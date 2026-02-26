import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
       let sortedNums = nums.sorted()
       var result: [[Int]] = []
       for i in 0..<sortedNums.count - 3 {
          if i > 0 && sortedNums[i] == sortedNums[i - 1] { continue }
          for j in i + 1..<sortedNums.count - 2 {
             if j > i + 1 && sortedNums[j] == sortedNums[j - 1] { continue }
             var left = j + 1
             var right = sortedNums.count - 1
             while left < right {
                let sum = sortedNums[i] + sortedNums[j] + sortedNums[left] + sortedNums[right]
                if sum < target {
                   left += 1
                } else if sum > target {
                   right -= 1
                } else {
                   result.append([sortedNums[i], sortedNums[j], sortedNums[left], sortedNums[right]])
                   while left < right && sortedNums[left] == sortedNums[left + 1] { left += 1 }
                   while left < right && sortedNums[right] == sortedNums[right - 1] { right -= 1 }
                   left += 1
                   right -= 1
                }
             }
          }
       }
       return result
    }
}

@Suite struct LC4sumTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "A39A29A9-B2E4-4BAE-9773-2A56C4143B4F"
        let rawInput = "{\"nums\": [1,2,3,4,5], \"target\": 100}"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "42BEDD6D-CD30-4EA2-A89E-EFE3ED07E896"
        let rawInput = "[1, 2, 3, 4, 5], 100"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "6652F16E-40F1-4EA5-86F1-E9F7F115666D"
        let rawInput = "[2, 2, 2, 2, 2], 8"
        let expectedOutput = "[[2,2,2,2]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "43F041A6-9FC4-400B-9AF2-681202EA5411"
        let rawInput = "[1, 1, 1, 1, 2, 2, 2, 3], 5"
        let expectedOutput = "[[1, 1, 1, 2]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "0B37872D-E180-451A-BE89-46D2438A9289"
        let rawInput = "[1000000000, 1000000000, 1000000000, 1000000000], 4000000000"
        let expectedOutput = "[[1000000000, 1000000000, 1000000000, 1000000000]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "B56394E1-C197-4F75-BAFD-AA62B776AF38"
        let rawInput = "[-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5], -10"
        let expectedOutput = "[[-5, -4, -3, 2], [-5, -4, -2, 1], [-5, -4, -1, 0], [-5, -3, -2, 0], [-4, -3, -2, -1]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "4f3ea156-fe81-458f-b632-dee1419be706"
        let rawInput = "nums = [], target = 0"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "d2d6dd62-0994-4125-8329-413ae8ce63ed"
        let rawInput = "nums = [0, 1, 1, 1], target = 3"
        let expectedOutput = "[[0, 1, 1, 1]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "235EE92D-2744-427F-B59F-540D20831608"
        let rawInput = "[1, 2, 3], 6"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "711CBF47-D3E4-416E-AF57-C8822120EE64"
        let rawInput = "[2, 2, 2, 2, 2], 10"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "B01C87F7-4C51-4767-BFDF-F4942B1F1572"
        let rawInput = "[-3, -2, -1, 0, 0, 1, 2, 3], 0"
        let expectedOutput = "[[-2,-1,0,3],[-3,-1,1,3],[-3,0,0,3],[-3,0,1,2],[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "e998099b-5497-4da0-9050-3958eb67dd1c"
        let rawInput = "nums = [0, -1, -1, -1], target = -3"
        let expectedOutput = "[[-1,-1,-1,0]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "93cdd25b-b460-403b-80db-d6845dbd676e"
        let rawInput = "nums = [1, 1, 1, 1, 1, 1], target = 5"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "9f736b64-65f9-480c-846b-cd7e9825aa94"
        let rawInput = "nums = [1, 0, -1, 0, -2, 2], target = 1"
        let expectedOutput = "[[-2,0,1,2],[-1,0,0,2]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "c410d428-964c-430e-aaf9-4747cfa9e5de"
        let rawInput = "nums = [1, 0, -1, 0, -2, 2], target = 2"
        let expectedOutput = "[[-1,0,1,2]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "4sum"
        let topic = "two-pointers"
        let testId = "61d2f9a5-c197-41c9-b81a-8e3b07047d7d"
        let rawInput = "nums = [1,0,-1,0,-2,2], target = 0"
        let expectedOutput = "[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }
        let p_target = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 200 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 200")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= nums[i] <= 109")
            return
        }
        guard p_target >= -109 && p_target <= 109 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -109 <= target <= 109")
            return
        }

        let solution = Solution()
        let result = solution.fourSum(p_nums, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
