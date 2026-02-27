import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreePruning {
    private class Solution {
        func pruneTree(_ root: TreeNode?) -> TreeNode? {
            func prune(_ node: TreeNode?) -> TreeNode? {
                if node == nil {
                    return nil
                }
                node?.left = prune(node?.left)
                node?.right = prune(node?.right)
                if node?.val == 0, node?.left == nil, node?.right == nil {
                    return nil
                }
                return node
            }
            return prune(root)
        }
    }

    @Suite struct BinaryTreePruningTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f9484055-f91e-4f72-9e01-3209b957e347",
             input: "root = []",
             expected: "null", orderMatters: true),
            TestCaseData(id: "123db559-1f20-4dec-b775-d5a5ba2a0212",
             input: "root = [0]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "58918818-d37b-4fef-8046-9f9f6a7043a8",
             input: "root = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "d8ab9af8-05f3-4e19-a506-5d2891770f78",
             input: "root = [0,0,0]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "0e3c13bd-d485-41ad-b077-9d38efb163cd",
             input: "root = [1,0,0]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "8870e33d-da89-4297-af67-9683ab1db8da",
             input: "root = [1,1,1]",
             expected: "[1,1,1]", orderMatters: true),
            TestCaseData(id: "01a718e5-2848-4e50-ad31-374b16d7b135",
             input: "root = [1,0,1,0,0]",
             expected: "[1,null,1]", orderMatters: true),
            TestCaseData(id: "61ba25dc-9521-457b-b4e1-4c1e5a7f3246",
             input: "root = [1,0,0,0,0,0,1]",
             expected: "[1,null,0,null,null,null,1]", orderMatters: true),
            TestCaseData(id: "fb447d81-86e1-48e0-a61b-62bc422e64b8",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "24db21b2-6488-4e25-afef-32ac33c923bc",
             input: "root = [0,0,0,0,0,0,0]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "4a843f56-e412-4abc-8690-5043c904351e",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[1,2,3,4,5,6,7]", orderMatters: true),
            TestCaseData(id: "8f208ce6-9b0f-4c52-8a20-f1be214d153e",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "f5f43d8f-e219-4350-b78f-f07f70a6d14e",
             input: "root = [0,0,0,0,0,0,0,0,0,0]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "d3d409ad-c353-4587-b3b0-22406a3d729b",
             input: "root = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "42d198ea-39f7-4adc-9330-4649e97cf00b",
             input: "root = [1,0,0,0,0,0,0,0,0,0]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "9989459e-9c37-400a-acc1-216b10d65d59",
             input: "root = [1,0,1,0,0,0,1,0,0,0]",
             expected: "[1,null,1,null,null,null,1]", orderMatters: true),
            TestCaseData(id: "5d7f1127-2571-4ae9-a68d-902f747d422a",
             input: "root = [0,0,0,0,null,0,0]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "3bfb3b00-6f46-42f6-a9da-98047830b278",
             input: "root = [1,1,0,1,1,0,1,0]",
             expected: "[1,1,0,1,1,null,1]", orderMatters: true),
            TestCaseData(id: "814d968e-4483-487e-b3b4-7eb5991f9c6e",
             input: "root = [0,1,0]",
             expected: "[0,1,null]", orderMatters: true),
            TestCaseData(id: "2a7e1f6d-4510-4ba7-9968-88e5190446b3",
             input: "root = [0,0,1]",
             expected: "[0,null,1]", orderMatters: true),
            TestCaseData(id: "1d95d1a0-6cc1-482a-8d06-d428b31e0cb7",
             input: "root = [1,0,1,0,1]",
             expected: "[1,0,1,null,1,null,null]", orderMatters: true),
            TestCaseData(id: "768aa514-54ff-4f42-97d1-5d9a920ed6e5",
             input: "root = [1,1,0,0,1,0]",
             expected: "[1,1,null,null,1]", orderMatters: true),
            TestCaseData(id: "32ebc5ca-41bf-4553-85a2-ede539084162",
             input: "root = [1,1,1,0,0,0,1]",
             expected: "[1,1,1,null,null,null,1]", orderMatters: true),
            TestCaseData(id: "75c8334e-09ab-4bcb-9ebc-02471d4b3d0b",
             input: "root = [1,-1,1,-1,1]",
             expected: "[1,-1,1,-1,null,1]", orderMatters: true),
            TestCaseData(id: "2a4b2530-da6f-4186-8bcc-885944f911fa",
             input: "root = [-1,-1,-1,-1,-1]",
             expected: "[-1,-1,-1,-1,null,-1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-tree-pruning"
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
                resultHolder = solution.pruneTree(p_root)
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
