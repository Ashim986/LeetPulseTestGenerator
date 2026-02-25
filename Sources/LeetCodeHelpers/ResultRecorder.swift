import Foundation

/// Thread-safe result recorder using Swift's actor concurrency.
/// The actor provides built-in data isolation and Sendable conformance —
/// no locks, semaphores, or manual synchronization needed.
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

    /// Flush all results to per-topic JSON files + summary.
    ///
    /// Output structure:
    /// ```
    /// test_results/
    /// ├── summary.json          # Aggregated stats
    /// ├── arrays-hashing.json   # Per-topic results
    /// ├── intervals.json
    /// └── ...
    /// ```
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
            let validCount = topicResults.filter { $0["is_valid"] as? Bool == true }.count
            let matchCount = topicResults.filter { $0["output_matches"] as? Bool == true }.count

            let topicOutput: [String: Any] = [
                "topic": topic,
                "evaluated_at": timestamp,
                "total_results": topicResults.count,
                "problems": topicMeta,
                "test_results": topicResults,
            ]

            let topicPath = outputDir + "/\(topic).json"
            do {
                let data = try JSONSerialization.data(withJSONObject: topicOutput, options: [.prettyPrinted, .sortedKeys])
                try data.write(to: URL(fileURLWithPath: topicPath))
            } catch {
                print("[ResultRecorder] ERROR writing \(topicPath): \(error)")
            }

            topicSummaries.append([
                "topic": topic,
                "total": topicResults.count,
                "valid": validCount,
                "invalid": topicResults.count - validCount,
                "matches": matchCount,
                "match_rate": topicResults.count > 0
                    ? Double(matchCount) / Double(topicResults.count)
                    : 0.0,
            ])
        }

        // Write summary
        let summary: [String: Any] = [
            "evaluated_at": timestamp,
            "total_results": results.count,
            "topics": topicSummaries,
            "problems": Array(problemMeta.values),
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

    /// Flush synchronously — bridges async actor to sync context.
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
/// Idempotent — safe to call multiple times (only registers once).
public func registerResultFlush() {
    guard !_flushRegistered else { return }
    _flushRegistered = true
    atexit {
        ResultRecorderActor.flushSync()
    }
}
