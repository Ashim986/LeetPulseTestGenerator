import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseStringIi {
    private class Solution {
        func reverseStr(_ s: String, _ k: Int) -> String {
            var result = String()
            let chars = Array(s)
            for i in stride(from: 0, to: chars.count, by: k) {
                let end = min(i+k, chars.count)
                let subArray = Array(chars[i..<end])
                let reversedSubArray = subArray.reversed()
                result.append(String(reversedSubArray))
                if end < chars.count {
                    result.append(String(chars[end..<min(end+k, chars.count)]))
                }
            }
            return result
        }
    }

    @Suite struct ReverseStringIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3a5c96ab-a8ea-4403-b1ae-f017b71a1ce9",
             input: "s = \"a\", k = 1",
             expected: "a", orderMatters: true),
            TestCaseData(id: "a58b7072-fe4c-4217-b0eb-928947ec37b9",
             input: "s = \"ab\", k = 1",
             expected: "ab", orderMatters: true),
            TestCaseData(id: "0aa508f1-3c8b-4e0e-ae76-3a340bd6c2a6",
             input: "s = \"abc\", k = 2",
             expected: "bac", orderMatters: true),
            TestCaseData(id: "169b8fdd-5e50-42a9-bfd4-3d81ddbdec4a",
             input: "s = \"abcd\", k = 3",
             expected: "cbad", orderMatters: true),
            TestCaseData(id: "61ec1c36-e028-474c-8e7e-dc127acc80c7",
             input: "s = \"abcde\", k = 4",
             expected: "dcbae", orderMatters: true),
            TestCaseData(id: "ea9f7caa-cf3b-460c-ac30-57c63f242f50",
             input: "s = \"abcdef\", k = 5",
             expected: "edcbaf", orderMatters: true),
            TestCaseData(id: "36232bb3-8c46-480d-8069-5c3e8f0858e5",
             input: "s = \"a\", k = 10",
             expected: "a", orderMatters: true),
            TestCaseData(id: "0d458e1c-36af-4d3e-9184-9293a99680ff",
             input: "s = \"aaaa\", k = 2",
             expected: "aaaa", orderMatters: true),
            TestCaseData(id: "42cd2487-888b-4eb4-b73b-2c866ef68ee9",
             input: "s = \"aaaa\", k = 4",
             expected: "aaaa", orderMatters: true),
            TestCaseData(id: "c2bceaa2-a360-4d34-b0d2-936b6bbfd198",
             input: "s = \"aaaa\", k = 1",
             expected: "aaaa", orderMatters: true),
            TestCaseData(id: "7f83cf6c-92e7-49c1-b535-c6b12dd3b0aa",
             input: "s = \"dcba\", k = 1",
             expected: "dcba", orderMatters: true),
            TestCaseData(id: "6be2304b-0606-451b-8bfe-72f274fef9d1",
             input: "s = \"abcdefghij\", k = 1",
             expected: "abcdefghij", orderMatters: true),
            TestCaseData(id: "484628bb-04b4-4f4b-ab5a-e9c351c1bd57",
             input: "s = \"abcdefgh\", k = 6",
             expected: "fedcbahg", orderMatters: true),
            TestCaseData(id: "40125021-b784-410d-a12f-08fa95969907",
             input: "s = \"abcdefghi\", k = 7",
             expected: "gfedcbaih", orderMatters: true),
            TestCaseData(id: "92ce8188-e5b9-419e-b6ed-b45054183740",
             input: "s = \"abcdefghij\", k = 8",
             expected: "hgfedcbaji", orderMatters: true),
            TestCaseData(id: "34ca85d5-7d1d-41ee-8298-1f59489f35d3",
             input: "s = \"abcdefghijk\", k = 9",
             expected: "ihgfedcbakj", orderMatters: true),
            TestCaseData(id: "8b3821d1-631b-4f46-b596-b94dad44ba08",
             input: "s = \"ab\", k = 10",
             expected: "ba", orderMatters: true),
            TestCaseData(id: "45552abb-2f06-43f5-94f0-e1531c3622d6",
             input: "s = \"abc\", k = 10",
             expected: "cba", orderMatters: true),
            TestCaseData(id: "0b7e6770-bbd4-41d7-b91f-fc09c1d5f535",
             input: "s = \"abcd\", k = 10",
             expected: "dcba", orderMatters: true),
            TestCaseData(id: "5e42528a-d5e2-482d-b19b-913e07e448cc",
             input: "s = \"abcde\", k = 10",
             expected: "edcba", orderMatters: true),
            TestCaseData(id: "13e39122-446a-4abd-a4e6-6824b47f18ca",
             input: "s = \"dcba\", k = 2",
             expected: "cdab", orderMatters: true),
            TestCaseData(id: "fb2e67cf-868e-4e2a-8a1b-ff5f88faea69",
             input: "s = \"dcba\", k = 4",
             expected: "abcd", orderMatters: true),
            TestCaseData(id: "f20f4957-fc04-4a85-b7dc-b837ed605b83",
             input: "s = \"abcdefghij\", k = 10",
             expected: "jihgfedcba", orderMatters: true),
            TestCaseData(id: "160f0a46-0e29-4a77-9765-139928eec68f",
             input: "s = \"abcdefghij\", k = 11",
             expected: "jihgfedcba", orderMatters: true),
            TestCaseData(id: "f4de6200-c9d3-4b21-8240-dc38099624a3",
             input: "s = \"abcdefghij\", k = 100",
             expected: "jihgfedcba", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
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
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.reverseStr(p_s, p_k)
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
