import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumWindowSubstring {
    private class Solution {
        func minWindow(_ s: String, _ t: String) -> String {
            var need: [Character: Int] = [:]
            for c in t { need[c, default: 0] += 1 }
            var have: [Character: Int] = [:]
            var required = need.count, formed = 0
            var left = 0, minLen = Int.max, minStart = 0
            let chars = Array(s)
            for (right, c) in chars.enumerated() {
                have[c, default: 0] += 1
                if let n = need[c], have[c] == n { formed += 1 }
                while formed == required {
                    if right - left + 1 < minLen { minLen = right - left + 1; minStart = left }
                    let lc = chars[left]
                    have[lc, default: 0] -= 1
                    if let n = need[lc], have[lc].unsafelyUnwrapped < n { formed -= 1 }
                    left += 1
                }
            }
            return minLen == Int.max ? "" : String(chars[minStart..<minStart+minLen])
        }
    }

    @Suite struct MinimumWindowSubstringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3fdb18fb-e690-4ee9-b935-8b2f5833e917",
             input: "s=\"a\", t=\"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "7be2cc2b-0a27-4e93-9bd4-1c6f38fbaa58",
             input: "s=\"aa\", t=\"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "ba4b6983-e0ba-43d7-ad3d-a2a53265ff47",
             input: "s=\"ab\", t=\"b\"",
             expected: "b", orderMatters: true),
            TestCaseData(id: "c5b8a099-9aa5-449e-9f38-9b817e802d20",
             input: "s=\"abc\", t=\"bc\"",
             expected: "bc", orderMatters: true),
            TestCaseData(id: "89d09188-4f67-44ac-b35c-352b779d7610",
             input: "s=\"abcd\", t=\"cd\"",
             expected: "cd", orderMatters: true),
            TestCaseData(id: "f8d5afdb-efe6-4700-a574-4df706c3947e",
             input: "s=\"abcde\", t=\"cde\"",
             expected: "cde", orderMatters: true),
            TestCaseData(id: "b5a107fd-4197-4470-8ab7-a697789a6472",
             input: "s=\"abcdef\", t=\"def\"",
             expected: "def", orderMatters: true),
            TestCaseData(id: "d698b241-73c7-4108-8470-5df261aa39dd",
             input: "s=\"abcdefg\", t=\"efg\"",
             expected: "efg", orderMatters: true),
            TestCaseData(id: "be8b48e1-4d3c-4b5f-ac18-3611ca732e58",
             input: "s=\"abcdefgh\", t=\"fgh\"",
             expected: "fgh", orderMatters: true),
            TestCaseData(id: "9cc38454-7b89-41a8-b075-85a45245cda6",
             input: "s=\"abcdefghi\", t=\"ghi\"",
             expected: "ghi", orderMatters: true),
            TestCaseData(id: "4486768b-a452-4838-9814-4c0b27f5a93d",
             input: "s=\"abcdefghij\", t=\"hij\"",
             expected: "hij", orderMatters: true),
            TestCaseData(id: "64570357-7e44-4acb-a3ff-afa3e8218793",
             input: "s=\"aaa\", t=\"aa\"",
             expected: "aa", orderMatters: true),
            TestCaseData(id: "f106beeb-f248-4d99-86ab-aac8f28c0dc6",
             input: "s=\"aaaa\", t=\"aaa\"",
             expected: "aaa", orderMatters: true),
            TestCaseData(id: "3ee3cbf2-1a99-4e62-81a7-ff987a6bc611",
             input: "s=\"aaaaa\", t=\"aaaa\"",
             expected: "aaaa", orderMatters: true),
            TestCaseData(id: "3cc4128b-4b51-4b3b-9a7f-6b705e2deeda",
             input: "s=\"ababab\", t=\"abab\"",
             expected: "abab", orderMatters: true),
            TestCaseData(id: "a6267722-09a4-40c8-85a6-2ccf7ad41de5",
             input: "s=\"abababa\", t=\"ababa\"",
             expected: "ababa", orderMatters: true),
            TestCaseData(id: "b09e56db-27d6-4ca0-984a-a0e7d5e2a486",
             input: "s=\"abababab\", t=\"ababab\"",
             expected: "ababab", orderMatters: true),
            TestCaseData(id: "725059e8-fe65-407d-bd59-0ef1ba976ffa",
             input: "s=\"abcabcabc\", t=\"abcabc\"",
             expected: "abcabc", orderMatters: true),
            TestCaseData(id: "ddd7896a-0437-4785-8b8e-1144d74a6caf",
             input: "s=\"abcabcabcd\", t=\"abcabcd\"",
             expected: "abcabcd", orderMatters: true),
            TestCaseData(id: "0f0b104b-2a0e-4895-887a-8e6266ffbc0a",
             input: "s=\"abcdabcdabcd\", t=\"abcdabcd\"",
             expected: "abcdabcd", orderMatters: true),
            TestCaseData(id: "68d17c86-ef0f-4fab-afdb-d8af74c72352",
             input: "s=\"abcdeabcde\", t=\"abcde\"",
             expected: "abcde", orderMatters: true),
            TestCaseData(id: "0213eef0-5b74-4fb9-a419-77a098c541d0",
             input: "s=\"abcdefabcdef\", t=\"abcdef\"",
             expected: "abcdef", orderMatters: true),
            TestCaseData(id: "eb4d3af9-f703-4307-b061-fd34f7c172c7",
             input: "s=\"abcdefghabcdefgh\", t=\"abcdefgh\"",
             expected: "abcdefgh", orderMatters: true),
            TestCaseData(id: "2f783151-7a6e-475c-b1dd-8770cd520b01",
             input: "s=\"abcdefghijabcdefghij\", t=\"abcdefghij\"",
             expected: "abcdefghij", orderMatters: true),
            TestCaseData(id: "a9ce62df-4c34-4035-9e45-42c3dacf2fdc",
             input: "s=\"abcdefghijklmnopqrstuvwxyz\", t=\"abcdefghijklmnopqrstuvwxyz\"",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-window-substring"
            let topic = "sliding-window"
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

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }
            let p_t = InputParser.parseString(params[1])
            guard p_t.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: t string too long (\(p_t.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 105"
                )
                return
            }
            guard p_t.count >= 1 && p_t.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.minWindow(p_s, p_t)
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

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
