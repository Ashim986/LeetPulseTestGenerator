import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDeleteAndEarn {
    private class Solution {
        func deleteAndEarn(_ nums: [Int]) -> Int {
            let maxNum = nums.max().unsafelyUnwrapped
            var freq = Array(repeating: 0, count: maxNum + 1)
            for num in nums {
                freq[num] += 1
            }
            var dp = Array(repeating: 0, count: maxNum + 1)
            dp[1] = freq[1]
            for i in 2...maxNum {
                dp[i] = max(dp[i - 1], dp[i - 2] + freq[i] * i)
            }
            return dp[maxNum]
        }
    }

    @Suite struct DeleteAndEarnTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "62525cf6-03c0-4bc8-91e4-9a9c25b3988a",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e5d716b7-cd82-4314-aed9-60edc9dd12bc",
             input: "nums = [1, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "de42fc6f-96c1-49d4-bce4-3d84dda091a4",
             input: "nums = [1, 1, 1, 1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "0abc3fd2-6596-4fc4-bfe0-efb9fe887fb8",
             input: "nums = [100, 100, 100]",
             expected: "300", orderMatters: true),
            TestCaseData(id: "7272ae0b-dff5-475f-98da-51c17999c17a",
             input: "nums = [1000, 1000, 1000, 1000]",
             expected: "4000", orderMatters: true),
            TestCaseData(id: "b8321d74-c773-47b3-8345-1083da35010f",
             input: "nums = [1, 3, 5, 7, 9]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "c36207b7-7a44-4a1e-8fa3-22a910f17d95",
             input: "nums = [9, 7, 5, 3, 1]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "ed063722-5a5c-4e6b-9020-b90f23a68211",
             input: "nums = [10, 20, 30, 40, 50]",
             expected: "150", orderMatters: true),
            TestCaseData(id: "61652512-bb99-487e-8041-ce9e4bfa691f",
             input: "nums = [50, 40, 30, 20, 10]",
             expected: "150", orderMatters: true),
            TestCaseData(id: "bebf4476-3b2e-4cc5-b719-abe0f0be28dc",
             input: "nums = [1000, 2000, 3000, 4000, 5000]",
             expected: "15000", orderMatters: true),
            TestCaseData(id: "0e642167-f6af-41cc-9504-6c0281f56b66",
             input: "nums = [5000, 4000, 3000, 2000, 1000]",
             expected: "15000", orderMatters: true),
            TestCaseData(id: "daf165f1-f984-428f-8063-f5050e24bd5c",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "5758d768-150b-4d39-9779-5312e18f12e7",
             input: "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "62d53fc5-a54c-4d69-9a54-a430a5151256",
             input: "nums = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "adb83142-4e13-4d6e-ae0b-721302987c7b",
             input: "nums = [10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000]",
             expected: "100000", orderMatters: true),
            TestCaseData(id: "1d329e71-0d64-45b6-8016-e0ff7a6c01ce",
             input: "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "0fc5b130-54c3-4a02-9ad0-1f0cdaf42c30",
             input: "nums = [19, 17, 15, 13, 11, 9, 7, 5, 3, 1]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "ee6e977e-fb88-4057-9907-cd7fd79d27ef",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "4c57349f-d319-46d4-b577-373bf8c84c10",
             input: "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "150", orderMatters: true),
            TestCaseData(id: "4db8cb42-1abc-4fab-b6fb-a20eb4e506d4",
             input: "nums = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100]",
             expected: "1500", orderMatters: true),
            TestCaseData(id: "02e7d15a-b884-452a-a1ab-d975e5e5449f",
             input: "nums = [1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "316737a9-1826-4af7-a0d4-d718143d5fed",
             input: "nums = [1, 2, 3]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "497fa0dd-4907-402e-8a36-344ed26e2387",
             input: "nums = [1, 2, 3, 4]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "f0365036-8658-4c9a-8b30-b0a6861440d5",
             input: "nums = [3,4,2]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "728128ff-e5e1-4ed1-9999-ad463b713384",
             input: "nums = [2,2,3,3,3,4]",
             expected: "9", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "delete-and-earn"
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
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 2 * 104"
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
            let result = solution.deleteAndEarn(p_nums)
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
