import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCInsertionSortList {
    private class Solution {
        func insertionSortList(_ head: ListNode?) -> ListNode? {
            let dummy = ListNode(0)
            var curr = head
            while curr != nil {
                let next = curr?.next
                var prev = dummy
                while prev.next != nil && prev.next.unsafelyUnwrapped.val < curr.unsafelyUnwrapped.val {
                    prev = prev.next.unsafelyUnwrapped
                }
                curr?.next = prev.next
                prev.next = curr
                curr = next
            }
            return dummy.next
        }
    }

    @Suite struct InsertionSortListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e51777ae-dbc4-4714-90a9-a70393f98fd4",
             input: "head = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "cada5a59-f55c-4bce-842e-26e12bea7711",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "bfbddadb-e59b-4ec2-a961-382c263370d3",
             input: "head = [5,4,3,2,1]",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "e55d907d-d090-487b-8748-a5f6f15cb07b",
             input: "head = [-5,-4,-3,-2,-1]",
             expected: "[-5, -4, -3, -2, -1]", orderMatters: true),
            TestCaseData(id: "dcf77272-981a-42db-90e3-f83d55d8750f",
             input: "head = [1,1,1,1,1]",
             expected: "[1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "b1f71070-d93c-4f6c-9b47-07eb0f3f1740",
             input: "head = [10,9,8,7,6,5,4,3,2,1]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]", orderMatters: true),
            TestCaseData(id: "7250397a-d07b-49af-964a-c2900d54d8f2",
             input: "head = [1,3,5,7,9]",
             expected: "[1, 3, 5, 7, 9]", orderMatters: true),
            TestCaseData(id: "492933f2-9487-4b7f-b21b-c40320d564b0",
             input: "head = [2,4,6,8,10]",
             expected: "[2, 4, 6, 8, 10]", orderMatters: true),
            TestCaseData(id: "4911abcd-70fc-43aa-8df9-08cec6bcae48",
             input: "head = [-10,-8,-6,-4,-2]",
             expected: "[-10, -8, -6, -4, -2]", orderMatters: true),
            TestCaseData(id: "ddce281e-2805-41be-905d-54f48228604e",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]", orderMatters: true),
            TestCaseData(id: "270c6c74-561e-4659-a9b0-21547cdda317",
             input: "head = [12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]", orderMatters: true),
            TestCaseData(id: "d035f245-9428-4957-9232-55684f10edc5",
             input: "head = [1,3,5,7,9,2,4,6,8,10]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]", orderMatters: true),
            TestCaseData(id: "251e761f-49a4-4f63-a8f5-142306868685",
             input: "head = [5,1,3,2,4]",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "3ebf37b1-4ad8-44f3-9bc0-f2239c46c9ee",
             input: "head = [10,1,5,3,2,8,6,4,9,7]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]", orderMatters: true),
            TestCaseData(id: "7bc297cb-b446-4a37-ad0a-d6c75bd8c755",
             input: "head = [1,1,2,2,3,3,4,4,5,5]",
             expected: "[1, 1, 2, 2, 3, 3, 4, 4, 5, 5]", orderMatters: true),
            TestCaseData(id: "3444f11d-363b-4e99-9e1d-98eff208602f",
             input: "head = [-1,-2,-3,-4,-5]",
             expected: "[-5, -4, -3, -2, -1]", orderMatters: true),
            TestCaseData(id: "0a56f6c0-6b0c-4013-9fab-e564ea9e6565",
             input: "head = [0,0,0,0,0]",
             expected: "[0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "f9a11af1-7cbf-466e-9f0e-19bd987795ef",
             input: "head = [1,-1,1,-1,1,-1]",
             expected: "[-1, -1, -1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "7e10168a-3cbf-4f24-8d52-b82936465991",
             input: "head = [10,-10,20,-20,30,-30]",
             expected: "[-30, -20, -10, 10, 20, 30]", orderMatters: true),
            TestCaseData(id: "e32898a6-7205-4246-88a2-548c85a1aa96",
             input: "head = [5,10,15,20,25]",
             expected: "[5, 10, 15, 20, 25]", orderMatters: true),
            TestCaseData(id: "0201db49-7b83-4712-8d3f-5ca35801b8a5",
             input: "head = [25,20,15,10,5]",
             expected: "[5, 10, 15, 20, 25]", orderMatters: true),
            TestCaseData(id: "3cc4d902-c506-4751-8f79-513dd561d3ad",
             input: "head = [1,2,3,4,5,6,7,8,9]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9]", orderMatters: true),
            TestCaseData(id: "ae2e3565-4cf6-4e68-b9fd-6f21b4a1cfa0",
             input: "head = [9,8,7,6,5,4,3,2,1]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9]", orderMatters: true),
            TestCaseData(id: "00164002-e3e7-4c41-a21f-56558d969052",
             input: "head = [1,3,5,7,9,11,13,15]",
             expected: "[1, 3, 5, 7, 9, 11, 13, 15]", orderMatters: true),
            TestCaseData(id: "0e6cb27f-c2ea-4020-9439-e5ad0af57a3b",
             input: "head = [15,13,11,9,7,5,3,1]",
             expected: "[1, 3, 5, 7, 9, 11, 13, 15]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "insertion-sort-list"
            let topic = "linked-list"
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

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as ListNode?"
                )
                return
            }

            let solution = Solution()
            var resultHolder: ListNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.insertionSortList(p_head)
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

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
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
