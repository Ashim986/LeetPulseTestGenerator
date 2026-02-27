import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreePreorderTraversal {
    private class Solution {
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
            var result = [Int]()
            var stack: [TreeNode] = root != nil ? [root.unsafelyUnwrapped] : []
            while !stack.isEmpty {
                let node = stack.removeLast()
                result.append(node.val)
                if let right = node.right {
                    stack.append(right)
                }
                if let left = node.left {
                    stack.append(left)
                }
            }
            return result
        }
    }

    @Suite struct BinaryTreePreorderTraversalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "704ab20e-202a-40c5-8df7-e7141d97de50",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "[1, 2, 4, 5, 3]", orderMatters: true),
            TestCaseData(id: "48104d27-0023-4b4f-926f-7c9be5ef9ae9",
             input: "root = [1,2]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "076449f3-187f-480a-a82d-3a4b6f841ad1",
             input: "root = [1,null,2]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "8600a343-41a1-4d47-a8f2-be7e6f7a3592",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[1, 2, 4, 5, 3, 6, 7]", orderMatters: true),
            TestCaseData(id: "526a68a5-e422-4402-a4cf-765f77429189",
             input: "root = [1,null,null]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "4dd5da71-59cd-4b85-9b45-6e2252d4949d",
             input: "root = [1,-2,3]",
             expected: "[1, -2, 3]", orderMatters: true),
            TestCaseData(id: "671e1db8-719a-482b-82e9-e12f5dcb230b",
             input: "root = [1,2,3,4,null,null,7,8]",
             expected: "[1, 2, 4, 8, 3, 7]", orderMatters: true),
            TestCaseData(id: "b15c5c64-6e02-4e21-9b8e-9f902d55b594",
             input: "root = [1,2,3,null,null,4,null,5]",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "1180f187-e4b6-4308-99ea-0a153349391f",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1, 2, 4, 8, 9, 5, 10, 3, 6, 7]", orderMatters: true),
            TestCaseData(id: "e67d3936-2dfa-4620-9d7d-5b93f371c17f",
             input: "root = [1,null,2,null,3]",
             expected: "[1, 2, 3]", orderMatters: true),
            TestCaseData(id: "0066da53-2e60-489c-a2cf-eafee9554cde",
             input: "root = [1,2,3,null,null,4,5,6,7]",
             expected: "[1, 2, 3, 4, 5, 6, 7]", orderMatters: true),
            TestCaseData(id: "68bded00-1818-44d5-badc-f1b1b93c69c7",
             input: "root = [1,2,3,4,5,6,7,8,9]",
             expected: "[1, 2, 4, 8, 9, 5, 3, 6, 7]", orderMatters: true),
            TestCaseData(id: "89e8d42e-f01b-4c11-9026-e29ba99a666d",
             input: "root = [1,null,2,3,null,4,5]",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "80f764de-12d0-4f63-8a78-0cd4da7d71ff",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[1, 2, 4, 8, 12, 13, 9, 14, 15, 5, 10, 11, 3, 6, 7]", orderMatters: true),
            TestCaseData(id: "57cdd3bb-4cb8-446d-b7c8-8e616de7e3f9",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "[1, 2, 3, 4]", orderMatters: true),
            TestCaseData(id: "0d74eebf-0b94-4af6-9ea4-47814362f391",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[1, 2, 4, 8, 9, 5, 10, 11, 3, 6, 7, 12]", orderMatters: true),
            TestCaseData(id: "bf791837-c47b-452a-b25d-3c1cd4b744ac",
             input: "root = [1,2,3,null,null,4,5,6,7,8,9]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9]", orderMatters: true),
            TestCaseData(id: "1c162869-2813-42f2-9260-de98103d2d4c",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "[1, 2, 4, 8, 12, 13, 9, 14, 5, 10, 11, 3, 6, 7]", orderMatters: true),
            TestCaseData(id: "97d018b9-b364-4ee1-9fdb-df3de89a9bf1",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13]",
             expected: "[1, 2, 4, 8, 9, 5, 10, 11, 3, 6, 7, 12, 13]", orderMatters: true),
            TestCaseData(id: "8b234d26-3d8d-406d-88a3-5523d7be98b0",
             input: "root = [1,null,2,3,null,4,5,6,7]",
             expected: "[1, 2, 3, 4, 5, 6, 7]", orderMatters: true),
            TestCaseData(id: "09caf789-af5f-4905-950a-7e546ef700be",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]",
             expected: "[1, 2, 4, 8, 12, 13, 14, 15, 16, 17, 18, 9, 5, 10, 11, 3, 6, 7]", orderMatters: true),
            TestCaseData(id: "ffd43acb-b8ad-46f8-9230-81e593e9ee9a",
             input: "root = [1,null,2,3,null,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]", orderMatters: true),
            TestCaseData(id: "2fe2658b-429c-4a55-a190-17c6b3ed1440",
             input: "root = [1,2,3,null,null,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]", orderMatters: true),
            TestCaseData(id: "50fd7634-d58e-4209-89ef-b6fcfb2eb9a6",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-tree-preorder-traversal"
            let topic = "stack"
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
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.preorderTraversal(p_root)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
