import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMergeTwoBinaryTrees {
    private class Solution {
        func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
            if t1 == nil {
                return t2
            }
            if t2 == nil {
                return t1
            }
            t1.unsafelyUnwrapped.val += t2.unsafelyUnwrapped.val
            t1.unsafelyUnwrapped.left = mergeTrees(t1.unsafelyUnwrapped.left, t2.unsafelyUnwrapped.left)
            t1.unsafelyUnwrapped.right = mergeTrees(t1.unsafelyUnwrapped.right, t2.unsafelyUnwrapped.right)
            return t1
        }
    }

    @Suite struct MergeTwoBinaryTreesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "970523b7-2fd3-4fe3-9293-ac246c9e60ae",
             input: "t1 = [1], t2 = [2]",
             expected: "[3]", orderMatters: true),
            TestCaseData(id: "34da5a89-23e6-4719-aff3-d0fac813b0a7",
             input: "t1 = [1,2], t2 = [1,null,2]",
             expected: "[2,2,2]", orderMatters: true),
            TestCaseData(id: "58eb82b7-ecfc-4eba-a186-2f597d32652e",
             input: "t1 = [1,null,2], t2 = [1,2]",
             expected: "[2,2,2]", orderMatters: true),
            TestCaseData(id: "e338ce3d-dff4-4ff8-b96c-0afe14186385",
             input: "t1 = [], t2 = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "773d4eb1-d905-46e9-9277-0da9290adfcb",
             input: "t1 = [1], t2 = []",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "a35408ef-5b10-488c-8a1f-43fffa0dd763",
             input: "t1 = [1,2,3], t2 = [4,5,6]",
             expected: "[5,7,9]", orderMatters: true),
            TestCaseData(id: "21497bb2-b013-4b41-8a78-7ce1d43e1df7",
             input: "t1 = [1,2,3], t2 = [4,null,6]",
             expected: "[5,2,9]", orderMatters: true),
            TestCaseData(id: "c1bbc7a3-1a1e-4f51-9f6c-d6b11b8f500b",
             input: "t1 = [1,null,3], t2 = [4,5,6]",
             expected: "[5,5,9]", orderMatters: true),
            TestCaseData(id: "b98ad1be-c28f-418c-8c35-f9cc50b2b68f",
             input: "t1 = [1,2,3,4,5], t2 = [6,7,8,9,10]",
             expected: "[7,9,11,13,15]", orderMatters: true),
            TestCaseData(id: "3512362b-a65c-4c4a-a527-ba49cb674420",
             input: "t1 = [1,2], t2 = [1,null,1]",
             expected: "[2,2,1]", orderMatters: true),
            TestCaseData(id: "87863f17-246c-4871-8fa4-789d9199df06",
             input: "t1 = [], t2 = [5]",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "57563b2f-092d-44c1-886d-ed23593dfb3e",
             input: "t1 = [0], t2 = [0]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "88d64c53-7f0c-41f8-9bcb-13b98fff0513",
             input: "t1 = [1,null,2,null,null,3], t2 = [1,null,2,null,null,3]",
             expected: "[2,null,4,null,null,6]", orderMatters: true),
            TestCaseData(id: "4fff0307-9c05-4a72-8645-de70082c3546",
             input: "t1 = [1,2,3,4,5], t2 = [6,null,8,null,10]",
             expected: "[7,2,11,4,5,null,10]", orderMatters: true),
            TestCaseData(id: "9ef2d5ef-e6ee-4ddf-b1d4-0f71622b74f6",
             input: "t1 = [10,5,15,3,null,12,null,4,null,7], t2 = [10,7,15,2,null,11,null,5,null,6]",
             expected: "[20,12,30,5,null,23,null,9,null,null,null,13]", orderMatters: true),
            TestCaseData(id: "f91ed815-bd34-46b6-851d-531a3934f2bd",
             input: "root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]",
             expected: "[3,4,5,5,4,null,7]", orderMatters: true),
            TestCaseData(id: "c812a768-e111-4179-8926-0ce2aabeb3fb",
             input: "root1 = [1], root2 = [1,2]",
             expected: "[2,2]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "merge-two-binary-trees"
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

            guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
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
            guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map({ buildTree($0) }) else {
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
            let result = solution.mergeTrees(p_t1, p_t2)
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
