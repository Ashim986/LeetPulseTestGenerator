import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumWidthOfBinaryTree {
    // Definition for a binary tree node.

    private class Solution {
        func widthOfBinaryTree(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }

            var queue: [(TreeNode, Int)] = [(root, 0)]
            var maxWidth = 1

            while !queue.isEmpty {
                var levelSize = queue.count
                var levelMin = Int.max
                var levelMax = Int.min

                for _ in 1...levelSize {
                    let (node, position) = queue.removeFirst()

                    if let leftChild = node.left {
                        queue.append((leftChild, position * 2))
                    }

                    if let rightChild = node.right {
                        queue.append((rightChild, position * 2 + 1))
                    }

                    levelMin = min(levelMin, position)
                    levelMax = max(levelMax, position)
                }

                let levelWidth = levelMax - levelMin + 1
                maxWidth = max(maxWidth, levelWidth)
            }

            return maxWidth
        }
    }

    @Suite struct MaximumWidthOfBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "84e0e61a-5a87-4d4f-94e0-9b3f793e58b9",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e1218ef2-e959-425b-ac61-51655658ae30",
             input: "root = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b45204e9-13d4-4fe7-b52c-e7f64aed2fd9",
             input: "root = [1,null,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7bc0802c-d41c-4c6c-972e-36b8a07ca597",
             input: "root = [1,2,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "648a4892-a839-4ed9-913b-6c740aae4623",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "496bd50d-8a3f-4b24-b8a3-4bfa789098c8",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "1825a9f3-f861-434f-a89e-ca872b968fa0",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e7e3d775-0614-4ba8-a8c9-95afcba72a7d",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "ccf6b878-a92c-4ffc-8846-052f3d8952d2",
             input: "root = [1,2,3,null,null,4,5,6,7,8,9,10,11]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "d17f68a0-ed24-4cdf-9e92-adff8a28b0b0",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "695e406a-c3bd-4e41-ab69-5f3419ffca4d",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "99afd2e3-7c5e-45c9-9c0f-70f0976b50ff",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "56f5de8d-e9a7-4fed-88f1-adc8cdd76daa",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "50950c27-51a6-469e-8c1c-8f73fbcc8eab",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9b0cce56-f6ae-4ed7-b051-2decb4155cc2",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e27af61d-1f35-451a-a1a0-153d1d576274",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6b198adf-be6d-47f3-bc11-6ba1beb1bf94",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9863bdd3-da3e-4cf7-9668-4c41aed6cdea",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f490d9b6-11e0-4c65-9961-801e3f069c2f",
             input: "root = [1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7f65dccc-5934-4437-bce1-3c7d225f7ba8",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "12f939b2-75cf-473f-8c42-b70bad25bf70",
             input: "root = [1,2,3,null,null,4,5,6,7]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b6e72258-6a8e-4ab6-b6fe-968b3719787e",
             input: "root = [1,-2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1f69591d-3d09-48ad-bcf9-0ea3f97805d6",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "55399e03-fe45-4e7f-93c2-92efc1d2aeb0",
             input: "root = [1,2,null,3,null,4,null,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ad2406a7-aa3b-4a75-9276-b497f54c681c",
             input: "root = [1,2,3,null,null,4,5,6,7,8,9]",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-width-of-binary-tree"
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
                resultHolder = solution.widthOfBinaryTree(p_root)
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
