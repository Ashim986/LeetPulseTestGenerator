import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPartitionToKEqualSumSubsets {
    private class Solution {
        func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
            let total = nums.reduce(0, +)
            if total % k != 0 {
                return false
            }
            let target = total / k
            var visited = Array(repeating: false, count: nums.count)
            return backtrack(nums.sorted(by: >), k, target, 0, 0, visited)
        }

        func backtrack(_ nums: [Int], _ k: Int, _ target: Int, _ index: Int, _ currentSum: Int, _ visited: [Bool]) -> Bool {
            if k == 0 {
                return true
            }
            if currentSum == target {
                return backtrack(nums, k - 1, target, 0, 0, visited)
            }
            for i in index..<nums.count {
                if !visited[i] && currentSum + nums[i] <= target {
                    var newVisited = visited
                    newVisited[i] = true
                    if backtrack(nums, k, target, i + 1, currentSum + nums[i], newVisited) {
                        return true
                    }
                }
            }
            return false
        }
    }

    @Suite struct PartitionToKEqualSumSubsetsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f8f2f333-2ee4-4ef7-89e4-9f774f964b75",
             input: "nums = [1, 1, 1], k = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0e1a3252-c55e-4bbd-bdd5-455a3ec11ee7",
             input: "nums = [10, 10, 10, 7, 7, 7], k = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9eb07f5c-624d-402e-b4a2-068c5b0f00d5",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1], k = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fce2e45a-6230-4414-8ee4-75b22aed17e1",
             input: "nums = [5, 5, 5, 5, 5], k = 5",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7537e3a3-b059-4cb1-8f74-9abbde385453",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1], k = 5",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ea23f01c-1aba-428b-a0b5-10436d4a3995",
             input: "nums = [1, 1, 1, 1, 1, 1], k = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ea6ac4aa-617c-4a51-ba1e-d56e328f0cf2",
             input: "nums = [10, 10, 10, 10, 10, 10], k = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5415b788-e176-4d9b-a1c7-3e53e80fdb5d",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1], k = 4",
             expected: "true", orderMatters: true),
            TestCaseData(id: "500ce4f6-f35c-48e9-9ce5-3524e52069a9",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1], k = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "34af9b42-8eda-444e-b288-b5aa885149db",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], k = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "903d6556-b99d-4529-8dbb-0d771100fb18",
             input: "nums = [1], k = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e525412a-3520-4c57-b695-97b5c7e2391d",
             input: "nums = [1, 2], k = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e8c471da-e924-4782-81a7-ba240e9eeb34",
             input: "nums = [1, 1], k = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c45a8634-af22-429e-9ec4-0dec850b9837",
             input: "nums = [1, 2, 3], k = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0c8977a7-bd86-4471-9d58-73ce2b5f3a15",
             input: "nums = [1, 2, 3], k = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "04fa92fd-bdd8-4d10-bdb9-67aa71950a03",
             input: "nums = [1, 1, 1], k = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0d6e7f6c-77ea-4f2f-8caf-301b3f161db1",
             input: "nums = [1, 1, 1], k = 4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "446c4039-9b36-45bc-b6ed-f466ed6045a7",
             input: "nums = [-1, -1, -1], k = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "bb0cf062-be37-4ddf-a348-b32757ffb72d",
             input: "nums = [-1, 1, -1], k = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e7e22714-1abf-4480-9dcd-a88a500755cd",
             input: "nums = [0, 0, 0], k = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1160c85b-431a-4dd9-96c7-f2b340de0906",
             input: "nums = [0, 1, 0], k = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8ba9c54b-9acb-47aa-a5d8-c2abb9f01ee1",
             input: "nums = [1000, 1000, 1000], k = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3fa71619-9409-4d07-b0a1-84c85f76e053",
             input: "nums = [1000, 1001, 1002], k = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a9b6c3af-1a70-4774-ab9a-becff617ba6b",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1], k = 10",
             expected: "true", orderMatters: true),
            TestCaseData(id: "880f7b5e-436b-4dbe-9334-e395df59403d",
             input: "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10], k = 10",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "partition-to-k-equal-sum-subsets"
            let topic = "dynamic-programming"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
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
            guard p_k >= 1 && p_k <= 16 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= nums.length <= 16"
                )
                return
            }
            guard p_nums.count >= 1 && p_nums.count <= 16 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= nums.length <= 16"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 1 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.canPartitionKSubsets(p_nums, p_k)
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
