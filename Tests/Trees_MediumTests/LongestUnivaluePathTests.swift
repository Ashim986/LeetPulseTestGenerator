import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestUnivaluePath {
    private class Solution {
        func longestUnivaluePath(_ root: TreeNode?) -> Int {
            var maxLength = 0
            func dfs(_ node: TreeNode?) -> (Int, Int) {
                guard let node = node else { return (0, 0) }
                let (leftLength, leftPath) = dfs(node.left)
                let (rightLength, rightPath) = dfs(node.right)
                var left = 0
                var right = 0
                if node.left?.val == node.val {
                    left = leftPath + 1
                }
                if node.right?.val == node.val {
                    right = rightPath + 1
                }
                maxLength = max(maxLength, left + right)
                return (max(left, right), max(left, right))
            }
            dfs(root)
            return maxLength
        }
    }

    @Suite struct LongestUnivaluePathTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "92908305-0f9c-4998-a712-89765dbb0602",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "934d20ab-1f7d-453e-84bb-e86050182b3e",
             input: "root = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "78c6bdfe-7204-4175-82aa-40aa52f70ad7",
             input: "root = [1,2,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b156e6bb-bc5c-4262-b3df-d15faab2c80d",
             input: "root = [1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "fcc8888b-cd2e-41c1-91cc-d0cc29e693c1",
             input: "root = [1,2,2,3,3,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5779e29e-8bb8-4b5e-87c1-f59d63e0d6b5",
             input: "root = [1,2,3,4,4,4,4]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "033b71c3-7a83-460a-a55a-78830ee8a9a1",
             input: "root = [1,2,3,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0e25e5e2-ad20-4879-a316-8c71b73ce217",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "abc804b8-19c8-4295-ac5f-1c24bd26c260",
             input: "root = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "656a9143-d479-47d3-ad9f-ce514b53e79a",
             input: "root = [1,-2,-3,-4,-5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a57bf51a-8d99-4a9e-aade-8a6ba7df6831",
             input: "root = [1,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7358c3a0-f2aa-43d2-8580-1bc36c953a0f",
             input: "root = [1,null,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "179fc13f-82aa-49ea-b1a2-19bcc348c5d8",
             input: "root = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dd50b520-b194-41b0-b742-92f66c3064d6",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "1aafbf2b-0f73-4701-b52f-a229e6fa6b3e",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "67f96577-a6f7-420f-bcda-3a6c42ba95fa",
             input: "root = [1,1,1,1,1,1,1,1,1,1]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "6829eb4c-52ca-47fc-98f3-9fecf6f7d823",
             input: "root = [-1,-1,-1,-1,-1,-1,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "27189abc-3ef8-4e38-912d-5deebbe6a0dc",
             input: "root = [5,5,5,5,5,5,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "abe1dd56-1444-40f0-87f3-445c2d204c57",
             input: "root = [1,1,1,2,2,2]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "30f74c7c-862f-4230-8c3b-c65832f06c99",
             input: "root = [1,1,1,1,2,2,2]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "288a467a-59f6-4b19-b193-0822e2dac061",
             input: "root = [1,1,1,2,2,2,2]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "57a4d579-871a-4129-94ab-a63c18182ded",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5406e389-223e-484a-8218-70b5480aa1be",
             input: "root = [1,1,1,1,1,1,1,1,1,1,1]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "2e14d3a6-d645-452c-b78d-eea88a19eef3",
             input: "root = [5,4,5,1,1,5,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "8c72f821-24b0-48b2-bc1e-2ae9827a088a",
             input: "root = [1,4,5,4,4,5,5]",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-univalue-path"
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
            let result = solution.longestUnivaluePath(p_root)
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
