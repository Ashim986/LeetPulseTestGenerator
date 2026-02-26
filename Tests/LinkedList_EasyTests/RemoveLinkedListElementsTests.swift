import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRemoveLinkedListElements {
    private class Solution {
        func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
            let dummy = ListNode(-1)
            dummy.next = head
            var prev: ListNode? = dummy
            var curr: ListNode? = head
            while let unwrappedCurr = curr {
                if unwrappedCurr.val == val {
                    prev?.next = unwrappedCurr.next
                } else {
                    prev = unwrappedCurr
                }
                curr = unwrappedCurr.next
            }
            return dummy.next
        }
    }

    @Suite struct RemoveLinkedListElementsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f0db07dd-3888-470b-8e0b-e6624a2a8006",
             input: "head = [1,2,3,4,5]",
             expected: "[1,2,4,5]", orderMatters: true),
            TestCaseData(id: "f4a58940-1045-44b5-b6bc-ddafa55a80c6",
             input: "head = [1,1,1,1,1]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "4364d780-d4b3-4566-a548-96a9d768eb95",
             input: "head = [5,5,5,5,5]",
             expected: "[5,5,5,5,5]", orderMatters: true),
            TestCaseData(id: "3b9e8000-8a8c-4b4d-8e76-e1904c3a091a",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "a8642d5a-92d3-4730-b2ca-abab513bc25d",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,2,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "23bfb15d-17c2-4255-bb14-3bf8ef4d5cc8",
             input: "head = [-1,-2,-3,-4,-5]",
             expected: "[-1,-2,-3,-4,-5]", orderMatters: true),
            TestCaseData(id: "7b90c20e-4967-454a-99f8-dfe35edf9bba",
             input: "head = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "1acb23f2-ad9e-4923-8d5f-7a6d9a80da0f",
             input: "head = [1,2,6,3,4,5,6], val = 6",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "bdd2061c-daca-4858-bb87-76b0d0d881b8",
             input: "head = [], val = 1",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "b1889ced-99fd-491b-96dc-bba25d35adb1",
             input: "head = [7,7,7,7], val = 7",
             expected: "[]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "remove-linked-list-elements"
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
            guard let p_val = InputParser.parseInt(params[1]) else {
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
            guard p_val >= 1 && p_val <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= Node.val <= 50"
                )
                return
            }
            guard p_val >= 0 && p_val <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= val <= 50"
                )
                return
            }

            let solution = Solution()
            let result = solution.removeElements(p_head, p_val)
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
