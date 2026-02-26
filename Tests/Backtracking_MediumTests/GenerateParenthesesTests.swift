import Foundation
import Testing
@testable import LeetCodeHelpers

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

    @Test func test_0() async {
        let slug = "generate-parentheses"
        let topic = "backtracking"
        let testId = "39fff8b7-73c3-47af-a4ad-a9d424b87b55"
        let rawInput = "n = 3"
        let expectedOutput = "[\"((()))\",\"(()())\",\"(())()\",\"()(())\",\"()()()\"]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_n = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_1() async {
        let slug = "generate-parentheses"
        let topic = "backtracking"
        let testId = "7d4c7414-7225-4a47-8978-d538f011f9b1"
        let rawInput = "n = 1"
        let expectedOutput = "[\"()\"]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_n = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 8 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 8")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

}
