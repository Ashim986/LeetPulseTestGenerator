import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCombinationSumIv {
    private class Solution {
        func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
            var dp: [Int] = Array(repeating: 0, count: target + 1)
            dp[0] = 1
            for i in 1...target {
                for num in nums {
                    if i >= num {
                        dp[i] += dp[i - num]
                    }
                }
            }
            return dp[target]
        }
    }

    @Suite struct CombinationSumIvTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ae44add8-c13e-4864-99f3-f9214c03eb8f",
             input: "nums = [1,2,3], target = 6",
             expected: "24", orderMatters: true),
            TestCaseData(id: "282a3d10-1f3d-4871-ada3-03629108b0f1",
             input: "nums = [9], target = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "287887a1-4d69-4d2e-adbe-f1d3b7f2f5a0",
             input: "nums = [1], target = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "54d2e131-803d-488f-aafd-eeb02c42c245",
             input: "nums = [], target = 5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dd932e0c-ce87-4779-a7fa-28edc2a93352",
             input: "nums = [1,2,3,4,5], target = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0e553abe-ae79-416b-9135-f49a106b810b",
             input: "nums = [1,2,3,4,5], target = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0b12fbf2-e04f-497c-8601-3de24f3cd908",
             input: "nums = [1,2,3,4,5], target = 3",
             expected: "4", orderMatters: true),
            TestCaseData(id: "8db23d6b-76a0-48a3-9164-6050d784b7e8",
             input: "nums = [2,3,5], target = 8",
             expected: "6", orderMatters: true),
            TestCaseData(id: "f3d3795e-16b4-47d9-946f-18d14154ff53",
             input: "nums = [1,2,3,4], target = 5",
             expected: "15", orderMatters: true),
            TestCaseData(id: "8e60289b-a1d1-40a8-a0a1-08e9ea7c2a20",
             input: "nums = [1], target = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2f004bda-4b31-4869-8220-5f59dd96993f",
             input: "nums = [1,2,3,4,5], target = 10",
             expected: "464", orderMatters: true),
            TestCaseData(id: "da8053b2-e89d-4b68-982f-9fa0d9a9089b",
             input: "nums = [1,2,3,4,5], target = 4",
             expected: "8", orderMatters: true),
            TestCaseData(id: "0ee354a8-9c05-4a19-b4ce-944300824e2f",
             input: "nums = [1,2,3,4,5], target = 5",
             expected: "16", orderMatters: true),
            TestCaseData(id: "94c40c7f-b329-469b-a553-6cd23023678a",
             input: "nums = [1,2,3,4,5], target = 6",
             expected: "31", orderMatters: true),
            TestCaseData(id: "d283d239-1bb0-4111-adfc-8e2f3049cc3c",
             input: "nums = [1,2,3,4,5], target = 7",
             expected: "61", orderMatters: true),
            TestCaseData(id: "f279e031-39a2-4186-9bff-f8c9cc92b390",
             input: "nums = [1,2,3,4,5], target = 8",
             expected: "120", orderMatters: true),
            TestCaseData(id: "a22f9935-de53-4a14-b9d9-2c6f7018f0a4",
             input: "nums = [1,2,3,4,5], target = 9",
             expected: "236", orderMatters: true),
            TestCaseData(id: "feabe432-5e62-4d8d-882a-28d1658a35eb",
             input: "nums = [1,2,3,4,5], target = 11",
             expected: "912", orderMatters: true),
            TestCaseData(id: "99e98718-0bbf-4aa5-9796-ebf6b4d2bafd",
             input: "nums = [1,2,3,4,5], target = 12",
             expected: "1793", orderMatters: true),
            TestCaseData(id: "d74065ee-be13-4f4c-9367-02358207b350",
             input: "nums = [1,2,3,4,5], target = 13",
             expected: "3525", orderMatters: true),
            TestCaseData(id: "cce00852-c942-4380-8615-b48ff038f6b9",
             input: "nums = [1,2,3,4,5], target = 14",
             expected: "6930", orderMatters: true),
            TestCaseData(id: "29ee1fa9-6f73-4b6f-b3a6-bf51f06a3f37",
             input: "nums = [1,2,3,4,5], target = 15",
             expected: "13624", orderMatters: true),
            TestCaseData(id: "f31f3274-4795-4838-938e-b3380f7cecc6",
             input: "nums = [1,2,3], target = 4",
             expected: "7", orderMatters: true),
            TestCaseData(id: "c2c4a62e-10b5-4edd-82b4-c0d3bc2e4224",
             input: "nums = [9], target = 3",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "combination-sum-iv"
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
            guard p_nums.count >= 1 && p_nums.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 200"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 1 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums[i] <= 1000"
                )
                return
            }
            guard p_target >= 1 && p_target <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= target <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.combinationSum4(p_nums, p_target)
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
