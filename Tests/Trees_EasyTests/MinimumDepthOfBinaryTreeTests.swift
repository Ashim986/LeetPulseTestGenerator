import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumDepthOfBinaryTree {
    private class Solution {
        func minDepth(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            var queue = [(root, 1)]
            while !queue.isEmpty {
                let (node, depth) = queue.removeFirst()
                if node.left == nil && node.right == nil { return depth }
                if let left = node.left { queue.append((left, depth + 1)) }
                if let right = node.right { queue.append((right, depth + 1)) }
            }
            return 0
        }
    }

    @Suite struct MinimumDepthOfBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "12d42207-a601-47b7-a965-571dbee30d3b",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b5e6e614-1e2e-4696-aceb-6c55839c0037",
             input: "root = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9fae2f2b-5685-49b4-9b21-b2001af3c1b8",
             input: "root = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "95fbcc90-a8d3-4d5d-b944-0173a07c5af3",
             input: "root = [1,2,null]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ac727cb4-7ed9-4512-9ccd-2785e471c0de",
             input: "root = [1,null,null]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c76b9f01-f6f2-43b6-a815-c033c3d1821a",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "70a187b2-51b2-4c7a-8e04-0042d683cbc8",
             input: "root = [1,2,3,4,5,6,null]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9602ebdb-19d5-4a04-bc77-c7cc1dfb4f6b",
             input: "root = [1,2,3,4,null,6,7]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ee848e8e-f90f-499c-b2fd-57b57f5bc8f5",
             input: "root = [1,2,3,null,4,5,6]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1660d6dd-3171-46db-a59c-209710d656a5",
             input: "root = [1,2,3,4,5,null,7]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e50e44a5-f736-4077-bda2-277b4b11dffb",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "c7a72bb1-d51f-4d4c-95a9-8c13e1904115",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "8e6b5b7b-79ae-435e-9131-78f7406225de",
             input: "root = [-1,-2,-3,-4,-5,-6,-7]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "06955f39-a8ea-4ba7-88a4-9f67eb232340",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a3f60dcc-036b-483c-a4d1-f31a7523ff4b",
             input: "root = [1,2,2,2,2,2,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "47e354af-6f96-42a3-8f70-46c0c7c059a5",
             input: "root = [1,2,3,2,3,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "093de563-eaa5-48e1-864e-0b27bfdbde64",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "7db3898f-8787-4ce5-bdf4-57e267b48f02",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c44f3a78-1eec-4c43-94f2-9bd46bca5c56",
             input: "root = [1,2,3,null,null,4,null]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0015934a-fb7c-47f8-b0c9-6e0d74740daf",
             input: "root = [1,null,2,3,null,4,null]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ea9aacaa-f04f-4a58-84fb-0cc1313d0cfa",
             input: "root = [1,2,null,3,null,4,null]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "533daaee-592c-4f60-b72f-1f60702660b2",
             input: "root = [1,2,3,4,5,6,7,8]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d6287b54-7f7d-4f9e-8d41-6b171749bec3",
             input: "root = [1,2,3,4,5,6,7,8,9]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f8a815d0-cbce-4ec5-9358-e4e39ff5e28d",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "aeb09551-2072-4b1c-93d8-99a2020a71dc",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11]",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-depth-of-binary-tree"
            let topic = "trees"
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
            let result = solution.minDepth(p_root)
            let computedOutput = OutputSerializer.serialize(result)

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
