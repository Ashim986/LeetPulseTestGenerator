import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSearchInRotatedSortedArrayIi {
    private class Solution {
        func search(_ nums: [Int], _ target: Int) -> Bool {
            var left = 0
            var right = nums.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] == target {
                    return true
                }
                else if nums[left] == nums[mid] {
                    left += 1
                }
                else if nums[left] < nums[mid] {
                    if nums[left] <= target && target < nums[mid] {
                        right = mid - 1
                    }
                    else {
                        left = mid + 1
                    }
                }
                else {
                    if nums[mid] < target && target <= nums[right] {
                        left = mid + 1
                    }
                    else {
                        right = mid - 1
                    }
                }
            }
            return false
        }
    }

    @Suite struct SearchInRotatedSortedArrayIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6c57f224-1512-4dca-8a5e-3e4cdd611764",
             input: "nums = [1], target = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "110c557c-b7f1-4ad5-95d7-f1ff8811f3e3",
             input: "nums = [1], target = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "53e370ce-20f4-4fcd-abc6-77707ee06c18",
             input: "nums = [1, 2, 3], target = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7bf96cec-2cc0-47c5-b825-b44d79c43487",
             input: "nums = [1, 2, 3], target = 4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0cbf5ee0-d9d6-46d6-b160-d08d2cbf7dcc",
             input: "nums = [1, 1, 1], target = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "dd75ef93-897f-49bc-91d3-c10c28d293c3",
             input: "nums = [1, 1, 1], target = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7c1b65aa-4896-42b8-8d99-6872c3a1fe95",
             input: "nums = [2, 2, 2, 0, 0, 1], target = 0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "317f93bc-1aee-42b3-9271-8122f8b6e09d",
             input: "nums = [2, 2, 2, 0, 0, 1], target = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "48ae6793-7f82-47bc-b5d3-0c616b987bbb",
             input: "nums = [1, 2, 3, 4, 5], target = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f8887db7-1868-4635-9f1c-16171f42aba6",
             input: "nums = [5, 4, 3, 2, 1], target = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "856cb339-c7f1-4641-913d-e265417d78db",
             input: "nums = [1, 2, 3, 4, 5], target = 6",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ad858ddf-9c27-4b50-b647-b58cd088d9fa",
             input: "nums = [5, 4, 3, 2, 1], target = 6",
             expected: "false", orderMatters: true),
            TestCaseData(id: "650ab519-53fd-45c9-a922-fcbc213c0452",
             input: "nums = [-1, 0, 1], target = 0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6ea2ecbb-7d5f-4e8e-9e80-04ed10344cb0",
             input: "nums = [-1, 0, 1], target = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "789e91bb-492a-48db-afd4-70d7354bf5cd",
             input: "nums = [1, 0, -1], target = 0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "032e374c-d1bf-426c-bd6a-07df278737dd",
             input: "nums = [1, 0, -1], target = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f505e071-8906-4245-ad43-6cb5786eb044",
             input: "nums = [10, 20, 30, 40, 50], target = 20",
             expected: "true", orderMatters: true),
            TestCaseData(id: "31e8ccf2-fa7c-4f35-a733-d5f46a8e638d",
             input: "nums = [10, 20, 30, 40, 50], target = 60",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d3654e49-a63d-4156-a816-4f83b47c1fb4",
             input: "nums = [50, 40, 30, 20, 10], target = 20",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c97496f5-3e16-4eb8-9feb-e4548c4f4146",
             input: "nums = [50, 40, 30, 20, 10], target = 60",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b434b69b-0521-4dfc-97cc-17a133141246",
             input: "nums = [], target = 1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e7dff577-1c07-43cf-a5f4-facddd0f9cb7",
             input: "nums = [1, 1, 1, 1, 1], target = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0f9a38ea-97fb-4df1-a501-0fa68a051b29",
             input: "nums = [1, 1, 1, 1, 1], target = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8c9b84d0-403d-4439-97af-aad0adbef33d",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9], target = 5",
             expected: "true", orderMatters: true),
            TestCaseData(id: "024870bc-97aa-4338-83b4-8802e960f95f",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9], target = 10",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "search-in-rotated-sorted-array-ii"
            let topic = "binary-search"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 5000"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }
            guard p_target >= -104 && p_target <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= target <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.search(p_nums, p_target)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
