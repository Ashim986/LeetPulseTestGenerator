import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCInterleavingString {
    private class Solution {
        func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
            let n = s1.count, m = s2.count
            if n + m != s3.count {
                return false
            }
            var dp = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)
            dp[0][0] = true
            for i in 0...n {
                for j in 0...m {
                    if i > 0 {
                        dp[i][j] = dp[i][j] || (dp[i-1][j] && s1[s1.index(s1.startIndex, offsetBy: i-1)] == s3[s3.index(s3.startIndex, offsetBy: i+j-1)])
                    }
                    if j > 0 {
                        dp[i][j] = dp[i][j] || (dp[i][j-1] && s2[s2.index(s2.startIndex, offsetBy: j-1)] == s3[s3.index(s3.startIndex, offsetBy: i+j-1)])
                    }
                }
            }
            return dp[n][m]
        }
    }

    @Suite struct InterleavingStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d000d448-c7ab-4160-9889-1110d341e424",
             input: "s1 = \"\", s2 = \"\", s3 = \"\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8885e423-36fa-4af5-a88e-3209571ed7a7",
             input: "s1 = \"a\", s2 = \"\", s3 = \"a\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c6cf3e54-0558-4ebb-88bf-a3f8a97c0b99",
             input: "s1 = \"\", s2 = \"b\", s3 = \"b\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "de8de69e-0431-477a-b12d-8551781da977",
             input: "s1 = \"a\", s2 = \"b\", s3 = \"ba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8e014b67-a9d7-487e-adc0-432cd8698aca",
             input: "s1 = \"abc\", s2 = \"def\", s3 = \"abcdef\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "61444c0c-34d0-41ee-91e3-f990f4bb1030",
             input: "s1 = \"abc\", s2 = \"def\", s3 = \"dabecf\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1d8005e6-5af0-4d9f-b29c-33f1e06ffa5b",
             input: "s1 = \"abc\", s2 = \"def\", s3 = \"dabfcf\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "18b8b279-9804-47fb-8aae-ba8c32558200",
             input: "s1 = \"a\", s2 = \"a\", s3 = \"aa\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "94b931f6-eb77-43a4-a1b8-078720720773",
             input: "s1 = \"a\", s2 = \"a\", s3 = \"ab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "08c33bcd-f01e-4c88-bba9-2babc3434365",
             input: "s1 = \"abc\", s2 = \"abc\", s3 = \"abcabc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9ee48129-3133-4a7d-928c-24592db8b0fc",
             input: "s1 = \"abc\", s2 = \"abc\", s3 = \"abccba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0e3931ac-64ec-4e84-90e2-7dccdde75ef8",
             input: "s1 = \"abcde\", s2 = \"fghij\", s3 = \"abcdefghij\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8a93c82f-5741-4918-bcfb-954c0c7ad166",
             input: "s1 = \"abcde\", s2 = \"fghij\", s3 = \"afbgchidej\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d347a4c3-26ad-4753-a031-1795a12027e0",
             input: "s1 = \"abcde\", s2 = \"fghij\", s3 = \"afbgchidek\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c6fa9f70-b95a-404b-b74c-a925d416f045",
             input: "s1 = \"a\", s2 = \"\", s3 = \"b\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0c18dfcc-9778-4475-a6f5-6d0128514ef6",
             input: "s1 = \"\", s2 = \"b\", s3 = \"a\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "10c373c1-c655-4cba-b97e-6328a0160faa",
             input: "s1 = \"abc\", s2 = \"\", s3 = \"abcd\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7a098d1c-ee40-4442-add3-d1818bee915b",
             input: "s1 = \"\", s2 = \"abc\", s3 = \"abcd\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c646bd6b-42da-4518-8c91-e3bc16bf3b17",
             input: "s1 = \"abc\", s2 = \"def\", s3 = \"abcdefg\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "148450b9-c9e1-4274-8dba-1f5d916572f1",
             input: "s1 = \"abc\", s2 = \"def\", s3 = \"abcdfe\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ef020bea-d6bc-4f73-833a-8ae391632bfb",
             input: "s1 = \"a\", s2 = \"b\", s3 = \"c\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3abef773-2ed5-417b-90ee-fac79706f8cd",
             input: "s1 = \"\", s2 = \"\", s3 = \"a\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e1b9fd0f-8f40-46a5-918f-f09c4c4c12ec",
             input: "s1 = \"a\", s2 = \"\", s3 = \"\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7aa2c8dc-ca71-4341-9482-e1264d04c709",
             input: "s1 = \"\", s2 = \"b\", s3 = \"\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b3c72c1a-0abf-4f93-82a2-829fe9c4f7c4",
             input: "s1 = \"a\", s2 = \"a\", s3 = \"aaaa\"",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "interleaving-string"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))"
                )
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))"
                )
                return
            }
            let p_s3 = InputParser.parseString(params[2])
            guard p_s3.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s3 string too long (\(p_s3.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 0 && p_s1.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= s1.length, s2.length <= 100"
                )
                return
            }
            guard p_s2.count >= 0 && p_s2.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= s1.length, s2.length <= 100"
                )
                return
            }
            guard p_s3.count >= 0 && p_s3.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= s3.length <= 200"
                )
                return
            }

            let solution = Solution()
            let result = solution.isInterleave(p_s1, p_s2, p_s3)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
