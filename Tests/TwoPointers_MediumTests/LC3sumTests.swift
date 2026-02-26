import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_3sum {
    private class Solution {
        func threeSum(_ nums: [Int]) -> [[Int]] {
            let nums = nums.sorted()
            var result: [[Int]] = []
            if nums.count < 3 { return result }

            for i in 0..<(nums.count - 2) {
                if i > 0 && nums[i] == nums[i - 1] { continue }
                var left = i + 1
                var right = nums.count - 1
                while left < right {
                    let sum = nums[i] + nums[left] + nums[right]
                    if sum == 0 {
                        result.append([nums[i], nums[left], nums[right]])
                        left += 1
                        right -= 1
                        while left < right && nums[left] == nums[left - 1] { left += 1 }
                        while left < right && nums[right] == nums[right + 1] { right -= 1 }
                    } else if sum < 0 {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
            return result
        }
    }

    @Suite struct LC3sumTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "9799078D-9FF2-42DE-AEFD-F2B53F330CEC"
            let rawInput = "[-1,0,1,2,-1,-4]"
            let expectedOutput = "[[-1,-1,2],[-1,0,1]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "1D812475-0375-45E4-A509-58DB4D51BAC2"
            let rawInput = "[]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "4C449B98-117A-4D39-8DB0-D5F85DD33A11"
            let rawInput = "[0]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "07526794-2970-4AE6-9FE8-5813AE150086"
            let rawInput = "[0,0,0]"
            let expectedOutput = "[[0,0,0]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "EBA37ADC-2400-4FC0-AC5C-6684AC8B56B9"
            let rawInput = "[-1,0,1]"
            let expectedOutput = "[[-1,0,1]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "3DFA8E86-B7EF-482B-8529-EC25A7DD53FE"
            let rawInput = "[-2,0,1,1,2]"
            let expectedOutput = "[[-2,0,2],[-2,1,1]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "C006DACA-8651-4DAD-92F1-49A0388ABDD2"
            let rawInput = "[-1,0,1,0]"
            let expectedOutput = "[[-1,0,1]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "5f3a308d-c7fd-4522-8eba-7bd7ec29f2ba"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "a532e4cb-347b-4cb7-89b2-e3ac59dc9e65"
            let rawInput = "nums = [0]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "a8a17a08-85ab-41e6-a6b8-c927c8f52cf8"
            let rawInput = "nums = [1, 2]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "e9bfe39e-6193-4373-8da3-834935bacd16"
            let rawInput = "nums = [1, 1, 1]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "786027f3-e57d-428b-bd52-f168e8bb311b"
            let rawInput = "nums = [1, 2, 3, 4, 5]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "1c27b363-9fcc-43b3-bff9-564dd633e271"
            let rawInput = "nums = [-5, -4, -3, -2, -1]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "95253589-42bb-456d-9806-ee3e293aef13"
            let rawInput = "nums = [0, 0, 0, 0, 0]"
            let expectedOutput = "[[0,0,0]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "47577304-b418-45bc-8078-7873b4770e3f"
            let rawInput = "nums = [1, -1, 0]"
            let expectedOutput = "[[-1,0,1]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "d1272d0d-167b-4125-bb93-a4b0e28d4554"
            let rawInput = "nums = [1, 1, -2]"
            let expectedOutput = "[[-2,1,1]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "84ae64ac-6324-4a33-bbc4-f359dcb755f3"
            let rawInput = "nums = [-1, -1, 2]"
            let expectedOutput = "[[-1,-1,2]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "29c9519c-6a45-44c8-8284-ffbeabf56ba4"
            let rawInput = "nums = [0, 1, 1, -2]"
            let expectedOutput = "[[-2,1,1]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "6bb75b02-ddf3-4589-82d8-8969034e549a"
            let rawInput = "nums = [0, 0, 0, 1, -1]"
            let expectedOutput = "[[-1,0,1],[0,0,0]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "4958422b-25f7-4443-b4e9-685d1ee33d23"
            let rawInput = "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]"
            let expectedOutput = "[[0,0,0]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "64f1b943-a89f-47af-8082-dbccc606cd94"
            let rawInput = "nums = [1, -2, 1, 0, 5]"
            let expectedOutput = "[[-2, 1, 1]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "EA92985F-D5E9-49C0-9125-865DADDA970F"
            let rawInput = "[1,2,-2,-1]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "003D6784-4A6E-4C62-9739-C00F1F533BEC"
            let rawInput = "[-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]"
            let expectedOutput = "[[-4,-2,6],[-4,0,4],[-4,1,3],[-4,2,2],[-2,-2,4],[-2,0,2]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "A5A0A856-654D-4297-B955-FBDF068C64C0"
            let rawInput = "[-1,0,1,2,-1,-4,-2,-3,3,0,4]"
            let expectedOutput = "[[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
            let slug = "3sum"
            let topic = "two-pointers"
            let testId = "DB94E37D-ED5B-43C2-8209-524CB0C1878E"
            let rawInput = "[3,0,-2,-1,1,2]"
            let expectedOutput = "[[-2,0,2],[-1,0,1]]"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 3 <= nums.length <= 3000")
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= nums[i] <= 105")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.threeSum(p_nums)
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
