import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDeleteNodeInABst {
    private class Solution {
        func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
            if root == nil {
                return nil
            }
            if key < root.unsafelyUnwrapped.val {
                root.unsafelyUnwrapped.left = deleteNode(root.unsafelyUnwrapped.left, key)
            } else if key > root.unsafelyUnwrapped.val {
                root.unsafelyUnwrapped.right = deleteNode(root.unsafelyUnwrapped.right, key)
            } else {
                if root.unsafelyUnwrapped.left == nil {
                    return root.unsafelyUnwrapped.right
                } else if root.unsafelyUnwrapped.right == nil {
                    return root.unsafelyUnwrapped.left
                }

                let minVal = findMin(root.unsafelyUnwrapped.right.unsafelyUnwrapped)
                root.unsafelyUnwrapped.val = minVal
                root.unsafelyUnwrapped.right = deleteNode(root.unsafelyUnwrapped.right, minVal)
            }
            return root
        }

        func findMin(_ node: TreeNode) -> Int {
            var current = node
            while current.left != nil {
                current = current.left.unsafelyUnwrapped
            }
            return current.val
        }
    }

    @Suite struct DeleteNodeInABstTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e31846e2-880b-4047-a554-c6527c304433",
             input: "root = [1]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "43477573-2266-46d1-be0f-bf14a8df0547",
             input: "root = [1,2]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "6037302c-1089-4da0-9a55-81e930463ead",
             input: "root = [1,null,2]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "75517b5b-1cb9-4a31-8dff-8005bd43e829",
             input: "root = [1,2,3]",
             expected: "[2,3]", orderMatters: true),
            TestCaseData(id: "ac9005fa-ef96-424a-b00d-a9b804fbaca7",
             input: "root = [1,null,2,null,3]",
             expected: "[2,null,3]", orderMatters: true),
            TestCaseData(id: "9752cbbd-1bb7-452c-9d1d-d0daec7f5282",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "[2,null,3,null,4]", orderMatters: true),
            TestCaseData(id: "7485304f-5df8-4631-80a1-578a95d25d9b",
             input: "root = [1,2,3,4,5]",
             expected: "[3,2,null,4,5]", orderMatters: true),
            TestCaseData(id: "e5def0dd-3733-4a2e-9fd2-9eb621ab1bbd",
             input: "root = [1,2,null,4]",
             expected: "[2,4]", orderMatters: true),
            TestCaseData(id: "693d61db-4635-46ea-b1ba-dabeec352b91",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[6,2,3,4,5,null,7]", orderMatters: true),
            TestCaseData(id: "d7c8987f-5abf-4920-a67b-6bad8c08d3d0",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[6,2,3,4,5,null,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "6dbf7edf-16bb-4c55-b042-f7644c488873",
             input: "root = [5,3,6,2,4,null,7], key = 3",
             expected: "[5,4,6,2,null,null,7]", orderMatters: true),
            TestCaseData(id: "ac1d4198-1740-45d4-9afb-da316738b406",
             input: "root = [5,3,6,2,4,null,7], key = 0",
             expected: "[5,3,6,2,4,null,7]", orderMatters: true),
            TestCaseData(id: "8f6d8265-182f-44df-b6e9-24e33986758f",
             input: "root = [], key = 0",
             expected: "[]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "delete-node-in-a-bst"
            let topic = "trees"
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

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as TreeNode?"
                )
                return
            }
            guard let p_key = InputParser.parseInt(params[1]) else {
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
            guard p_key >= -105 && p_key <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -105 <= Node.val <= 105"
                )
                return
            }
            guard p_key >= -105 && p_key <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -105 <= key <= 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.deleteNode(p_root, p_key)
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
