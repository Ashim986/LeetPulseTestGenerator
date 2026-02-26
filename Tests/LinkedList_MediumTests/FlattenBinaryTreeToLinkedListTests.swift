import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFlattenBinaryTreeToLinkedList {
    private class Solution {
        func flatten(_ root: TreeNode?) {
            var curr = root
            while curr != nil {
                if curr?.left != nil {
                    var rightmost = curr?.left
                    while rightmost?.right != nil {
                        rightmost = rightmost?.right
                    }
                    rightmost?.right = curr?.right
                    curr?.right = curr?.left
                    curr?.left = nil
                }
                curr = curr?.right
            }
        }
    }

    @Suite struct FlattenBinaryTreeToLinkedListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ccecbbdc-8a10-43e5-8248-42ee3150e894",
             input: "root = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "0f4c8ed4-643d-4731-ac36-7748a190d3c5",
             input: "root = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "8f00bef0-89c3-4787-b0c0-598cc679f244",
             input: "root = [1,2]",
             expected: "[1,null,2]", orderMatters: true),
            TestCaseData(id: "0b4ec906-be49-4dac-bec9-6f39abea5492",
             input: "root = [1,null,2]",
             expected: "[1,null,2]", orderMatters: true),
            TestCaseData(id: "96749234-072c-4417-8e46-92bffd49419a",
             input: "root = [1,2,3]",
             expected: "[1,null,2,null,3]", orderMatters: true),
            TestCaseData(id: "5b68f59d-4c62-439f-864c-dcdb1a013366",
             input: "root = [1,null,2,3]",
             expected: "[1,null,2,null,3]", orderMatters: true),
            TestCaseData(id: "bfd94ed3-3b95-4634-be17-a132404c9edc",
             input: "root = [1,2,null,3]",
             expected: "[1,null,2,null,3]", orderMatters: true),
            TestCaseData(id: "76c4a7c2-3065-4873-9648-a836b0bc0469",
             input: "root = [1,null,2,null,3]",
             expected: "[1,null,2,null,3]", orderMatters: true),
            TestCaseData(id: "4d6605e2-ddd4-400a-8877-ae63af9b52ff",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[1,null,2,null,4,null,5,null,3,null,6,null,7]", orderMatters: true),
            TestCaseData(id: "8c4c702d-3cb2-48a6-ae5f-f5d7051d8396",
             input: "root = [1,-2,3,-4,5,-6,7]",
             expected: "[1,null,-2,null,-4,null,5,null,3,null,-6,null,7]", orderMatters: true),
            TestCaseData(id: "ab30b037-8cb6-4c6d-a2a0-b53f49e92fb3",
             input: "root = [1,2,5,3,4,null,6]",
             expected: "[1,null,2,null,3,null,4,null,5,null,6]", orderMatters: true),
            TestCaseData(id: "6dc1b533-6e18-400f-a97e-5d9ad631ef57",
             input: "root = [0]",
             expected: "[0]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "flatten-binary-tree-to-linked-list"
            let topic = "linked-list"
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
            solution.flatten(p_root)
            let computedOutput = OutputSerializer.serializeVoid()

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
