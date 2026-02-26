import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSumRootToLeafNumbers {
    private class Solution {
        func sumNumbers(_ root: TreeNode?) -> Int {
            var totalSum = 0
            var stack = [(root, 0)]
            while !stack.isEmpty {
                let (node, currentNumber) = stack.removeLast()
                if node?.left == nil && node?.right == nil {
                    totalSum += currentNumber * 10 + (node?.val ?? 0)
                } else {
                    if let right = node?.right {
                        stack.append((right, currentNumber * 10 + (node?.val ?? 0)))
                    }
                    if let left = node?.left {
                        stack.append((left, currentNumber * 10 + (node?.val ?? 0)))
                    }
                }
            }
            return totalSum
        }
    }

    @Suite struct SumRootToLeafNumbersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bfe25c78-24bf-4499-a326-51b9e25d3257",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fcad7baf-ce91-478e-b878-9a52606e7ccd",
             input: "root = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7c1b97e5-f0c5-459b-80a6-584d2d437708",
             input: "root = [1,null,2]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "fd302e1e-9b38-40a6-8a1b-298ccecf1bbe",
             input: "root = [1,2]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "29e7431c-a619-4dae-95d9-be555854ff51",
             input: "root = [0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "57ccae74-8bb1-429b-aba7-3a9009af9e53",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "522", orderMatters: true),
            TestCaseData(id: "f877af4b-0845-43cb-8500-c86ad219b569",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "68457", orderMatters: true),
            TestCaseData(id: "3c288887-ddaa-4e36-958c-7e274ed9b8e4",
             input: "root = [-1,2,3]",
             expected: "-15", orderMatters: true),
            TestCaseData(id: "4f8717c9-c4a3-497c-9446-bb4f71ec8444",
             input: "root = [1,-2,3]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "cf9124d7-74e3-4797-9d6b-75e4b0e2ae99",
             input: "root = [1,2,-3]",
             expected: "19", orderMatters: true),
            TestCaseData(id: "71f00a99-3f3e-4ef7-aaf9-183b1e5b04fc",
             input: "root = [1,2,3,4,4,4,4]",
             expected: "516", orderMatters: true),
            TestCaseData(id: "322e125b-37ee-42b0-87bc-94b5c6b1187e",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "444", orderMatters: true),
            TestCaseData(id: "6a72fe4d-ef41-4c42-8845-00c7d43b682a",
             input: "root = [5,4,5,4,4,4]",
             expected: "1642", orderMatters: true),
            TestCaseData(id: "a5afb742-2700-405f-bd90-19778b2ec82b",
             input: "root = [1,0,1]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "9f484dc5-afea-43aa-a7b0-2a58fa1e4f43",
             input: "root = [1,1,1,1,1,1]",
             expected: "333", orderMatters: true),
            TestCaseData(id: "60526cf3-0077-4d45-a087-9dd13d906aad",
             input: "root = [2,2,2,2,2,2]",
             expected: "666", orderMatters: true),
            TestCaseData(id: "a2edf498-64bf-41c9-836b-ff8d75e682dd",
             input: "root = [3,3,3,3,3,3]",
             expected: "999", orderMatters: true),
            TestCaseData(id: "b9bdc2d3-d672-45e1-ab30-56cfcbb003ee",
             input: "root = [1,2,3,4,5,6]",
             expected: "385", orderMatters: true),
            TestCaseData(id: "ecb5e675-60d1-4201-ab4f-a560090be267",
             input: "root = [1,2,3,4,5,6,7,8]",
             expected: "1646", orderMatters: true),
            TestCaseData(id: "a8fc6df9-544d-4a5a-b64d-2db4d42f56ac",
             input: "root = [1,2,3,4,5,6,7,8,9]",
             expected: "2895", orderMatters: true),
            TestCaseData(id: "03e09348-4e8c-4141-acd5-9b9eda8a5eb4",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "4030", orderMatters: true),
            TestCaseData(id: "bedbe015-6abc-4026-8e5d-d88047169869",
             input: "root = [0,1,2,3,4,5,6,7,8,9]",
             expected: "475", orderMatters: true),
            TestCaseData(id: "d0ad00d8-7001-48df-8715-8d7a510ba3a2",
             input: "root = [10,2,3,4,5,6,7,8,9]",
             expected: "32595", orderMatters: true),
            TestCaseData(id: "5b4e8dc9-c72a-424b-8841-29e97f22596a",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11]",
             expected: "5281", orderMatters: true),
            TestCaseData(id: "85b3af67-d3e7-41bb-aebf-98e85fc71762",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "18767", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sum-root-to-leaf-numbers"
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
            let result = solution.sumNumbers(p_root)
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
