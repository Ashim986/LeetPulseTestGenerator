import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBeautifulArrangement {
    private class Solution {
        func countArrangement(_ n: Int) -> Int {
            var count = 0
            var visited = 0
            func dfs(_ index: Int) {
                if index == n + 1 {
                    count += 1
                    return
                }
                for i in 1...n {
                    if (visited & (1 << (i - 1))) == 0 && (index % i == 0 || i % index == 0) {
                        visited |= (1 << (i - 1))
                        dfs(index + 1)
                        visited &= ~(1 << (i - 1))
                    }
                }
            }
            dfs(1)
            return count
        }
    }

    @Suite struct BeautifulArrangementTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7c426fd3-1381-4ec2-879c-f440ed290d49",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c8b45c64-40b7-4779-9856-76e3d68ef43a",
             input: "n = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "27df4cdc-26e1-4671-938d-75942122da31",
             input: "n = -2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1c1db614-a98b-460d-b459-2ea88151c938",
             input: "n = -3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "74d7e244-35e2-40a6-9ce0-9d20da4e02e8",
             input: "n = 4",
             expected: "8", orderMatters: true),
            TestCaseData(id: "f07885dd-f115-46ac-ae3f-86423d556f43",
             input: "n = 5",
             expected: "10", orderMatters: true),
            TestCaseData(id: "ffca07e2-02d9-4d46-a2c8-ebfa23c40840",
             input: "n = 6",
             expected: "36", orderMatters: true),
            TestCaseData(id: "e35a04db-7dcd-4f90-b455-31ff2d9859e1",
             input: "n = 7",
             expected: "41", orderMatters: true),
            TestCaseData(id: "d79edf21-31d1-4f41-b9e8-73d9e4bb3f0a",
             input: "n = 8",
             expected: "132", orderMatters: true),
            TestCaseData(id: "7b78975a-4f41-4550-83df-1b43952ef69e",
             input: "n = 9",
             expected: "250", orderMatters: true),
            TestCaseData(id: "b2968886-ce09-4c45-aff1-a9a66efdb0aa",
             input: "n = 10",
             expected: "700", orderMatters: true),
            TestCaseData(id: "d31d5e95-417f-4405-9a18-872ebc6afe96",
             input: "n = 11",
             expected: "750", orderMatters: true),
            TestCaseData(id: "855b2ac2-9d88-4283-b540-709b6194b217",
             input: "n = 12",
             expected: "4010", orderMatters: true),
            TestCaseData(id: "3533d01a-91ef-4dde-8ef3-39ecc2d0ebcf",
             input: "n = 13",
             expected: "4237", orderMatters: true),
            TestCaseData(id: "4547418b-4618-4e36-9697-93f84639f692",
             input: "n = 14",
             expected: "10680", orderMatters: true),
            TestCaseData(id: "43a3329a-12c6-485f-894a-f1da4e099ecb",
             input: "n = 15",
             expected: "24679", orderMatters: true),
            TestCaseData(id: "99d7ae1d-fcbc-472d-b1fd-db7adb61195e",
             input: "n = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b7c5f205-61f6-422d-abb4-98b0bf739bd0",
             input: "n = 100",
             expected: "null", orderMatters: true),
            TestCaseData(id: "a43067db-e8fc-4b7c-a57f-8b60b2568bf0",
             input: "n = 1000",
             expected: "null", orderMatters: true),
            TestCaseData(id: "b557bb1a-8400-48f9-a32f-2260692eee84",
             input: "n = 10000",
             expected: "null", orderMatters: true),
            TestCaseData(id: "1969b3a7-07c4-4345-92df-ab5992d7b3cb",
             input: "n = 2",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "beautiful-arrangement"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 15 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 15"
                )
                return
            }

            let solution = Solution()
            let result = solution.countArrangement(p_n)
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
