import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRansomNote {
    private class Solution {
        func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
            var counts: [Character: Int] = [:]
            for ch in magazine { counts[ch, default: 0] += 1 }
            for ch in ransomNote {
                let remaining = (counts[ch] ?? 0) - 1
                if remaining < 0 { return false }
                counts[ch] = remaining
            }
            return true
        }
    }

    @Suite struct RansomNoteTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1bd9a12b-5f51-428b-8229-c90fe4d95a5f",
             input: "ransomNote = \"a\", magazine = \"a\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "be12a9c3-8982-4acf-9fcc-cccb43fe5610",
             input: "ransomNote = \"ab\", magazine = \"ba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4011fe21-caf6-492c-8bbf-6a289fa87e61",
             input: "ransomNote = \"abc\", magazine = \"abc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "837562fd-acd8-406c-a603-71cf8c3deb0e",
             input: "ransomNote = \"\", magazine = \"abc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "56e7cb3c-a306-438f-8dff-25a8d148e3d3",
             input: "ransomNote = \"abc\", magazine = \"\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e4a4bca3-ffed-495b-847e-7374f7c7eab1",
             input: "ransomNote = \"aaa\", magazine = \"aa\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a4ac5a8e-23a4-49a3-89f0-8f9e132ed0b1",
             input: "ransomNote = \"aa\", magazine = \"aaa\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "10acd068-9bfe-4314-b2bb-1ead51c382a4",
             input: "ransomNote = \"abc\", magazine = \"abcd\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "afbeff9d-adf5-4e38-96a3-c5df5ec43534",
             input: "ransomNote = \"abcd\", magazine = \"abc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ccd9adf0-608b-4059-8850-dd886ebfe75f",
             input: "ransomNote = \"a\", magazine = \"\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "495f625b-6bd8-4a16-99f9-ee745cf8eee4",
             input: "ransomNote = \"\", magazine = \"\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6c8c26ef-1e5c-482a-9f91-cd1ec8da99ca",
             input: "ransomNote = \"abcdefghijklmnopqrstuvwxyz\", magazine = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d3bc962e-189a-4893-917b-9c764d2665b2",
             input: "ransomNote = \"abcdefghijklmnopqrstuvwxyz\", magazine = \"abcdefghijklmnopqrstuvwxyzabc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "001a4619-e719-40ca-998f-103e41981fdc",
             input: "ransomNote = \"abc\", magazine = \"abcabcabc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3182daad-08ab-4532-af73-8585692fe5a2",
             input: "ransomNote = \"abcabcabc\", magazine = \"abc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "303cb5e2-8d58-4ee7-b53a-0dfb381bc17f",
             input: "ransomNote = \"abc\", magazine = \"def\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "07f32c97-7d0a-435d-8801-a1f241860cbe",
             input: "ransomNote = \"abc\", magazine = \"abcabc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "aaf5da47-50a6-4aa4-8b45-5ddaf3f636c2",
             input: "ransomNote = \"abcabc\", magazine = \"abc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7f15e92a-cf14-49e8-a4d5-6c5dd849c77e",
             input: "ransomNote = \"aa\", magazine = \"ab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bdf2a27e-6dce-4cb0-866b-2475d77b6279",
             input: "ransomNote = \"ab\", magazine = \"aa\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4487d2bc-45a6-4b91-827c-cb29cb74fb19",
             input: "ransomNote = \"abc\", magazine = \"bca\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ad79e6f1-f48f-4b56-9a68-bc88169c263e",
             input: "ransomNote = \"bca\", magazine = \"abc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b64cdcf0-1807-4575-8303-7f4b08f1f8bd",
             input: "ransomNote = \"abc\", magazine = \"cab\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "47f9abc0-9802-4d0e-976c-708fccf96489",
             input: "ransomNote = \"cab\", magazine = \"abc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c4e19ee3-1b97-4bf4-a303-10ec6a439324",
             input: "ransomNote = \"abc\", magazine = \"bac\"",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "ransom-note"
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

            let p_ransomNote = InputParser.parseString(params[0])
            guard p_ransomNote.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: ransomNote string too long (\(p_ransomNote.count))"
                )
                return
            }
            let p_magazine = InputParser.parseString(params[1])
            guard p_magazine.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: magazine string too long (\(p_magazine.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_ransomNote.count >= 1 && p_ransomNote.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= ransomNote.length, magazine.length <= 10^5"
                )
                return
            }
            guard p_magazine.count >= 1 && p_magazine.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= ransomNote.length, magazine.length <= 10^5"
                )
                return
            }

            let solution = Solution()
            let result = solution.canConstruct(p_ransomNote, p_magazine)
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
