import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_minimum_ascii_delete_sum_for_two_strings {
    private class Solution {
        func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
            let arr1 = Array(s1.utf8)
            let arr2 = Array(s2.utf8)
            let m = arr1.count
            let n = arr2.count
            var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
            for i in 1...m {
                dp[i][0] = dp[i - 1][0] + Int(arr1[i - 1])
            }
            for j in 1...n {
                dp[0][j] = dp[0][j - 1] + Int(arr2[j - 1])
            }
            for i in 1...m {
                for j in 1...n {
                    if arr1[i - 1] == arr2[j - 1] {
                        dp[i][j] = dp[i - 1][j - 1]
                    }
                    else {
                        dp[i][j] = min(dp[i - 1][j] + Int(arr1[i - 1]), dp[i][j - 1] + Int(arr2[j - 1]))
                    }
                }
            }
            return dp[m][n]
        }
    }

    @Suite struct MinimumAsciiDeleteSumForTwoStringsTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "b7e42a51-8663-4580-90f4-24bfa64a8efb"
            let rawInput = "s1 = \"abc\", s2 = \"abc\""
            let expectedOutput = "0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_1() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "40a73c42-0026-4fd9-a243-b8b1cf36b830"
            let rawInput = "s1 = \"\", s2 = \"abc\""
            let expectedOutput = "294"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_2() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "00f82083-7896-4b55-a62e-6c196f022e25"
            let rawInput = "s1 = \"abc\", s2 = \"\""
            let expectedOutput = "294"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_3() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "5506d7f1-e2c6-4590-b1ab-830466b36149"
            let rawInput = "s1 = \"a\", s2 = \"b\""
            let expectedOutput = "195"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_4() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "4d69c54a-adb9-4d58-b989-3667ad850f2b"
            let rawInput = "s1 = \"aaaaa\", s2 = \"aaaaa\""
            let expectedOutput = "0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_5() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "185c8f52-8edd-48af-b034-5a52da439400"
            let rawInput = "s1 = \"abcde\", s2 = \"abcde\""
            let expectedOutput = "0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_6() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "f43a6eb1-f4e1-4901-9162-e305d1515eb7"
            let rawInput = "s1 = \"abcdefghijklmnopqrstuvwxyz\", s2 = \"abcdefghijklmnopqrstuvwxyz\""
            let expectedOutput = "0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_7() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "1c81cad6-83ad-42d1-b040-c39122370f10"
            let rawInput = "s1 = \"abc\", s2 = \"ab\""
            let expectedOutput = "99"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_8() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "91959487-1e11-4938-ab69-2cff93f3eb50"
            let rawInput = "s1 = \"ab\", s2 = \"abc\""
            let expectedOutput = "99"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_9() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "be4f00b5-5816-48a2-9096-9d15c402d768"
            let rawInput = "s1 = \"\", s2 = \"\""
            let expectedOutput = "0"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_10() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "935e55bb-9d85-418e-9d6f-84717df68582"
            let rawInput = "s1 = \"a\", s2 = \"\""
            let expectedOutput = "97"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_11() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "6a63103b-4e33-4d8b-8283-1de236bce00a"
            let rawInput = "s1 = \"\", s2 = \"a\""
            let expectedOutput = "97"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_12() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "e2786684-df6d-4b18-a426-cc2895b0a211"
            let rawInput = "s1 = \"ab\", s2 = \"ba\""
            let expectedOutput = "194"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_13() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "3b47dd01-bba4-46dd-92d3-d68dedd9722f"
            let rawInput = "s1 = \"abcde\", s2 = \"edcba\""
            let expectedOutput = "788"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_14() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "cf073aed-6fb6-4fcd-9a7d-ead4f3b7c638"
            let rawInput = "s1 = \"a\", s2 = \"aaaaa\""
            let expectedOutput = "388"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_15() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "d8bad7b1-db62-4073-8cd2-a7b2eedeead5"
            let rawInput = "s1 = \"aaaaa\", s2 = \"a\""
            let expectedOutput = "388"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_16() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "9ed47b25-bf3a-44ff-a304-b37f8c9fac06"
            let rawInput = "s1 = \"abc\", s2 = \"def\""
            let expectedOutput = "597"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_17() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "493eedab-ba2e-4f04-951c-86f8a8fa6fbb"
            let rawInput = "s1 = \"abcdefghijklmnopqrstuvwxyz\", s2 = \"zyxwvutsrqponmlkjihgfedcba\""
            let expectedOutput = "5694"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_18() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "3c6e140a-4887-4d9d-99c9-2fed70d25aa1"
            let rawInput = "s1 = \"abcdefghijklmnopqrstuvwxyz\", s2 = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\""
            let expectedOutput = "2847"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_19() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "2559121d-362d-4045-8cb1-36411ded32f0"
            let rawInput = "s1 = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\", s2 = \"abcdefghijklmnopqrstuvwxyz\""
            let expectedOutput = "2847"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_20() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "5a4e89ae-eb81-4451-a5cc-a04730306773"
            let rawInput = "s1 = \"a\", s2 = \"abcdefghijklmnopqrstuvwxyz\""
            let expectedOutput = "2947"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_21() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "ec09dfa3-64b4-446c-89ab-f3bc45f3646d"
            let rawInput = "s1 = \"abcdefghijklmnopqrstuvwxyz\", s2 = \"a\""
            let expectedOutput = "2947"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_22() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "c06bae61-c387-4f38-98b5-16b1fbfc51ec"
            let rawInput = "s1 = \"abc\", s2 = \"abcabcabc\""
            let expectedOutput = "588"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_23() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "368cfca2-2a69-49f8-b23c-737ce1012cd3"
            let rawInput = "s1 = \"abcabcabc\", s2 = \"abc\""
            let expectedOutput = "588"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_24() async {
            let slug = "minimum-ascii-delete-sum-for-two-strings"
            let topic = "dynamic-programming"
            let testId = "1bde255f-11d1-4572-9756-4453444acee6"
            let rawInput = "s1 = \"abc\", s2 = \"abcabc\""
            let expectedOutput = "294"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))")
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))")
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.minimumDeleteSum(p_s1, p_s2)
                let computedOutput = OutputSerializer.serialize(result)

                let matches = computedOutput == expectedOutput
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

    }

}
