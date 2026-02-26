import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAddOneRowToTree {
    private class Solution {
        func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
            if depth == 1 {
                let newNode = TreeNode(val)
                newNode.left = root
                return newNode
            }
            addRowHelper(root, val, depth, 1, true)
            return root
        }

        func addRowHelper(_ node: TreeNode?, _ val: Int, _ depth: Int, _ currentDepth: Int, _ isLeft: Bool) {
            guard let node = node else { return }
            if currentDepth == depth - 1 {
                let tempLeft = node.left
                let tempRight = node.right
                if isLeft {
                    node.left = TreeNode(val)
                    node.left?.left = tempLeft
                    node.right = TreeNode(val)
                    node.right?.right = tempRight
                } else {
                    node.left = TreeNode(val)
                    node.left?.right = tempLeft
                    node.right = TreeNode(val)
                    node.right?.left = tempRight
                }
                return
            }
            addRowHelper(node.left, val, depth, currentDepth + 1, true)
            addRowHelper(node.right, val, depth, currentDepth + 1, false)
        }
    }

    @Suite struct AddOneRowToTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0fa59eaa-bf16-49db-a0a1-b3dff5f0c004",
             input: "root = [1,2,3], val = 4, depth = 1",
             expected: "[4,1,null,2,3]", orderMatters: true),
            TestCaseData(id: "3ef99311-9401-4be0-bddc-4e9fb0893c18",
             input: "root = [1,2,3], val = 4, depth = 3",
             expected: "[1,2,3,4,4,4,4]", orderMatters: true),
            TestCaseData(id: "22c614b4-c6da-47a7-9a28-e48788fb0594",
             input: "root = [1,2,3], val = 4, depth = 2, isLeft = false",
             expected: "[1,4,4,2,null,null,3]", orderMatters: true),
            TestCaseData(id: "35a3b637-ab12-41ec-b1e9-ccca111e703c",
             input: "root = [1,2,3], val = 4, depth = 2",
             expected: "[1,4,4,2,null,null,3]", orderMatters: true),
            TestCaseData(id: "c62820e2-4e5a-43b9-9dac-109d56259cde",
             input: "root = [1], val = 2, depth = 1",
             expected: "[2,1,null]", orderMatters: true),
            TestCaseData(id: "cedd35a1-06af-4348-9459-4cf69ba14e6a",
             input: "root = [1], val = 2, depth = 2",
             expected: "[1,2,2]", orderMatters: true),
            TestCaseData(id: "b38dc87a-9523-44a4-99c5-688878d6068b",
             input: "root = [1,2], val = 3, depth = 1",
             expected: "[3,1,null,2,null]", orderMatters: true),
            TestCaseData(id: "dcd46abe-a21e-4336-956c-ba2eb1194adf",
             input: "root = [1,2], val = 3, depth = 2",
             expected: "[1,3,3,2,null,null,null]", orderMatters: true),
            TestCaseData(id: "bb045f65-07f4-4400-95b0-f73520c17a3e",
             input: "root = [1,2], val = 3, depth = 3",
             expected: "[1,2,null,3,3]", orderMatters: true),
            TestCaseData(id: "c83d1042-acb5-4f37-b380-f2776f9fc6f0",
             input: "root = [1,2,3,4,5,6,7], val = 8, depth = 4",
             expected: "[1,2,3,4,5,6,7,8,8,8,8,8,8,8,8]", orderMatters: true),
            TestCaseData(id: "a9ab6f9e-c2f1-4e51-a2ee-a31390d01c5e",
             input: "root = [1,2,3,4,5,6,7], val = 0, depth = 1",
             expected: "[0,1,null,2,3,null,null,4,5,6,7]", orderMatters: true),
            TestCaseData(id: "a387af10-97bf-4ae8-a91e-f6d4e4d84d51",
             input: "root = [1,2,3,4,5,6,7], val = 0, depth = 2",
             expected: "[1,0,0,2,null,null,3,4,5,6,7]", orderMatters: true),
            TestCaseData(id: "db3970e0-e51b-4a65-a8ba-b1c2455623a9",
             input: "root = [1,2,3,4,5,6,7], val = 0, depth = 3",
             expected: "[1,2,3,0,0,0,0,4,null,null,5,6,null,null,7]", orderMatters: true),
            TestCaseData(id: "b9a87130-553d-438b-b8ac-0447f17c3cfd",
             input: "root = [1,2,3,4,5,6,7], val = 0, depth = 4",
             expected: "[1,2,3,4,5,6,7,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "d32e91a0-cba8-4d96-8a0c-c0e0fa64f16e",
             input: "root = [1,2,3,4,5,6,7], val = 0, depth = 5",
             expected: "[1,2,3,4,5,6,7]", orderMatters: true),
            TestCaseData(id: "dabf29b4-0780-4f01-9a16-ae2e7f30b9d9",
             input: "root = [4,2,6,3,1,5], val = 1, depth = 2",
             expected: "[4,1,1,2,null,null,6,3,1,5]", orderMatters: true),
            TestCaseData(id: "4d5d669e-f5c5-4897-a842-8b393f2070f7",
             input: "root = [4,2,null,3,1], val = 1, depth = 3",
             expected: "[4,2,null,1,1,3,null,null,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "add-one-row-to-tree"
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
            guard let p_val = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_depth = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_val >= -100 && p_val <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -100 <= Node.val <= 100"
                )
                return
            }
            guard p_val >= -105 && p_val <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -105 <= val <= 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.addOneRow(p_root, p_val, p_depth)
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
