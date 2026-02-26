import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSumOfLeftLeaves {
    private class Solution {
        func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            var sum = 0
            var stack: [(TreeNode, Bool)] = [(root, false)]

            while !stack.isEmpty {
                let (node, isLeft) = stack.removeLast()

                if node.left == nil, node.right == nil, isLeft {
                    sum += node.val
                }

                if let right = node.right {
                    stack.append((right, false))
                }

                if let left = node.left {
                    stack.append((left, true))
                }
            }

            return sum
        }
    }

    @Suite struct SumOfLeftLeavesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "78cd6b75-8d6d-44af-b2b7-51426e72a624",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "de438f85-52f8-4ac4-a491-3b4ae66bdd77",
             input: "root = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3c244ef8-d8e7-49b8-b677-e8a63d1ae0c1",
             input: "root = [1,2,null]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6afc339a-7b41-44b9-853b-38381b951bc6",
             input: "root = [1,2,null,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f1a707e1-d66a-4de6-92c0-51b8a1144dfa",
             input: "root = [1,2,3,4,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "d01f6420-bd83-4c47-b43e-cfab9344ef21",
             input: "root = [1,2,3,4,5,null,6]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "c49dec95-fd41-4df7-9d56-a27be2120881",
             input: "root = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e81c5fbd-def4-449e-bb4d-341329e719c6",
             input: "root = [1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "78bd7aca-bd97-4624-b021-3b14d6aedc93",
             input: "root = [1,1,null]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1d3b869e-702c-4889-9a8f-fe00d6920479",
             input: "root = [1,1,1,1,1,null,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b6cd7501-4314-4a80-90ac-d3ecefe73ecd",
             input: "root = [1,null,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f7e548d8-e5ae-4e8b-8da1-980ccb073a63",
             input: "root = [1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a449ed59-aa22-48c0-be19-21e1afef0733",
             input: "root = [1,null,2,null,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b2fe0ab4-bb24-4495-87c6-6d45fa42e723",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "27753927-9f10-4747-8029-73f692310c37",
             input: "root = [1,2,3,4,null,5]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "df89de29-a400-4ac6-8e18-df496563b058",
             input: "root = [1,2,3,null,4,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5580607c-4f37-47c0-a196-c54407745603",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d1ce7aac-0957-4e9a-a416-66b18cb161eb",
             input: "root = [1,2,3,4,5,6,null]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d8032023-4b8b-49a8-913e-d09d7c1e7a97",
             input: "root = [1,2,3,4,5,null,6,7]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "ad959600-d3a9-4b1d-8b3d-171e27fc95b7",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "24", orderMatters: true),
            TestCaseData(id: "8a47bded-6179-4e4f-953e-3c4bef4dfe57",
             input: "root = [1,-2,3]",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "bc4983a8-a082-43b8-9311-a9d84c2167be",
             input: "root = [1,2,-3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6d0f464c-a25c-4f73-9d9e-1e046bc1d7f6",
             input: "root = [1,-2,-3]",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "be5188c7-97b8-4b31-a058-460c3cbcf660",
             input: "root = [1,2,3,4,-5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "d8d59ab9-9822-40d4-96c0-c4ff86c9a845",
             input: "root = [1,2,3,4,5,-6]",
             expected: "-2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sum-of-left-leaves"
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
            let result = solution.sumOfLeftLeaves(p_root)
            let computedOutput = OutputSerializer.serialize(result)

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
