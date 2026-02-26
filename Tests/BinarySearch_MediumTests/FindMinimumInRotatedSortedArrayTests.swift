import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindMinimumInRotatedSortedArray {
    private class Solution {
        func findMin(_ nums: [Int]) -> Int {
            var left = 0
            var right = nums.count - 1

            while left < right {
                let mid = left + (right - left) / 2

                if nums[mid] > nums[right] {
                    // Minimum is in the right half
                    left = mid + 1
                } else {
                    // Minimum is in the left half (including mid)
                    right = mid
                }
            }

            return nums[left]
        }
    }

    @Suite struct FindMinimumInRotatedSortedArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bffd4475-5eca-4190-9415-35b90a4b5480",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e4dd10e6-f4b1-4590-90c8-e04397c6881d",
             input: "nums = [1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "90b284e8-47f4-4f27-9eaa-60e70952bcac",
             input: "nums = [2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9256f110-e1c0-4b29-840e-8f982d258f93",
             input: "nums = [5,1,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "363abf15-244e-444f-bce2-6a1c14b4be68",
             input: "nums = [1,2,3,4,5,6,7]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7080c220-a024-45f0-bf54-0ceb68c7da39",
             input: "nums = [7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "49304f73-77d2-4ab8-a833-4e8b5f74d3a3",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "-5", orderMatters: true),
            TestCaseData(id: "36f92b2e-d135-4661-b5f8-49788911e2bd",
             input: "nums = [10,20,30,40,50]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "04295e81-a0e1-4857-bb70-535a17126095",
             input: "nums = [50,40,30,20,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "8a1aa6b4-102a-4ff8-99cb-9eb1d6efdaf8",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7251426c-0c55-44e0-9ab6-5095eaae44b2",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "10df85c2-d893-4e4d-92e3-4eb3a310f67a",
             input: "nums = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "-10", orderMatters: true),
            TestCaseData(id: "09fe0ec8-9922-4696-9ce1-d37bf496e189",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "4bff4a89-357c-4553-9e06-04a7d6fc72e8",
             input: "nums = [5000,4000,3000,2000,1000]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "60aa6b84-5dcb-4d75-91fd-30b700b580a7",
             input: "nums = [5,6,7,1,2,3,4]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1222fe58-4f74-40da-8703-48db4c05941c",
             input: "nums = [10,20,30,1,2,3,4,5,6,7,8,9]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7125c136-283b-47f4-8b67-fde26f617a27",
             input: "nums = [9,8,7,6,5,4,3,2,1,10,20,30]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9dbbd9dc-b332-4a1a-af53-152a9ff16118",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "81e63589-42e3-44bf-85b6-5b1d7087bca1",
             input: "nums = [3,4,5,1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ecd09d04-8c47-471f-ab5d-ba9dba464922",
             input: "nums = [4,5,6,7,0,1,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9800463b-6f75-4138-b520-ce56ef437de9",
             input: "nums = [11,13,15,17]",
             expected: "11", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-minimum-in-rotated-sorted-array"
            let topic = "binary-search"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.allSatisfy({ $0 >= -5000 && $0 <= 5000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -5000 <= nums[i] <= 5000"
                )
                return
            }

            let solution = Solution()
            let result = solution.findMin(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
