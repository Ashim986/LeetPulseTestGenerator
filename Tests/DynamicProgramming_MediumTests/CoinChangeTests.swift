import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCoinChange {
    private class Solution {
        func coinChange(_ coins: [Int], _ amount: Int) -> Int {
            if amount == 0 { return 0 }
            var dp = Array(repeating: amount + 1, count: amount + 1)
            dp[0] = 0

            if amount > 0 {
                for a in 1...amount {
                    for coin in coins where coin <= a {
                        dp[a] = min(dp[a], dp[a - coin] + 1)
                    }
                }
            }

            return dp[amount] > amount ? -1 : dp[amount]
        }
    }

    @Suite struct CoinChangeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4C97CC68-E850-42F6-A656-87964D2750A3",
             input: "[1,2,5]\n11",
             expected: "3", orderMatters: true),
            TestCaseData(id: "91C9D1AD-3396-44EB-99C3-5738856E3020",
             input: "[2]\n3",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "0CDF438D-8FE9-4FB9-A4C4-1E3280E55037",
             input: "[1]\n0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "FB3E3AFA-7233-452C-B7F2-2115494297C5",
             input: "[1]\n2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "710B28DE-4C33-4165-87CC-065EA8C57C05",
             input: "[]\n1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "03BBBC77-2E3F-43EC-9BC9-9C72216D907B",
             input: "[1,4,5]\n6",
             expected: "2", orderMatters: true),
            TestCaseData(id: "874FFF3F-AC9B-4B7B-971B-6E0F3A5D3A68",
             input: "[186, 419, 83, 408]\n6249",
             expected: "20", orderMatters: true),
            TestCaseData(id: "F617B26A-6EF8-45FA-A4D0-61523BB49E83",
             input: "[1,5,11]\n16",
             expected: "4", orderMatters: true),
            TestCaseData(id: "4718D0F6-113A-45B9-ADEC-CD3464F2F7BB",
             input: "[2,5,10]\n10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "20B8D686-1DB9-45F2-B4EE-B7982D92EAA4",
             input: "[1,2,5]\n33",
             expected: "7", orderMatters: true),
            TestCaseData(id: "4D7F5067-68F2-4C1D-9876-5C17C379F8CE",
             input: "[1]\n1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "B15CA1BE-9027-4861-B924-60F9187E7AC2",
             input: "[3,5]\n8",
             expected: "2", orderMatters: true),
            TestCaseData(id: "C0F09756-0447-4E32-B4CA-7ACAC7904E68",
             input: "[2,5]\n3",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "98EB120E-1738-4BCF-BA43-6B07BEC966A6",
             input: "[]\n0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "F3D3C048-439F-42FB-83D8-BAE2DF37BC97",
             input: "[1,2,5]\n0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "666F14C3-B3B8-4301-9A6E-AE9E2DE759B4",
             input: "[1,5]\n6",
             expected: "2", orderMatters: true),
            TestCaseData(id: "F36D03CB-0D08-450A-826B-992B0F015FD2",
             input: "[2]\n2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "32808578-5D49-49B1-A436-E0E6CCB6FCE3",
             input: "[3,5]\n3",
             expected: "1", orderMatters: true),
            TestCaseData(id: "46E9F532-5D95-4360-8A37-E069AE5781ED",
             input: "[2,5]\n10",
             expected: "2", orderMatters: true),
            TestCaseData(id: "B2DFD28C-03DB-4E20-82C0-554393905D67",
             input: "[1,4,5]\n4",
             expected: "1", orderMatters: true),
            TestCaseData(id: "FA8AB1ED-904F-4F4E-8A0E-46EDB49DB424",
             input: "[1,2]\n4",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6E42715D-450E-4BDA-ADEB-A77CD3478E11",
             input: "[3,5]\n5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "85769D5E-5808-4885-A986-601F751C0E91",
             input: "[1,5]\n5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "E98BABD9-C1EB-4ADD-BA6B-D8FA772389BF",
             input: "[1,2,5]\n1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "70628D16-7AEF-428F-A9D9-77BF6F6E2DB6",
             input: "[1]\n-1",
             expected: "-1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "coin-change"
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

            guard let p_coins = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
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
            guard let p_amount = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_coins.count >= 1 && p_coins.count <= 12 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= coins.length <= 12"
                )
                return
            }
            guard p_coins.allSatisfy({ $0 >= 1 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= coins[i] <= 231 - 1"
                )
                return
            }
            guard p_amount >= 0 && p_amount <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= amount <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.coinChange(p_coins, p_amount)
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
