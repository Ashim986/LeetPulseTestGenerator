import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCValidAnagram {
    private class Solution {
        func isAnagram(_ s: String, _ t: String) -> Bool {
            if s.count != t.count { return false }
            var counts: [Character: Int] = [:]
            for ch in s { counts[ch, default: 0] += 1 }
            for ch in t {
                let remaining = (counts[ch] ?? 0) - 1
                if remaining < 0 { return false }
                counts[ch] = remaining
            }
            return true
        }
    }

    @Suite struct ValidAnagramTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6CBC4B07-AF28-42D3-8973-7E06EC52E8E5",
             input: "anagram\nnagaram",
             expected: "true", orderMatters: true),
            TestCaseData(id: "73211EDB-D864-403A-BFCF-513CFDFBCB70",
             input: "rat\nart",
             expected: "true", orderMatters: true),
            TestCaseData(id: "B31AA08C-4441-481E-83FF-249B7273F81D",
             input: "hello\nworld",
             expected: "false", orderMatters: true),
            TestCaseData(id: "83A1EB71-F9AC-4BD4-A3D1-0D85A9893F53",
             input: "a\na",
             expected: "true", orderMatters: true),
            TestCaseData(id: "B1F7EC3B-B64A-4F01-B64E-AE7CD040B950",
             input: "abc\nbca",
             expected: "true", orderMatters: true),
            TestCaseData(id: "06E2273E-8BDA-4CFD-902F-0B294FEE74DE",
             input: "abc\nbac",
             expected: "true", orderMatters: true),
            TestCaseData(id: "CE65727E-21A8-40A3-A03C-95611DD00D3F",
             input: "abc\nabc",
             expected: "true", orderMatters: true),
            TestCaseData(id: "03FAF821-D4F1-4EBB-A715-80D060D37ECE",
             input: "abc\ndef",
             expected: "false", orderMatters: true),
            TestCaseData(id: "00CC7B91-5A9C-4C6F-A6E4-6E90E38692C9",
             input: "aa\naa",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9BAB9B38-9C47-4B3D-A68C-0DF2F8F4F06B",
             input: "aabb\nbbaa",
             expected: "true", orderMatters: true),
            TestCaseData(id: "DDA266E3-553A-4141-8CF0-E15119CC2AF9",
             input: "aaabb\nbbaaa",
             expected: "true", orderMatters: true),
            TestCaseData(id: "F352745E-A237-4670-B72A-DEC352AC1E43",
             input: "aabbcc\nccbbaa",
             expected: "true", orderMatters: true),
            TestCaseData(id: "84263DC4-C7CB-4FB0-ADEC-EFD7EBB6D0A4",
             input: "abcde\nedcba",
             expected: "true", orderMatters: true),
            TestCaseData(id: "921EFAB8-E58D-4437-81B9-B4FC3EFEA141",
             input: "abcde\naabcde",
             expected: "false", orderMatters: true),
            TestCaseData(id: "C78EAFD0-828F-452E-96D6-F2CCB94CA54D",
             input: "abcde\naabcdeabcde",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6177D98E-F275-46D9-A145-606E5DDF56FA",
             input: "abcde\n12345",
             expected: "false", orderMatters: true),
            TestCaseData(id: "CA2EBC9F-11A4-44A7-8C52-F87BED9A8000",
             input: "a",
             expected: "false", orderMatters: true),
            TestCaseData(id: "BA034595-E8EC-4FC6-97C2-318FDB47D34B",
             input: "abc",
             expected: "false", orderMatters: true),
            TestCaseData(id: "96CB5D79-A3CF-41B3-9D96-06666FC531AF",
             input: "abcdef\nfedcba",
             expected: "true", orderMatters: true),
            TestCaseData(id: "EDB9D579-9E18-42B1-BFE7-B1073632292E",
             input: "abcd\nfedcba",
             expected: "false", orderMatters: true),
            TestCaseData(id: "16F79E85-1D82-4D21-AA0E-51C25F0A69EB",
             input: "aabbccdd\nddccbbaa",
             expected: "true", orderMatters: true),
            TestCaseData(id: "72A8A33A-6308-456A-B31D-889728973269",
             input: "a aa ba ca\na aca bac",
             expected: "false", orderMatters: true),
            TestCaseData(id: "D60C0C76-9FF8-4F01-BEBF-30A3906D42F6",
             input: "abc abc\nb abc c a",
             expected: "false", orderMatters: true),
            TestCaseData(id: "43879898-F30E-47B1-B402-B81ADA78269C",
             input: "aa aa\na aa a",
             expected: "false", orderMatters: true),
            TestCaseData(id: "CD576DFE-6F84-4884-B23A-0C2B2A5A6300",
             input: "abc d ef\na dfb c e",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "valid-anagram"
            let topic = "arrays-hashing"
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
            guard p_s.count >= 1 && p_s.count <= 50000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length, t.length <= 5 * 10^4"
                )
                return
            }
            guard p_t.count >= 1 && p_t.count <= 50000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length, t.length <= 5 * 10^4"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isAnagram(p_s, p_t)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
