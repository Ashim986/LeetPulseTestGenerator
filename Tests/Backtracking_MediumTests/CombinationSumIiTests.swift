import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_combination_sum_ii {
    private class Solution {
        func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
            var result: [[Int]] = []
            var current: [Int] = []
            let sorted = candidates.sorted()

            func backtrack(_ start: Int, _ remaining: Int) {
                if remaining == 0 {
                    result.append(current)
                    return
                }
                for i in start..<sorted.count {
                    if sorted[i] > remaining { break }
                    if i > start && sorted[i] == sorted[i-1] { continue }
                    current.append(sorted[i])
                    backtrack(i + 1, remaining - sorted[i])
                    current.removeLast()
                }
            }

            backtrack(0, target)
            return result
        }
    }

    @Suite struct CombinationSumIiTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "55AD33D4-BD45-495A-B9F7-44C922C88534"
            let rawInput = "{\"candidates\": [10,1,2,7,6,1,5], \"target\": 8}"
            let expectedOutput = "[[1,1,6],[1,2,5],[1,7],[2,6]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "0976026C-88C6-4873-98B2-154BBB72AE60"
            let rawInput = "{\"candidates\": [2,3,6,7], \"target\": 1}"
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "36D86EEA-63E5-4462-960D-7FAE83B717CC"
            let rawInput = "{\"candidates\": [5], \"target\": 5}"
            let expectedOutput = "[[5]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "9F4C2978-A8D6-4D9D-BB3A-694806AE53EF"
            let rawInput = "{\"candidates\": [5], \"target\": 3}"
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "BCECE5DF-FDE4-42DE-8C9B-5867E2B783C1"
            let rawInput = "{\"candidates\": [5,6,7], \"target\": 4}"
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "1B92F161-6921-4851-ACB7-6C62168E405F"
            let rawInput = "{\"candidates\": [1,1,1,1,1], \"target\": 3}"
            let expectedOutput = "[[1,1,1]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "21081B18-C96A-4A8D-BFA8-9D13D21F2B1F"
            let rawInput = "{\"candidates\": [2,2,2,2,2], \"target\": 4}"
            let expectedOutput = "[[2,2]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "CF5F73D4-3791-40C7-99E7-5D872F9F43D8"
            let rawInput = "candidates = [5,6,7], target = 3"
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "D546E188-59AF-4034-8047-4898F1F07E14"
            let rawInput = "candidates = [2,3,4], target = 9"
            let expectedOutput = "[[2,3,4]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "30C5ECA2-04D9-4F14-BA9C-DDA13E10AFA6"
            let rawInput = "candidates = [1,2,3,4,5], target = 5"
            let expectedOutput = "[[1,4],[2,3],[5]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "E9947183-6C97-4FF3-87C7-A1B9A77DFC06"
            let rawInput = "candidates = [1,1,1,2,2], target = 3"
            let expectedOutput = "[[1,1,1],[1,2]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "F4947E61-5C5E-47E7-B63B-8F0F40989930"
            let rawInput = "candidates = [], target = 5"
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "9F2A4422-92D4-4EC5-AC98-9A568F8FAF76"
            let rawInput = "candidates = [3,3,3,3], target = 3"
            let expectedOutput = "[[3]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "7A6DFCA6-5F05-4C77-A202-985C3DAF0D10"
            let rawInput = "[2,5,8], 1"
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "48F9516D-667E-4423-8C1C-BB1DDC40E431"
            let rawInput = "[5,6,7], 3"
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "1A6576B7-3B8F-4240-AE52-2ED3437C7BA2"
            let rawInput = "{\"candidates\": [4,4,2,1,4,2,2,1,3,5], \"target\": 9}"
            let expectedOutput = "[[1,1,2,2,3],[1,1,2,5],[1,1,3,4],[1,2,2,4],[1,3,5],[1,4,4],[2,2,5],[2,3,4],[4,5]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "9C84EF9F-7FDC-4DC8-B8D2-A49712F6F9F5"
            let rawInput = "{\"candidates\": [1,2,3], \"target\": 6}"
            let expectedOutput = "[[1,2,3]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "8A8A3C65-9A95-4A18-896C-2CAAE9356771"
            let rawInput = "{\"candidates\": [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,3,3,3,3,3], \"target\": 5}"
            let expectedOutput = "[[1,1,1,1,1],[1,1,1,2],[1,1,3],[1,2,2],[2,3]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "6809F635-62AE-46C9-9FCC-213C02054A29"
            let rawInput = "candidates = [15,8,2,4,1,1,1,2], target = 10"
            let expectedOutput = "[[1,1,2,2,4],[1,1,2,6],[1,1,8],[1,2,2,5],[1,2,7],[1,4,5],[1,9],[2,2,6],[2,8],[4,6],[10]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "174BD5CF-4581-472A-981D-62F0F4482DEC"
            let rawInput = "candidates = [1,2,6,7], target = 5"
            let expectedOutput = "[[1,2,2],[1,4],[2,3]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "FA3A6067-DD4F-48F1-9821-59FCD2CDD847"
            let rawInput = "candidates = [20,10,5,25,10], target = 50"
            let expectedOutput = "[[5,10,15,20],[5,10,10,25],[5,20,25],[10,15,25],[10,20,20],[25,25]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "D20B6BC1-AB0C-45A0-8E73-8A119EEBD8DE"
            let rawInput = "[10,1,2,7,6,1,5], 8"
            let expectedOutput = "[ [1,1,6], [1,2,5], [1,7], [2,6] ]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "A410F487-37FD-4051-A5DA-230580EF2878"
            let rawInput = "[1,2,3], 0"
            let expectedOutput = "[[]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "9EBAE27F-A8E9-405B-8757-FA6CE4C34944"
            let rawInput = "[3,1,4,2], 4"
            let expectedOutput = "[[1,3],[4]]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
            let slug = "combination-sum-ii"
            let topic = "backtracking"
            let testId = "5145dbb1-41f2-4b13-bc62-0677588bfe92"
            let rawInput = "candidates = [2,5,2,1,2], target = 5"
            let expectedOutput = "[ [1,2,2], [5] ]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))")
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates.length <= 100")
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= candidates[i] <= 50")
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= target <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.combinationSum2(p_candidates, p_target)
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
