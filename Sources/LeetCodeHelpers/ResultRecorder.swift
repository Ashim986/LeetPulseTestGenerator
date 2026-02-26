import Foundation

/// Thread-safe result recorder using Swift's actor concurrency.
/// The actor provides built-in data isolation and Sendable conformance --
/// no locks, semaphores, or manual synchronization needed.
///
/// Status field values (replaces old output_matches boolean):
/// - "matched": computed output matches expected output
/// - "mismatched": computed output differs from expected output
/// - "parse_error": input parsing failed (bad format, wrong param count, type mismatch)
/// - "runtime_error": solution execution failed (crash, exception, timeout)
public actor ResultRecorderActor {
    public static let shared = ResultRecorderActor()

    private var results: [[String: Any]] = []
    private var problemMeta: [String: [String: Any]] = [:]

    private init() {}

    /// Record a single test case result.
    ///
    /// - Parameters:
    ///   - slug: Problem slug (e.g., "two-sum")
    ///   - topic: Topic category (e.g., "arrays-hashing")
    ///   - testId: Test case identifier
    ///   - input: Raw input string
    ///   - originalExpected: Expected output from test data
    ///   - computedOutput: Actual computed output from solution
    ///   - isValid: Whether the test case itself is valid
    ///   - status: One of "matched", "mismatched", "parse_error", "runtime_error"
    ///   - orderMatters: Whether array element order matters for comparison
    ///   - errorMessage: Structured error context for parse_error/runtime_error.
    ///     For parse_error: contains error type, raw input that failed, expected type, parameter index.
    ///     For runtime_error: contains the error/crash description.
    ///     For matched/mismatched: nil.
    ///   - traceSteps: Optional trace steps for debugging
    public func record(
        slug: String,
        topic: String,
        testId: String,
        input: String,
        originalExpected: String,
        computedOutput: String,
        isValid: Bool,
        status: String,
        orderMatters: Bool,
        errorMessage: String? = nil,
        traceSteps: [[String: Any]]? = nil
    ) {
        var entry: [String: Any] = [
            "slug": slug,
            "topic": topic,
            "test_id": testId,
            "input": input,
            "original_expected": originalExpected,
            "computed_output": computedOutput,
            "is_valid": isValid,
            "status": status,
            "order_matters": orderMatters
        ]
        if let err = errorMessage {
            entry["error_message"] = err
        }
        if let steps = traceSteps, !steps.isEmpty {
            entry["trace_steps"] = steps
        }
        results.append(entry)

        // Console output on mismatch: show expected vs computed, truncated for readability
        if status == "mismatched" {
            let truncatedExpected = truncateForDisplay(originalExpected)
            let truncatedComputed = truncateForDisplay(computedOutput)
            print("[MISMATCH] \(slug) test \(testId): expected=\(truncatedExpected) computed=\(truncatedComputed)")
        }

        // Update problem meta
        var meta = problemMeta[slug] ?? [
            "slug": slug,
            "topic": topic,
            "total_tests": 0,
            "valid_tests": 0,
            "invalid_tests": 0
        ]
        meta["total_tests"] = (meta["total_tests"] as? Int ?? 0) + 1
        if isValid {
            meta["valid_tests"] = (meta["valid_tests"] as? Int ?? 0) + 1
        } else {
            meta["invalid_tests"] = (meta["invalid_tests"] as? Int ?? 0) + 1
        }
        problemMeta[slug] = meta
    }

    /// Truncate a string to ~200 chars for console display.
    /// Shows first 50 and last 50 chars with "..." in the middle for long outputs.
    private func truncateForDisplay(_ s: String) -> String {
        guard s.count > 200 else { return s }
        let prefix = s.prefix(50)
        let suffix = s.suffix(50)
        return "\(prefix)...\(suffix)"
    }

    /// Flush all results to per-topic JSON files + summary.
    ///
    /// Output structure:
    /// ```
    /// test_results/
    /// +-- summary.json          # Aggregated stats (no parse_error counts per user decision)
    /// +-- arrays-hashing.json   # Per-topic results with stats header
    /// +-- intervals.json
    /// +-- ...
    /// ```
    ///
    /// Per-topic JSON includes a stats header with counts for each status category.
    /// Summary.json does NOT include parse_error stats (per user decision).
    public func flush(to basePath: String? = nil) {
        let outputDir = basePath ?? defaultOutputDir()

        // Create directory
        let fm = FileManager.default
        try? fm.createDirectory(atPath: outputDir, withIntermediateDirectories: true)

        let timestamp = ISO8601DateFormatter().string(from: Date())

        // Group results by topic
        var resultsByTopic: [String: [[String: Any]]] = [:]
        for r in results {
            let topic = r["topic"] as? String ?? "unknown"
            resultsByTopic[topic, default: []].append(r)
        }

        // Group problem meta by topic
        var metaByTopic: [String: [[String: Any]]] = [:]
        for meta in problemMeta.values {
            let topic = meta["topic"] as? String ?? "unknown"
            metaByTopic[topic, default: []].append(meta)
        }

        // Write per-topic files
        var topicSummaries: [[String: Any]] = []
        for (topic, topicResults) in resultsByTopic.sorted(by: { $0.key < $1.key }) {
            let topicMeta = metaByTopic[topic] ?? []

            // Compute per-topic stats header with counts for each status category
            let matchedCount = topicResults.filter { ($0["status"] as? String) == "matched" }.count
            let mismatchedCount = topicResults.filter { ($0["status"] as? String) == "mismatched" }.count
            let parseErrorCount = topicResults.filter { ($0["status"] as? String) == "parse_error" }.count
            let runtimeErrorCount = topicResults.filter { ($0["status"] as? String) == "runtime_error" }.count

            let stats: [String: Any] = [
                "total": topicResults.count,
                "matched": matchedCount,
                "mismatched": mismatchedCount,
                "parse_error": parseErrorCount,
                "runtime_error": runtimeErrorCount
            ]

            let topicOutput: [String: Any] = [
                "topic": topic,
                "evaluated_at": timestamp,
                "total_results": topicResults.count,
                "stats": stats,
                "problems": topicMeta,
                "test_results": topicResults
            ]

            let topicPath = outputDir + "/\(topic).json"
            do {
                let data = try JSONSerialization.data(withJSONObject: topicOutput, options: [.prettyPrinted, .sortedKeys])
                try data.write(to: URL(fileURLWithPath: topicPath))
            } catch {
                print("[ResultRecorder] ERROR writing \(topicPath): \(error)")
            }

            // Summary uses matched count (parse_error stats stay OUT of summary per user decision)
            let validCount = topicResults.filter { $0["is_valid"] as? Bool == true }.count
            topicSummaries.append([
                "topic": topic,
                "total": topicResults.count,
                "valid": validCount,
                "invalid": topicResults.count - validCount,
                "matched": matchedCount,
                "mismatched": mismatchedCount,
                "runtime_error": runtimeErrorCount,
                "match_rate": topicResults.count > 0
                    ? Double(matchedCount) / Double(topicResults.count)
                    : 0.0
            ])
        }

        // Write summary (no parse_error stats per user decision)
        let summary: [String: Any] = [
            "evaluated_at": timestamp,
            "total_results": results.count,
            "topics": topicSummaries,
            "problems": Array(problemMeta.values)
        ]

        let summaryPath = outputDir + "/summary.json"
        do {
            let data = try JSONSerialization.data(withJSONObject: summary, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: URL(fileURLWithPath: summaryPath))
            print("[ResultRecorder] Wrote \(results.count) results to \(outputDir)/ (\(resultsByTopic.count) topics)")
        } catch {
            print("[ResultRecorder] ERROR writing summary: \(error)")
        }
    }

    /// Reset all recorded data.
    public func reset() {
        results.removeAll()
        problemMeta.removeAll()
    }

    private func defaultOutputDir() -> String {
        let env = ProcessInfo.processInfo.environment
        if let dir = env["TEST_RESULTS_DIR"] {
            return dir
        }
        return FileManager.default.currentDirectoryPath + "/test_results"
    }

    // MARK: - Synchronous flush (for atexit handler only)

    /// Flush synchronously -- bridges async actor to sync context.
    /// Only used by the atexit handler at process exit.
    public static func flushSync() {
        let group = DispatchGroup()
        group.enter()
        Task {
            await shared.flush()
            group.leave()
        }
        group.wait()
    }
}

// MARK: - Auto-flush registration

nonisolated(unsafe) private var _flushRegistered = false

/// Register an atexit handler to flush results when the process exits.
/// Idempotent -- safe to call multiple times (only registers once).
public func registerResultFlush() {
    guard !_flushRegistered else { return }
    _flushRegistered = true
    atexit {
        ResultRecorderActor.flushSync()
    }
}
