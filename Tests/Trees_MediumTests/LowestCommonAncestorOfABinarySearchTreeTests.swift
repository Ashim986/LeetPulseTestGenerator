import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLowestCommonAncestorOfABinarySearchTree {
    private class Solution {
        func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            guard let root = root, let p = p, let q = q else { return nil }
            if p.val < root.val && q.val < root.val {
                return lowestCommonAncestor(root.left, p, q)
            }
            if p.val > root.val && q.val > root.val {
                return lowestCommonAncestor(root.right, p, q)
            }
            return root
        }
    }

    @Suite struct LowestCommonAncestorOfABinarySearchTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "02952880-07bd-445d-aabb-d1b895fa4626",
             input: "root = null",
             expected: "null", orderMatters: true),
            TestCaseData(id: "2287a3d8-91cf-4107-97c5-b178ec3720df",
             input: "root = []",
             expected: "null", orderMatters: true),
            TestCaseData(id: "3c64f49b-cb0f-48ed-8ddd-46e6109a04ca",
             input: "root = [null]",
             expected: "None", orderMatters: true),
            TestCaseData(id: "8886b5ad-1d43-4578-9314-dde20c2b6013",
             input: "{'root': [10, 5, 15, None, None, 6, 20], 'p': 5, 'q': 15}",
             expected: "10", orderMatters: true),
            TestCaseData(id: "45f9577e-caba-415e-b627-f55c7108e685",
             input: "{'root': [1], 'p': 1, 'q': 1}",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c29b544d-01c2-4421-a543-b6a2ae5ff507",
             input: "{'root': [5, 3, 7, 2, 4, 6, 8], 'p': 2, 'q': 8}",
             expected: "5", orderMatters: true),
            TestCaseData(id: "40a0da06-f848-489a-8822-64e6bebb6d67",
             input: "{'root': [0, -1, 4, -2, None, None, 3], 'p': -2, 'q': 4}",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5e248d51-71b5-4fbe-955b-2d47fbc323bf",
             input: "root = [1,2,3]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "977897cc-c000-4629-b93b-4b87c51efcd7",
             input: "root = [1,null,2]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "886eb4f3-2f61-4536-88a6-64fd443bc03c",
             input: "root = [1,2,null]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "6fd7b4da-031e-4bd7-9893-24cf02fa58eb",
             input: "root = [1,null,null]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "44278aae-232c-4e44-872a-27f7da969fe6",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "cb25eb84-5f5c-41a7-9b25-258cc4378605",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "93b433c5-28ba-404f-af5c-547582715c47",
             input: "root = [5,3,7,2,4,6,8]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "710649b4-2695-4d01-bca5-499abb08ff49",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "8947eac6-87ab-4b51-992e-5fb6bf0a30f9",
             input: "root = [1,-2,3,-4,5,-6,7]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "ce5e58df-8578-433c-95d8-84dd752247d1",
             input: "root = [10,5,15,3,7,12,17]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "f487f1b5-6dd2-4ef2-b729-95a9bdf57965",
             input: "root = [1]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "e37b66cc-14a1-414c-b1a0-3b3798baf657",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "0a1c02b8-1a01-4bee-be58-71848d64b9bd",
             input: "root = [1,2,null,null,3]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "423ba434-01fb-4930-af3b-95c744be428b",
             input: "root = [5,3,6,2,4,null,null]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "a86be7bf-131c-432b-9080-7516377e7bdb",
             input: "root = [10,5,15,3,7,12,20]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "218555fe-e0c1-4b56-b17f-edf7b90ef4f8",
             input: "root = [1,null,2,null,3]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "c80ff910-35f9-452a-a12a-de89c8094299",
             input: "root = [0,-1,1]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "142e02d0-ba81-4feb-9396-b34bd0131536",
             input: "root = [1,1,1]",
             expected: "null", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "lowest-common-ancestor-of-a-binary-search-tree"
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
