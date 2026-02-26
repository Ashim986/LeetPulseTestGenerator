import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCConvertSortedListToBinarySearchTree {
    private class Solution {
        func sortedListToBST(_ head: ListNode?) -> TreeNode? {
            return findMiddle(head, nil)
        }

        func findMiddle(_ head: ListNode?, _ tail: ListNode?) -> TreeNode? {
            if head == tail {
                return nil
            }
            var slow = head
            var fast = head
            var prev: ListNode?
            while fast?.next != tail && fast?.next?.next != tail {
                prev = slow
                slow = slow?.next
                fast = fast?.next?.next
            }
            let node = TreeNode(slow.unsafelyUnwrapped.val)
            if prev != nil {
                prev?.next = slow?.next
            }
            node.left = findMiddle(head, slow)
            node.right = findMiddle(slow?.next, tail)
            return node
        }
    }

    @Suite struct ConvertSortedListToBinarySearchTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "138a6b23-ea79-48cd-be0c-50cec726611d",
             input: "head = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "9fac2c00-f48f-4510-99f3-0210ae6ccf87",
             input: "head = [1]",
             expected: "[1,null,null]", orderMatters: true),
            TestCaseData(id: "50533de4-22ac-465e-a300-a52a0aeb7425",
             input: "head = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "[5,[2,[1,null,null],[3,null,[4,null,null]]],[8,[6,null,[7,null,null]],[9,null,[10,null,null]]]]", orderMatters: true),
            TestCaseData(id: "bfd40134-8fb3-4bc4-a84f-25ea8007f1da",
             input: "head = [-1, 0, 1, 2, 3]",
             expected: "[1,[-1,null,[0,null,null]],[2,null,[3,null,null]]]", orderMatters: true),
            TestCaseData(id: "0c51d634-af47-4761-b01e-c883da490c56",
             input: "head = [1, 1, 1, 1, 1]",
             expected: "[1,[1,null,[1,null,null]],[1,null,[1,null,null]]]", orderMatters: true),
            TestCaseData(id: "79657e7e-2cfc-4579-bbc1-f32015e24723",
             input: "head = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]",
             expected: "[6,[3,[1,null,[2,null,null]],[4,null,[5,null,null]]],[9,[7,null,[8,null,null]],[11,[10,null,null],[12,null,null]]]]", orderMatters: true),
            TestCaseData(id: "cf4922d2-2b78-4506-9198-24d854c603e3",
             input: "head = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "[-6,[-9,[-10,null,null],[-8,null,[-7,null,null]]],[-3,[-5,null,[-4,null,null]],[-2,null,[-1,null,null]]]]", orderMatters: true),
            TestCaseData(id: "03eeb989-50db-4dac-b260-9a561e1bd4dc",
             input: "head = [0, 0, 0, 0, 0]",
             expected: "[0,[0,null,[0,null,null]],[0,null,[0,null,null]]]", orderMatters: true),
            TestCaseData(id: "9cd171a9-0950-4382-9f83-67750294304d",
             input: "head = [1, 3, 5, 7, 9]",
             expected: "[5,[1,null,[3,null,null]],[7,null,[9,null,null]]]", orderMatters: true),
            TestCaseData(id: "3843e653-cf1b-4c9a-8138-76484da8b5c8",
             input: "head = [-1, 1, -3, 3, -5, 5]",
             expected: "[-3,[-1,null,[1,null,null]],[-5,[3,null,null],[5,null,null]]]", orderMatters: true),
            TestCaseData(id: "9fd39333-04bc-4389-b23c-a0d7df8226e3",
             input: "head = [-10,-3,0,5,9]",
             expected: "[0,-3,9,-10,null,5]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "convert-sorted-list-to-binary-search-tree"
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
            let result = solution.sortedListToBST(p_head)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical tree format
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
