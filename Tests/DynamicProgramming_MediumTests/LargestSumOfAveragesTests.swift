import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLargestSumOfAverages {
    private class Solution {
        func largestSumOfAverages(_ nums: [Int], _ k: Int) -> Double {
            let n = nums.count
            var prefixSum = [Double](repeating: 0, count: n+1)
            for i in 0...n-1 {
                prefixSum[i+1] = prefixSum[i] + Double(nums[i])
            }

            var dp = [[Double]](repeating: [Double](repeating: 0, count: k+1), count: n+1)
            for i in 1...n {
                for j in 1...min(i, k) {
                    var maxVal = Double(Int.min)
                    for x in (j-1)...(i-1) {
                        maxVal = max(maxVal, dp[x][j-1] + (prefixSum[i] - prefixSum[x]) / Double(i-x))
                    }
                    dp[i][j] = maxVal
                }
            }
            return dp[n][k]
        }
    }

    @Suite struct LargestSumOfAveragesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "71ca156e-67ed-4f76-8fb3-5b0c97db4fe1",
             input: "nums = [1], k = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "b57bf860-18d6-464f-913d-a9020b564a79",
             input: "nums = [1,2], k = 1",
             expected: "1.5", orderMatters: true),
            TestCaseData(id: "97a3c7bf-8b21-4cba-8e5a-00d0a848b4fa",
             input: "nums = [1,2,3], k = 1",
             expected: "2.0", orderMatters: true),
            TestCaseData(id: "28f0a20c-3be1-48b4-b29f-ed0f32712852",
             input: "nums = [1,2,3,4,5], k = 1",
             expected: "3.0", orderMatters: true),
            TestCaseData(id: "5ba82dbc-e82a-46fc-b2b6-fc7d5141173a",
             input: "nums = [-1,-2,-3], k = 1",
             expected: "-2.0", orderMatters: true),
            TestCaseData(id: "732b818f-f775-419a-968a-56d2ebb9194a",
             input: "nums = [10,20,30], k = 1",
             expected: "20.0", orderMatters: true),
            TestCaseData(id: "7e7dc578-ddfe-470c-8058-258e6274f1fc",
             input: "nums = [5,5,5,5,5], k = 1",
             expected: "5.0", orderMatters: true),
            TestCaseData(id: "d3c144a6-fb66-44f5-84cb-cd2ba176c515",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], k = 1",
             expected: "5.5", orderMatters: true),
            TestCaseData(id: "678c1292-2bd6-4fb5-8c77-94a151a554fc",
             input: "nums = [10,9,8,7,6,5,4,3,2,1], k = 1",
             expected: "5.5", orderMatters: true),
            TestCaseData(id: "0728da91-3ab6-4bc1-8247-875db52a6260",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], k = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "0b1f966d-8d94-47d6-b021-a826b631c28e",
             input: "nums = [5,4,3,2,1], k = 1",
             expected: "3.0", orderMatters: true),
            TestCaseData(id: "a4758f59-0b12-45a7-b0eb-054d5f6f885f",
             input: "nums = [1,2,3,4,5,6,7,8,9], k = 1",
             expected: "5.0", orderMatters: true),
            TestCaseData(id: "d1286973-63ad-4ca3-a428-3e4b873bea55",
             input: "nums = [10,20,30,40,50], k = 1",
             expected: "30.0", orderMatters: true),
            TestCaseData(id: "261102f4-d78d-4b58-a5de-43f7e9bc4244",
             input: "nums = [1,3,5,7,9], k = 1",
             expected: "5.0", orderMatters: true),
            TestCaseData(id: "d2c03f9a-6fa2-48f0-99ff-0d431d6c2713",
             input: "nums = [2,4,6,8,10], k = 1",
             expected: "6.0", orderMatters: true),
            TestCaseData(id: "02aeb024-5c2b-454e-9248-b668757afdb7",
             input: "nums = [-10,-20,-30,-40,-50], k = 1",
             expected: "-30.0", orderMatters: true),
            TestCaseData(id: "28cee1f8-e400-49c5-85d3-872253ad88ea",
             input: "nums = [100,200,300,400,500], k = 1",
             expected: "300.0", orderMatters: true),
            TestCaseData(id: "bef4b654-3b63-4977-bf46-f298ac19758e",
             input: "nums = [1,1,1,1,1,1,1,1,1], k = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "ccd54458-5c54-4fc5-afbb-78ff7dc31a51",
             input: "nums = [], k = 1",
             expected: "-9.223372036854776e+18", orderMatters: true),
            TestCaseData(id: "0b955695-539e-4c98-a296-074d15294089",
             input: "nums = [1,2,3], k = 3",
             expected: "6.0", orderMatters: true),
            TestCaseData(id: "137336c3-26d1-488d-8cb2-a8f52b9c8d7e",
             input: "nums = [1,1,1], k = 3",
             expected: "3.0", orderMatters: true),
            TestCaseData(id: "b2c51aa0-7139-443b-b679-b7a4ece8879a",
             input: "nums = [1,2,3,4,5], k = 5",
             expected: "15.0", orderMatters: true),
            TestCaseData(id: "f8272d2b-8bbc-4393-a3dd-41070562a390",
             input: "nums = [-1,-2,-3], k = 3",
             expected: "-6.0", orderMatters: true),
            TestCaseData(id: "d9a34b9c-d8d2-457e-a356-f9a5791beefc",
             input: "nums = [10,20,30], k = 3",
             expected: "60.0", orderMatters: true),
            TestCaseData(id: "e7ca133a-9130-4715-bd04-474fb7c4e502",
             input: "nums = [1,1,1,1,1], k = 5",
             expected: "5.0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "largest-sum-of-averages"
            let topic = "dynamic-programming"
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
            guard p_nums.count >= 1 && p_nums.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 100"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 1 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Double?
            let didCrash = withCrashGuard {
                resultHolder = solution.largestSumOfAverages(p_nums, p_k)
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

            // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
            // Treats -0 and 0 as equal; handles trailing zero normalization
            let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
            let matches = abs(result - expectedVal) < 1e-5
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
