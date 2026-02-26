import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_soup_servings {
    private class Solution {
        func soupServings(_ n: Int) -> Double {
            if n >= 5500 { return 1.0 }
            var memo: [String: Double] = [:]
            func helper(_ a: Int, _ b: Int) -> Double {
                let key = "(a),(b)"
                if let value = memo[key] { return value }
                if a <= 0 && b > 0 { return 1.0 }
                if a <= 0 && b <= 0 { return 0.5 }
                if b <= 0 { return 0.0 }
                let result = min(1.0, 4 * helper(max(0, a - 4), b) + helper(a - 3, max(0, b - 1)) + helper(max(0, a - 2), max(0, b - 2)) + helper(max(0, a - 1), max(0, b - 3))) / 4
                memo[key] = result
                return result
            }
            return helper(n, n)
        }
    }

    @Suite struct SoupServingsTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "e5db6426-b5f0-47db-92a0-5ba9ad0f09d0"
            let rawInput = "n = 1"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_1() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "d8ac694d-34d9-42d4-ba48-98a617eba23b"
            let rawInput = "n = 2"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_2() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "1857205b-b697-43b4-91ae-10610f003537"
            let rawInput = "n = 3"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_3() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "b561aba0-6625-4939-b134-75f1b71fd451"
            let rawInput = "n = 10"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_4() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "8d628f13-9009-4ee6-b5ab-943ad68eeb08"
            let rawInput = "n = 100"
            let expectedOutput = "0.71875"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_5() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "84725559-2c75-42cc-b68a-e7ef9575d377"
            let rawInput = "n = 1000"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_6() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "a746e26c-7ffc-4efa-83fb-0204dd74d9da"
            let rawInput = "n = 0"
            let expectedOutput = "0.5"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_7() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "07c28dd4-30a6-41f3-a220-6eda6d5e1f88"
            let rawInput = "n = -1"
            let expectedOutput = "0.5"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_8() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "cd8d2ff3-3f98-4afb-ac2b-c73b93de72dc"
            let rawInput = "n = -10"
            let expectedOutput = "0.5"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_9() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "ad546ec9-81b9-4631-9a36-af52c66fb5b6"
            let rawInput = "n = -100"
            let expectedOutput = "0.5"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_10() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "84ed8cf4-1624-4411-af01-cc9a005364dd"
            let rawInput = "n = 25"
            let expectedOutput = "0.9999999999999999"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_11() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "a280ccba-862a-4389-aaff-6912e4df11fe"
            let rawInput = "n = 49"
            let expectedOutput = "0.9999999999999999"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_12() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "a6ec2da9-e2cf-465f-8708-c0f7ac77178a"
            let rawInput = "n = 75"
            let expectedOutput = "0.9999999999999999"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_13() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "415f4a77-68b7-42b0-976e-c49204b18bec"
            let rawInput = "n = 101"
            let expectedOutput = "0.9999999999999999"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_14() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "63674abe-8186-427b-8f1e-76186b3cf2e5"
            let rawInput = "n = 500"
            let expectedOutput = "0.9999999999999999"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_15() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "b5173ac9-7de2-4c9d-a507-8dda0e6cfafe"
            let rawInput = "n = 10000"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_16() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "06850557-ef5b-410a-a48c-3bdba4338597"
            let rawInput = "n = 6"
            let expectedOutput = "0.7578125"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_17() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "2fa846e5-13d2-4090-94ab-0d4699cf2c6b"
            let rawInput = "n = 7"
            let expectedOutput = "0.74609375"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_18() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "b2b358ea-fc76-4b45-a9cd-ae02d48ad515"
            let rawInput = "n = 12"
            let expectedOutput = "0.87890625"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_19() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "10945abb-abf3-4074-9d6c-a25d381ffcf6"
            let rawInput = "n = 15"
            let expectedOutput = "0.890625"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_20() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "dd71587f-dd79-4452-bd52-0b1c858b5fbd"
            let rawInput = "n = 20"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_21() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "8b566b18-2b23-4e58-867a-0d2b182f0a3d"
            let rawInput = "n = 28"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_22() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "2f64421d-b8db-4575-9b15-21bcdcd439a9"
            let rawInput = "n = 32"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_23() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "e70cbabe-6315-4c65-9f53-483764d8eeb0"
            let rawInput = "n = 40"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_24() async {
            let slug = "soup-servings"
            let topic = "math-geometry"
            let testId = "e8440250-20c6-4eb5-9b94-ea59727361ff"
            let rawInput = "n = 45"
            let expectedOutput = "1.0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= n <= 109")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.soupServings(p_n)
                let computedOutput = OutputSerializer.serialize(result)

                // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
                // Treats -0 and 0 as equal; handles trailing zero normalization
                let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
                let matches = abs(result - expectedVal) < 1e-5
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

    }

}
