import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_summary_ranges {
    private class Solution {
        func summaryRanges(_ nums: [Int]) -> [String] {
            var result: [String] = []
            var i = 0
            while i < nums.count {
                let start = nums[i]
                var end = start
                while i + 1 < nums.count, nums[i + 1] == nums[i] + 1 {
                    i += 1
                    end = nums[i]
                }
                if start == end {
                    result.append("\(start)")
                } else {
                    result.append("\(start)->\(end)")
                }
                i += 1
            }
            return result
        }
    }

    @Suite struct SummaryRangesTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "f2698365-60d2-4990-bb02-1e1599b15dfa"
            let rawInput = "nums = []"
            let expectedOutput = "[]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_1() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "d486185d-b957-4c80-b794-e33455cb6bee"
            let rawInput = "nums = [1]"
            let expectedOutput = "[\"1\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_2() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "367e1579-b993-46ce-b4b8-b431519cc3c5"
            let rawInput = "nums = [1, 2, 3]"
            let expectedOutput = "[\"1->3\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_3() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "014e111a-a91c-4e76-803a-05dfcb44fcc4"
            let rawInput = "nums = [1, 3, 5]"
            let expectedOutput = "[\"1\", \"3\", \"5\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_4() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "fa9f8996-7d01-4e56-b4d1-dbe62fda2d46"
            let rawInput = "nums = [-1, 0, 1]"
            let expectedOutput = "[\"-1->1\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_5() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "f625c33f-5fae-4d0c-9673-004fd3567b9a"
            let rawInput = "nums = [100, 101, 102]"
            let expectedOutput = "[\"100->102\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_6() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "0a2e2167-77ed-44da-b514-7d2c6ec545c0"
            let rawInput = "nums = [10, 20, 30, 40, 50]"
            let expectedOutput = "[\"10\", \"20\", \"30\", \"40\", \"50\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_7() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "22d6a251-df45-4ef7-a71d-bc393ddfda80"
            let rawInput = "nums = [1, 2, 3, 5, 6, 7]"
            let expectedOutput = "[\"1->3\", \"5->7\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_8() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "5dde888c-9cf0-4268-a77f-0932c2f18b40"
            let rawInput = "nums = [1, 3, 5, 7, 9]"
            let expectedOutput = "[\"1\", \"3\", \"5\", \"7\", \"9\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_9() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "32377fdd-b026-40fe-ad02-2872530b73d0"
            let rawInput = "nums = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]"
            let expectedOutput = "[\"10->20\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_10() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "62f7b3c3-705d-45d4-8e66-faea0a7ee79f"
            let rawInput = "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
            let expectedOutput = "[\"1->10\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_11() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "aad77fea-0d69-4af9-963d-852c74bc15c6"
            let rawInput = "nums = [1000, 1001, 1002, 1003, 1004, 1005]"
            let expectedOutput = "[\"1000->1005\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_12() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "272d9abd-3170-4b2b-b64b-0e6fa13f4d54"
            let rawInput = "nums = [-100, -99, -98, -97, -96]"
            let expectedOutput = "[\"-100->-96\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_13() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "9fe25c41-a01a-4301-8ebc-2e2945695e06"
            let rawInput = "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]"
            let expectedOutput = "[\"1->15\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_14() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "eee95dd2-818d-41dc-a7ac-dcc2a6b35117"
            let rawInput = "nums = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]"
            let expectedOutput = "[\"-10->-1\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_15() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "cab23ebb-a186-453c-b72f-8a0fa59f21d6"
            let rawInput = "nums = [10000, 10001, 10002, 10003, 10004, 10005, 10006, 10007, 10008, 10009, 10010]"
            let expectedOutput = "[\"10000->10010\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_16() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "30bd1ed1-563d-494a-a4f1-65040d3d6929"
            let rawInput = "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]"
            let expectedOutput = "[\"1\", \"3\", \"5\", \"7\", \"9\", \"11\", \"13\", \"15\", \"17\", \"19\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_17() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "7f3c31d0-a120-42c0-adf8-96bd89d0bbfa"
            let rawInput = "nums = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]"
            let expectedOutput = "[\"10\", \"20\", \"30\", \"40\", \"50\", \"60\", \"70\", \"80\", \"90\", \"100\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_18() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "87912845-b487-43ca-9f6a-76e400e8c18a"
            let rawInput = "nums = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]"
            let expectedOutput = "[\"100\", \"200\", \"300\", \"400\", \"500\", \"600\", \"700\", \"800\", \"900\", \"1000\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_19() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "972db74d-44de-4354-a8d8-3321bfe3b7e4"
            let rawInput = "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]"
            let expectedOutput = "[\"1->20\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_20() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "152a7bc9-b703-4f64-9d82-e7e38836fa42"
            let rawInput = "nums = [-1000, -999, -998, -997, -996, -995, -994, -993, -992, -991]"
            let expectedOutput = "[\"-1000->-991\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_21() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "2ff82d2e-f58b-4237-968f-2c183e1ac2d8"
            let rawInput = "nums = [1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015]"
            let expectedOutput = "[\"1000->1015\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_22() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "7ae1e6cf-f256-4eb1-9737-b7311bf40806"
            let rawInput = "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29]"
            let expectedOutput = "[\"1\", \"3\", \"5\", \"7\", \"9\", \"11\", \"13\", \"15\", \"17\", \"19\", \"21\", \"23\", \"25\", \"27\", \"29\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_23() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "62868691-04a7-4135-b6ba-ca9527ea3156"
            let rawInput = "nums = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150]"
            let expectedOutput = "[\"10\", \"20\", \"30\", \"40\", \"50\", \"60\", \"70\", \"80\", \"90\", \"100\", \"110\", \"120\", \"130\", \"140\", \"150\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
                }
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_24() async {
            let slug = "summary-ranges"
            let topic = "arrays-hashing"
            let testId = "8abe1bf8-14e4-44ce-928a-2cf9f1f135c4"
            let rawInput = "nums = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500]"
            let expectedOutput = "[\"100\", \"200\", \"300\", \"400\", \"500\", \"600\", \"700\", \"800\", \"900\", \"1000\", \"1100\", \"1200\", \"1300\", \"1400\", \"1500\"]"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= nums.length <= 20")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.summaryRanges(p_nums)
                let computedOutput = OutputSerializer.serialize(result)

                // Order-independent string array comparison (QUAL-01)
                guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                    await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [String]")
                    #expect(Bool(false), "Test \(testId): failed to parse expected output")
                    return
                }
                let matches: Bool
                if orderMatters {
                    matches = result == expectedArray
                } else {
                    matches = result.sorted() == expectedArray.sorted()
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
