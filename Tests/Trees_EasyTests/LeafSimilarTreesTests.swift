import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLeafSimilarTrees {
    private class Solution {
        func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
            var stack1: [TreeNode] = [root1.unsafelyUnwrapped]
            var stack2: [TreeNode] = [root2.unsafelyUnwrapped]

            while !stack1.isEmpty && !stack2.isEmpty {
                let node1 = stack1.removeLast()
                let node2 = stack2.removeLast()

                if node1.val != node2.val { return false }

                if node1.left == nil && node1.right == nil && node2.left == nil && node2.right == nil {
                    if node1.val != node2.val { return false }
                    continue
                } else if (node1.left == nil && node1.right != nil) || (node1.left != nil && node1.right == nil) {
                    return false
                } else if (node2.left == nil && node2.right != nil) || (node2.left != nil && node2.right == nil) {
                    return false
                }

                if node1.left != nil { stack1.append(node1.left.unsafelyUnwrapped) }
                if node1.right != nil { stack1.append(node1.right.unsafelyUnwrapped) }
                if node2.left != nil { stack2.append(node2.left.unsafelyUnwrapped) }
                if node2.right != nil { stack2.append(node2.right.unsafelyUnwrapped) }
            }

            return stack1.isEmpty && stack2.isEmpty
        }
    }

    @Suite struct LeafSimilarTreesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5636100d-ea18-4525-b1ce-3b012fad674a",
             input: "root1 = [1], root2 = [1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "58f64d95-ff23-40fe-8e63-be3b154026e9",
             input: "root1 = [1], root2 = [2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "7aaff65b-835d-43bf-8a2f-c340b1b3428b",
             input: "root1 = [], root2 = []",
             expected: "True", orderMatters: true),
            TestCaseData(id: "635f7199-f2e0-4771-b16b-22d212544014",
             input: "root1 = [1,2], root2 = [1,2]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "29c0604f-6a12-4d73-b86d-56c1df56a4d6",
             input: "root1 = [1,2], root2 = [1,3]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "c232f62b-51c7-4dbb-a489-8ff4d089ba1d",
             input: "root1 = [1,null,2], root2 = [1,null,2]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "c307dc37-f2b2-46d1-baf4-bf6017ca3be4",
             input: "root1 = [1,null,2], root2 = [1,null,3]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "6d4b582b-d804-4046-ad57-3f3697990b3a",
             input: "root1 = [1,2,3,4,5,6,7], root2 = [1,2,3,4,5,6,7]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "16366b29-ff53-4c18-b41e-7ef219af0193",
             input: "root1 = [1,2,3,4,5,6,7], root2 = [1,2,3,4,5,6,8]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "6f98d0e4-5ff7-42d1-9470-60743da0597e",
             input: "root1 = [1,-2,3], root2 = [1,-2,3]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "543a2342-d40d-4dcd-a3d5-13cd37d17fce",
             input: "root1 = [1,-2,3], root2 = [1,2,3]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "577d0b1a-d025-4ba0-893a-621146686a25",
             input: "root1 = [1,2,2], root2 = [1,2,2]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "18ea0dd2-f976-4f62-b479-5f8ff1270fe4",
             input: "root1 = [1,2,2], root2 = [1,2,3]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "30ef8599-3735-42dd-9966-73ca228d2de6",
             input: "root1 = [1,null,2,null,3], root2 = [1,null,2,null,3]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "35324eb9-1f76-4ad4-a3cc-c1942ec5e19c",
             input: "root1 = [1,null,2,null,3], root2 = [1,null,2,null,4]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "6a84199d-bc73-4c8e-87e5-a7f9625c9034",
             input: "root1 = [1,2,3,4,5,6,7,8,9,10], root2 = [1,2,3,4,5,6,7,8,9,10]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "e5ef0ef2-d7fd-4b49-827c-6fdb1ffb6b8a",
             input: "root1 = [1,2,3,4,5,6,7,8,9,10], root2 = [1,2,3,4,5,6,7,8,9,11]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "a095e703-c26e-4e58-987e-f11c6fef800c",
             input: "root1 = [1,null,null], root2 = [1,null,null]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "d8450743-290b-433c-9ab7-0bc807963f56",
             input: "root1 = [1,null,null], root2 = [2,null,null]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "742633d1-7a23-43b5-9bfd-b4c16504b19e",
             input: "root1 = [1,2,null,4], root2 = [1,2,null,4]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "a6f05e84-f888-436e-beaa-84da5c1fe825",
             input: "root1 = [1,2,null,4], root2 = [1,2,null,5]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "a4745ff2-365a-4296-bea8-7ab44c444f17",
             input: "root1 = [1,2,3,null,null,4,5], root2 = [1,2,3,null,null,4,5]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "9a22bb51-05f5-4507-a5b6-54a159880606",
             input: "root1 = [1,2,3,null,null,4,5], root2 = [1,2,3,null,null,4,6]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "92967486-bad1-490e-8f4c-ae32c3060ec5",
             input: "root1 = [1,2,3,4,5,6,7,8], root2 = [1,2,3,4,5,6,7,8]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "d497dc45-b5ab-49a6-9c23-7339320f9ca7",
             input: "root1 = [1,2,3,4,5,6,7,8], root2 = [1,2,3,4,5,6,7,9]",
             expected: "False", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "leaf-similar-trees"
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

            guard let p_root1 = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
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
            guard let p_root2 = InputParser.parseNullableIntArray(params[1]).map({ buildTree($0) }) else {
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
            let result = solution.leafSimilar(p_root1, p_root2)
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
