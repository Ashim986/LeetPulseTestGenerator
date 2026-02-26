import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLowestCommonAncestorOfABinaryTree {
    private class Solution {
        func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            guard let root = root else { return nil }
            if root === p || root === q { return root }
            let left = lowestCommonAncestor(root.left, p, q)
            let right = lowestCommonAncestor(root.right, p, q)
            if left != nil && right != nil { return root }
            return left ?? right
        }
    }

    @Suite struct LowestCommonAncestorOfABinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a5aea984-009a-43a6-b811-7df20a02a8b9",
             input: "root = []",
             expected: "None", orderMatters: true),
            TestCaseData(id: "acc63703-7d89-4cad-83f0-0db31ab12730",
             input: "root = [1,2,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "880d5f01-ebc7-4c25-88f0-04f52f58e071",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2974b0b4-2bd6-468f-a3c4-d3e01422d19a",
             input: "root = [1,-2,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2d2e67a9-8291-4967-89da-d0fb7e581e8b",
             input: "root = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ad1aae4b-5380-4457-a06d-ae0a09c7be58",
             input: "root = [1,2,3,4,4,4,4]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8940de76-a19c-4c42-96d8-543394f64dc4",
             input: "root = [1,2,3,4,5,6,7,null,null,null,null,null,null,8]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bbe6b339-8a8d-4d16-980e-6b03be5e5d65",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2994239b-2d66-44ea-a4f0-2a538416d3d2",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e55cc585-2ec3-4b9c-81ed-14e276c6db4b",
             input: "root = [1,2]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "52f8698a-52b9-4f49-a967-56db25f74dab",
             input: "root = [1,null,2]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "b96d60e9-4e71-477e-bbac-24411dbaa3ef",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "7bb59c1a-7f14-4d33-b0f4-f0e8e73822f7",
             input: "root = [1,null,2,null,3]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "61d5af66-d9a7-4a99-b4ca-70fd1e10b382",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "43ce172c-da30-47e6-8ce4-29a34dc37734",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "b721881f-926f-4758-a473-ddc1bb621402",
             input: "root = [1,2,3,-4,5,-6,7]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "2f9f041d-a3fd-4f36-81ae-ae712fbcfd17",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "ddd36647-bcf6-42c4-a575-2a1ea236bbdc",
             input: "root = [1]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "24c4a02c-2702-455c-94c8-7bead67d90bc",
             input: "root = [1,null,null]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "56f9c35a-84c1-42da-9214-9551c3c560ca",
             input: "root = [1,2,null,4]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a473e72d-6d4f-4b19-a0b3-6802f20a1489",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "2f748ef0-fd5d-4d39-9c15-e988b251684e",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "6f808a09-fe63-4bf6-a228-b17eff8e1fe8",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "0c359b7b-5c12-48b2-b41d-ffb282fb1e5b",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "d62c5c1a-5681-4c6a-ad0b-a661cc07bcee",
             input: "root = [1,2,null,null,null]",
             expected: "null", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "lowest-common-ancestor-of-a-binary-tree"
            let topic = "trees"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
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
            guard let p_p = InputParser.parseNullableIntArray(params[1]).map({ buildTree($0) }) else {
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
            guard let p_q = InputParser.parseNullableIntArray(params[2]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as TreeNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
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
