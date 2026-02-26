import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCOddEvenLinkedList {
    private class Solution {
        func oddEvenList(_ head: ListNode?) -> ListNode? {
            guard let head = head, let even = head.next else { return head }
            var odd: ListNode? = head
            var evenNode: ListNode? = even
            let evenHead = even
            while evenNode?.next != nil {
                odd?.next = evenNode?.next
                odd = odd?.next
                evenNode?.next = odd?.next
                evenNode = evenNode?.next
            }
            odd?.next = evenHead
            return head
        }
    }

    @Suite struct OddEvenLinkedListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8172cd95-b4ec-428e-bb24-f5fde2508e36",
             input: "head = [2,1,3,5,6,4,7]",
             expected: "[2,3,6,7,1,5,4]", orderMatters: true),
            TestCaseData(id: "ef3f2076-a57c-496b-806d-6173659b2528",
             input: "head = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "901308b2-63f6-4d5c-ad65-2eb29644a406",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "52b381bb-c779-48e9-ae4c-10ddb92eedd7",
             input: "head = [1,2]",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "c827c50e-7e53-4a0d-a943-e5f574b7daba",
             input: "head = [1,2,3,4]",
             expected: "[1,3,2,4]", orderMatters: true),
            TestCaseData(id: "d56b8037-7aac-45ed-af9b-2011ef1f3a69",
             input: "head = [1,1,1,1,1]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "25773ba9-185d-4208-9142-52fe0cf66d91",
             input: "head = [-1,-2,-3,-4,-5]",
             expected: "[-1,-3,-5,-2,-4]", orderMatters: true),
            TestCaseData(id: "9d5228a1-0372-46df-8227-f9fe38768a36",
             input: "head = [10,20,30,40,50]",
             expected: "[10,30,50,20,40]", orderMatters: true),
            TestCaseData(id: "41e32b6d-c34f-4d85-a89f-4c402ad8306f",
             input: "head = [1,3,5,7,9,2,4,6,8,10]",
             expected: "[1,5,9,2,6,10,3,7,8,4]", orderMatters: true),
            TestCaseData(id: "5842346f-090b-43b0-a161-acf374634711",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[1,3,5,7,9,11,2,4,6,8,10,12]", orderMatters: true),
            TestCaseData(id: "cab9524c-649b-47ce-9d64-2b5cd5be44bf",
             input: "head = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "[-10,-8,-6,-4,-2,-1,-9,-7,-5,-3]", orderMatters: true),
            TestCaseData(id: "f10d6971-c9b7-4e50-ab82-1c62d45f89c8",
             input: "head = [0,0,0,0,0,0,0,0,0,0]",
             expected: "[0,0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "18c79583-a031-4a76-a25f-9ab04e65f61b",
             input: "head = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "97803bc7-c547-46eb-99b0-2fb81fe41935",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11]",
             expected: "[1,3,5,7,9,11,2,4,6,8,10]", orderMatters: true),
            TestCaseData(id: "41bcb9e6-b164-4b33-8689-d561fb44d1ff",
             input: "head = [1,3,5,7,9,11,13,15,17,19,21]",
             expected: "[1,5,9,13,17,21,3,7,11,15,19]", orderMatters: true),
            TestCaseData(id: "947d9bbf-96ee-46a4-9940-3cf41875d22f",
             input: "head = [2,4,6,8,10,12,14,16,18,20,22]",
             expected: "[2,6,10,14,18,22,4,8,12,16,20]", orderMatters: true),
            TestCaseData(id: "38968059-750c-4d47-b24a-e43116bfd7d2",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[1,3,5,7,9,11,13,15,2,4,6,8,10,12,14]", orderMatters: true),
            TestCaseData(id: "c377ae16-039c-4497-b561-cf0757311cab",
             input: "head = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "dddc02ea-325b-4db7-aa93-3bb520c12707",
             input: "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15]",
             expected: "[-1,-3,-5,-7,-9,-11,-13,-15,-2,-4,-6,-8,-10,-12,-14]", orderMatters: true),
            TestCaseData(id: "7baeeb4e-9534-4b71-90a8-7bd0731c8381",
             input: "head = [10,20,30,40,50,60,70,80,90,100,110,120,130,140,150]",
             expected: "[10,30,50,70,90,110,130,150,20,40,60,80,100,120,140]", orderMatters: true),
            TestCaseData(id: "3049ae70-a450-45cc-aab8-bfbc0a612049",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]",
             expected: "[1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30]", orderMatters: true),
            TestCaseData(id: "4b0b9b70-a11a-4a70-9e83-47905886bea4",
             input: "head = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "4b3fcde5-b255-45dc-a372-bc93eca16530",
             input: "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25,-26,-27,-28,-29,-30]",
             expected: "[-1,-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25,-27,-29,-2,-4,-6,-8,-10,-12,-14,-16,-18,-20,-22,-24,-26,-28,-30]", orderMatters: true),
            TestCaseData(id: "8cc03826-53a3-483b-b119-6c665a6363fa",
             input: "head = [10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300]",
             expected: "[10,30,50,70,90,110,130,150,170,190,210,230,250,270,290,20,40,60,80,100,120,140,160,180,200,220,240,260,280,300]", orderMatters: true),
            TestCaseData(id: "19448802-ab76-422d-b03b-96a704b73324",
             input: "head = [1,2,3,4,5]",
             expected: "[1,3,5,2,4]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "odd-even-linked-list"
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
            let result = solution.oddEvenList(p_head)
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
