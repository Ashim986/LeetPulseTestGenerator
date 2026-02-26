import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFlipBinaryTreeToMatchPreorderTraversal {
    private class Solution {
        func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
            guard let root1 = root1, let root2 = root2 else {
                return root1 == nil && root2 == nil
            }
            if root1.val != root2.val {
                return false
            }
            let left1 = flipEquiv(root1.left, root2.left)
            let right1 = flipEquiv(root1.right, root2.right)
            let left2 = flipEquiv(root1.left, root2.right)
            let right2 = flipEquiv(root1.right, root2.left)
            return left1 && right1 || left2 && right2
        }
    }

    @Suite struct FlipBinaryTreeToMatchPreorderTraversalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "98fa51e7-f113-49b7-bf53-59280cf4ceed",
             input: "root1 = [1], root2 = [1]",
             expected: "True", orderMatters: false),
            TestCaseData(id: "74c7db4f-523f-4251-939c-f6731174bfa1",
             input: "root1 = [1], root2 = [2]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "8e8e7f81-348e-4555-8612-9226235045e4",
             input: "root1 = [1,2], root2 = [1,2]",
             expected: "True", orderMatters: false),
            TestCaseData(id: "62c7141d-cd4f-4fe7-bf09-4cc6b11988c2",
             input: "root1 = [1,2], root2 = [1,3]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "4e9c9d23-c568-4c9b-8574-6cf258eafc13",
             input: "root1 = [1,null,2], root2 = [1,null,2]",
             expected: "True", orderMatters: false),
            TestCaseData(id: "dea5462f-9a8b-4048-b124-8cea388e36ed",
             input: "root1 = [1,null,2], root2 = [1,null,3]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "9d9f303c-633b-458e-b2e0-999d4307d76c",
             input: "root1 = [1,2,3], root2 = [1,3,2]",
             expected: "True", orderMatters: false),
            TestCaseData(id: "288ab93e-ecb9-435d-8742-254b54a424d7",
             input: "root1 = [1,2,3], root2 = [1,2,4]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "04dcf772-e01e-4400-892e-5509203a04ab",
             input: "root1 = [1,2,3,4], root2 = [1,3,2,4]",
             expected: "True", orderMatters: false),
            TestCaseData(id: "6ca60982-eee1-4bae-8465-26031341e562",
             input: "root1 = [1,2,3,4], root2 = [1,3,2,5]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "4b1bf5c7-9355-4dab-ab89-3e6fb47ed139",
             input: "root1 = [1,2,3,4,5], root2 = [1,3,2,4,6]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "d26a4de7-90ee-4378-b625-4cbb0dcf40db",
             input: "root1 = [1,2,3,4,5,6], root2 = [1,3,2,6,4,5]",
             expected: "True", orderMatters: false),
            TestCaseData(id: "e095ea32-c219-489b-ae1c-138bc9383d18",
             input: "root1 = [1,2,3,4,5,6], root2 = [1,3,2,6,4,7]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "01ffc7e3-86ec-402a-85ff-444c315172cf",
             input: "root1 = [1,2,3,4,5,6,7,8], root2 = [1,3,2,6,4,5,7,8]",
             expected: "True", orderMatters: false),
            TestCaseData(id: "6932d1de-7935-4a23-9be9-f4df8bb7f7a1",
             input: "root1 = [1,2,3,4,5,6,7,8], root2 = [1,3,2,6,4,5,7,9]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "cc82cb01-c6d9-44b8-bb3b-dd041f20bcf5",
             input: "root1 = [1,2,3,4,5,6,7,8,9], root2 = [1,3,2,6,4,5,7,8,9]",
             expected: "True", orderMatters: false),
            TestCaseData(id: "400eb516-899d-495e-be7e-b755208587b6",
             input: "root1 = [1,2,3,4,5,6,7,8,9], root2 = [1,3,2,6,4,5,7,8,10]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "d3ba56c8-9e71-4bd9-9c27-d88605a7f40a",
             input: "root1 = [1,2,3,4,5,6,7,8,9,10], root2 = [1,3,2,6,4,5,7,8,9,10]",
             expected: "True", orderMatters: false),
            TestCaseData(id: "f1815166-4e80-4eda-a1a9-2b1dec14a02e",
             input: "root1 = [1,2,3,4,5,6,7,8,9,10], root2 = [1,3,2,6,4,5,7,8,9,11]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "1e33b2a3-23ab-477c-96e7-72f673397604",
             input: "root1 = [1,2,3,4,5,6,7,8,9,10,11], root2 = [1,3,2,6,4,5,7,8,9,10,12]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "b723158c-afd0-4298-9348-bdbdbbf4b96d",
             input: "root1 = [1,2,3,4,5,6,7,8,9,10,11,12], root2 = [1,3,2,6,4,5,7,8,9,10,11,13]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "fcdc0fdb-c85c-4b25-9d94-b914d72ea74e",
             input: "root1 = [1,2,3,4,5,6,7,8,9,10,11,12,13], root2 = [1,3,2,6,4,5,7,8,9,10,11,12,14]",
             expected: "False", orderMatters: false),
            TestCaseData(id: "09126d1e-4fb6-4604-bb76-176d68f5d0a7",
             input: "root1 = [], root2 = []",
             expected: "True", orderMatters: false),
            TestCaseData(id: "653ff389-10d4-4fb3-a666-8daf386bf055",
             input: "root1 = [1], root2 = []",
             expected: "False", orderMatters: false),
            TestCaseData(id: "e7dd1a40-8c4e-45c6-bbfd-f611f4edbdee",
             input: "root1 = [], root2 = [1]",
             expected: "False", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "flip-binary-tree-to-match-preorder-traversal"
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

            guard let p_root1 = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
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
            guard let p_root2 = InputParser.parseNullableIntArray(params[1]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as TreeNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.flipEquiv(p_root1, p_root2)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
