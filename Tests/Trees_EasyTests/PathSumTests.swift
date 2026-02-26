import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPathSum {
    private class Solution {
        func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
            guard let root = root else { return false }

            var stack: [(TreeNode, Int)] = [(root, targetSum)]

            while !stack.isEmpty {
                let (node, remaining) = stack.removeLast()

                // Check if leaf with matching sum
                if node.left == nil && node.right == nil && remaining == node.val {
                    return true
                }

                // Push children
                if let left = node.left {
                    stack.append((left, remaining - node.val))
                }
                if let right = node.right {
                    stack.append((right, remaining - node.val))
                }
            }

            return false
        }
    }

    @Suite struct PathSumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f738ab4a-138c-463c-80c5-8edebc7883bc",
             input: "root = [1,null,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "8edde347-c7e2-4a2a-ae47-0190ba603d61",
             input: "root = [1,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "40cd55c4-c8ce-4975-b793-8270c8e3158d",
             input: "root = [0]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "1471a064-6c4d-4459-8814-c5f7c89e0f98",
             input: "root = [0,null,0]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "27b52f40-cb92-4900-94c1-1b599b619f03",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "d9fbe3af-52f0-4ac0-bd75-afc98d944fd3",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "a32abda1-9193-48f6-9aa4-55d0d04f9c49",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "1e02cc30-32f5-4b88-b856-c81fc20e8982",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "974bb505-fb97-4943-a504-362a3789a6b8",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "942726c8-874c-4117-a646-7a2d271ee10f",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "e8d8e417-bf3c-4b18-b710-ee01028aa856",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "b29d3491-bc80-459f-b90e-36a885932c49",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "794f3cdf-6d71-4247-81f4-11b68fcadf0f",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "0ecea3eb-a8d2-41db-ac83-1ab3bc734c72",
             input: "root = [1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "0fb2fb7e-3457-4474-93c6-c216399616fd",
             input: "root = [2,-2,-3]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "1bb2fd9b-29c8-43ac-8f8e-6b96bd13bac8",
             input: "root = [1,-1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "5633e6a0-02a7-4efb-9757-8eb262844551",
             input: "root = [1,2,2,3,3,3,3]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "0ba9ac2e-4ea5-4bc9-9cc0-0d2d2c3a12f1",
             input: "root = [-2,null,-3]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "0953c479-d1af-4c54-9251-db6555a34b87",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1f730fb7-2b9b-4984-a617-5842b51a1397",
             input: "root = [1,null,2,null,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "fb331be7-8463-45f8-97bc-8fd4b72bffa6",
             input: "root = [1,2,null,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "25288559-f5b3-4cc8-85dc-d7aba5494614",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e6f058df-656e-4dee-9d64-e09928fb262c",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e9b0601b-102e-46ab-a235-c1c26541ad42",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "cc2e6333-8668-491c-aecb-f578c61a833f",
             input: "root = [0,1,1]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "path-sum"
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
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
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

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= Node.val <= 1000"
                )
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= targetSum <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.hasPathSum(p_root, p_targetSum)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
