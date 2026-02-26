import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func toGoatLatin(_ S: String) -> String {
        let words = S.components(separatedBy: " ")
        let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

        return words.enumerated().map { index, word -> String in
            var goatLatin = word

            if !vowels.contains(word.first!) {
                goatLatin = String(goatLatin.dropFirst()) + String(word.first!)
            }

            return goatLatin + "ma" + String(repeating: "a", count: index + 1)
        }.joined(separator: " ")
    }
}

@Suite struct GoatLatinTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "goat-latin"
        let topic = "misc"
        let testId = "4b7ed38f-5ee6-49aa-bd70-31ce21425fcf"
        let rawInput = "sentence = \"I speak Goat Latin\""
        let expectedOutput = "\"Imaa peaksmaaa oatGmaaaa atinLmaaaaa\""
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }

        // Constraint precondition checks
        guard p_S.count >= 1 && p_S.count <= 150 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= sentence.length <= 150")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.toGoatLatin(p_S)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "goat-latin"
        let topic = "misc"
        let testId = "bab05965-8e0a-4b54-8d04-e44b6fdd41a6"
        let rawInput = "sentence = \"The quick brown fox jumped over the lazy dog\""
        let expectedOutput = "\"heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa\""
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }

        // Constraint precondition checks
        guard p_S.count >= 1 && p_S.count <= 150 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= sentence.length <= 150")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.toGoatLatin(p_S)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
