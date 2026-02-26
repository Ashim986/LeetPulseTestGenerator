import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestPalindromicSubstring {
    private class Solution {
        func longestPalindrome(_ s: String) -> String {
            let chars = Array(s)
            var start = 0, maxLen = 0

            func expand(_ left: Int, _ right: Int) -> Int {
                var l = left, r = right
                while l >= 0 && r < chars.count && chars[l] == chars[r] {
                    l -= 1; r += 1
                }
                return r - l - 1
            }

            for i in 0..<chars.count {
                let len1 = expand(i, i)      // Odd length
                let len2 = expand(i, i + 1)  // Even length
                let len = max(len1, len2)
                if len > maxLen {
                    maxLen = len
                    start = i - (len - 1) / 2
                }
            }

            return String(chars[start..<start + maxLen])
        }
    }

    @Suite struct LongestPalindromicSubstringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5AABB31E-276A-4674-86E2-751802A251E8",
             input: "\"cbbd\"",
             expected: "bb", orderMatters: true),
            TestCaseData(id: "4BB45F82-ACA7-4FAE-9A6F-5C4943D659FA",
             input: "\"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "42A0FC0F-4A91-44C2-A60F-EEB371399201",
             input: "\"ac\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "5F99FCB5-1D6A-45D9-84DC-B26FB081FF9E",
             input: "\"aaaa\"",
             expected: "aaaa", orderMatters: true),
            TestCaseData(id: "10252F6D-8FE4-420C-982A-53E54B74B36C",
             input: "\"bananas\"",
             expected: "anana", orderMatters: true),
            TestCaseData(id: "B6C3C271-A7D9-40C8-B426-8C66BD49B1B6",
             input: "\"aacabdkacaa\"",
             expected: "aca", orderMatters: true),
            TestCaseData(id: "12672802-0B59-4E54-9C76-CB089141542D",
             input: "\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaa\"",
             expected: "\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                + "aaa\"", orderMatters: true),
            TestCaseData(id: "FF9AB78D-47F9-499C-8047-12150E9D35E0",
             input: "\"\"",
             expected: "\"\"", orderMatters: true),
            TestCaseData(id: "4ED9B464-1D1C-4ADD-BFCB-0DDFDF283AC5",
             input: "\"ccc\"",
             expected: "\"ccc\"", orderMatters: true),
            TestCaseData(id: "0139BB1F-C8B3-4533-9B87-F9C7730173A9",
             input: "a",
             expected: "a", orderMatters: true),
            TestCaseData(id: "63DEA760-3897-4140-9C8F-C03755260411",
             input: "bb",
             expected: "bb", orderMatters: true),
            TestCaseData(id: "16FEB283-DB8B-42D9-8AF8-7653E42D6329",
             input: "cbbd",
             expected: "bb", orderMatters: true),
            TestCaseData(id: "49EAA482-243A-4361-AB64-A8161511F5E1",
             input: "bananas",
             expected: "anana", orderMatters: true),
            TestCaseData(id: "9c950f36-cfb3-4c98-8df6-bf188c9df97b",
             input: "s = \"a\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "0cddf5d2-bcf4-4882-8826-9b0d0c57cfe4",
             input: "s = \"ac\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "2569e562-80d4-4772-ba0c-27268c507a37",
             input: "s = \"racecar\"",
             expected: "\"racecar\"", orderMatters: true),
            TestCaseData(id: "1f57ea95-556c-4c44-9da4-b35417b0f4a5",
             input: "s = \"\"",
             expected: "\"\"", orderMatters: true),
            TestCaseData(id: "1e735762-5590-4bbe-be2d-9ef46f3e60a2",
             input: "s = \"aa\"",
             expected: "\"aa\"", orderMatters: true),
            TestCaseData(id: "c649d7cc-73f5-477c-b9ff-69de77b8c228",
             input: "s = \"abba\"",
             expected: "\"abba\"", orderMatters: true),
            TestCaseData(id: "a9650511-bd97-4a72-80c9-a6e17a49b003",
             input: "s = \"abcba\"",
             expected: "\"abcba\"", orderMatters: true),
            TestCaseData(id: "a340f4f2-677d-4c3e-8089-461b694c4e6f",
             input: "s = \"abcdedcba\"",
             expected: "\"abcdedcba\"", orderMatters: true),
            TestCaseData(id: "5e848426-86cc-4026-afca-77288f1ad56c",
             input: "s = \"abccba\"",
             expected: "\"abccba\"", orderMatters: true),
            TestCaseData(id: "0cff3919-d484-47a4-a957-70d4f28e467c",
             input: "s = \"aaaaa\"",
             expected: "\"aaaaa\"", orderMatters: true),
            TestCaseData(id: "1e997475-ae57-4262-859f-25759a0e9bca",
             input: "s = \"ab\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "2752b1c7-ab47-4598-9f55-f76c5d5b1728",
             input: "s = \"abcddcba\"",
             expected: "\"abcddcba\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-palindromic-substring"
            let topic = "two-pointers"
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
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.longestPalindrome(p_s)
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
