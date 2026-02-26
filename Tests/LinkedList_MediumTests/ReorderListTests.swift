import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReorderList {
    private class Solution {
        func reorderList(_ head: ListNode?) {
            guard let head = head else { return }

            // Push all nodes to stack
            var stack: [ListNode] = []
            var node: ListNode? = head
            while let n = node {
                stack.append(n)
                node = n.next
            }

            let count = stack.count
            var curr: ListNode? = head

            // Interleave n/2 nodes from the end
            for _ in 0..<(count / 2) {
                let end = stack.removeLast()
                let next = curr?.next
                curr?.next = end
                end.next = next
                curr = next
            }

            // Terminate the list
            curr?.next = nil
        }
    }

    @Suite struct ReorderListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f29d97f5-fe3a-4247-9bc2-9a831531d42b",
             input: "head = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "da5210eb-3fd7-4015-84c9-4b465a770486",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "80078658-97f1-48ff-a41f-4ce010386db2",
             input: "head = [1,2]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "3f94c29f-9ecd-4f04-8158-01cf1b287d27",
             input: "head = [1,2,3,4,5,6]",
             expected: "[1, 6, 2, 5, 3, 4]", orderMatters: true),
            TestCaseData(id: "34afb59c-fb85-45e6-9514-69e3371b9d5a",
             input: "head = [-1,-2,-3,-4,-5]",
             expected: "[-1, -5, -2, -4, -3]", orderMatters: true),
            TestCaseData(id: "aba61633-0fe0-409d-ab81-c8564cff039f",
             input: "head = [1,1,1,1,1]",
             expected: "[1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "d2ac2973-234b-4dc2-a5b0-e1de8d86ba79",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1, 10, 2, 9, 3, 8, 4, 7, 5, 6]", orderMatters: true),
            TestCaseData(id: "18f29e68-78bc-4a45-9b74-f19fe892b649",
             input: "head = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "[-10, -1, -9, -2, -8, -3, -7, -4, -6, -5]", orderMatters: true),
            TestCaseData(id: "5a0efb09-3ef1-4b63-828e-a364069a5d43",
             input: "head = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "44099081-bc47-4219-b204-f903d4fc9fa0",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11]",
             expected: "[1, 11, 2, 10, 3, 9, 4, 8, 5, 7, 6]", orderMatters: true),
            TestCaseData(id: "8406e538-53ca-44cb-865a-3174fd38975f",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[1, 12, 2, 11, 3, 10, 4, 9, 5, 8, 6, 7]", orderMatters: true),
            TestCaseData(id: "5cf74648-33e9-4776-b619-61bf9f8c64a7",
             input: "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]",
             expected: "[-1, -10, -2, -9, -3, -8, -4, -7, -5, -6]", orderMatters: true),
            TestCaseData(id: "292bc9e3-da63-4cd6-9614-078082db2c39",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13]",
             expected: "[1, 13, 2, 12, 3, 11, 4, 10, 5, 9, 6, 8, 7]", orderMatters: true),
            TestCaseData(id: "f1234a63-5362-49ac-ad67-456b055470aa",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "[1, 14, 2, 13, 3, 12, 4, 11, 5, 10, 6, 9, 7, 8]", orderMatters: true),
            TestCaseData(id: "438a742b-644a-486b-a832-a3c1d56b417c",
             input: "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12]",
             expected: "[-1, -12, -2, -11, -3, -10, -4, -9, -5, -8, -6, -7]", orderMatters: true),
            TestCaseData(id: "4e49a3af-d8a2-4451-9391-a1bb95401d9f",
             input: "head = [1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "738cee5a-f425-4d41-95a4-f0dbf3d46272",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[1, 15, 2, 14, 3, 13, 4, 12, 5, 11, 6, 10, 7, 9, 8]", orderMatters: true),
            TestCaseData(id: "d723d821-a89b-4f93-9ecf-75b829fa1c77",
             input: "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14]",
             expected: "[-1, -14, -2, -13, -3, -12, -4, -11, -5, -10, -6, -9, -7, -8]", orderMatters: true),
            TestCaseData(id: "e317a842-ae4e-412b-88cd-6afb45f24027",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "[1, 16, 2, 15, 3, 14, 4, 13, 5, 12, 6, 11, 7, 10, 8, 9]", orderMatters: true),
            TestCaseData(id: "38c751cb-91b5-4824-a574-011b5e55af3a",
             input: "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15]",
             expected: "[-1, -15, -2, -14, -3, -13, -4, -12, -5, -11, -6, -10, -7, -9, -8]", orderMatters: true),
            TestCaseData(id: "81315a3c-b0e6-4c48-93f8-fdadf7254c7c",
             input: "head = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "8c067d9c-aa0b-4cde-bba6-625b48830822",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]",
             expected: "[1, 21, 2, 20, 3, 19, 4, 18, 5, 17, 6, 16, 7, 15, 8, 14, 9, 13, 10, 12, 11]", orderMatters: true),
            TestCaseData(id: "85e4d086-2e53-4d30-9201-90ed3d82277e",
             input: "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20]",
             expected: "[-1, -20, -2, -19, -3, -18, -4, -17, -5, -16, -6, -15, -7, -14, -8, -13, -9, -12, -10, -11]", orderMatters: true),
            TestCaseData(id: "2bcb0dcf-3a80-4683-8347-118b81a2e5a0",
             input: "head = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "10daa34a-d0d6-4b9e-b6a8-8a35e1821208",
             input: "head = [1,2,3,4]",
             expected: "[1,4,2,3]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reorder-list"
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
            solution.reorderList(p_head)
            let computedOutput = OutputSerializer.serializeVoid()

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
