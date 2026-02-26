import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBestTimeToBuyAndSellStockIi {
    private class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            var profit = 0
            for i in 1..<prices.count {
                if prices[i] > prices[i-1] {
                    profit += prices[i] - prices[i-1]
                }
            }
            return profit
        }
    }

    @Suite struct BestTimeToBuyAndSellStockIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1aeb4d16-5c13-47ed-92f8-9dfc980c533a",
             input: "prices = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c5a04641-e690-4398-8d5f-968a0a18ae50",
             input: "prices = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c4af7d9e-05f6-4537-a2c2-974923e37e2c",
             input: "prices = [1, 2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e9e0c341-2ab1-48a2-a127-393bec034d7b",
             input: "prices = [2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "56864809-b1d4-44bf-976d-aad6dc8415cb",
             input: "prices = [1, 2, 3, 4, 5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "092e9447-e60c-4916-b6dd-cc8494de248e",
             input: "prices = [5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "60a5d6c2-c7db-4b74-a983-94fcf3296b57",
             input: "prices = [1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "62d4df00-55ab-4d33-9b89-59ae5da20fde",
             input: "prices = [-1, -2, -3, -4, -5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bdd009a6-3314-466f-bddc-f2b77fa1ff02",
             input: "prices = [10, 7, 5, 8, 11, 9]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "cc9fc23a-bda6-4a68-b435-62292aee5019",
             input: "prices = [7, 6, 4, 3, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6b880416-222a-4563-952f-a91ebae0a1ae",
             input: "prices = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "79078fee-72ce-455b-92b4-d7a9cf48239b",
             input: "prices = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "048d8a4b-139d-4fe1-b09e-7abe25491443",
             input: "prices = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fd3bceab-ed35-4e7a-8452-ce37bd894cc6",
             input: "prices = [100, 1, 100, 1, 100, 1, 100, 1, 100, 1]",
             expected: "396", orderMatters: true),
            TestCaseData(id: "ee7810fc-1005-41c8-951c-db92e0cbe3a4",
             input: "prices = [1000, 999, 998, 997, 996, 995, 994, 993, 992, 991]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dc816564-0acc-4c5a-b2c5-7799616a5212",
             input: "prices = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1000]",
             expected: "999", orderMatters: true),
            TestCaseData(id: "fa9b93cf-a699-47af-bdb0-59ddad6524f4",
             input: "prices = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1000]",
             expected: "999", orderMatters: true),
            TestCaseData(id: "12ef42c8-3086-4618-aa41-7702ad88c558",
             input: "prices = [1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7a855a49-c1db-467c-bc50-13bc01f68371",
             input: "prices = [1000, 1, 1000, 1, 1000, 1, 1000, 1, 1000, 1]",
             expected: "3996", orderMatters: true),
            TestCaseData(id: "c2f852b8-b938-4405-9de0-0783e2621d1f",
             input: "prices = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]",
             expected: "14", orderMatters: true),
            TestCaseData(id: "a70e1bd5-662e-4d49-bc6a-ba1e91e08e0a",
             input: "prices = [15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "93f01c6d-077a-4e99-a175-5e9f6867f594",
             input: "prices = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "52b78cc9-56dc-455f-a9a8-8925570990f9",
             input: "prices = [1000, 999, 998, 997, 996, 995, 994, 993, 992, 991, 990, 989, 988, 987, 986]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4a126f0d-e56c-4574-a7c4-6aac32f57a68",
             input: "prices = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1000]",
             expected: "999", orderMatters: true),
            TestCaseData(id: "c2b5cbb9-7496-4367-9e9c-0f1edc17385b",
             input: "prices = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1000]",
             expected: "999", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "best-time-to-buy-and-sell-stock-ii"
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

            guard let p_prices = InputParser.parseIntArray(params[0]) else {
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
            guard p_prices.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: prices array too large (\(p_prices.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_prices.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= prices.length <= 3 * 104"
                )
                return
            }
            guard p_prices.allSatisfy({ $0 >= 0 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= prices[i] <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.maxProfit(p_prices)
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
