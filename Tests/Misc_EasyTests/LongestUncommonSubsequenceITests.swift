import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestUncommonSubsequenceI {
    private class Solution {
        func findLUSlength(_ a: String, _ b: String) -> Int {
          if a == b {
            return -1
          } else {
            return max(a.count, b.count)
          }
        }
    }

    @Suite struct LongestUncommonSubsequenceITests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2681a68f-e31f-4514-9124-a587d8fedd6a",
             input: "a = \"aba\", b = \"cdc\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "56b7f026-8a26-47c4-8a22-dcf571bc2662",
             input: "a = \"aaa\", b = \"bbb\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "cd57d8f6-2596-4012-bb33-783907017354",
             input: "a = \"aaa\", b = \"aaa\"",
             expected: "-1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-uncommon-subsequence-i"
            let topic = "misc"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            let p_a = InputParser.parseString(params[0])
            guard p_a.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: a string too long (\(p_a.count))"
                )
                return
            }
            let p_b = InputParser.parseString(params[1])
            guard p_b.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: b string too long (\(p_b.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_a.count >= 1 && p_a.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= a.length, b.length <= 100"
                )
                return
            }
            guard p_b.count >= 1 && p_b.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= a.length, b.length <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findLUSlength(p_a, p_b)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
