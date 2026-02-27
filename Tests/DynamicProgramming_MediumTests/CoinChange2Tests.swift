import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCoinChange2 {
    private class Solution {
        func change(_ amount: Int, _ coins: [Int]) -> Int {
            var dp = [Int](repeating: 0, count: amount + 1)
            dp[0] = 1
            for coin in coins {
                for a in coin...amount {
                    dp[a] += dp[a - coin]
                }
            }
            return dp[amount]
        }
    }

    @Suite struct CoinChange2Tests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "42bd5e1b-1caa-4f18-b2d4-300afe20d1bc",
             input: "amount = 0, coins = []",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bc2d3ff8-1d88-46b7-9f60-2912c8a79c34",
             input: "amount = 1, coins = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ca53d0c1-be1a-4a84-aab9-0582f7fd064c",
             input: "amount = 2, coins = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f7dbc248-fdc6-4148-a29f-8e0ccd26be3f",
             input: "amount = 3, coins = [1,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "b5840b25-c3c1-408d-a53e-5fdcbc134779",
             input: "amount = 4, coins = [1,2,3,4]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f477aebe-a293-4fd5-b5a5-52e57f1deb19",
             input: "amount = -1, coins = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "156350ec-f9b8-4d01-84d7-5362aca87664",
             input: "amount = 0, coins = [1,2,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "09257aee-5d1a-4bbb-915e-627b3e5d2fc5",
             input: "amount = 1, coins = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cf2cc9a0-cd64-4797-9655-e48241fa22c8",
             input: "amount = 100, coins = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "062e7941-f9c2-496f-a8d5-e490c8f02ca5",
             input: "amount = 100, coins = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a3f03aef-d29e-47fb-80ac-ecb39fc5782f",
             input: "amount = 100, coins = [100]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6beec849-bc4b-4cd7-8e4d-1815786fc7b9",
             input: "amount = 100, coins = [1,100]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9acb55a5-e7ba-479b-b3d7-bcaac7071b62",
             input: "amount = 5, coins = [1,1,1,1,1]",
             expected: "126", orderMatters: true),
            TestCaseData(id: "50e2d25f-8af3-44b2-93ec-a571833ed8da",
             input: "amount = 10, coins = [1,2,5,10]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "170a32f6-37c4-417f-be64-9a8c9538421d",
             input: "amount = 100, coins = [1,5,10,25,50,100]",
             expected: "292", orderMatters: true),
            TestCaseData(id: "b0a0d25f-255b-4fee-8a42-b0fc9dcd67a6",
             input: "amount = 1000, coins = [1,2,5,10,20,50,100,200,500,1000]",
             expected: "133984", orderMatters: true),
            TestCaseData(id: "5aad3bef-a399-4a8f-b934-5423a2172d93",
             input: "amount = 100, coins = [1,2,3,4,5,6,7,8,9,10]",
             expected: "1022600", orderMatters: true),
            TestCaseData(id: "8ea2ecd9-27d5-4977-8bdf-88117613d2b5",
             input: "amount = 100, coins = [10,20,30,40,50,60,70,80,90,100]",
             expected: "42", orderMatters: true),
            TestCaseData(id: "27de1fc0-8d48-4f8e-87e5-941f70e45ac0",
             input: "amount = 100, coins = [100,90,80,70,60,50,40,30,20,10]",
             expected: "42", orderMatters: true),
            TestCaseData(id: "c55fc014-8de8-4d56-8dc1-92f07bed6315",
             input: "amount = 100, coins = [1,1,1,1,1,1,1,1,1,1]",
             expected: "200160075", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "coin-change-2"
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
