import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCInvertBinaryTree {
    private class Solution {
        func invertTree(_ root: TreeNode?) -> TreeNode? {
            guard let root = root else { return nil }
            var queue: [TreeNode] = [root]
            var index = 0
            while index < queue.count {
                let node = queue[index]
                index += 1
                let temp = node.left
                node.left = node.right
                node.right = temp
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            return root
        }
    }

    @Suite struct InvertBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b775b775-f721-47c2-807c-4736016df4de",
             input: "root = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "ac5557e3-68fc-4509-8ce2-e9560826eefb",
             input: "root = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "0af9b98f-31d8-4e0b-8494-14430f3c8067",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "[1,3,2,5,4]", orderMatters: true),
            TestCaseData(id: "a166c69d-371f-4478-9869-e661f9be9a93",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[1,3,2,7,6,5,4]", orderMatters: true),
            TestCaseData(id: "787f38dd-3c4f-4275-b2f4-a4abe703d3c4",
             input: "root = [1,-2,3]",
             expected: "[1,3,-2]", orderMatters: true),
            TestCaseData(id: "39751494-553a-44dc-8519-37666a97cb18",
             input: "root = [1,2,2]",
             expected: "[1,2,2]", orderMatters: true),
            TestCaseData(id: "2b42c2af-e50a-41ae-8b1e-4c48a718c1b5",
             input: "root = [1,2,3,4,4,5,6]",
             expected: "[1,3,2,6,5,4,4]", orderMatters: true),
            TestCaseData(id: "c3483940-33ca-4325-a82e-4437c9b677eb",
             input: "root = [10,20,30,40,50,60,70]",
             expected: "[10,30,20,70,60,50,40]", orderMatters: true),
            TestCaseData(id: "abfd2c4b-01e5-4e43-aa16-8bd3f1e6605d",
             input: "root = [1,null,null]",
             expected: "[1,null,null]", orderMatters: true),
            TestCaseData(id: "62288119-c69b-40b8-9969-9ae5c7492543",
             input: "root = [1,2,3,4,5,6,7,null]",
             expected: "[1,3,2,7,6,5,4]", orderMatters: true),
            TestCaseData(id: "7c870023-08ac-4272-9ceb-4d20244535d9",
             input: "root = [1,2,3,4,5,6,7,null,null]",
             expected: "[1,3,2,7,6,5,4]", orderMatters: true),
            TestCaseData(id: "62c1a234-6cd8-4048-8cb0-5c3685669304",
             input: "root = [1,2]",
             expected: "[1,null,2]", orderMatters: true),
            TestCaseData(id: "908d7787-8acd-4f62-b502-1cb87b1a4cd5",
             input: "root = [1,null,2]",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "be3fac32-c0cf-40ea-ab30-bede6b3c2851",
             input: "root = [1,2,null,3]",
             expected: "[1,null,2,null,3]", orderMatters: true),
            TestCaseData(id: "77dbb392-4498-4d58-b2d7-a0e7a6d21982",
             input: "root = [1,2,3,null,4]",
             expected: "[1,3,2,null,null,4,null]", orderMatters: true),
            TestCaseData(id: "0f633525-cf8c-4f13-b89c-4a1a41cde813",
             input: "root = [1,2,3,4,null,5]",
             expected: "[1,3,2,null,5,4,null]", orderMatters: true),
            TestCaseData(id: "195531ef-6c54-4e0a-a7c0-37e5e2f1bd0c",
             input: "root = [1,2,3,4,5,null,6]",
             expected: "[1,3,2,6,null,5,4]", orderMatters: true),
            TestCaseData(id: "3820327b-cbdc-4614-9fda-9b409a81fad5",
             input: "root = [1,2,3,4,5,6,null]",
             expected: "[1,3,2,null,6,5,4]", orderMatters: true),
            TestCaseData(id: "5af60cf4-1346-4cd4-8460-1c2c3a12d0c3",
             input: "root = [1,2,3,4,5,6,7,8,9]",
             expected: "[1,3,2,7,6,5,4,null,null,null,null,null,null,9,8]", orderMatters: true),
            TestCaseData(id: "a708b599-1c38-4a02-a170-080f53940397",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,3,2,7,6,5,4,null,null,null,10,null,9,null,8]", orderMatters: true),
            TestCaseData(id: "23564db8-a902-4f39-86e1-dbea18035dba",
             input: "root = [1,2,3,4,5,6,7,8,9,null,null,null,null]",
             expected: "[1,3,2,7,6,5,4,null,null,9,8]", orderMatters: true),
            TestCaseData(id: "55dc0dc0-8fe1-4b47-9c31-146636464d78",
             input: "root = [1,2,3,4,5,6,7,8,9,10,null,null,null,null,null]",
             expected: "[1,3,2,7,6,5,4,null,10,9,8]", orderMatters: true),
            TestCaseData(id: "16d4c342-e75a-43c7-8e71-413d6ef24dd9",
             input: "root = [5,3,6,2,4,null,null,1]",
             expected: "[5,6,3,null,null,4,2,null,null,null,1]", orderMatters: true),
            TestCaseData(id: "cd21b1ed-6aea-4fcd-b447-35b971ef4dce",
             input: "root = [4,2,7,1,3,6,9]",
             expected: "[4,7,2,9,6,3,1]", orderMatters: true),
            TestCaseData(id: "f73eef69-be32-4b58-aad3-7178732f1725",
             input: "root = [2,1,3]",
             expected: "[2,3,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "invert-binary-tree"
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
                resultHolder = solution.invertTree(p_root)
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
