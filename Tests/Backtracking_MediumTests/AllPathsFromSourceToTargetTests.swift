import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_all_paths_from_source_to_target {
    private class Solution {
        func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
            let n = graph.count
            var result: [[Int]] = []
            var memo: [Int: [[Int]]] = [:]
            func dfs(_ node: Int, _ path: [Int]) -> [[Int]] {
                if let cachedResult = memo[node] {
                    return cachedResult
                }
                if node == n - 1 {
                    return [path]
                }
                var paths: [[Int]] = []
                for nextNode in graph[node] {
                    let newPaths = dfs(nextNode, path + [nextNode])
                    paths.append(contentsOf: newPaths)
                }
                memo[node] = paths
                return paths
            }
            result = dfs(0, [0])
            return result
        }
    }

    @Suite struct AllPathsFromSourceToTargetTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "7c1a6cdc-96fd-42d7-b2bf-18699717fd39"
            let rawInput = "graph = [[1],[2],[]]"
            let expectedOutput = "[[0, 1, 2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_1() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "74d9464c-2b30-4f52-ab3a-e41acada67fc"
            let rawInput = "graph = [[1],[2],[3],[]]"
            let expectedOutput = "[[0, 1, 2, 3]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_2() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "7fb62000-b502-4c6b-ba77-6443eb19ca52"
            let rawInput = "graph = [[1],[2],[3],[4],[]]"
            let expectedOutput = "[[0, 1, 2, 3, 4]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_3() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "d57467f1-2caa-4fb2-8f9d-90da1f644c3f"
            let rawInput = "graph = [[1],[2],[3],[4],[5],[]]"
            let expectedOutput = "[[0, 1, 2, 3, 4, 5]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_4() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "71d4b44d-04ed-4a76-a576-f6e4fc8a8d9e"
            let rawInput = "graph = [[1],[2],[3],[4],[5],[6],[]]"
            let expectedOutput = "[[0, 1, 2, 3, 4, 5, 6]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_5() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "9d1fe21e-dd33-4831-a7c9-10f0addd6973"
            let rawInput = "graph = [[1],[2],[3],[4],[5],[6],[7],[]]"
            let expectedOutput = "[[0, 1, 2, 3, 4, 5, 6, 7]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_6() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "e3de5854-48f6-4c35-ab1f-c77d7c80fcaa"
            let rawInput = "graph = [[1],[2],[3],[4],[5],[6],[7],[8],[]]"
            let expectedOutput = "[[0, 1, 2, 3, 4, 5, 6, 7, 8]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_7() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "ab320c17-dae8-4a3a-b2db-a01d5778e770"
            let rawInput = "graph = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[]]"
            let expectedOutput = "[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_8() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "a1c411ae-5e90-4a23-b234-74665c29acf7"
            let rawInput = "graph = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[]]"
            let expectedOutput = "[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_9() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "260b06e9-0ef5-425c-8a38-41cca5f21187"
            let rawInput = "graph = [[1,2],[3],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_10() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "782f4d9b-8296-4b38-9e7c-9e12132ef10d"
            let rawInput = "graph = [[1,2,3],[4],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_11() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "0e1b1b39-f488-431a-8b52-90ba57f5562b"
            let rawInput = "graph = [[1,2,3,4],[5],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_12() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "eca1d79a-2da7-4edb-acda-edf1f36f7815"
            let rawInput = "graph = [[1,2],[3,4],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_13() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "b47922ae-7007-4c43-8e34-421f0bd3f3c0"
            let rawInput = "graph = [[1,2,3,4,5],[6],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_14() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "ef7e6130-408b-41a8-a49d-0f3b2c78465d"
            let rawInput = "graph = [[1,2,3,4,5,6],[7],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_15() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "5adb7318-1a4c-4bc2-8a07-8840bf8af9e4"
            let rawInput = "graph = [[1,2,3,4,5,6,7],[8],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_16() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "55c1b5e0-e3a3-4884-8d66-f493ccbb2ad6"
            let rawInput = "graph = [[1,2,3,4,5,6,7,8],[9],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_17() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "ae781226-9b4f-4cb8-9b58-f3a650be4c06"
            let rawInput = "graph = [[1,2,3,4,5,6,7,8,9],[10],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_18() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "1ecd3c25-3f94-475e-8669-8b609202ad32"
            let rawInput = "graph = [[1,2,3,4,5,6,7,8,9,10],[11],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_19() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "1ce20539-684e-4e9a-9604-43d1364254f0"
            let rawInput = "graph = [[1,2,3],[4,5],[]]"
            let expectedOutput = "[[0,2]]"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_20() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "555b431d-5141-4970-93fc-9e55d917569f"
            let rawInput = "graph = [[1,2,3,4],[5,6],[]]"
            let expectedOutput = "null"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_21() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "20f633aa-35e4-4df7-9a06-b220c634c95c"
            let rawInput = "graph = [[1,2,3,4,5],[6,7],[]]"
            let expectedOutput = "null"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_22() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "50b97029-00a1-4760-85c0-4c64cfaa51db"
            let rawInput = "graph = [[1,2,3,4,5,6],[7,8],[]]"
            let expectedOutput = "null"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_23() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "d442b438-6fff-4be3-94b4-5a360a12f71b"
            let rawInput = "graph = [[1,2,3,4,5,6,7],[8,9],[]]"
            let expectedOutput = "null"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_24() async {
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = "8ed5211e-48b8-4af8-b719-f7b0ebdf5bb8"
            let rawInput = "graph = [[1,2,3,4,5,6,7,8],[9,10],[]]"
            let expectedOutput = "null"
            let orderMatters = false

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Int]]: '\(params[0])'")
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.allPathsSourceTarget(p_graph)
                let computedOutput = OutputSerializer.serialize(result)

                // Nested order-independent comparison (QUAL-01)
                // Inner arrays compared as-is, outer array order ignored when orderMatters=false
                guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArrays
                } else {
                    // Sort outer array by content for stable comparison (inner order preserved)
                    let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                        for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                        return a.count < b.count
                    } }
                    matches = sortOuter(result) == sortOuter(expectedArrays)
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

    }

}
