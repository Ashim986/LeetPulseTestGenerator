import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int, trace: Trace) -> [Int] {
        var counts: [Int: Int] = [:]
        for num in nums { counts[num, default: 0] += 1 }
        let countSnapshot = counts.reduce(into: [String: Int]()) { $0[String($1.key)] = $1.value }
        trace.step("count frequencies", ["counts": countSnapshot, "k": k])
        var buckets = Array(repeating: [Int](), count: nums.count + 1)
        for (num, count) in counts {
            buckets[count].append(num)
        }
        trace.step("bucket sort", ["bucketCount": buckets.count])
        var result: [Int] = []
        for freq in stride(from: buckets.count - 1, through: 1, by: -1) {
            for num in buckets[freq] {
                result.append(num)
                trace.step("pick element", ["num": num, "freq": freq, "resultSoFar": result])
                if result.count == k { return result }
            }
        }
        trace.step("result", ["topK": result])
        return result
    }
}

@Suite struct TopKFrequentElementsTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "18B3BB64-1650-4F1A-AB2D-B97674C565EB"
        let rawInput = "[1,1,1,2,2,3]\n2"
        let expectedOutput = "[1,2]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "32A1E91A-F1E9-45F6-864C-9A5AA385CEB2"
        let rawInput = "[1]\n1"
        let expectedOutput = "[1]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "AB5D7695-53AB-4BF5-9BCD-756E58DC0548"
        let rawInput = "[]\n0"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "FBC2042C-A3FE-4F4D-BD99-F92BCF6F072D"
        let rawInput = "[1,2]\n2"
        let expectedOutput = "[1,2]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "CE0979DE-8AA4-4101-9E16-7E14AB2C225C"
        let rawInput = "[1,1,2,2,3,3,3]\n1"
        let expectedOutput = "[3]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "6FA0301E-9CF6-49F2-82E9-5A18C7867F14"
        let rawInput = "[3,0,1,0]\n1"
        let expectedOutput = "[0]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "12808917-232D-401E-825A-1258C189ECFE"
        let rawInput = "[-1,-1]\n1"
        let expectedOutput = "[-1]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "B9B40E57-7531-449B-86F7-DEA069A7ECEE"
        let rawInput = "[1,2,3,4,5,6]\n3"
        let expectedOutput = "[1,2,3]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "7EF5323F-2FCF-4245-8634-79A603FEFFC0"
        let rawInput = "[-1,-1,-1,-2,-2]\n1"
        let expectedOutput = "[-1]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "8A10AC0C-CAF6-414E-8362-0540C96449B5"
        let rawInput = "[5,5,5,5,5,6,6,6,7,7,8,8,8,8,8,9]\n2"
        let expectedOutput = "[5,8]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "5466F342-2B0F-4322-9ABF-6FD6309C9809"
        let rawInput = "[1,1,1,2,2,2,3,3,3,3]\n3"
        let expectedOutput = "[3,1,2]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "D83F67CD-E951-45C3-AAA4-86AB8C150072"
        let rawInput = "[-1,-1,-1,0,0,0]\n1"
        let expectedOutput = "[-1]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "6CD1D367-41B8-43CE-87F0-F0A39567F9F3"
        let rawInput = "[9,9,9,9,9,9,9,8,8,8,8,8,8,7,7,7,6,6,6]\n3"
        let expectedOutput = "[9,8,7]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "7288707F-0032-4C3F-8804-E25FB4BE6117"
        let rawInput = "[1,2,3,1,2,3,1,2,3,1,2,3,1,2,3]\n2"
        let expectedOutput = "[1,2]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "E5816568-2428-4C62-AC5C-7D0011E391CE"
        let rawInput = "[0,0,0,2,2,2,2,3,3,3]\n2"
        let expectedOutput = "[2,0]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "E5BDEC86-4D5D-41FB-944A-A926DFE77E3A"
        let rawInput = "[-1,-2,-3,-2,-1,-2,-2,0,0,0]\n3"
        let expectedOutput = "[-2,0,-1]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "EA033C51-24B6-494E-A747-815D8FD50462"
        let rawInput = "[0,4,1,-1,-1,0,-1,-1,-1,4,4,0]\n3"
        let expectedOutput = "[-1,0,4]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "973611B9-E5D6-4E64-82E4-F93FCAEF9455"
        let rawInput = "[5,5,5,5,5,5,5,4,4,4,4,4,3,3,3,2,2,1]\n5"
        let expectedOutput = "[5,4,3,2,1]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "4622C7AC-6AF8-42EE-92F9-B1F832B433C2"
        let rawInput = "[8,8,8,8,8,8,8,1,1,1,1,1,1,1]\n2"
        let expectedOutput = "[8,1]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "0E9D7F62-DE82-40A0-B464-698B0C061557"
        let rawInput = "[1,2,2,4,2,4,4,5,4,5,5,5,4,5,5]\n2"
        let expectedOutput = "[5,4]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "18F39EFC-103E-49D8-BA1F-11548FD4D42B"
        let rawInput = "[-3,-3,-3,-3,-3,-3,-3,-3,-2,-2,-2,-2,0,0,0,0,0,0,1,1,1]\n2"
        let expectedOutput = "[-3,0]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "E36A2762-BEA0-45F5-B40D-0902AFA8D4AE"
        let rawInput = "[7,7,7,7,7,7,7,7,7,6,6,6,6,5,5,5,5]\n3"
        let expectedOutput = "[7,6,5]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "876AF71D-D810-472C-8BCB-94C00E3C5547"
        let rawInput = "[3,3,3,2,2,2,1,1,1]\n2"
        let expectedOutput = "[3,2]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "384F1658-7874-468D-B91C-28D2DD658CD0"
        let rawInput = "[3,2,1]\n3"
        let expectedOutput = "[3,2,1]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "top-k-frequent-elements"
        let topic = "heap-priority-queue"
        let testId = "3983DB95-63D9-451E-976D-FA9A6E01DB01"
        let rawInput = "[1,1,2,2,3,3,4,4,5,5]\n5"
        let expectedOutput = "[1,2,3,4,5]"
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
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_nums.count >= 1 && p_nums.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= nums.length <= 105")
            return
        }
        guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -104 <= nums[i] <= 104")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.topKFrequent(p_nums, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
