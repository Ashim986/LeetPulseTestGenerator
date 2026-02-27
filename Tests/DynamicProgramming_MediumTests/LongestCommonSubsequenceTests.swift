import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestCommonSubsequence {
    private class Solution {
        func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
            let s1 = Array(text1), s2 = Array(text2)
            let m = s1.count, n = s2.count
            var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)

            for i in 1...m {
                for j in 1...n {
                    if s1[i-1] == s2[j-1] {
                        dp[i][j] = dp[i-1][j-1] + 1
                    } else {
                        dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                    }
                }
            }

            return dp[m][n]
        }
    }

    @Suite struct LongestCommonSubsequenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6eff6904-bba5-44b4-adbe-322a791f11d7",
             input: "text1 = \"abc\", text2 = \"abc\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "658b01d3-3e74-42f9-9708-2a5cba819878",
             input: "text1 = \"abc\", text2 = \"def\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "622cca6a-f95e-4e3a-81e3-1e91c86c0c52",
             input: "text1 = \"\", text2 = \"abc\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "55eaf64e-453b-4997-ae54-6520408a70e9",
             input: "text1 = \"abc\", text2 = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "94669dcc-ce61-443f-b388-351fa5e89b8b",
             input: "text1 = \"a\", text2 = \"a\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "be409014-0716-4dda-9968-dbcf15cf3ff7",
             input: "text1 = \"a\", text2 = \"b\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "18468ff8-2357-41df-93d0-48bbb56142ff",
             input: "text1 = \"abcde\", text2 = \"abcde\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "439969c9-0390-4f80-8285-2ff6f831e9ab",
             input: "text1 = \"abcde\", text2 = \"edcba\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "14c1e37f-59ce-4c55-bdc7-bab4e10ae4ae",
             input: "text1 = \"aaaaa\", text2 = \"aaaaa\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "cbb9f13f-3195-4fc1-ac93-26bc846364c4",
             input: "text1 = \"aaaaa\", text2 = \"bbbbb\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8bc0181a-f9c4-4884-bfe4-28fe15b31ce4",
             input: "text1 = \"abcabc\", text2 = \"abcabc\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "5432034c-7c0a-42db-8ef9-dd8ddf974a9f",
             input: "text1 = \"abcabc\", text2 = \"defdef\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7976cb0a-1b6a-4187-9583-e753ec1b0427",
             input: "text1 = \"abcdefgh\", text2 = \"abcdxyz\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "1f210bb8-825c-4280-9f67-5726fdc2b63c",
             input: "text1 = \"abcdefgh\", text2 = \"xyzabcd\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "3fb62e1a-964a-4307-8a88-35ab1288619d",
             input: "text1 = \"abcdefgh\", text2 = \"abcdabcd\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "23211857-2709-4fda-a413-51853ad6270d",
             input: "text1 = \"abcdefgh\", text2 = \"abcdefghabcdefgh\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "33ef26ba-3766-4b35-b150-ddd7ddc87388",
             input: "text1 = \"abcdefghabcdefgh\", text2 = \"abcdefgh\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "c895db25-dd72-4a7e-a62a-8b7a2d213cda",
             input: "text1 = \"abcdefghabcdefgh\", text2 = \"abcdefghabcdefghabcdefgh\"",
             expected: "16", orderMatters: true),
            TestCaseData(id: "75b051c6-97a3-4972-a444-1642ceab46d2",
             input: "text1 = \"abcdefghabcdefghabcdefgh\", text2 = \"abcdefghabcdefgh\"",
             expected: "16", orderMatters: true),
            TestCaseData(id: "9541b0e9-6966-42cf-bbb5-d96d0087995c",
             input: "text1 = \"abcdefghijklmnopqrstuvwxyz\", text2 = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "26", orderMatters: true),
            TestCaseData(id: "62f91f87-bf4f-408c-912f-48d585a10d3e",
             input: "text1 = \"abcdefghijklmnopqrstuvwxyz\", text2 = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "26", orderMatters: true),
            TestCaseData(id: "63e62e72-202a-4cdc-8141-8b8e7b43c01c",
             input: "text1 = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\", text2 = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "26", orderMatters: true),
            TestCaseData(id: "4744ea4e-6ac5-466d-bebc-ba4342e35f27",
             input: "text1 = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\", text2 = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgh"
                + "ijklmnopqrstuvwxyz\"",
             expected: "52", orderMatters: true),
            TestCaseData(id: "e1da06a1-53d5-4d98-887b-243072c28bb7",
             input: "text1 = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\", text2 = \"abcdefghijklmnopqrstuvwxyzabcdefgh"
                + "ijklmnopqrstuvwxyz\"",
             expected: "52", orderMatters: true),
            TestCaseData(id: "1d0999cb-7ad4-4f61-ab75-72fb2da62b3c",
             input: "text1 = \"a\", text2 = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-common-subsequence"
            let topic = "dynamic-programming"
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

            let p_text1 = InputParser.parseString(params[0])
            guard p_text1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: text1 string too long (\(p_text1.count))"
                )
                return
            }
            let p_text2 = InputParser.parseString(params[1])
            guard p_text2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: text2 string too long (\(p_text2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_text1.count >= 1 && p_text1.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= text1.length, text2.length <= 1000"
                )
                return
            }
            guard p_text2.count >= 1 && p_text2.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= text1.length, text2.length <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.longestCommonSubsequence(p_text1, p_text2)
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
