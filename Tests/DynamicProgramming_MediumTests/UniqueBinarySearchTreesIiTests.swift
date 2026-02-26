import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUniqueBinarySearchTreesIi {
    private class Solution {
        func generateTrees(_ n: Int) -> [TreeNode?] {
            var memo: [[TreeNode?]] = Array(repeating: [], count: n + 1)
            return generateTreesHelper(1, n, &memo)
        }

        private func generateTreesHelper(_ start: Int, _ end: Int, _ memo: inout [[TreeNode?]]) -> [TreeNode?] {
            if start > end {
                return [nil]
            }
            if !memo[start].isEmpty {
                return memo[start]
            }
            var result: [TreeNode?] = []
            for i in start...end {
                let leftSubtrees = generateTreesHelper(start, i - 1, &memo)
                let rightSubtrees = generateTreesHelper(i + 1, end, &memo)
                for leftSubtree in leftSubtrees {
                    for rightSubtree in rightSubtrees {
                        let root = TreeNode(i)
                        root.left = leftSubtree
                        root.right = rightSubtree
                        result.append(root)
                    }
                }
            }
            memo[start] = result
            return result
        }
    }

    @Suite struct UniqueBinarySearchTreesIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ef6c51f2-415b-417f-b186-c3366f4d0980",
             input: "n = 11",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "ac5559f9-a4b1-40b3-8a4f-5ce9984ce821",
             input: "n = 12",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "44fb89e3-4243-4534-ad5e-9d037a1c5467",
             input: "n = 13",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "42cdc70d-58e1-454b-a862-f24da3994b54",
             input: "n = 14",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "cd30683c-8877-4320-a505-413e5a8b0a9a",
             input: "n = -2",
             expected: "[null]", orderMatters: false),
            TestCaseData(id: "51592693-2b01-4e9f-bf30-a315885c064c",
             input: "n = -3",
             expected: "[null]", orderMatters: false),
            TestCaseData(id: "1957a999-7468-49c1-bb00-d0c659116b22",
             input: "n = -4",
             expected: "[null]", orderMatters: false),
            TestCaseData(id: "706e2033-5602-4ab1-95ca-2772c4a70cf9",
             input: "n = -5",
             expected: "[null]", orderMatters: false),
            TestCaseData(id: "8f3d7391-ed70-4734-b55e-d6b386eda597",
             input: "root = [1,2,3]",
             expected: "[[1,null,2,null,null,null,3],[1,null,3,2,null],[2,1,3],[3,1,null,null,2],[3,2,null,1,null]]", orderMatters: false),
            TestCaseData(id: "15ec4661-b087-4f20-ab67-a9cc729a7bc7",
             input: "head = [1,2,3]",
             expected: "[[1,null,2,null,null,null,3],[1,null,3,2,null],[2,1,3],[3,1,null,null,2],[3,2,null,1,null]]", orderMatters: false),
            TestCaseData(id: "25b8cc1e-19f5-46d4-8055-febf31a9d3fb",
             input: "n = 15",
             expected: "<output too large to display>", orderMatters: false),
            TestCaseData(id: "6caa0b81-d11d-4e6b-91dd-8e279a0e5609",
             input: "n = 3",
             expected: "[[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]", orderMatters: false),
            TestCaseData(id: "49a91251-ac29-48d2-9d57-71d09570d8e9",
             input: "n = 1",
             expected: "[[1]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "unique-binary-search-trees-ii"
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
            guard p_n >= 1 && p_n <= 8 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 8"
                )
                return
            }

            let solution = Solution()
            let result = solution.generateTrees(p_n)
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
