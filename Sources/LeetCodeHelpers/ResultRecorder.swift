import Foundation

/// Thread-safe result recorder using Swift's modern actor concurrency.
/// Records test results to a JSON file for later processing.
public actor ResultRecorderActor {
    public static let shared = ResultRecorderActor()

    private var results: [[String: Any]] = []
    private var problemMeta: [String: [String: Any]] = [:]

    private init() {}

    /// Record a single test case result.
    public func record(
        slug: String,
        topic: String,
        testId: String,
        input: String,
        originalExpected: String,
        computedOutput: String,
        isValid: Bool,
        outputMatches: Bool,
        orderMatters: Bool,
        errorMessage: String? = nil
    ) {
        var entry: [String: Any] = [
            "slug": slug,
            "topic": topic,
            "test_id": testId,
            "input": input,
            "original_expected": originalExpected,
            "computed_output": computedOutput,
            "is_valid": isValid,
            "output_matches": outputMatches,
            "order_matters": orderMatters,
        ]
        if let err = errorMessage {
            entry["error_message"] = err
        }
        results.append(entry)

        // Update problem meta
        var meta = problemMeta[slug] ?? [
            "slug": slug,
            "topic": topic,
            "total_tests": 0,
            "valid_tests": 0,
            "invalid_tests": 0,
        ]
        meta["total_tests"] = (meta["total_tests"] as? Int ?? 0) + 1
        if isValid {
            meta["valid_tests"] = (meta["valid_tests"] as? Int ?? 0) + 1
        } else {
            meta["invalid_tests"] = (meta["invalid_tests"] as? Int ?? 0) + 1
        }
        problemMeta[slug] = meta
    }

    /// Flush all results to a JSON file.
    public func flush(to path: String? = nil) {
        let outputPath = path ?? defaultOutputPath()

        let output: [String: Any] = [
            "problems": Array(problemMeta.values),
            "test_results": results,
            "evaluated_at": ISO8601DateFormatter().string(from: Date()),
            "total_results": results.count,
        ]

        do {
            let data = try JSONSerialization.data(withJSONObject: output, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: URL(fileURLWithPath: outputPath))
            print("[ResultRecorder] Wrote \(results.count) results to \(outputPath)")
        } catch {
            print("[ResultRecorder] ERROR writing results: \(error)")
        }
    }

    /// Reset all recorded data.
    public func reset() {
        results.removeAll()
        problemMeta.removeAll()
    }

    private func defaultOutputPath() -> String {
        let env = ProcessInfo.processInfo.environment
        if let dir = env["TEST_RESULTS_DIR"] {
            return dir + "/test_results.json"
        }
        return FileManager.default.currentDirectoryPath + "/test_results.json"
    }
}

/// Synchronous wrapper for use in XCTest methods (which aren't async).
/// Uses `ResultRecorderActor` under the hood.
public enum ResultRecorder {
    public static let shared = ResultRecorderSync()
}

public final class ResultRecorderSync: @unchecked Sendable {
    private let actor = ResultRecorderActor.shared

    public func record(
        slug: String,
        topic: String,
        testId: String,
        input: String,
        originalExpected: String,
        computedOutput: String,
        isValid: Bool,
        outputMatches: Bool,
        orderMatters: Bool,
        errorMessage: String? = nil
    ) {
        // Bridge synchronous XCTest to async actor
        let semaphore = DispatchSemaphore(value: 0)
        Task {
            await actor.record(
                slug: slug, topic: topic, testId: testId,
                input: input, originalExpected: originalExpected,
                computedOutput: computedOutput, isValid: isValid,
                outputMatches: outputMatches, orderMatters: orderMatters,
                errorMessage: errorMessage
            )
            semaphore.signal()
        }
        semaphore.wait()
    }

    public func flush(to path: String? = nil) {
        let semaphore = DispatchSemaphore(value: 0)
        Task {
            await actor.flush(to: path)
            semaphore.signal()
        }
        semaphore.wait()
    }

    public func reset() {
        let semaphore = DispatchSemaphore(value: 0)
        Task {
            await actor.reset()
            semaphore.signal()
        }
        semaphore.wait()
    }
}
