import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestPalindromicSubsequence {
    private class Solution {
        func longestPalindromeSubseq(_ s: String) -> Int {
          let n = s.count
          var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

          for i in stride(from: n-1, through: 0, by: -1) {
            dp[i][i] = 1
            for j in i+1..<n {
              if s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: j)] {
                dp[i][j] = dp[i+1][j-1] + 2
              } else {
                dp[i][j] = max(dp[i+1][j], dp[i][j-1])
              }
            }
          }
          return dp[0][n-1]
        }
    }

    @Suite struct LongestPalindromicSubsequenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3d242cea-bb75-49da-ba45-2ae36a287bc4",
             input: "s = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9d4b52f5-4893-4ff0-8342-de8333016462",
             input: "s = \"a\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b87ff542-2a55-405e-846b-058fd10b6582",
             input: "s = \"ab\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "88ee8814-72df-4c0a-ab13-cdccdf582b1c",
             input: "s = \"aa\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "775f82cb-78f8-4b30-ae3e-141552c8d0bb",
             input: "s = \"aba\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "77a7a26f-640f-476e-8a3b-2d423d027d4d",
             input: "s = \"abba\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "92148cf9-ed5c-43e0-82f6-6cbdc8baed95",
             input: "s = \"abcba\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c9ae58ef-edb2-4a7b-ab3b-04aa79998399",
             input: "s = \"aaaaa\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a3612db1-1d86-4d4b-a8f4-62c92fb6687d",
             input: "s = \"abcde\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "295e8716-dd83-4366-9f9b-3ce099a312d5",
             input: "s = \"edcba\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cf6f14d1-9182-4ba4-b17d-861c86de2203",
             input: "s = \"aabbcc\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2c7adf48-76a7-46c1-b6e1-fec0297b6a0b",
             input: "s = \"aaaaaaaa\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "31b16870-bdc9-4d13-bc4a-29d5382d9a7c",
             input: "s = \"abcdefgh\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "62861e53-c768-47d5-8b21-72001aee925f",
             input: "s = \"hgfedcba\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "de26c208-2fbb-4d05-bf69-831eff3168b1",
             input: "s = \"aaaaaaab\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "651338cb-8f5b-4de6-a726-c1b5786d9e35",
             input: "s = \"baaaaaaa\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "3f97cf0b-4ec8-4406-bc35-b83318759555",
             input: "s = \"aaaaaaaaaa\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "0093afa2-be56-4fb8-b1fa-7b56db53dcf7",
             input: "s = \"abcdefghi\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "eda8f11e-c1f9-4c07-b29d-72e4898194a8",
             input: "s = \"ihgfedcba\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "86a5975b-9a1a-41a6-b8db-e63917964e12",
             input: "s = \"aaaaaaaaaaaa\"",
             expected: "12", orderMatters: true),
            TestCaseData(id: "e5339eb0-821c-4a2d-bbb2-0205bb357991",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9c59aed1-a0e4-4c1e-b340-ac89b14b0154",
             input: "s = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5d3c3878-f797-4c5b-baac-11646d9f8bf7",
             input: "s = \"aaaaaaaaaaaaaaaa\"",
             expected: "16", orderMatters: true),
            TestCaseData(id: "181b04cd-a9fc-41f6-8cdc-0aabd7a87e05",
             input: "s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ab811c82-7924-4718-8c42-a78acde50e94",
             input: "s = \"ababab\"",
             expected: "5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-palindromic-subsequence"
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
            let result = solution.longestPalindromeSubseq(p_s)
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
