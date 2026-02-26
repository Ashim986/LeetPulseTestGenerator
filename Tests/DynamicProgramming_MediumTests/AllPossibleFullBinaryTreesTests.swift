import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAllPossibleFullBinaryTrees {
    // Definition for a binary tree node.

    private class Solution {
        private var memo: [Int: [TreeNode?]] = [:]

        func allPossibleFBT(_ n: Int) -> [TreeNode?] {
            if n % 2 == 0 { return [] }

            if n == 1 {
                return [TreeNode(0)]
            }

            if let result = memo[n] {
                return result
            }

            var result: [TreeNode?] = []

            for x in stride(from: 1, to: n, by: 2) {
                let leftTrees = allPossibleFBT(x)
                let rightTrees = allPossibleFBT(n - 1 - x)

                for leftTree in leftTrees {
                    for rightTree in rightTrees {
                        result.append(TreeNode(0, leftTree, rightTree))
                    }
                }
            }

            memo[n] = result

            return result
        }
    }

    @Suite struct AllPossibleFullBinaryTreesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9d4ef4a8-005a-43b8-b50f-afb455eac83e",
             input: "n = 4",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "8b556be1-e411-4112-a0f5-2266f9d226ce",
             input: "n = 6",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "2e0051f2-8725-466b-ab4e-3159c2820c90",
             input: "n = 8",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "b87816b7-660d-47ad-a49a-f323ae606ccd",
             input: "n = 10",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "bff9ea8b-8666-40c1-92d9-9ff789786ba5",
             input: "n = 12",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "531ba108-b1d9-4e6f-9c21-cd72d6346a81",
             input: "n = 20",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "282447be-964b-486d-b72a-12ccfc1d8e71",
             input: "n = 30",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "a31c7318-7216-4d49-bac3-d1c69a66780c",
             input: "n = 7",
             expected: "[[0,0,0,null,null,0,0,null,null,0,0],[0,0,0,null,null,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,null,null,null,null,0,0],[0,0,0,0,0,null,null,"
                + "0,0]]", orderMatters: false),
            TestCaseData(id: "65549bfc-c9d3-4ff0-bd99-58b0ad51e1eb",
             input: "n = 3",
             expected: "[[0,0,0]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "all-possible-full-binary-trees"
            let topic = "dynamic-programming"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 20 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 20"
                )
                return
            }

            let solution = Solution()
            let result = solution.allPossibleFBT(p_n)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[TreeNode?]', using string equality
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
