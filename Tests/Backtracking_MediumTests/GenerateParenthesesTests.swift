import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGenerateParentheses {
    private class Solution {
        func generateParenthesis(_ n: Int) -> [String] {
            var result: [String] = []
            var current = ""

            func backtrack(_ open: Int, _ close: Int) {
                if current.count == 2 * n {
                    result.append(current)
                    return
                }
                if open < n {
                    current.append("(")
                    backtrack(open + 1, close)
                    current.removeLast()
                }
                if close < open {
                    current.append(")")
                    backtrack(open, close + 1)
                    current.removeLast()
                }
            }

            backtrack(0, 0)
            return result
        }
    }

    @Suite struct GenerateParenthesesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "39fff8b7-73c3-47af-a4ad-a9d424b87b55",
             input: "n = 3",
             expected: "[\"((()))\",\"(()())\",\"(())()\",\"()(())\",\"()()()\"]", orderMatters: true),
            TestCaseData(id: "7d4c7414-7225-4a47-8978-d538f011f9b1",
             input: "n = 1",
             expected: "[\"()\"]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "generate-parentheses"
            let topic = "backtracking"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 8 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 8"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [String]?
            let didCrash = withCrashGuard {
                resultHolder = solution.generateParenthesis(p_n)
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

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [String]"
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
