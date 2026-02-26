import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBestTimeToBuyAndSellStockWithTransactionFee {
    private class Solution {
        func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
            if prices.count < 2 {
                return 0
            }
            var buy = -prices[0]
            var sell = 0
            for i in 1..<prices.count {
                let newBuy = Swift.max(buy, sell - prices[i])
                let newSell = Swift.max(sell, buy + prices[i] - fee)
                buy = newBuy
                sell = newSell
            }
            return sell
        }
    }

    @Suite struct BestTimeToBuyAndSellStockWithTransactionFeeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "890b0b32-7bb5-4edd-88f4-71a9d83a9f6d",
             input: "prices = [1,2,3], fee = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bd6eee49-0802-4514-9b6d-04c38158c63c",
             input: "prices = [1,2,3,4,5], fee = 0",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e006d51e-2ce4-4f80-abe5-9209c676b3e5",
             input: "prices = [5,4,3,2,1], fee = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b586931e-00b1-499f-bc8d-2d1c34974135",
             input: "prices = [1,1,1,1,1], fee = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8e360933-eee3-4475-8c78-62e7d357cbaa",
             input: "prices = [1,2,3,4,5], fee = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ce355487-e7d5-400a-ad8b-43bcdccc1ca7",
             input: "prices = [1], fee = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2a0fbf94-d5ff-4fc9-8cb0-fb7e6197d305",
             input: "prices = [1,2,3,4,5], fee = 100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "023482c8-81e6-4230-95db-bf74e9e5b3ee",
             input: "prices = [10,9,8,7,6,5,4,3,2,1], fee = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "50798770-26b8-44e2-90f6-0d89a0956a54",
             input: "prices = [1,1,1,1,1,1,1,1,1,1], fee = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a3ddf5ac-6b0d-48f1-a706-a30eb36bab43",
             input: "prices = [1,2,3,4,5,6,7,8,9,10], fee = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1e49a2fd-68cf-4559-a035-00e18fecd7c8",
             input: "prices = [1,2,3,4,5,6,7,8,9,10], fee = 0",
             expected: "9", orderMatters: true),
            TestCaseData(id: "e5032f42-b727-4fa0-9112-befc35619233",
             input: "prices = [1,1,1,1,1,1,1,1,1,1], fee = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b05ce4e7-4a36-4141-bc01-8491daa7da52",
             input: "prices = [10,9,8,7,6,5,4,3,2,1], fee = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "071dcf19-3a79-4c97-94dc-d511a7093023",
             input: "prices = [1,2,3,4,5,6,7,8,9,10], fee = 1000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "deabc284-453d-40ab-9a68-c56354702c17",
             input: "prices = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1], fee = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3ca6828d-daf3-4a32-8d59-08d2d5850c15",
             input: "prices = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], fee = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fa79b7ec-4a6c-4d78-98cf-f18c827fc583",
             input: "prices = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], fee = 0",
             expected: "14", orderMatters: true),
            TestCaseData(id: "567b3aaa-ea96-4cda-aa2f-7b23c874c2af",
             input: "prices = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1], fee = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "74984bb3-b49f-435d-a19f-193aafc514bb",
             input: "prices = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], fee = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "db6c69dd-89f8-45cc-8b01-879657bcd6bc",
             input: "prices = [1,2,3,4,5], fee = -1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a0ce1610-00da-4167-b14e-06694b0287d3",
             input: "prices = [1,-2,3,-4,5], fee = 1",
             expected: "12", orderMatters: true),
            TestCaseData(id: "a48a6309-ecae-4e32-98b9-4cc711bc5936",
             input: "prices = [100,200,300,400,500], fee = 1",
             expected: "399", orderMatters: true),
            TestCaseData(id: "4f7f013e-d766-4ddc-8f40-b9a45f706f17",
             input: "prices = [1,100,1,100,1], fee = 1",
             expected: "196", orderMatters: true),
            TestCaseData(id: "5fa934f3-0833-46b5-b7b6-84e68b383ed1",
             input: "prices = [1,2,3,4,5,6,7,8,9,10], fee = 1",
             expected: "8", orderMatters: true),
            TestCaseData(id: "ef92049d-7c58-49a1-94d7-6dad85fdd1c8",
             input: "prices = [10,20,30,40,50,60,70,80,90,100], fee = 1",
             expected: "89", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "best-time-to-buy-and-sell-stock-with-transaction-fee"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            guard let p_fee = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
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
                    errorMessage: "Constraint violation: 1 <= prices.length <= 5 * 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.maxProfit(p_prices, p_fee)
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
