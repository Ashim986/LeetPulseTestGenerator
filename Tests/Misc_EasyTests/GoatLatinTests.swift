import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGoatLatin {
    private class Solution {
        func toGoatLatin(_ S: String) -> String {
            let words = S.components(separatedBy: " ")
            let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

            return words.enumerated().map { index, word -> String in
                var goatLatin = word

                if !vowels.contains(word[word.startIndex]) {
                    goatLatin = String(goatLatin.dropFirst()) + String(word[word.startIndex])
                }

                return goatLatin + "ma" + String(repeating: "a", count: index + 1)
            }.joined(separator: " ")
        }
    }

    @Suite struct GoatLatinTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4b7ed38f-5ee6-49aa-bd70-31ce21425fcf",
             input: "sentence = \"I speak Goat Latin\"",
             expected: "\"Imaa peaksmaaa oatGmaaaa atinLmaaaaa\"", orderMatters: true),
            TestCaseData(id: "bab05965-8e0a-4b54-8d04-e44b6fdd41a6",
             input: "sentence = \"The quick brown fox jumped over the lazy dog\"",
             expected: "\"heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "goat-latin"
            let topic = "misc"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            let p_S = InputParser.parseString(params[0])
            guard p_S.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: S string too long (\(p_S.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_S.count >= 1 && p_S.count <= 150 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= sentence.length <= 150"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.toGoatLatin(p_S)
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

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
