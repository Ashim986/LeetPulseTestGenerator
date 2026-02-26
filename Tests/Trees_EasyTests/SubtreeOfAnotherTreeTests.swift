import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSubtreeOfAnotherTree {
    private class Solution {
        func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
            let rootStr = serialize(root)
            let subStr = serialize(subRoot)
            return rootStr.contains(subStr)
        }

        private func serialize(_ node: TreeNode?) -> String {
            guard let node = node else { return "#" }
            return "(\(node.val)),\(serialize(node.left)),\(serialize(node.right))"
        }
    }

    @Suite struct SubtreeOfAnotherTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "09de7ef5-0bf0-4ef2-8998-02a88fa58ccc",
             input: "root = [1,null,2], subRoot = [1,null,2]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "556b9b5c-81c3-4dee-aa23-a184196c7e19",
             input: "root = [1,2,3,4,5,6,7], subRoot = [7]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "0b140d85-5cd9-4b32-ac29-580a830d3ad3",
             input: "root = [1,2,3,4,5,6,7], subRoot = [8]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "a1cb64c6-8662-44fa-a947-3705a1e3c08e",
             input: "root = [1,2,3,4,5,6,7], subRoot = [1,2,3,4,5,6,7]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "aa7be89e-de25-4b94-9cbd-b091fa2b0cb9",
             input: "root = [1,2,3,4,5,6,7], subRoot = [1,3,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "4a0699b1-0c1d-4fb0-a261-2486ac1b65a7",
             input: "root = [1,2,3,4,5,6,7], subRoot = [1,2,3,4,5,6,8]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "8b52c53a-6518-4317-9435-94c5081e72f4",
             input: "root = [1,2,3,4,5,6,7], subRoot = [1,2,3,4,5,6,7,8]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "7e42ca96-b1bb-4d03-9a33-a1edf6b5f556",
             input: "root = [1,2,3,4,5,6,7], subRoot = []",
             expected: "False", orderMatters: true),
            TestCaseData(id: "c9108439-f4f9-49ee-9fa8-ebc74eb8b414",
             input: "root = [], subRoot = [1,2,3]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "36345e22-6c06-47b5-99d6-6a7f03235f34",
             input: "root = [1,2,3], subRoot = []",
             expected: "False", orderMatters: true),
            TestCaseData(id: "2c55a950-8fbf-4ef5-b4a7-c041d0b1d031",
             input: "root = [], subRoot = []",
             expected: "False", orderMatters: true),
            TestCaseData(id: "a3e75546-1991-4be8-ac9b-2532a2d6157b",
             input: "root = [1], subRoot = [1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "73dc8ba7-34c6-42fb-945e-afc2e2fb7f36",
             input: "root = [1], subRoot = [2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "55100596-a8a9-41ab-b470-5ba30bd579d5",
             input: "root = [1,2,3,4,5,6,7,8,9,10], subRoot = [1,2,3,4,5,6,7,8,9,10]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "051c2ca3-3b48-4d4f-b9f4-5cc944e6c996",
             input: "root = [1,2,3,4,5,6,7,8,9,10], subRoot = [1,2,3,4,5,6,7,8,9,11]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "23c01dd7-d014-4adc-9734-039fd3ad2868",
             input: "root = [1,2,3,4,5,6,7,8,9,10], subRoot = [1,3,2,4,5,6,7,8,9,10]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "35dbade8-877e-4daa-82a9-0783112770db",
             input: "root = [1,2,3,4,5,6,7,8,9,10], subRoot = [1,2,3,4,5,6,7,8,9,10,11]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "81d00714-0a24-4f6b-9e89-fbc13b1038bb",
             input: "root = [1,2,3,4,5,6,7,8,9,10], subRoot = [-1,-2,-3,-4,-5]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "cd4a39e6-c1b1-41c0-b792-cff0cf9c5d2e",
             input: "root = [1,2,3,4,5,6,7,8,9,10], subRoot = [1,1,1,1,1]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "38828a29-0d95-4e5f-834e-571013a9b063",
             input: "root = [1,1,1,1,1,1,1,1,1,1], subRoot = [1,1,1,1,1]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "3bf1b207-be51-4712-9222-f2b6f93ea149",
             input: "root = [1,1,1,1,1,1,1,1,1,1], subRoot = [2,2,2,2,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "13230708-80a2-4dfa-90b9-5156a930e183",
             input: "root = [1,1,1,1,1,1,1,1,1,1], subRoot = [1,1,1,1,1,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "ff3ee422-6b1f-4252-a72c-4447672e4382",
             input: "root = [1,1,1,1,1,1,1,1,1,1], subRoot = [1,2,3,4,5]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "6e8e7bff-bc8f-4676-9872-b5d01cbdc701",
             input: "root = [1,1,1,1,1,1,1,1,1,1], subRoot = [1,1,1,1,1,1,1,1,1,1,1]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "504e7186-0cd2-455e-870d-1976259f42bc",
             input: "root = [1,1,1,1,1,1,1,1,1,1], subRoot = [1,1,1,1,1,1,1,1,1]",
             expected: "True", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "subtree-of-another-tree"
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
            guard let p_subRoot = InputParser.parseNullableIntArray(params[1]).map({ buildTree($0) }) else {
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
            let result = solution.isSubtree(p_root, p_subRoot)
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
