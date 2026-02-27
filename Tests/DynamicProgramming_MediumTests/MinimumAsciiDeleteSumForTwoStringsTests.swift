import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumAsciiDeleteSumForTwoStrings {
    private class Solution {
        func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
            let arr1 = Array(s1.utf8)
            let arr2 = Array(s2.utf8)
            let m = arr1.count
            let n = arr2.count
            var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
            for i in 1...m {
                dp[i][0] = dp[i - 1][0] + Int(arr1[i - 1])
            }
            for j in 1...n {
                dp[0][j] = dp[0][j - 1] + Int(arr2[j - 1])
            }
            for i in 1...m {
                for j in 1...n {
                    if arr1[i - 1] == arr2[j - 1] {
                        dp[i][j] = dp[i - 1][j - 1]
                    }
                    else {
                        dp[i][j] = min(dp[i - 1][j] + Int(arr1[i - 1]), dp[i][j - 1] + Int(arr2[j - 1]))
                    }
                }
            }
            return dp[m][n]
        }
    }

    @Suite struct MinimumAsciiDeleteSumForTwoStringsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b7e42a51-8663-4580-90f4-24bfa64a8efb",
             input: "s1 = \"abc\", s2 = \"abc\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "40a73c42-0026-4fd9-a243-b8b1cf36b830",
             input: "s1 = \"\", s2 = \"abc\"",
             expected: "294", orderMatters: true),
            TestCaseData(id: "00f82083-7896-4b55-a62e-6c196f022e25",
             input: "s1 = \"abc\", s2 = \"\"",
             expected: "294", orderMatters: true),
            TestCaseData(id: "5506d7f1-e2c6-4590-b1ab-830466b36149",
             input: "s1 = \"a\", s2 = \"b\"",
             expected: "195", orderMatters: true),
            TestCaseData(id: "4d69c54a-adb9-4d58-b989-3667ad850f2b",
             input: "s1 = \"aaaaa\", s2 = \"aaaaa\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "185c8f52-8edd-48af-b034-5a52da439400",
             input: "s1 = \"abcde\", s2 = \"abcde\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f43a6eb1-f4e1-4901-9162-e305d1515eb7",
             input: "s1 = \"abcdefghijklmnopqrstuvwxyz\", s2 = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1c81cad6-83ad-42d1-b040-c39122370f10",
             input: "s1 = \"abc\", s2 = \"ab\"",
             expected: "99", orderMatters: true),
            TestCaseData(id: "91959487-1e11-4938-ab69-2cff93f3eb50",
             input: "s1 = \"ab\", s2 = \"abc\"",
             expected: "99", orderMatters: true),
            TestCaseData(id: "be4f00b5-5816-48a2-9096-9d15c402d768",
             input: "s1 = \"\", s2 = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "935e55bb-9d85-418e-9d6f-84717df68582",
             input: "s1 = \"a\", s2 = \"\"",
             expected: "97", orderMatters: true),
            TestCaseData(id: "6a63103b-4e33-4d8b-8283-1de236bce00a",
             input: "s1 = \"\", s2 = \"a\"",
             expected: "97", orderMatters: true),
            TestCaseData(id: "e2786684-df6d-4b18-a426-cc2895b0a211",
             input: "s1 = \"ab\", s2 = \"ba\"",
             expected: "194", orderMatters: true),
            TestCaseData(id: "3b47dd01-bba4-46dd-92d3-d68dedd9722f",
             input: "s1 = \"abcde\", s2 = \"edcba\"",
             expected: "788", orderMatters: true),
            TestCaseData(id: "cf073aed-6fb6-4fcd-9a7d-ead4f3b7c638",
             input: "s1 = \"a\", s2 = \"aaaaa\"",
             expected: "388", orderMatters: true),
            TestCaseData(id: "d8bad7b1-db62-4073-8cd2-a7b2eedeead5",
             input: "s1 = \"aaaaa\", s2 = \"a\"",
             expected: "388", orderMatters: true),
            TestCaseData(id: "9ed47b25-bf3a-44ff-a304-b37f8c9fac06",
             input: "s1 = \"abc\", s2 = \"def\"",
             expected: "597", orderMatters: true),
            TestCaseData(id: "493eedab-ba2e-4f04-951c-86f8a8fa6fbb",
             input: "s1 = \"abcdefghijklmnopqrstuvwxyz\", s2 = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "5694", orderMatters: true),
            TestCaseData(id: "3c6e140a-4887-4d9d-99c9-2fed70d25aa1",
             input: "s1 = \"abcdefghijklmnopqrstuvwxyz\", s2 = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "2847", orderMatters: true),
            TestCaseData(id: "2559121d-362d-4045-8cb1-36411ded32f0",
             input: "s1 = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\", s2 = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "2847", orderMatters: true),
            TestCaseData(id: "5a4e89ae-eb81-4451-a5cc-a04730306773",
             input: "s1 = \"a\", s2 = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "2947", orderMatters: true),
            TestCaseData(id: "ec09dfa3-64b4-446c-89ab-f3bc45f3646d",
             input: "s1 = \"abcdefghijklmnopqrstuvwxyz\", s2 = \"a\"",
             expected: "2947", orderMatters: true),
            TestCaseData(id: "c06bae61-c387-4f38-98b5-16b1fbfc51ec",
             input: "s1 = \"abc\", s2 = \"abcabcabc\"",
             expected: "588", orderMatters: true),
            TestCaseData(id: "368cfca2-2a69-49f8-b23c-737ce1012cd3",
             input: "s1 = \"abcabcabc\", s2 = \"abc\"",
             expected: "588", orderMatters: true),
            TestCaseData(id: "1bde255f-11d1-4572-9756-4453444acee6",
             input: "s1 = \"abc\", s2 = \"abcabc\"",
             expected: "294", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-ascii-delete-sum-for-two-strings"
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

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))"
                )
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000"
                )
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.minimumDeleteSum(p_s1, p_s2)
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
