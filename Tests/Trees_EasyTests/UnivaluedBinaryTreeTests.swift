import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUnivaluedBinaryTree {
    private class Solution {
        func isUnivalTree(_ root: TreeNode?) -> Bool {
            guard let root = root else { return true }
            var queue: [(TreeNode, Int)] = [(root, root.val)]
            while !queue.isEmpty {
                let (node, val) = queue.removeFirst()
                if node.val != val {
                    return false
                }
                if let left = node.left {
                    queue.append((left, val))
                }
                if let right = node.right {
                    queue.append((right, val))
                }
            }
            return true
        }
    }

    @Suite struct UnivaluedBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e63c8e4e-4670-47ee-af2e-9e64035efae2",
             input: "root = []",
             expected: "True", orderMatters: true),
            TestCaseData(id: "027c86a4-b90a-4132-b82a-435d6bee2403",
             input: "root = [1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "ebe32560-5b90-4226-88b3-75fe31519ed5",
             input: "root = [1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "3a4162f6-6b24-477f-8c27-2aebe40209b2",
             input: "root = [1,null,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "c6e9c2a4-fbb2-4431-884e-76811326ae53",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "cf84987c-67c9-455a-ad11-4c3152962967",
             input: "root = [5,5,5,5,5,5,5]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "420e7e0f-1f8a-41f8-bf2e-a5a20c32a71b",
             input: "root = [-1,-1,-1,-1,-1,-1,-1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "e2cb278c-8407-4ddd-b061-197d4099cb2b",
             input: "root = [0,0,0,0,0,0,0]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "e4337b30-aad9-4b70-bf4a-a05b07f5308a",
             input: "root = [1,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "dfd996a0-52be-455e-842f-bd62a68f0c88",
             input: "root = [1,null,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "664ec60d-5f85-4dfe-9944-c56a2f168257",
             input: "root = [1,1,2,1,1,1,1]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "b7236137-6edd-4a3c-a557-c25331118e63",
             input: "root = [5,5,5,5,5,5,6]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "5b93fd9a-c92b-47f7-a5b4-334b2d91ed68",
             input: "root = [-1,-1,-1,-1,-1,-1,0]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "6c6ddd54-da34-4c6f-bbd6-ee3a056cba9e",
             input: "root = [0,0,0,0,0,0,1]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "af69748f-52d6-4726-b525-42cb0426fc44",
             input: "root = [1,1,1,1,1,null,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "4ec54622-11cb-46c4-81b6-8527bbadacd7",
             input: "root = [1,1,1,1,1,null,1,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "c31c3591-4b05-421b-95a1-f7ceef5383b6",
             input: "root = [1,1,1,1,1,1,1,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "391c7424-b0e2-4d36-93b3-1ad31c6f70c1",
             input: "root = [5,5,5,5,5,5,5,6]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "3ffc1e83-920d-40f1-9b55-32ac37ce38a9",
             input: "root = [-1,-1,-1,-1,-1,-1,0,1]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "d72c6e6a-1237-4f5c-9412-a5b5b8d8a4b1",
             input: "root = [0,0,0,0,0,0,1,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "33915b61-6415-4f5e-b32f-96064cc08d17",
             input: "root = [1,1,1,1,1,null,1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "057fe20c-e7eb-4a92-adf5-1e92a0a66c44",
             input: "root = [2,2,2,5,2,null,2,2,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "152feca3-bdbe-4b05-847b-048351a1eea1",
             input: "root = [1,1,1,1,1,null,1,1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "dd5fb18d-022d-4b6c-90cb-ea073e21c6aa",
             input: "root = [1,1,1,1,1,1,1,1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "6abdce62-0b2d-465e-b0bd-81ca0ccf4015",
             input: "root = [5,5,5,5,5,5,5,5,5,5]",
             expected: "True", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "univalued-binary-tree"
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
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isUnivalTree(p_root)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
