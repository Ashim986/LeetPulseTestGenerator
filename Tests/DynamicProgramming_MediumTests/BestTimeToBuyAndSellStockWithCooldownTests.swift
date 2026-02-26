import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBestTimeToBuyAndSellStockWithCooldown {
    private class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            if prices.isEmpty { return 0 }
            var hold = -prices[0], sold = 0, rest = 0
            for i in 1..<prices.count {
                let prevHold = hold, prevSold = sold
                hold = max(hold, rest - prices[i])
                sold = prevHold + prices[i]
                rest = max(rest, prevSold)
            }
            return max(sold, rest)
        }
    }

    @Suite struct BestTimeToBuyAndSellStockWithCooldownTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "aebf6ae5-d120-429a-9245-1fe476357059",
             input: "prices = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "317b4ae9-114f-43a6-b1c2-ba4cef685cff",
             input: "prices = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "aca291e3-f1d6-40e6-92d7-bc9f46934436",
             input: "prices = [1, 2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b336bd4c-8287-45fc-b54e-a5f5c79e3893",
             input: "prices = [2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9cd5606a-d80a-4c70-bc3c-3f16393742da",
             input: "prices = [1, 2, 3, 4, 5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "d59fe749-b4cc-4fec-a96a-31325e9af4c3",
             input: "prices = [5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1b154a0b-384a-4619-97f1-61ba57ee11f4",
             input: "prices = [1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "907d9934-dcd6-4819-acd8-970ba6d9fd2a",
             input: "prices = [-1, -2, -3, -4, -5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "11cc9c5e-e6dd-4723-838c-d4ee936d9104",
             input: "prices = [10, 20, 30, 40, 50]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "33975f37-9690-4795-96bc-daed31d603fb",
             input: "prices = [50, 40, 30, 20, 10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2208eb2f-5e92-4cad-909e-6a8db84c2fa6",
             input: "prices = [1, 2, 3, 2, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ecda25fe-bdbf-4fcd-b8f9-73435f17ea45",
             input: "prices = [1, 3, 2, 4, 5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "af727af9-fc5f-403a-958a-f13e76a92ab3",
             input: "prices = [7, 6, 4, 3, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "24ef30a4-8546-41b8-9361-074a77bf3c3c",
             input: "prices = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "b960a470-d170-44ec-8f57-e8f2736793a4",
             input: "prices = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f89159b9-fa30-455f-ba65-434075bf3cf6",
             input: "prices = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "16ff6cb0-5914-49c9-965b-0909f75f2e2c",
             input: "prices = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "80cacde9-1296-444e-8a4f-21ed0072d370",
             input: "prices = [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f7bc71ed-ff49-44d3-8484-cb75df3b7fdb",
             input: "prices = [1, 3, 2, 8, 4, 9]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "b50bec34-2d22-45c6-88b3-4aeeb4b11095",
             input: "prices = [1, 2, 4, 2, 5, 7, 2, 4, 9, 0]",
             expected: "13", orderMatters: true),
            TestCaseData(id: "c5210a21-b413-431e-ac53-602ff2677e62",
             input: "prices = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]",
             expected: "14", orderMatters: true),
            TestCaseData(id: "0b649072-f5ee-4011-a0dc-a7e88537a7cb",
             input: "prices = [15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6404f173-2555-46a4-9cea-ee119a227b50",
             input: "prices = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ae9c6b64-0dd0-4ca9-aa10-5e9c9dc06cf7",
             input: "prices = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]",
             expected: "19", orderMatters: true),
            TestCaseData(id: "b80ad164-f7b1-4e81-81a0-adec7bfe562d",
             input: "prices = [20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "best-time-to-buy-and-sell-stock-with-cooldown"
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
            guard p_prices.count >= 1 && p_prices.count <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= prices.length <= 5000"
                )
                return
            }
            guard p_prices.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= prices[i] <= 1000"
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
