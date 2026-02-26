import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCountGoodNodesInBinaryTree {
    private class Solution {
        func goodNodes(_ root: TreeNode?) -> Int {
            func dfs(_ node: TreeNode?, _ currentMax: Int) -> Int {
                guard let node = node else { return 0 }
                let isGood = node.val >= currentMax ? 1 : 0
                let nextMax = max(currentMax, node.val)
                return isGood + dfs(node.left, nextMax) + dfs(node.right, nextMax)
            }
            guard let root = root else { return 0 }
            return dfs(root, root.val)
        }
    }

    @Suite struct CountGoodNodesInBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "900a21c1-6aae-4a3c-a5cb-2c229736e8cb",
             input: "root = [2,2,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "628eccba-9836-46fc-8e47-0cece374d66c",
             input: "root = [5,null,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f58b02a3-3575-49d9-ae24-434b2b492842",
             input: "root = [2,2,null,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "33878ad3-6d3a-4911-bec8-e1a60cde243c",
             input: "root = [10,10,10]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "25d113cd-65fc-4ca8-8131-b9d87ed5234f",
             input: "root = [5,5,5,null,null,5,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "d1229455-48ae-4071-8247-8524f8b32eaf",
             input: "root = [5,null,3,null,4]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "721637e9-8d00-4f93-b07f-f74a52dff52c",
             input: "root = [2,2,null,2,null,2]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "dc4a6222-6634-412d-95c5-eb4b1e1765bf",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3d53065b-1bd8-41e0-b671-ca6dec04835a",
             input: "root = [0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8823ccdc-a904-4e93-9d0c-aaedc520577b",
             input: "root = [5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "70f3c2b3-0e10-4c16-8abf-f29b574cadfe",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "6ac01fa3-44de-4c93-8be1-8ee56d439f3c",
             input: "root = [10,20,30,40,50,60,70,80,90]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "1e08444c-2683-4c7c-afcf-b2907a5296ff",
             input: "root = [5,5,5,5,5,5,5,5,5,5]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "51454ba3-909c-4a87-9323-44de45c9b253",
             input: "root = [1,2,2,2,2,2,2,2,2,2]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "9d08697c-e481-48a4-986d-74f5ff8fa379",
             input: "root = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a4badcef-75c5-4a08-b5e5-7bf5d1f99ade",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "3da07a5f-cd31-4d6b-84fd-b7d33dd5ea3e",
             input: "root = [5,3,8,null,null,4,7]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "989868e3-b5b1-4beb-af4b-99cd513a7105",
             input: "root = [10,3,15,null,null,4,7]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f1207696-6ddc-4de5-b246-17a4f198ba88",
             input: "root = [1,null,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "10988ff5-0754-47e4-99a7-c554cbbfa8f6",
             input: "root = [10,null,15]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d5b55aa0-477c-41cc-b231-84d5b8e72082",
             input: "root = [2,2,2,null,null,2,2]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "1c786dd7-d88d-4502-b521-66cc5f381bc0",
             input: "root = [1,null,2,null,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "fbb02f79-01d0-4c3c-8361-0b6ced19d085",
             input: "root = [10,10,10,null,null,10,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f7449177-f006-4503-8ac1-80eb294ab0d0",
             input: "root = [10,null,15,null,null,4]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f137b594-3380-434f-844d-8d2be5d7219a",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "count-good-nodes-in-binary-tree"
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
            let result = solution.goodNodes(p_root)
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
