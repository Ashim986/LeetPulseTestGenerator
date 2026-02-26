import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCConstructBinaryTreeFromPreorderAndInorderTraversal {
    private class Solution {
        func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
            var indexMap: [Int: Int] = [:]
            for (i, val) in inorder.enumerated() { indexMap[val] = i }
            var preIndex = 0

            func helper(_ left: Int, _ right: Int) -> TreeNode? {
                if left > right { return nil }
                let rootVal = preorder[preIndex]
                preIndex += 1
                let root = TreeNode(rootVal)
                let mid = indexMap[rootVal] ?? 0
                root.left = helper(left, mid - 1)
                root.right = helper(mid + 1, right)
                return root
            }

            return helper(0, inorder.count - 1)
        }
    }

    @Suite struct ConstructBinaryTreeFromPreorderAndInorderTraversalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9183693e-0ae7-41f6-8c5c-1976024e96f8",
             input: "preorder = [1,2,3], inorder = [2,1,3]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "34d3ec05-8130-4733-920d-d3479643f032",
             input: "preorder = [1], inorder = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "a043f2cb-0206-4d1f-b8ac-6925061db9bf",
             input: "preorder = [-1,-2,-3], inorder = [-2,-1,-3]",
             expected: "[-1,-2,-3]", orderMatters: true),
            TestCaseData(id: "5651ef32-d579-4933-90df-e7b71e3b0fe4",
             input: "preorder = [], inorder = []",
             expected: "null", orderMatters: true),
            TestCaseData(id: "5a684199-b799-487a-92f4-76083914e405",
             input: "preorder = [1,2,3,4,5,6,7], inorder = [4,2,6,1,3,5,7]",
             expected: "[1,2,3,4,6,null,5,null,null,null,null,null,7]", orderMatters: true),
            TestCaseData(id: "bc53feb7-3b5d-4a43-a1ee-a7d59b9161e6",
             input: "preorder = [1,2,3,4,5,6,7,8,9,10], inorder = [5,4,2,8,6,1,9,3,7,10]",
             expected: "[1,2,3,4,8,9,7,5,null,null,6,null,null,null,10]", orderMatters: true),
            TestCaseData(id: "c5998161-a0d1-46d2-b906-688fa87c2f96",
             input: "preorder = [1,2,3,4,5], inorder = [2,1,4,3,5]",
             expected: "[1,2,3,null,null,4,5]", orderMatters: true),
            TestCaseData(id: "575030b8-9603-4813-8cb1-8f9e558912e8",
             input: "preorder = [1,2,3,4,5,6], inorder = [2,1,4,3,5,6]",
             expected: "[1,2,3,null,null,4,5,null,null,null,6]", orderMatters: true),
            TestCaseData(id: "d57289c5-6649-4e28-9b3e-8fa6fc7e4f2c",
             input: "preorder = [1,2,3,4,5,6,7,8], inorder = [4,2,6,1,3,5,7,8]",
             expected: "[1,2,3,4,6,null,5,null,null,null,null,null,7,null,null,null,8]", orderMatters: true),
            TestCaseData(id: "51d7ceca-6024-4d00-8ea1-7bccbb3be95c",
             input: "preorder = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22], inorder = [14,9,2,13,8,1,15,3,10,5,4,6,7,11,12,16,17,18,19,20,21,"
                + "22]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "9b76e286-17ad-4710-a55e-fb2a1f2b14b4",
             input: "preorder = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23], inorder = [15,10,2,14,9,1,16,3,11,5,4,6,7,8,12,13,17,18,19,20,"
                + "21,22,23]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "738f8c79-cc4d-4a8d-b042-4867c16e0090",
             input: "preorder = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24], inorder = [16,11,2,15,10,1,17,3,12,5,4,6,7,8,9,13,14,18,19,"
                + "20,21,22,23,24]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "0f400951-5a9b-4445-b036-f90d7ba9c642",
             input: "preorder = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25], inorder = [17,12,2,16,11,1,18,3,13,5,4,6,7,8,9,10,14,15,"
                + "19,20,21,22,23,24,25]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "57abc1e4-c73d-4940-bef7-5b72c2fc675f",
             input: "preorder = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26], inorder = [18,13,2,17,12,1,19,3,14,5,4,6,7,8,9,10,11,"
                + "15,20,21,22,23,24,25,26,16]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "2f9e6e69-07be-4e59-9350-e946e1aeca6d",
             input: "preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]",
             expected: "[3,9,20,null,null,15,7]", orderMatters: true),
            TestCaseData(id: "8238c4f6-aec7-447d-8afc-35a768b29c3a",
             input: "preorder = [-1], inorder = [-1]",
             expected: "[-1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "construct-binary-tree-from-preorder-and-inorder-traversal"
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

            guard let p_preorder = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_preorder.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: preorder array too large (\(p_preorder.count))"
                )
                return
            }
            guard let p_inorder = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_inorder.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: inorder array too large (\(p_inorder.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_preorder.count >= 1 && p_preorder.count <= 3000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= preorder.length <= 3000"
                )
                return
            }
            guard p_preorder.allSatisfy({ $0 >= -3000 && $0 <= 3000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -3000 <= preorder[i], inorder[i] <= 3000"
                )
                return
            }
            guard p_inorder.allSatisfy({ $0 >= -3000 && $0 <= 3000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -3000 <= preorder[i], inorder[i] <= 3000"
                )
                return
            }

            let solution = Solution()
            let result = solution.buildTree(p_preorder, p_inorder)
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
