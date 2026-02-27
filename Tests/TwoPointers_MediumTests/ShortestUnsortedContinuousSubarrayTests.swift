import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCShortestUnsortedContinuousSubarray {
    private class Solution {
        func findUnsortedSubarray(_ nums: [Int]) -> Int {
          let sorted = nums.sorted()
          var left = nums.count
          var right = 0
          for i in 0...nums.count - 1 {
            if nums[i] != sorted[i] {
              left = min(left, i)
              right = max(right, i)
            }
          }
          return right - left < 0 ? 0 : right - left + 1
        }
    }

    @Suite struct ShortestUnsortedContinuousSubarrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ba43c823-9cc8-4b3c-85c7-80a3be3c8230",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "31cba069-99bb-4bc0-bdc0-cc147ce370b8",
             input: "nums = [2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8af32926-18a9-4c72-a07e-81ffc49989aa",
             input: "nums = [5,4,3,2,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "bb7d72f0-f470-405a-b720-9f2bbe9fb27a",
             input: "nums = [1,3,2,4,5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6f08cb66-829f-4233-8b01-f8c7d7339f64",
             input: "nums = [-1,2,3,4,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cf667b51-0be0-47a7-96d9-65cb3b65142e",
             input: "nums = [1,-2,3,4,5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2f23658d-1e49-4187-b183-b4063a0081fa",
             input: "nums = [1,2,-3,4,5]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "630446c7-ae6d-4303-9c89-27fc38c964a6",
             input: "nums = [1,2,3,-4,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ef784561-177b-4ae3-9bb1-de7c7a59782e",
             input: "nums = [1,2,3,4,-5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "509a813c-5cec-49fc-8e39-7d472ca67389",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "9785a72b-d674-4214-ad25-e61e9caf7609",
             input: "nums = [2,2,2,2,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "7d1ed3e6-d0f0-4f5f-96a4-8312e1b11281",
             input: "nums = [10,9,8,7,6,5,4,3,2,1,0]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "1b50f826-4a19-42ad-9519-f8732fc70e3c",
             input: "nums = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "6d6fe504-9f26-43e9-acfa-6be123c11465",
             input: "nums = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "be0ec146-205e-4a44-b61a-3f6232ddc4c9",
             input: "nums = [19,17,15,13,11,9,7,5,3,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "313b646b-50b8-4360-8e36-60e01e9001a5",
             input: "nums = [25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "2984fde0-33e4-41fa-851d-36f18ab08756",
             input: "nums = [30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "2cd57b82-96a9-4682-b3bc-1358184e6c84",
             input: "nums = [1,3,2,0,-1,-3]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "6e99e6ba-4bd3-4fd6-a907-898342cd0329",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a3ed10b1-d032-4a98-9d79-eb54d9980693",
             input: "nums = [1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0083a8d3-52c1-4b66-b055-9ec083d865be",
             input: "nums = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3cbf9cd5-fbae-4b9f-9832-05c08c85bfc6",
             input: "nums = [1,2,3,4,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "58a56adb-9a52-44b7-b383-0b9a6b639a4c",
             input: "nums = [1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8d11b498-7328-4f34-9310-61b50450dc3a",
             input: "nums = [1,2,2,2,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "54e5836b-cb1a-4aff-911c-72e6b75e56b0",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "shortest-unsorted-continuous-subarray"
            let topic = "two-pointers"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -105 <= nums[i] <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findUnsortedSubarray(p_nums)
            }
            guard !didCrash, let result = resultHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
