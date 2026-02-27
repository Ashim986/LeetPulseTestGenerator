import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumDepthOfBinaryTree {
    private class Solution {
        func maxDepth(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            var queue: [TreeNode] = [root]
            var depth = 0
            var index = 0
            while index < queue.count {
                let levelCount = queue.count - index
                for _ in 0..<levelCount {
                    let node = queue[index]
                    index += 1
                    if let left = node.left { queue.append(left) }
                    if let right = node.right { queue.append(right) }
                }
                depth += 1
            }
            return depth
        }
    }

    @Suite struct MaximumDepthOfBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ba41e9a9-4cae-4b50-a6a1-ac21c66c7b5e",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3e5be7c4-9d4a-4345-93cf-5814cd9079cd",
             input: "root = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "355cece4-b087-4829-a32a-4ca3e5c14b1b",
             input: "root = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9e473022-10e8-49d6-a157-da8e26e3f637",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "54668a07-58b3-4f44-bfb5-1edee0e3d3eb",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "af48dee2-8d6a-4cf2-addf-e5f7b6ff29bd",
             input: "root = [1,null,null]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a1868eaf-c586-44d1-81ef-744e53a71257",
             input: "root = [1,-2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bfe27c2a-1878-40fa-af8e-4ca3bdce7c45",
             input: "root = [1,2,2,4,5,5]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "0bdd881b-5f4d-4162-a032-783401d308c2",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4dd7645c-8532-4abc-8422-7c7ec44b120e",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "8d30650f-1d3c-41a6-8418-e8d70ca83a57",
             input: "root = [1,2,3,null,null,4,5,null,null,6,7,null,null,8,9]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "10ad8d2f-13cc-418d-a5a2-39413914face",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "86706f40-c353-4058-85bd-240f1b699717",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "783c1539-60ba-4f96-aacb-7cb9dccd5cb9",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "ec52e7fb-1b84-4ae2-ae8e-71c2ea67582f",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "06667d00-9480-4ba8-87e3-878d00dc0461",
             input: "root = [1,2,null,4,null,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "fff8e9fe-c8aa-417d-a731-79b8a7209d53",
             input: "root = [1,2,3,null,null,4,5,6,7]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e2ab9274-c100-4d7c-93c2-2a6fa88ad52d",
             input: "root = [1,2,null,4,5,null,6,7]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "c8b540af-dc9c-424e-bb99-d490f8537602",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b533649a-4272-4702-a9ad-3316f0dbbd39",
             input: "root = [1,2,3,null,null,4,5,null,null,6,7]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "b9d88f71-5e81-43ea-a999-f1360457d259",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "8edd56f7-0b36-4d01-b736-a96774146b1c",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "52be9360-dfb3-4a2d-9901-ef805164a2d8",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "40c456c1-428d-4411-9194-40310ad20da8",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "7992769b-014d-4721-be36-b8e3b1b5291a",
             input: "root = [1,2,3,null,null,4,5,null,null,6,7,null,null,8,9,null,null,10,11]",
             expected: "6", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-depth-of-binary-tree"
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
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxDepth(p_root)
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
