import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCoinChangeIi {
    private class Solution {
        func change(_ amount: Int, _ coins: [Int]) -> Int {
            var dp = [Int](repeating: 0, count: amount + 1)
            dp[0] = 1

            for coin in coins {
                for i in coin...amount {
                    dp[i] += dp[i - coin]
                }
            }
            return dp[amount]
        }
    }

    @Suite struct CoinChangeIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "613d58b6-481c-4ddd-8fb8-ecb2422af70c",
             input: "amount = 0, coins = []",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7e8bf82d-31e4-4bee-a382-67920e693448",
             input: "amount = 1, coins = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b8c64573-56eb-4a52-9e49-0439f1ba361a",
             input: "amount = 5, coins = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9baf0f58-97f5-415c-bcac-375d4b5283f2",
             input: "amount = 5, coins = [5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e4c4bc10-a200-4034-9a76-0d31d69d342c",
             input: "amount = 5, coins = [1,5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f5694c2a-3c20-4fd4-9cc2-e04f47df92e4",
             input: "amount = 3, coins = [2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c0c6a338-9b7d-449d-aebd-d1a3d629fa84",
             input: "amount = 3, coins = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e6d82d52-9924-46b2-827c-c8d4431152bb",
             input: "amount = 0, coins = [1,2,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7ddf9b4b-1aa0-4af9-8e2a-878fae5dd730",
             input: "amount = 1, coins = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2db88ccc-f56d-4bcf-b2e9-f7d4b25244c1",
             input: "amount = 2, coins = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "757959b4-c315-4693-ab88-894e638bd35c",
             input: "amount = 3, coins = [3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "38e83c77-8c9e-4b64-a4e4-b1a74b3a3980",
             input: "amount = 4, coins = [1,2,3]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "c1689f10-6e38-4a38-bbb7-a832a6b1d258",
             input: "amount = 10, coins = [1,2,5,10]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "5535e724-b86f-4645-a53d-13f8b1b92d2e",
             input: "amount = 100, coins = [1,5,10,25,50,100]",
             expected: "292", orderMatters: true),
            TestCaseData(id: "d252e2d7-e0b5-42bc-b2b6-b8a0d19b1b38",
             input: "amount = 5, coins = [1,2,3,4,5]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "d07efaf4-d5c7-4de6-ae4a-29527908954c",
             input: "amount = 6, coins = [1,2,3,4,5,6]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "393197dc-a605-459c-8185-d3d499f90db3",
             input: "amount = 7, coins = [1,2,3,4,5,6,7]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "9fe302ac-e0a5-4c4d-bd90-38ce8fb070e3",
             input: "amount = 8, coins = [1,2,3,4,5,6,7,8]",
             expected: "22", orderMatters: true),
            TestCaseData(id: "047a1e34-c6a7-4f17-baaf-f7def84ce296",
             input: "amount = 9, coins = [1,2,3,4,5,6,7,8,9]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "3f77573b-61fc-4a35-8a30-8932220e4692",
             input: "amount = 10, coins = [1,2,3,4,5,6,7,8,9,10]",
             expected: "42", orderMatters: true),
            TestCaseData(id: "593a7d93-a6aa-4d7d-9b35-04092b92132d",
             input: "amount = 11, coins = [1,2,3,4,5,6,7,8,9,10,11]",
             expected: "56", orderMatters: true),
            TestCaseData(id: "a36b92f8-d3f6-4d4b-972b-4ce52ab88e45",
             input: "amount = 12, coins = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "77", orderMatters: true),
            TestCaseData(id: "027f648a-ca42-4365-863a-3a43200d74fa",
             input: "amount = 13, coins = [1,2,3,4,5,6,7,8,9,10,11,12,13]",
             expected: "101", orderMatters: true),
            TestCaseData(id: "e671de7b-f9d7-4268-b0b4-38f130b3f6e8",
             input: "amount = 14, coins = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "135", orderMatters: true),
            TestCaseData(id: "12656615-e23e-4208-9108-828fe6912d0e",
             input: "amount = 5, coins = [1,2,5]",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "coin-change-ii"
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

            guard let p_amount = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_coins = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_coins.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: coins array too large (\(p_coins.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_coins.count >= 1 && p_coins.count <= 300 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= coins.length <= 300"
                )
                return
            }
            guard p_coins.allSatisfy({ $0 >= 1 && $0 <= 5000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= coins[i] <= 5000"
                )
                return
            }
            guard p_amount >= 0 && p_amount <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= amount <= 5000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.change(p_amount, p_coins)
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
