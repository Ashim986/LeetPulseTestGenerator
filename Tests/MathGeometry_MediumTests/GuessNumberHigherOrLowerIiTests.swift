import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGuessNumberHigherOrLowerIi {
    private class Solution {
        func getMoneyAmount(_ n: Int) -> Int {
            var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
            for length in stride(from: 1, to: n + 1, by: 1) {
                for i in stride(from: 1, to: n - length + 2, by: 1) {
                    let j = i + length - 1
                    if length == 1 { dp[i][j] = 0 }
                    else if length == 2 { dp[i][j] = i }
                    else {
                        var res = Int.max
                        for k in stride(from: i, to: j + 1, by: 1) {
                            let cost = k + max(dp[i][k - 1], dp[k + 1][j])
                            res = min(res, cost)
                        }
                        dp[i][j] = res
                    }
                }
            }
            return dp[1][n]
        }
    }

    @Suite struct GuessNumberHigherOrLowerIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f762748a-63e9-4a8c-8ac7-d52a0671a7c5",
             input: "n = 10",
             expected: "16", orderMatters: true),
            TestCaseData(id: "d19bbd99-ce34-42ff-876e-146555c36c07",
             input: "n = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b12c9c2f-3af0-47b6-92a5-79cec8093427",
             input: "n = 4",
             expected: "4", orderMatters: true),
            TestCaseData(id: "7b4b6061-7b11-4de9-8e34-ce5b6368d0b3",
             input: "n = 6",
             expected: "8", orderMatters: true),
            TestCaseData(id: "83fc0045-0f02-476e-9a8e-fb84aa74341c",
             input: "n = 7",
             expected: "10", orderMatters: true),
            TestCaseData(id: "cfad1cd0-adbc-436d-afd6-e6be90df3bb8",
             input: "n = 8",
             expected: "12", orderMatters: true),
            TestCaseData(id: "e5184f84-1409-48bf-8d99-4c49dd548830",
             input: "n = 9",
             expected: "14", orderMatters: true),
            TestCaseData(id: "6df3d782-712e-46b5-ac86-9987252387c1",
             input: "n = 11",
             expected: "18", orderMatters: true),
            TestCaseData(id: "9bbb8785-aa77-489f-bf8f-28bd0c0d9ad7",
             input: "n = 12",
             expected: "20", orderMatters: true),
            TestCaseData(id: "e283b3d3-179f-4e30-8ea9-97164c1d6bc8",
             input: "n = 13",
             expected: "22", orderMatters: true),
            TestCaseData(id: "b704e0d1-3386-46c8-be28-b7e309548e22",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a7c1fa7c-9472-43e8-b90a-642f2b5eda00",
             input: "n = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "20598945-1796-491c-8b4c-3237dfa8609d",
             input: "n = -5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4f5a35cd-ace4-41cc-b000-10fb1721fcbd",
             input: "n = -2147483648",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c5de8e95-68cf-450a-bade-729f889b6bb9",
             input: "n = 14",
             expected: "27", orderMatters: true),
            TestCaseData(id: "1ba2d040-50bd-4bbc-ba13-8a9c36106b32",
             input: "n = 15",
             expected: "30", orderMatters: true),
            TestCaseData(id: "bc3c65e7-9675-4658-88b7-2036d7cae125",
             input: "n = 16",
             expected: "33", orderMatters: true),
            TestCaseData(id: "17491f9e-2fb8-414b-8f1b-bc29196250ce",
             input: "n = 17",
             expected: "36", orderMatters: true),
            TestCaseData(id: "2c03b74e-a768-409e-8940-d681ecd62f13",
             input: "n = 18",
             expected: "39", orderMatters: true),
            TestCaseData(id: "0c0ea937-7cc3-4157-bfc2-53a5af83964a",
             input: "n = 19",
             expected: "42", orderMatters: true),
            TestCaseData(id: "4ce82092-4fef-4aac-b7a3-2504a44c3a72",
             input: "n = 20",
             expected: "45", orderMatters: true),
            TestCaseData(id: "bcefaca1-1cab-4381-bceb-cfb5056f2120",
             input: "n = 100",
             expected: "404", orderMatters: true),
            TestCaseData(id: "392a7a6a-241a-4552-bb08-d3df9b869ce4",
             input: "n = 1000",
             expected: "6940", orderMatters: true),
            TestCaseData(id: "1ac9b3ef-2723-4070-81b7-208e4ef6f36f",
             input: "n = 10000",
             expected: "92399", orderMatters: true),
            TestCaseData(id: "d20905d5-0b95-4d0d-843f-139b67e3d82d",
             input: "n = 100000",
             expected: "1176470", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "guess-number-higher-or-lower-ii"
            let topic = "math-geometry"
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
            guard p_n >= 1 && p_n <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 200"
                )
                return
            }

            let solution = Solution()
            let result = solution.getMoneyAmount(p_n)
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
