import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRemoveNthNodeFromEndOfList {
    private class Solution {
        func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
            // First pass: count length
            var length = 0
            var node = head
            while node != nil {
                length += 1
                node = node?.next
            }

            let dummy = ListNode(0)
            dummy.next = head

            // Find predecessor of target (at position length - n - 1 from dummy)
            var curr: ListNode? = dummy
            for _ in 0..<(length - n) {
                curr = curr?.next
            }

            // Skip target
            curr?.next = curr?.next?.next

            return dummy.next
        }
    }

    @Suite struct RemoveNthNodeFromEndOfListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "E58917A0-BE4B-4A78-9FF2-D4334A9AF739",
             input: "[]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "E7F896C6-4FD4-48E3-ACE7-8845934B9754",
             input: "[1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "21EC9A4F-CFEE-4AF6-8347-218D47C1DAEE",
             input: "[1,2]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "DE4A1793-6B32-4CC7-92CA-854A0498C906",
             input: "[[1,2,3,4,5], 2]",
             expected: "[1,2,3,5]", orderMatters: true),
            TestCaseData(id: "FBD438E4-6898-4B47-A4F7-2DEEAD7F1B75",
             input: "[[1], 1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "D6FFD945-83DC-451A-8579-59D5CB83E638",
             input: "[[1,2], 1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "6185E209-B6DC-4036-80B5-EC13FDB0CB8C",
             input: "[[1,2,3,4,5], 1]",
             expected: "[1,2,3,4]", orderMatters: true),
            TestCaseData(id: "93FFE814-3999-49DB-9A8E-607461DCCB6F",
             input: "[[], 1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "36E02958-822D-44A7-9F1A-3C3CA957871E",
             input: "[[1,2,3], 3]",
             expected: "[2,3]", orderMatters: true),
            TestCaseData(id: "388494e0-7f31-444e-a683-04d9c3126e05",
             input: "head = [5]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "6c6a36da-3d60-48d3-9997-415f9ef156f1",
             input: "head = [1,1,1,1,1]",
             expected: "[1,1,1,1]", orderMatters: true),
            TestCaseData(id: "82e05c0f-40c0-4d41-bd53-dd1b73358ff8",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11]", orderMatters: true),
            TestCaseData(id: "8ca0f604-fe47-4b88-9276-69c1f4777534",
             input: "head = [1,2,3,4,5,6,7,8,9]",
             expected: "[1,2,3,4,5,6,7,8]", orderMatters: true),
            TestCaseData(id: "f34ce2b1-8a0c-465b-8a3d-c9004439cd1f",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20]", orderMatters: true),
            TestCaseData(id: "65a63a65-4575-4e7b-9165-79ba78df043a",
             input: "head = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "d40b4e5a-d23e-4c62-b88f-e58315326528",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,30]", orderMatters: true),
            TestCaseData(id: "26B4BA7D-CC1D-4A5C-B9F2-7BAAAC917E5B",
             input: "[1,2,3,4,5]",
             expected: "[1,2,3,4]", orderMatters: true),
            TestCaseData(id: "5AA5B1FA-9C13-4F25-B5CC-B6622844E324",
             input: "[1,2,3]",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "AA2FBD68-9C2D-4653-9D46-C6D0F7FE7C80",
             input: "[1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,2,3,4,5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "E4D9C248-4121-4D26-879D-947F54F7F577",
             input: "[[1,2], 2]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "22d287bc-2f8e-45fe-9815-a047544bda6d",
             input: "head = [1,2,3,4,5,6]",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "ef836b23-3b6d-4633-a684-3692acd440bb",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,2,3,4,5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "9b2f15f6-5f97-41c2-85f3-5f0655a3f719",
             input: "head = [-1,-2,-3,-4,-5]",
             expected: "[-1,-2,-3,-4]", orderMatters: true),
            TestCaseData(id: "a60399e1-81a9-4376-a249-e0f435c34594",
             input: "head = [1,2,3,4,5,6,7]",
             expected: "[1,2,3,4,5,7]", orderMatters: true),
            TestCaseData(id: "8a0d5177-3cac-4e83-bae8-f2c69237bbae",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,15]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "remove-nth-node-from-end-of-list"
            let topic = "linked-list"
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
            guard let p_n = InputParser.parseInt(params[1]) else {
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
            guard p_n >= 0 && p_n <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= Node.val <= 100"
                )
                return
            }
            guard p_n >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= sz"
                )
                return
            }

            let solution = Solution()
            let result = solution.removeNthFromEnd(p_head, p_n)
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
