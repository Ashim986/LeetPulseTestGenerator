import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBalancedBinaryTree {
    private class Solution {
        func isBalanced(_ root: TreeNode?) -> Bool {
            func height(_ node: TreeNode?) -> Int {
                guard let node = node else { return 0 }
                let left = height(node.left)
                if left == -1 { return -1 }
                let right = height(node.right)
                if right == -1 { return -1 }
                if abs(left - right) > 1 { return -1 }
                return 1 + max(left, right)
            }
            return height(root) != -1
        }
    }

    @Suite struct BalancedBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9e79e7b1-2893-46a8-a2e7-e6276fa4f8fa",
             input: "root = [-1,-2,-3]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "f426192e-3ff6-46c3-8244-576f86d4d54a",
             input: "root = [1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "0ff15438-7571-4aa9-b2e8-19e9eab72fdf",
             input: "root = [1,null,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "02d11c30-7d59-494d-bc65-64d87ad5c1bf",
             input: "root = [1,2,2]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "ecfbb9de-62a4-440d-a617-98ccdfd35931",
             input: "root = [1,2,3,2,2]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "79c4e9dc-c973-4e55-99b1-b3a312d0d7c3",
             input: "root = [1,2,3,null,null,4,2,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "642dab93-1245-4331-902f-1296bf743bf2",
             input: "root = [1,2,3,null,null,4,5,2,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "edd9f72b-72a5-4405-9bd7-c0ba497ed502",
             input: "root = [1,2,3,4,5,6,7,8,9,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "a8f3d231-2c43-4d50-92ec-bd41e5a5dd86",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "959437a4-075b-4cf5-ac8e-c7b23ad5a70c",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "4db1dbda-37ac-4b73-b7a3-7196d8cef9ff",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "4a31c693-a4b8-4a4f-af11-3f50f3c33e43",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "a54b7531-65f2-43ee-aa53-e03e8c6063fd",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "2135f3c9-e3ac-4d8d-a982-5adaac7f9190",
             input: "root = [1,2,null,3,null,4,null,5]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "17973d95-5d79-44c3-a289-2fabdaaa1eec",
             input: "root = [1,2,3,4,5,null,null,null,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "d61b96c5-e4bb-460a-96f7-b1c3d72e171d",
             input: "root = [1,2,3,4,5,6,null,null,null,null,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "48e5874a-050b-48ae-aa78-f82c42b254da",
             input: "root = [1,2,3,4,5,6,7,null,null,null,null,null,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "fae18044-aeb0-4628-b658-5c98813c85a9",
             input: "root = [1,2,3,null,2,2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "caceb7e1-b807-41af-a860-16e9c50ce494",
             input: "root = [1,2,3,null,null,2,2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "90bbe6a6-22b7-4cae-9f87-4993765090a0",
             input: "root = [1,2,3,4,2,2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b99b38f0-a10f-4ad4-96ed-4c46da972bfc",
             input: "root = [1,2,3,null,4,2,2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d0990fdf-cbc6-4eb1-8424-6d65e0cbccab",
             input: "root = [1,2,3,4,5,6,7,8,9,null,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "04da4980-711f-4127-95af-d67b1c49f83c",
             input: "root = [1,2,3,4,5,6,7,8,9,10,null]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6edc0dd4-f352-475b-a42c-76f95adb1df4",
             input: "root = [1,2,3,null,null,null,null,4,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b6e86e05-dce2-48fe-b111-206580affa2c",
             input: "root = [1,2,3,4,null,null,5,null,null]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "balanced-binary-tree"
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
            let result = solution.isBalanced(p_root)
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
