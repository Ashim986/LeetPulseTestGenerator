import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCConstructBinaryTreeFromPreorderAndPostorderTraversal {
    private class Solution {
        func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
            var preorderIndex = 0
            var postorderIndex = 0
            var postorderMap: [Int: Int] = [:]

            for i in 0..<postorder.count {
                postorderMap[postorder[i]] = i
            }

            return constructFromPrePostHelper(&preorderIndex, &postorderIndex, preorder, postorder, postorderMap)
        }

        func constructFromPrePostHelper(_ preorderIndex: inout Int, _ postorderIndex: inout Int, _ preorder: [Int], _ postorder: [Int], _ postorderMap: [Int: Int]) -> TreeNode? {
            if preorderIndex >= preorder.count {
                return nil
            }

            let node = TreeNode(preorder[preorderIndex])
            preorderIndex += 1

            if preorderIndex >= preorder.count {
                return node
            }

            let leftSubtreeRootValue = preorder[preorderIndex]
            node.left = constructFromPrePostHelper(&preorderIndex, &postorderIndex, preorder, postorder, postorderMap)

            node.right = constructFromPrePostHelper(&preorderIndex, &postorderIndex, preorder, postorder, postorderMap)

            return node
        }
    }

    @Suite struct ConstructBinaryTreeFromPreorderAndPostorderTraversalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e37e3105-87b2-4bf7-8dce-e8830364591b",
             input: "preorder = [1,2,4,5,3,6,7], postorder = [4,5,2,6,7,3,1]",
             expected: "[1,2,3,4,5,6,7]", orderMatters: true),
            TestCaseData(id: "89c90961-e22b-45d2-8fc2-20e6d62018c6",
             input: "preorder = [1], postorder = [1]",
             expected: "[1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "construct-binary-tree-from-preorder-and-postorder-traversal"
            let topic = "trees"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_preorder = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_preorder.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: preorder array too large (\(p_preorder.count))"
                )
                return
            }
            guard let p_postorder = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_postorder.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: postorder array too large (\(p_postorder.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_preorder.count >= 1 && p_preorder.count <= 30 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= preorder.length <= 30"
                )
                return
            }

            let solution = Solution()
            var resultHolder: TreeNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.constructFromPrePost(p_preorder, p_postorder)
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
