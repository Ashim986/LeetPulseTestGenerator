import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRemoveDuplicateLetters {
    private class Solution {
        func removeDuplicateLetters(_ s: String) -> String {
            let s = Array(s)
            var lastOccurrence: [Character: Int] = [:]
            var stack: [Character] = []
            var seen: [Character: Bool] = [:]
            for (index, char) in s.enumerated() {
                lastOccurrence[char] = index
            }
            for (index, char) in s.enumerated() {
                if seen[char] != nil {
                    continue
                }
                while !stack.isEmpty, let top = stack.last, top > char, lastOccurrence[top].unsafelyUnwrapped > index {
                    seen[top] = nil
                    stack.removeLast()
                }
                seen[char] = true
                stack.append(char)
            }
            return String(stack)
        }
    }

    @Suite struct RemoveDuplicateLettersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "631d9586-5b60-4fce-a270-b025eeba7f8b",
             input: "s = \"abc\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "2cab52d2-fccb-402c-8613-bf64973390cc",
             input: "s = \"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "abc4219c-f948-4836-a921-2a0a773c5a78",
             input: "s = \"abcde\"",
             expected: "abcde", orderMatters: true),
            TestCaseData(id: "2a0c6c23-6c2f-44cb-86e9-f780be41801f",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "d7d714da-4869-4b86-98c5-0c7497b08a60",
             input: "s = \"dcba\"",
             expected: "abcd", orderMatters: true),
            TestCaseData(id: "5120d556-d12a-4f5f-b25d-19a99094ab86",
             input: "s = \"baac\"",
             expected: "bc", orderMatters: true),
            TestCaseData(id: "2375c862-80ed-424e-82cb-cba5f63ac7bc",
             input: "s = \"abac\"",
             expected: "bc", orderMatters: true),
            TestCaseData(id: "542c3435-23e1-417f-ad08-5836bd8a3b1f",
             input: "s = \"edcba\"",
             expected: "abcde", orderMatters: true),
            TestCaseData(id: "e9d4dd06-d7d3-48bf-8a16-37d0fda0a859",
             input: "s = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "61617064-e2f2-4800-b242-84e23c2cd79c",
             input: "s = \"ababababababababab\"",
             expected: "b", orderMatters: true),
            TestCaseData(id: "1e649d4f-2cbf-4134-9e29-0245b5fd248a",
             input: "s = \"bcabc\"",
             expected: "\"abc\"", orderMatters: true),
            TestCaseData(id: "f6103b5e-ba69-4c15-bc2f-073d1cf7fe6f",
             input: "s = \"cbacdcbc\"",
             expected: "\"acdb\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "remove-duplicate-letters"
            let topic = "stack"
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

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.removeDuplicateLetters(p_s)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
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
