import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCArithmeticSlices {
    private class Solution {
        func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
            var count = 0
            var dp = [Int: Int]()
            for i in 2..<nums.count {
                let diff = nums[i] - nums[i - 1]
                for j in (0...i - 2) {
                    let prevDiff = nums[j + 1] - nums[j]
                    if prevDiff == diff {
                        if let currCount = dp[j] {
                            count += currCount
                            dp[i] = (dp[i] ?? 0) + currCount
                        }
                    }
                }
                dp[i] = (dp[i] ?? 0) + 1
            }
            return count
        }
    }

    @Suite struct ArithmeticSlicesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "83aec5a0-42ce-4439-a59e-547d4e15673c",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d019ea9b-fb60-4dd9-a0c0-5230e5b09f2e",
             input: "nums = [1, 2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "30b06ccf-fd4a-4d1e-93a4-fb60d784023d",
             input: "nums = [1, 2, 3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7e7e8d72-cbe9-4559-95e0-efcde7bf637a",
             input: "nums = [1, 3, 5, 7, 9]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "6d9d1d85-3a84-4bdd-a95b-f3099a2630c8",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f472184a-39db-43cb-900a-f4b15e213df4",
             input: "nums = [-1, 0, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b515c8b6-482c-4bac-849a-ad4dd4490912",
             input: "nums = [1, -2, 3, -4, 5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "10fda69f-6b20-40b7-ac22-8dc028d1d1b8",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "aafad206-9898-47ca-bccd-3d63b75ee6ac",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "953556e8-c0df-4048-84c2-d356fae05430",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "265809c7-6fa2-4ae3-87e9-df13f56ca00c",
             input: "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "e638ff7d-f579-4593-a6be-37a30d76bae9",
             input: "nums = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "3c8c2d41-da0d-4489-9757-73053fb0881c",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "a84cad2f-83cb-4e03-9526-39c7bddd7b0c",
             input: "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "b36fcd41-a4fe-4973-820c-ea8ef5e74a56",
             input: "nums = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "3c16b055-bab7-435c-abac-02aa3084b82d",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]",
             expected: "91", orderMatters: true),
            TestCaseData(id: "ec478d57-91dc-4925-8b71-673dd6c5c150",
             input: "nums = [15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "91", orderMatters: true),
            TestCaseData(id: "d7cf39c9-8c5d-4072-948f-fca4b2861f9a",
             input: "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29]",
             expected: "91", orderMatters: true),
            TestCaseData(id: "a792fa2f-a59c-4f91-8972-55293a6cb78a",
             input: "nums = [29, 27, 25, 23, 21, 19, 17, 15, 13, 11, 9, 7, 5, 3, 1]",
             expected: "91", orderMatters: true),
            TestCaseData(id: "385b8c85-5d35-4631-a273-e602f230aef2",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "91", orderMatters: true),
            TestCaseData(id: "c00a982c-6bbf-437d-9ba1-ba56beb69df2",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]",
             expected: "91", orderMatters: true),
            TestCaseData(id: "0438af74-b308-40d8-8e5b-966688554966",
             input: "nums = [14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "91", orderMatters: true),
            TestCaseData(id: "60975de0-789b-4ecb-9496-aeaf5efe0bb0",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]",
             expected: "171", orderMatters: true),
            TestCaseData(id: "f99a85bc-acb6-43e4-b29e-dc6fd3ca8fcf",
             input: "nums = [20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "171", orderMatters: true),
            TestCaseData(id: "c196bc44-3fdf-4c31-b09e-c1612fb4304d",
             input: "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39]",
             expected: "171", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "arithmetic-slices"
            let topic = "dynamic-programming"
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
            guard p_nums.allSatisfy({ $0 >= -1000 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= nums[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.numberOfArithmeticSlices(p_nums)
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
