import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSwapNodesInPairs {
    private class Solution {
        func swapPairs(_ head: ListNode?) -> ListNode? {
            let dummy = ListNode(0)
            dummy.next = head
            var prev: ListNode? = dummy
            while prev?.next != nil && prev?.next?.next != nil {
                let first = prev?.next
                let second = first?.next
                first?.next = second?.next
                second?.next = first
                prev?.next = second
                prev = first
            }
            return dummy.next
        }
    }

    @Suite struct SwapNodesInPairsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "81F8B304-CFAB-486B-AF8A-96CA36C86A6C",
             input: "[]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "1307E59E-269E-47F1-B798-534249EEF9A0",
             input: "[1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "63830629-8699-41DD-8EFE-19EDA5E443CE",
             input: "[1,2]",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "BD2009F9-2244-4B19-B8B5-B82862CAE279",
             input: "[1,2,3]",
             expected: "[2,1,3]", orderMatters: true),
            TestCaseData(id: "B86E0266-46A7-409A-AA0F-AF35830C01B1",
             input: "[1,2,3,4]",
             expected: "[2,1,4,3]", orderMatters: true),
            TestCaseData(id: "0ACABD0D-2505-4C92-B39F-92B9D2CD2E26",
             input: "[1,2,3,4,5,6]",
             expected: "[2,1,4,3,6,5]", orderMatters: true),
            TestCaseData(id: "9636474B-22BA-4D08-A861-F47D5473F19B",
             input: "[1,2,3,4,5,6,7]",
             expected: "[2,1,4,3,6,5,7]", orderMatters: true),
            TestCaseData(id: "D40732B6-E6A6-4223-B120-3DD0EA794FBA",
             input: "[10,9,8,7,6,5,4,3,2,1]",
             expected: "[9,10,7,8,5,6,3,4,1,2]", orderMatters: true),
            TestCaseData(id: "A361915D-2040-465E-97DF-C9EBC493030E",
             input: "[5,5,5,5]",
             expected: "[5,5,5,5]", orderMatters: true),
            TestCaseData(id: "ACB52BE1-5155-4282-830F-A0F97E430BD9",
             input: "[1,2,2,1]",
             expected: "[2,1,1,2]", orderMatters: true),
            TestCaseData(id: "9557E065-6A2F-4746-B8F0-D6969E1C1DEF",
             input: "[1,2,3,4,5]",
             expected: "[2,1,4,3,5]", orderMatters: true),
            TestCaseData(id: "3CED5EEE-5EF1-47B3-834A-09B9EA5942C6",
             input: "[10,20,30,40,50,60,70]",
             expected: "[20,10,40,30,60,50,70]", orderMatters: true),
            TestCaseData(id: "AAD566DC-081F-48FC-BBC4-E412EBBD6A51",
             input: "[1,1,1,1]",
             expected: "[1,1,1,1]", orderMatters: true),
            TestCaseData(id: "6941E4E1-194E-4CE7-A0C1-CD5E768A2636",
             input: "[2,1,4,3]",
             expected: "[1,2,3,4]", orderMatters: true),
            TestCaseData(id: "7356EBCC-8F3E-4755-AB24-05135CE480ED",
             input: "[10,20,30,40,50,60,70,80,90]",
             expected: "[20,10,40,30,60,50,80,70,90]", orderMatters: true),
            TestCaseData(id: "74D5DEF9-BE77-4272-A8EA-F45D1C66F891",
             input: "[5,5,4,4,3,3]",
             expected: "[5,5,4,4,3,3]", orderMatters: true),
            TestCaseData(id: "CFA69D11-4BC7-4015-AFBA-2FD7F0E29274",
             input: "[100,200,300,400]",
             expected: "[200,100,400,300]", orderMatters: true),
            TestCaseData(id: "48AECC6D-D817-40A5-8F56-B3DF39E375D6",
             input: "[1,1,2,2]",
             expected: "[1,1,2,2]", orderMatters: true),
            TestCaseData(id: "A03CF92D-0708-4199-B772-8BC41E3396D6",
             input: "[-1,-2,-3,-4]",
             expected: "[-2,-1,-4,-3]", orderMatters: true),
            TestCaseData(id: "36898AD3-14BE-4625-9F36-B1A64816CA9E",
             input: "[1,2,3,4,5,6,7,8,9,10]",
             expected: "[2,1,4,3,6,5,8,7,10,9]", orderMatters: true),
            TestCaseData(id: "259072E9-E55D-4597-8984-9B7D1252B5B9",
             input: "[5,5,5,5,5]",
             expected: "[5,5,5,5,5]", orderMatters: true),
            TestCaseData(id: "772FB5D7-A333-4CCE-BDFF-2446CDAB0C13",
             input: "[10,20,30,40,50,60]",
             expected: "[20,10,40,30,60,50]", orderMatters: true),
            TestCaseData(id: "E53F954C-7CB1-4952-876D-FC7BFB337531",
             input: "[100,200,300,400,500,600,700]",
             expected: "[200,100,400,300,600,500,700]", orderMatters: true),
            TestCaseData(id: "10CE3898-F271-4529-A932-1EE063F8AE7C",
             input: "[4,3,2,1]",
             expected: "[2,1,4,3]", orderMatters: true),
            TestCaseData(id: "B2D6BBCF-2A28-4C6E-A3F6-EE9EF5433B4E",
             input: "[5,1,8,2,7,4,9,3]",
             expected: "[1,5,2,8,4,7,3,9]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "swap-nodes-in-pairs"
            let topic = "linked-list"
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

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as ListNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.swapPairs(p_head)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
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
