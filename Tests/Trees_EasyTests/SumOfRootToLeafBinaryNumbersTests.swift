import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSumOfRootToLeafBinaryNumbers {
    private class Solution {
        func sumRootToLeaf(_ root: TreeNode?) -> Int {
           var sum = 0
           func dfs(_ node: TreeNode?, _ currentNumber: Int) {
              if node == nil {
                 return
              }

              let newNumber = (currentNumber << 1) | node.unsafelyUnwrapped.val
              if node?.left == nil && node?.right == nil {
                 sum += newNumber
              } else {
                 dfs(node?.left, newNumber)
                 dfs(node?.right, newNumber)
              }
           }
           dfs(root, 0)
           return sum
        }
    }

    @Suite struct SumOfRootToLeafBinaryNumbersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "718c7634-200d-4274-b0da-97295308d2da",
             input: "root = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8b66c3c6-883d-4821-8cbf-7cee11790212",
             input: "root = [0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1a57cb55-8dd3-4625-a4d9-b4103caab813",
             input: "root = [1,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f8346a2f-a450-44b3-ae22-8685a6fc7658",
             input: "root = [1,0,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "08f3fc7b-c6ed-4d3f-bf3a-6bf65f2d71f5",
             input: "root = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "92aa029d-b83a-4408-b166-20fb0bf2fb2b",
             input: "root = [0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "55f05dea-30c5-489d-84eb-a9938d84d6c7",
             input: "root = [0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "625e0aa8-a521-4cad-9436-b62d40ad71c9",
             input: "root = [0,1,0,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ff319716-4a33-40e1-ac2a-7e10946f3c2a",
             input: "root = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3cef57c0-0fd6-492e-99b9-5fe9b6ee877a",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e6579dd0-b501-48ef-a65c-4c2aeeae9b59",
             input: "root = [1,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "07b58c91-6931-4c84-908d-0de79cb0e662",
             input: "root = [1,1,0]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "40bdafc0-2c5f-4586-aa3c-3b56a1487b2c",
             input: "root = [1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "bfbcc3ed-9af8-4258-9a95-460c71a7a715",
             input: "root = [0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4dc1fa8e-6e0c-49c6-8386-93093dd948e5",
             input: "root = [1,0,0,0]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "a9cab4ed-496b-49ea-b376-003436bf8cfb",
             input: "root = [1,1,0,0]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "33a31e61-1f05-4ed2-b75b-8186629707b0",
             input: "root = [1,0,1,0]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "72acd266-92bd-4771-b75f-c8858f0317ab",
             input: "root = [1,1,1,0]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "db4d7d4b-2d9b-4e2d-9b10-edce6efd327c",
             input: "root = [1,0,1,1]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "d967c7fe-faef-4ca2-bfff-e0b03c43aa5c",
             input: "root = [1,1,0,1]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "fe567a2f-12f5-40a3-8c2d-7064b7ba44e7",
             input: "root = [1,0,0,1]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "0c620467-512f-4cd0-bb2b-5b1e5108f777",
             input: "root = [0,1,1,0]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "fadff29a-aca9-4a8f-8948-72dd560ace9d",
             input: "root = [0,0,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d61e186e-8135-4c7a-8a7d-5bd55d181d12",
             input: "root = [1,1,1,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d48bfa04-9e81-43b9-b781-86a2bb9dd93a",
             input: "root = [1,0,0,0,0]",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sum-of-root-to-leaf-binary-numbers"
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
            let result = solution.sumRootToLeaf(p_root)
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
