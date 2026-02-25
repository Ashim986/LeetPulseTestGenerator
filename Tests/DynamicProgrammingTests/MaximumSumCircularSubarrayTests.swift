import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        let n: Int = nums.count
        let total: Int = nums.reduce(0, +)
        var maxKadane: Int = kadane(nums)
        var minKadane: Int = kadane(nums.map {
            -$0
        }
        )
        if minKadane == total {
            return maxKadane
        }
        else {
            return max(maxKadane, total - minKadane)
        }
        func kadane(_ nums: [Int]) -> Int {
            var maxSoFar: Int = Int.min
            var maxEndingHere: Int = 0
            for num in nums {
                maxEndingHere = max(num, maxEndingHere + num)
                maxSoFar = max(maxSoFar, maxEndingHere)
            }
            return maxSoFar
        }
    }
}

@Suite struct MaximumSumCircularSubarrayTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "ebe87592-3070-449c-a9db-93d6ab3b6bb7"
        let rawInput = "nums = [1]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "4d11c9bf-8ab8-4a65-9177-c0c66078bbb0"
        let rawInput = "nums = [1, 2]"
        let expectedOutput = "3"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "7006c430-a0ae-4338-b04c-21815a4d27a4"
        let rawInput = "nums = [1, -1]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "63fb279c-4110-4a53-a08d-5f891e1f7941"
        let rawInput = "nums = [-1, 1]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "b3ea9995-a0d3-46e8-a21e-72585b1db493"
        let rawInput = "nums = [1, 2, 3, 4, 5]"
        let expectedOutput = "15"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "89c9cc3e-73d5-49cf-81b8-c35dc0516f9b"
        let rawInput = "nums = [-1, -2, -3, -4, -5]"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "f4a634c8-7015-422f-9986-bc828301051b"
        let rawInput = "nums = [1, 1, 1, 1, 1]"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "390ef4c5-690e-4d5d-ac09-d616b457dd6d"
        let rawInput = "nums = [-1, -1, -1, -1, -1]"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "c2656cb4-27dd-42d6-890a-4fb64751ee2a"
        let rawInput = "nums = [10, 20, 30, 40, 50]"
        let expectedOutput = "150"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "085fc5a5-28f5-4236-9803-736746732e81"
        let rawInput = "nums = [-10, -20, -30, -40, -50]"
        let expectedOutput = "-10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "302371ed-82c0-4b1d-858b-2f5c50bd905b"
        let rawInput = "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
        let expectedOutput = "55"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "610ed594-4595-4ce1-8d25-10ee64de99f0"
        let rawInput = "nums = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10]"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "f0dcdb46-0230-4218-98c8-32daf14fbb9a"
        let rawInput = "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]"
        let expectedOutput = "100"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "f73d1c5b-6660-42b7-b554-6895c5dbbda4"
        let rawInput = "nums = [-10, -10, -10, -10, -10, -10, -10, -10, -10, -10]"
        let expectedOutput = "-10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "ec0a0eff-e590-4c99-8583-e830367ad878"
        let rawInput = "nums = [1, -1, 1, -1, 1, -1, 1, -1, 1, -1]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "3505f103-e35b-4807-a4e2-69fcd1c1b97e"
        let rawInput = "nums = [-1, 1, -1, 1, -1, 1, -1, 1, -1, 1]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "4f6dfe9f-76cf-4afa-9050-1288612851d3"
        let rawInput = "nums = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]"
        let expectedOutput = "5500"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "6a1c1eae-905b-4adc-ac6d-fe19d6fc6c5f"
        let rawInput = "nums = [-100, -200, -300, -400, -500, -600, -700, -800, -900, -1000]"
        let expectedOutput = "-100"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "a1012544-91f3-44af-973f-d5ad65914694"
        let rawInput = "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]"
        let expectedOutput = "15"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "00186ef9-8ea7-4b03-8baf-2091d8bac8bf"
        let rawInput = "nums = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "254fd345-d106-4d49-9613-6560fe716633"
        let rawInput = "nums = [-10, -20, -30, -40, -50, -60, -70, -80, -90, -100, -110, -120, -130, -140, -150]"
        let expectedOutput = "-10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "dfcc7ba0-1f39-4c5f-b8fa-55c10df11cb6"
        let rawInput = "nums = [1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000]"
        let expectedOutput = "15000"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "42e716fc-f05c-484b-ba3f-4420592f814c"
        let rawInput = "nums = [-1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000]"
        let expectedOutput = "-1000"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "e2f8865b-11f2-4a53-abbe-0c814f672b11"
        let rawInput = "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]"
        let expectedOutput = "210"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "maximum-sum-circular-subarray"
        let topic = "dynamic-programming"
        let testId = "c2fd6887-7bc7-4d8e-a781-8fe0072189fe"
        let rawInput = "nums = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16, -17, -18, -19, -20]"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_nums = InputParser.parseIntArray(params[0])
        guard p_nums.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: nums array too large (\(p_nums.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxSubarraySumCircular(p_nums)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
