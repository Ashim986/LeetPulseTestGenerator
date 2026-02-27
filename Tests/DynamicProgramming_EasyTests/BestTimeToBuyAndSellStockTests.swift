import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBestTimeToBuyAndSellStock {
    private class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            var minPrice = Int.max
            var best = 0
            for price in prices {
                minPrice = min(minPrice, price)
                best = max(best, price - minPrice)
            }
            return best
        }
    }

    @Suite struct BestTimeToBuyAndSellStockTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "B20E3263-355A-4A40-9604-D98297AF9405",
             input: "[7,1,5,3,6,4]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "C8B0D23A-07C3-429A-A95C-5679F6CA25A7",
             input: "[7,6,4,3,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "CBB78B00-A0CC-4D5D-9BA4-7B44FA120ED9",
             input: "[1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6E5C59EC-E5C2-419B-A851-BE825C0C64A1",
             input: "[2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "86E3298A-9C37-4076-B735-2B466A36BB55",
             input: "[1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "D48CC72F-1F51-496E-BCDB-1966C7BB092A",
             input: "[1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "DCF5FFF6-5143-4F42-9004-993365A641FD",
             input: "[]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "BD50965E-03E7-4B7D-B6B5-9C5E7DDD10F9",
             input: "[10,20,30,40,50]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "5F1A3D91-08E1-40EB-9003-EC9865922363",
             input: "[50,40,30,20,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3111ABDE-7E61-4F89-92E3-352DD16ECAB5",
             input: "[7,6,5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "BC232EA5-9757-437D-8BF2-93A4FD8C965B",
             input: "[1,2,3,4,5,6,7]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "7B23A8D4-1F5D-425B-A321-F3EF7D7756BA",
             input: "[5,4,3,2,6,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "8A7E7E52-CD6F-4942-B10C-82540B129C71",
             input: "[10,9,8,7,6,5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1D5D2044-1B66-4C1C-96AC-363418FC3B07",
             input: "[1,2,3,4,5,6,7,8,9,10]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "8434EBBB-2C16-4E4D-BA47-B3AA144D0F45",
             input: "[0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7521B6FC-5108-412D-B332-F82A57FDB259",
             input: "[5,5,5,5,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "017F7334-7432-4392-AD61-2D42438AE67A",
             input: "[0,1,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "C3DC6765-203B-4231-906C-258578ECC8D9",
             input: "[10,10,10,10,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1C962886-815B-4836-80DA-D95E4FD11C79",
             input: "[-1,-2,-3,-4,-5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "19BE1EBF-55F8-4F11-9033-2F2DB8D290E2",
             input: "[0,0,0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "B5EA008B-C148-404C-B260-70254902CB5A",
             input: "[1,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5497F53D-FA8A-49D2-A088-701635572ABE",
             input: "[10,-10,-20,-30,-40]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0EFA59BA-20DC-45C3-A2E9-0149390FF38D",
             input: "[100,80,60,40,20]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "00CDD719-8933-44B5-B735-83BEB32161B1",
             input: "[200,180,160,140,120]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "59889013-1E26-4F71-BA5F-536BD4B4ABFD",
             input: "[300,280,260,240,220]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "best-time-to-buy-and-sell-stock"
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

            guard let p_prices = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_prices.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: prices array too large (\(p_prices.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_prices.count >= 1 && p_prices.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= prices.length <= 105"
                )
                return
            }
            guard p_prices.allSatisfy({ $0 >= 0 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= prices[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxProfit(p_prices)
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
