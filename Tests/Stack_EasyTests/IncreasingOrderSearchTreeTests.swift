import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCIncreasingOrderSearchTree {
    private class Solution {
        var prev: TreeNode?
        func increasingBST(_ root: TreeNode?) -> TreeNode? {
            let dummy = TreeNode(0)
            prev = dummy
            inorder(root)
            return dummy.right
        }
        func inorder(_ node: TreeNode?) {
            if node == nil { return }
            inorder(node?.left)
            node?.left = nil
            prev?.right = node
            prev = node
            inorder(node?.right)
        }
    }

    @Suite struct IncreasingOrderSearchTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "29ba19b3-ec1e-4503-b016-b875fea2d908",
             input: "root = []",
             expected: "null", orderMatters: true),
            TestCaseData(id: "299e6675-7d59-4442-a2f2-217d380499c8",
             input: "root = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "525b8ef5-d87b-4ec9-b256-474709280399",
             input: "root = [1,2]",
             expected: "[2,null,1]", orderMatters: true),
            TestCaseData(id: "b6803b69-e28e-4910-97f7-0c8c9dd73d39",
             input: "root = [2,1]",
             expected: "[1,null,2]", orderMatters: true),
            TestCaseData(id: "1fddeaab-520a-4f35-b738-f1a70aee147d",
             input: "root = [1,null,2]",
             expected: "[1,null,2]", orderMatters: true),
            TestCaseData(id: "4ca1109d-b6db-475c-b719-996a8eb9ed57",
             input: "root = [2,null,1]",
             expected: "[2,null,1]", orderMatters: true),
            TestCaseData(id: "abf483e3-fca5-4844-b50a-530719996fd4",
             input: "root = [1,2,3,4,5]",
             expected: "[4,null,2,null,5,null,1,null,3]", orderMatters: true),
            TestCaseData(id: "f84d4dde-5221-4e45-ac04-f2334df58636",
             input: "root = [5,4,3,2,1]",
             expected: "[1,null,2,null,3,null,4,null,5]", orderMatters: true),
            TestCaseData(id: "a9b33b79-3fb6-4774-ab39-02dcdb62315b",
             input: "root = [10,5,15,3,7,12,20]",
             expected: "[3,null,5,null,7,null,10,null,12,null,15,null,20]", orderMatters: true),
            TestCaseData(id: "7b66c6c9-68e1-4c57-bec2-a1f9c7ed9e35",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,11,13,19,21]",
             expected: "[2,null,3,null,4,null,5,null,6,null,7,null,8,null,10,null,11,null,12,null,13,null,15,null,19,null,20,null,21]", orderMatters: true),
            TestCaseData(id: "d7f84ed5-a9ff-4acf-a1ae-be4f12cb835d",
             input: "root = [-10,-5,0,5,10]",
             expected: "[5,null,-5,null,10,null,-10,null,0]", orderMatters: true),
            TestCaseData(id: "b4dda69d-a117-43fc-b6ff-984ef498a455",
             input: "root = [10,5,15,5,5]",
             expected: "[5,null,5,null,5,null,10,null,15]", orderMatters: true),
            TestCaseData(id: "34cc4912-5914-4fd4-802d-7d324fd5b56e",
             input: "root = [1,1,1,1,1]",
             expected: "[1,null,1,null,1,null,1,null,1]", orderMatters: true),
            TestCaseData(id: "d8adac81-65b1-4211-a9b1-95b70742de10",
             input: "root = [1,2,2,2,2]",
             expected: "[2,null,2,null,2,null,1,null,2]", orderMatters: true),
            TestCaseData(id: "de85d94f-ac66-4640-a806-5c26dcdb5bde",
             input: "root = [1,null,2,null,3]",
             expected: "[1,null,2,null,3]", orderMatters: true),
            TestCaseData(id: "6080b3d6-2fab-428f-adaf-879a6dd30142",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "[1,null,2,null,3,null,4]", orderMatters: true),
            TestCaseData(id: "f40bf4ae-8070-4e5c-9e73-b63343baf00a",
             input: "root = [1,2,null,3]",
             expected: "[3,null,2,null,1]", orderMatters: true),
            TestCaseData(id: "3c412ea7-6b6c-477a-8b82-0bbe4ddfd42d",
             input: "root = [1,2,null,3,null,4]",
             expected: "[4,null,3,null,2,null,1]", orderMatters: true),
            TestCaseData(id: "dbb4af95-d706-459d-988b-0eea7fd3846c",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "[2,null,1,null,4,null,3,null,5]", orderMatters: true),
            TestCaseData(id: "1c7e47cc-e841-4df4-bb5a-568427a1e281",
             input: "root = [1,2,3,4,5,null,null]",
             expected: "[4,null,2,null,5,null,1,null,3]", orderMatters: true),
            TestCaseData(id: "5bf52eaf-8e2f-4e55-8fdf-ebe3a2460a8a",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,11,13,19,21,0,-1,-2,-3]",
             expected: "[0,null,-1,null,2,null,-2,null,4,null,-3,null,3,null,6,null,7,null,8,null,5,null,10,null,11,null,12,null,13,null,15,null,19,null,20,null"
                + ",21]", orderMatters: true),
            TestCaseData(id: "fa236d68-4aa4-47fa-8ce8-ee2d8ff57419",
             input: "root = [10,5,15,3,7,13,18,2,4,6,8,12,14,17,19]",
             expected: "[2,null,3,null,4,null,5,null,6,null,7,null,8,null,10,null,12,null,13,null,14,null,15,null,17,null,18,null,19]", orderMatters: true),
            TestCaseData(id: "fdd3778f-214f-4b47-a620-2756ec099626",
             input: "root = [5,-3,8,-4,2,6,10,-1,3,7,9]",
             expected: "[-1,null,-4,null,-3,null,2,null,3,null,5,null,6,null,7,null,8,null,9,null,10]", orderMatters: true),
            TestCaseData(id: "0900ee1c-2d3d-49f8-af1f-e4ba1eeabff0",
             input: "root = [5,3,6,2,4,null,8,1,null,null,null,7,9]",
             expected: "[1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]", orderMatters: true),
            TestCaseData(id: "65345af3-22b4-4cf1-abf2-0cfae7f6a6ae",
             input: "root = [5,1,7]",
             expected: "[1,null,5,null,7]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "increasing-order-search-tree"
            let topic = "stack"
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

            let solution = Solution()
            let result = solution.increasingBST(p_root)
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
