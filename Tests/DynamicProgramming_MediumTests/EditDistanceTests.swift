import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCEditDistance {
    private class Solution {
        func minDistance(_ word1: String, _ word2: String) -> Int {
            let s1 = Array(word1), s2 = Array(word2)
            let m = s1.count, n = s2.count
            var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)

            for i in 0...m { dp[i][0] = i }
            for j in 0...n { dp[0][j] = j }

            for i in 1...m {
                for j in 1...n {
                    if s1[i-1] == s2[j-1] {
                        dp[i][j] = dp[i-1][j-1]
                    } else {
                        dp[i][j] = 1 + min(dp[i-1][j-1], min(dp[i-1][j], dp[i][j-1]))
                    }
                }
            }

            return dp[m][n]
        }
    }

    @Suite struct EditDistanceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "412459ff-0cb1-4d48-8175-2f1052ec8a79",
             input: "word1 = \"intention\", word2 = \"execution\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9a54a72e-3ac4-4724-8947-35bb0785baa4",
             input: "word1 = \"\", word2 = \"hello\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f92e69bc-0b90-448d-a761-03741d4487b8",
             input: "word1 = \"hello\", word2 = \"\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "dfe7e8b1-ba28-491c-a29f-fd08510cbede",
             input: "word1 = \"a\", word2 = \"b\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5251f229-4ee5-4a22-9e16-580a0e60934e",
             input: "word1 = \"abc\", word2 = \"abc\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "44dd5b28-0dec-438d-a495-eb00a57ef5db",
             input: "word1 = \"abc\", word2 = \"def\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "0661eade-44b3-49f7-9741-9b7e0e30480e",
             input: "word1 = \"abcdef\", word2 = \"fedcba\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "5d2f9e96-4f84-40f7-9ab2-2cd84ef93b64",
             input: "word1 = \"abcdefghijklmnopqrstuvwxyz\", word2 = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5d384ca8-073b-464b-b7e6-f6996dd861a4",
             input: "word1 = \"aaaaa\", word2 = \"aaaaa\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9a1ecf53-95a3-4755-83b0-e47e7a902502",
             input: "word1 = \"aaaaa\", word2 = \"bbbbb\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "43859ffa-5a33-4926-afb3-518ac5114787",
             input: "word1 = \"abcde\", word2 = \"abcdeabcde\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f2966470-e5ac-4601-805e-acd89b3fdf64",
             input: "word1 = \"abcdeabcde\", word2 = \"abcde\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "58ae7565-d0d4-4697-8c46-339458be670e",
             input: "word1 = \"hello\", word2 = \"hellohello\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e332ecf9-bf6a-4554-be4f-18e43fd7cdca",
             input: "word1 = \"hellohello\", word2 = \"hello\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9aa395a2-33b0-44d4-9444-17455648907a",
             input: "word1 = \"a\", word2 = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "25", orderMatters: true),
            TestCaseData(id: "9c8054c6-3c67-45c4-b213-c8f436a97384",
             input: "word1 = \"abcdefghijklmnopqrstuvwxyz\", word2 = \"a\"",
             expected: "25", orderMatters: true),
            TestCaseData(id: "a20a388b-606c-4e2b-9446-7cc0b8140b8b",
             input: "word1 = \"abc\", word2 = \"abcd\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "720fb982-8fc4-4373-bfe4-8ea303db34e9",
             input: "word1 = \"abcd\", word2 = \"abc\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a6542885-2a6a-4db8-917a-5851e971bcb6",
             input: "word1 = \"abc\", word2 = \"abce\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "11b8346a-2360-41d5-99b0-4a45ae9ad5dd",
             input: "word1 = \"abce\", word2 = \"abc\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "53364f41-55f4-4106-9b9c-a7f315ccdc8d",
             input: "word1 = \"abc\", word2 = \"abcf\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e4d22296-2240-4e6e-9487-27c7b468c2e1",
             input: "word1 = \"abcf\", word2 = \"abc\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "563a88f4-fd0d-4ee2-9a06-8125a208b82d",
             input: "word1 = \"abc\", word2 = \"ab\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e27fd1b4-d951-4738-b77b-4e6aa71d7b95",
             input: "word1 = \"ab\", word2 = \"abc\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ef96bf7b-0a8b-4751-8049-fa3020696e21",
             input: "word1 = \"\", word2 = \"\"",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "edit-distance"
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

            let p_word1 = InputParser.parseString(params[0])
            guard p_word1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: word1 string too long (\(p_word1.count))"
                )
                return
            }
            let p_word2 = InputParser.parseString(params[1])
            guard p_word2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: word2 string too long (\(p_word2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_word1.count >= 0 && p_word1.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= word1.length, word2.length <= 500"
                )
                return
            }
            guard p_word2.count >= 0 && p_word2.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= word1.length, word2.length <= 500"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.minDistance(p_word1, p_word2)
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
