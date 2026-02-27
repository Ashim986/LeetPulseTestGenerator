import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDominoAndTrominoTiling {
    private class Solution {
        func numTilings(n: Int) -> Int {
            let MOD = 1000000007
            if n == 1 {
                return 0
            }
            if n == 2 {
                return 1
            }
            if n == 3 {
                return 2
            }
            var dp = Array(repeating: 0, count: n + 1)
            dp[1] = 0
            dp[2] = 1
            dp[3] = 2
            for i in 4...n {
                dp[i] = (2 * dp[i-1]) + dp[i-3]
                dp[i] %= MOD
            }
            return dp[n]
        }
    }

    @Suite struct DominoAndTrominoTilingTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b851889d-870c-42f4-98f9-5345e0238df6",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8293505a-5782-4782-a6bd-aaf22de6ab10",
             input: "n = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b7dc8529-e82b-4cde-be8c-a1f49d320acb",
             input: "n = 5",
             expected: "9", orderMatters: true),
            TestCaseData(id: "5baefde2-df34-4d86-80b3-a5271abfc07d",
             input: "n = 6",
             expected: "20", orderMatters: true),
            TestCaseData(id: "211d377d-26e1-42e8-b737-d64993d50d4e",
             input: "n = 7",
             expected: "44", orderMatters: true),
            TestCaseData(id: "20f9a94f-636d-4ddc-8e6f-1d39de1f1bb0",
             input: "n = 8",
             expected: "97", orderMatters: true),
            TestCaseData(id: "2f268026-631a-4ff2-903c-179189c781b2",
             input: "n = 9",
             expected: "214", orderMatters: true),
            TestCaseData(id: "eedfbb0a-af6a-452a-82b1-c87c2df1e03b",
             input: "n = 10",
             expected: "472", orderMatters: true),
            TestCaseData(id: "97afecc4-6c36-4ef4-b876-74e3c2076b87",
             input: "n = 11",
             expected: "1041", orderMatters: true),
            TestCaseData(id: "2aa1e146-9b6e-4971-a077-d8d843484238",
             input: "n = 12",
             expected: "2296", orderMatters: true),
            TestCaseData(id: "44622b70-d795-47cd-87ca-0dee350386ab",
             input: "n = 13",
             expected: "5064", orderMatters: true),
            TestCaseData(id: "28955735-fca3-4f33-976f-dde7893e3f06",
             input: "n = 14",
             expected: "11169", orderMatters: true),
            TestCaseData(id: "b4d9a897-beb3-406b-85b2-8f08f31d3de8",
             input: "n = 15",
             expected: "24634", orderMatters: true),
            TestCaseData(id: "6b8936da-7dac-47cb-96d3-b83b0224bc71",
             input: "n = 16",
             expected: "54332", orderMatters: true),
            TestCaseData(id: "15a8dc4b-0eda-47f7-8ebb-ea63ad167510",
             input: "n = 17",
             expected: "119833", orderMatters: true),
            TestCaseData(id: "ec67c4d2-298a-44b1-ab6b-81f44d835831",
             input: "n = 18",
             expected: "264300", orderMatters: true),
            TestCaseData(id: "c32ac15d-1a04-47b9-9a44-708efc74551e",
             input: "n = 19",
             expected: "582932", orderMatters: true),
            TestCaseData(id: "d215c2e9-0639-4321-8f9b-07a661ea5ec2",
             input: "n = 20",
             expected: "1285697", orderMatters: true),
            TestCaseData(id: "b00a4f73-fdc3-4e38-8e98-730b6b9fdacc",
             input: "n = 21",
             expected: "2835694", orderMatters: true),
            TestCaseData(id: "7bff00b6-b13f-432a-93a8-5682def4ec10",
             input: "n = 22",
             expected: "6254320", orderMatters: true),
            TestCaseData(id: "041f0d47-621c-47fb-86bc-7f856de1dd2e",
             input: "n = 23",
             expected: "13794337", orderMatters: true),
            TestCaseData(id: "914fc4a0-288d-4442-b2a6-68baa9a0282a",
             input: "n = 24",
             expected: "30424368", orderMatters: true),
            TestCaseData(id: "61ad33bd-b59d-4fd5-8d79-67678abfda24",
             input: "n = 25",
             expected: "67103056", orderMatters: true),
            TestCaseData(id: "d5cfc0bf-2a4b-430e-8ff2-a63c337b147d",
             input: "n = 26",
             expected: "148000449", orderMatters: true),
            TestCaseData(id: "05863537-514b-4d34-abc2-eeb22398c95d",
             input: "n = 27",
             expected: "326425266", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "domino-and-tromino-tiling"
            let topic = "dynamic-programming"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.numTilings(n: p_n)
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
