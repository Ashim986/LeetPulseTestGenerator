import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSmallestSubtreeWithAllTheDeepestNodes {
    private class Solution {
        var maxDepth = 0
        var minNode = TreeNode(0)

        func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
            if root == nil {
                return nil
            }
            maxDepth = 0
            minNode = TreeNode(0)
            postOrder(root)
            return minNode
        }

        func postOrder(_ node: TreeNode?) -> Int {
            if node == nil {
                return 0
            }
            let leftDepth = postOrder(node?.left)
            let rightDepth = postOrder(node?.right)
            if leftDepth > rightDepth {
                return leftDepth + 1
            } else if leftDepth < rightDepth {
                return rightDepth + 1
            } else {
                if leftDepth == maxDepth {
                    minNode = node.unsafelyUnwrapped
                }
                maxDepth = max(maxDepth, leftDepth)
                return leftDepth + 1
            }
        }
    }

    @Suite struct SmallestSubtreeWithAllTheDeepestNodesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "01d0d53e-3055-4725-b6ae-f114b15af95f",
             input: "root = []",
             expected: "null", orderMatters: true),
            TestCaseData(id: "80f2ce4e-6faf-4e9b-9d65-3ab267bfacf4",
             input: "root = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c0415400-ae70-4eed-8de8-95d571c09e99",
             input: "root = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2302a0e4-6ee0-4b78-9ab5-bc6ae8ceda4e",
             input: "root = [1,null,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "91d4b100-90ff-452c-b4f0-dff4ce6ed776",
             input: "root = [1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c3c93c80-7196-4e55-a943-32130355a347",
             input: "root = [1,null,2,null,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "84135c0a-d488-4003-901f-f6999846ee13",
             input: "root = [1,2,null,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "b6cb1ffa-6b40-4b76-becb-54e4b70e6e80",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ed0daf48-db6a-4d1c-b53d-0e4609038679",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "1455f4e5-6ba3-450b-a1f1-ee117841e954",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d6b16a30-5e83-46b8-81f0-c109b9649d48",
             input: "root = [-1,-2,-3]",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "3387293f-b667-40f5-99f8-0e0cb19b900e",
             input: "root = [1,2,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8b290b96-3fc8-4e38-8ca7-e8938b74c18b",
             input: "root = [1,null,2,null,null,3,null,4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "3ece686d-69e8-460e-92cd-1b08b5752da7",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "7c80f978-ffe5-41e9-90c1-0823d47927ad",
             input: "root = [1,2,3,null,null,4,5,null,null,6,7]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "67924d2d-41e1-4afc-9770-0b644c67ffd0",
             input: "root = [1,2,3,4,5,6,7,null,null,8,9]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "89ea6ccf-729b-49f6-988a-82969210fec4",
             input: "root = [1,2,3,null,null,4,5,null,null,null,null,6,7]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "ffb6660f-5112-424c-b553-473e04583e6e",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "04312786-0f28-43ae-a406-12a2ed77b354",
             input: "root = [1,null,2,null,null,3,null,null,4,null,null,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4d467a5a-03af-4458-bd4e-20d592f6df7f",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "8ea3fb64-65eb-4baf-9b3f-b986a737bc7f",
             input: "root = [1,2,3,null,null,4,5,null,null,null,null,6,7,null,null,8,9]",
             expected: "[8]", orderMatters: true),
            TestCaseData(id: "6ce6a8a4-49dc-4bec-a15d-40c0ad5ab2d9",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]",
             expected: "[16]", orderMatters: true),
            TestCaseData(id: "833f301d-7eb4-4414-804f-30477aa90cbd",
             input: "root = [1,null,2,null,null,3,null,null,4,null,null,5,null,null,6]",
             expected: "[6]", orderMatters: true),
            TestCaseData(id: "687aca31-7268-4848-b4ec-3907b94c30e3",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]",
             expected: "[16]", orderMatters: true),
            TestCaseData(id: "187b9c03-56ca-4d9e-9036-da7d318d911a",
             input: "root = [1,null,2,null,null,3,null,null,4,null,null,5,null,null,6,null,null,7]",
             expected: "[7]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "smallest-subtree-with-all-the-deepest-nodes"
            let topic = "trees"
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

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as TreeNode?"
                )
                return
            }

            let solution = Solution()
            var resultHolder: TreeNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.subtreeWithAllDeepest(p_root)
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

            // Structural comparison: both sides serialized to canonical tree format
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
