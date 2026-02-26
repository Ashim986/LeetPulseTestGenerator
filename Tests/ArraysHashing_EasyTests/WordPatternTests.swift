import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCWordPattern {
    private class Solution {
        func wordPattern(_ pattern: String, _ s: String) -> Bool {
            let words = s.components(separatedBy: " ")
            if words.count != pattern.count { return false }
            var charToWord: [Character: String] = [:]
            var wordToChar: [String: Character] = [:]

            for (char, word) in zip(pattern, words) {
                if (charToWord[char] != word) || (wordToChar[word] != char) {
                    return false
                }
                charToWord[char] = word
                wordToChar[word] = char
            }

            return true
        }
    }

    @Suite struct WordPatternTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "69ad6878-d453-414d-9504-d2ae484d2d63",
             input: "pattern = \"abc\", s = \"dog cat mouse\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6865aaae-f4c1-46de-a631-ecb02074f37f",
             input: "pattern = \"abc\", s = \"dog cat dog\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "af110588-89ea-4850-a617-d56a5c246516",
             input: "pattern = \"a\", s = \"dog\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0764e4df-b7e0-411b-8e97-1dba495eb613",
             input: "pattern = \"\", s = \"dog cat\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "057d740a-f305-4058-9bc7-e3c4c40d95b7",
             input: "pattern = \"ab\", s = \"dog cat dog\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "232e83c2-3d81-4bf0-b851-1e7f704f1324",
             input: "pattern = \"abba\", s = \"dog dog dog dog\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4b4bb7bb-4c09-4b0d-b786-8a317c2c1b4f",
             input: "pattern = \"aaaa\", s = \"dog dog dog dog\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "27808fa2-d69a-4166-a672-8375114e50f5",
             input: "pattern = \"abab\", s = \"dog cat dog cat\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c1f52750-451b-4b11-bb93-135ba5672de0",
             input: "pattern = \"abab\", s = \"dog cat cat dog\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f367dc41-9889-423a-9fdd-9628133c4117",
             input: "pattern = \"abcde\", s = \"dog cat mouse bird fish\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b2aa1fdc-15f8-4513-90e7-1584663c6de5",
             input: "pattern = \"abcde\", s = \"dog cat mouse bird cat\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3c4d0825-f899-4c3a-a8ac-21a058604177",
             input: "pattern = \"aabb\", s = \"dog dog cat cat\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "909b6bbd-3857-4d6e-9161-ebe0eeeae05f",
             input: "pattern = \"aabb\", s = \"dog dog cat dog\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "144a31bb-88f4-446c-a89c-27a91da195d3",
             input: "pattern = \"abcabc\", s = \"dog cat mouse dog cat mouse\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7cd8817c-c652-42be-a296-e5404dfe0ad8",
             input: "pattern = \"abcabc\", s = \"dog cat mouse dog cat dog\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b17460a0-f797-4e65-95ed-f1cb9116078d",
             input: "pattern = \"ababab\", s = \"dog cat dog cat dog cat\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cb275cef-958c-4095-bdae-c66b4788a093",
             input: "pattern = \"ababab\", s = \"dog cat dog cat cat dog\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "98049cf5-0419-4cca-8fb6-d25e73e7cc0c",
             input: "pattern = \"aaaaa\", s = \"dog dog dog dog dog\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8194e0fd-6c59-4341-b17c-ae72e305d709",
             input: "pattern = \"aaaaa\", s = \"dog dog dog dog cat\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d5665b7d-aec5-4e4f-bed6-6a134a01a22d",
             input: "pattern = \"abcdeabcde\", s = \"dog cat mouse bird fish dog cat mouse bird fish\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "162f0673-d501-460d-88d5-4a59580d6072",
             input: "pattern = \"abcdeabcde\", s = \"dog cat mouse bird fish dog cat mouse bird cat\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9c0d1acb-0c2c-4f0d-b156-05914c7fde8f",
             input: "pattern = \"aabbcc\", s = \"dog dog cat cat mouse mouse\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2427ed76-460e-48d0-83ed-0b95b587c8d2",
             input: "pattern = \"aabbcc\", s = \"dog dog cat cat mouse dog\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d07b0cac-2597-495d-878b-981820173f8a",
             input: "pattern = \"abcdef\", s = \"dog cat mouse bird fish lion\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "34984600-1b30-4f48-bb89-565694eecb84",
             input: "pattern = \"abcdef\", s = \"dog cat mouse bird fish cat\"",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "word-pattern"
            let topic = "arrays-hashing"
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

            let p_pattern = InputParser.parseString(params[0])
            guard p_pattern.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: pattern string too long (\(p_pattern.count))"
                )
                return
            }
            let p_s = InputParser.parseString(params[1])
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
            guard p_pattern.count >= 1 && p_pattern.count <= 300 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= pattern.length <= 300"
                )
                return
            }
            guard p_s.count >= 1 && p_s.count <= 3000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 3000"
                )
                return
            }

            let solution = Solution()
            let result = solution.wordPattern(p_pattern, p_s)
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
