import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCKthLargestElementInAnArray {
    private class Solution {
        func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
            var nums = nums
            let target = nums.count - k

            func partition(_ left: Int, _ right: Int) -> Int {
                let pivot = nums[right]
                var i = left
                for j in left..<right {
                    if nums[j] < pivot {
                        nums.swapAt(i, j)
                        i += 1
                    }
                }
                nums.swapAt(i, right)
                return i
            }

            var left = 0, right = nums.count - 1
            while true {
                let p = partition(left, right)
                if p == target { return nums[p] }
                if p < target { left = p + 1 }
                else { right = p - 1 }
            }
        }
    }

    @Suite struct KthLargestElementInAnArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ddda2a54-b66c-44b1-92be-e12feaa12c22",
             input: "nums = [1,2,3], k = 1",
             expected: "3", orderMatters: true),
            TestCaseData(id: "7434a921-3394-4699-80ef-3d5155c388ea",
             input: "nums = [5,4,3,2,1], k = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bab333f0-619e-4fa2-88ad-e427db4e6d1a",
             input: "nums = [1,1,1,1,1], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d7488960-06dc-4acc-bdf3-afc3c014e75e",
             input: "nums = [1,2,3,4,5], k = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "084f57e4-1100-4fae-9c25-67d661d49f8b",
             input: "nums = [10,20,30,40,50], k = 2",
             expected: "40", orderMatters: true),
            TestCaseData(id: "1f546c10-b3a7-4661-b652-19c913fd4e12",
             input: "nums = [-1,-2,-3,-4,-5], k = 1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "8efcee3f-53f9-4a7b-a4f2-22f976356918",
             input: "nums = [1,2,3,4,5], k = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bc19d628-9db4-45b7-8b32-9fa4e4700760",
             input: "nums = [1], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "77b4aa42-d25b-45e2-b5d6-a2f2bcbb1adc",
             input: "nums = [5,5,5,5,5], k = 3",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a995b4bd-817b-4382-8bbf-03317a26c5a5",
             input: "nums = [1,1,1,1,1], k = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1061dc3d-ef72-446d-bf90-0f7e80101805",
             input: "nums = [10,9,8,7,6,5,4,3,2,1], k = 1",
             expected: "10", orderMatters: true),
            TestCaseData(id: "9d4e15b0-14c9-45de-b15a-bb27c00bec21",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], k = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "636c47ea-96a0-48ec-8359-5f9eb78e7c9d",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], k = 5",
             expected: "6", orderMatters: true),
            TestCaseData(id: "b9915082-2c5d-4625-a84a-af4d5613d21c",
             input: "nums = [10,20,30,40,50,60,70,80,90,100], k = 1",
             expected: "100", orderMatters: true),
            TestCaseData(id: "8617053b-2c8e-4c9a-b053-09ddf6061dc5",
             input: "nums = [100,90,80,70,60,50,40,30,20,10], k = 10",
             expected: "10", orderMatters: true),
            TestCaseData(id: "0e6b88af-9c4b-41aa-804e-4ced356d199a",
             input: "nums = [1,3,5,7,9], k = 3",
             expected: "5", orderMatters: true),
            TestCaseData(id: "987d3488-6407-4105-80e8-a0432a6b7ca5",
             input: "nums = [2,4,6,8,10], k = 2",
             expected: "8", orderMatters: true),
            TestCaseData(id: "2f787eaf-358c-40de-96d7-c9c11ad36f21",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "92b7506b-c413-40a2-b60a-afb8f156302e",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], k = 1",
             expected: "10", orderMatters: true),
            TestCaseData(id: "dcad0759-71a6-4b5e-8200-7f59ed87a70c",
             input: "nums = [10,9,8,7,6,5,4,3,2,1], k = 5",
             expected: "6", orderMatters: true),
            TestCaseData(id: "e0c0712b-202b-4dac-99e9-b0144906f197",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], k = 9",
             expected: "2", orderMatters: true),
            TestCaseData(id: "000d6170-91d7-4f42-ab92-195429660075",
             input: "nums = [10,20,30,40,50,60,70,80,90,100], k = 5",
             expected: "60", orderMatters: true),
            TestCaseData(id: "ac0970f4-1a20-4ac1-970f-816c736bfd1c",
             input: "nums = [100,90,80,70,60,50,40,30,20,10], k = 5",
             expected: "60", orderMatters: true),
            TestCaseData(id: "3055afc4-44ba-4327-8531-0314ef27ce5f",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], k = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "efe423eb-d451-4785-8fd0-70231b3e6055",
             input: "nums = [10,20,30,40,50], k = 3",
             expected: "30", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "kth-largest-element-in-an-array"
            let topic = "heap-priority-queue"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_k >= 1 && p_k <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= nums.length <= 105"
                )
                return
            }
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findKthLargest(p_nums, p_k)
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
