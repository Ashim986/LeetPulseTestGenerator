import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPredictTheWinner {
    private class Solution {
        func PredictTheWinner(_ nums: [Int]) -> Bool {
            let n = nums.count
            var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
            for i in stride(from: n - 1, through: 0, by: -1) {
                dp[i][i] = nums[i]
                for j in stride(from: i + 1, through: n - 1, by: 1) {
                    dp[i][j] = max(nums[i] - dp[i + 1][j], nums[j] - dp[i][j - 1])
                }
            }
            return dp[0][n - 1] >= 0
        }
    }

    @Suite struct PredictTheWinnerTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "83b48747-dfac-4fad-b143-8f68dfb7622b",
             input: "nums = [1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7ffbc63d-ee89-4e7a-9278-c1c855b7bc2f",
             input: "nums = [1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "56c53fc4-03b1-4163-82f3-2e8d367c1b75",
             input: "nums = [1, 2, 3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b0d72a42-a0a1-4e1f-a036-55377540a5bf",
             input: "nums = [3, 2, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e2f591cd-bc5c-436e-8824-7cea43485f43",
             input: "nums = [1000, 2000, 3000]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "17f8aad9-62e9-4d1c-9793-b0380798424a",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7e0bbf33-31b1-47e7-9877-5a661880d525",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a9629e95-45ca-42b2-9341-f1d0c687b003",
             input: "nums = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c3c01e7c-839c-4668-a038-2f9658ca7e16",
             input: "nums = [1, -1, 1, -1, 1, -1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "09869aa3-0162-45a0-9d08-2ad12a49ffef",
             input: "nums = [0, 0, 0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1ba8a37a-03fa-4a3d-8d0a-56e361c1ee0d",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "279ca961-2873-4dd6-a216-f6cec5e1feb8",
             input: "nums = [20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "be21d362-32fe-4138-8fdf-9732f9dfdec8",
             input: "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4f24e410-3cfd-4838-b662-b36a57ad9339",
             input: "nums = [19, 17, 15, 13, 11, 9, 7, 5, 3, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "52dc48ec-1253-4e87-8f69-ffa075f3a43f",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f5b2e946-51c2-493e-8664-809a755729d8",
             input: "nums = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "21142c7d-411d-4f7f-824d-2a7e2c40e0f7",
             input: "nums = [20, 18, 16, 14, 12, 10, 8, 6, 4, 2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "374631e9-8cee-44d0-99bd-8ad078b42059",
             input: "nums = [1, 3, 5, 7, 9]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c53a8cdc-0d10-4b51-977b-04da061f02ff",
             input: "nums = [9, 7, 5, 3, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fa4a1100-176e-4b51-9b8e-83af43845b23",
             input: "nums = [1, 2, 3, 4, 5, 6]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "12c716ac-a4f5-43ff-b268-3116e29c8419",
             input: "nums = [6, 5, 4, 3, 2, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "dd2caa60-fcd7-4213-aa06-41ecda887667",
             input: "nums = [1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f80ba08a-9712-4d7f-89c8-af9d190dca93",
             input: "nums = [2, 2, 2, 2, 2, 2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ae60ff5b-2e1c-47a2-988d-0f5c1d998fcb",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "436c0f4b-8835-444b-bcd1-130f85c2f313",
             input: "nums = [5, 4, 3, 2, 1]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "predict-the-winner"
            let topic = "math-geometry"
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
            guard p_nums.count >= 1 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 20"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 107 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 107"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.PredictTheWinner(p_nums)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
