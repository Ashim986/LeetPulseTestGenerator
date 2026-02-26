import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindAndReplacePattern {
    private class Solution {
        func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
            var result: [String] = []
            let patternMap: [Character: String] = [:]
            for word in words {
                var wordMap: [Character: Character] = [:]
                var matched = true
                for (w, p) in zip(word, pattern) {
                    if let value = wordMap[p] {
                        if value != w {
                            matched = false
                            break
                        }
                    }
                    else {
                        if wordMap.values.contains(w) {
                            matched = false
                            break
                        }
                        else {
                            wordMap[p] = w
                        }
                    }
                }
                if matched {
                    result.append(word)
                }
            }
            return result
        }
    }

    @Suite struct FindAndReplacePatternTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d21b072d-6888-4d62-b1c5-3a49c38a3fde",
             input: "words = [\"abc\"], pattern = \"abc\"",
             expected: "[\"abc\"]", orderMatters: false),
            TestCaseData(id: "6fbe3f6c-a4f4-4bcf-afe6-4dd2bf0cf492",
             input: "words = [\"abc\",\"abc\"], pattern = \"abc\"",
             expected: "[\"abc\",\"abc\"]", orderMatters: false),
            TestCaseData(id: "d2922555-273f-4fae-847a-00edbb0c5a5f",
             input: "words = [\"aa\",\"bb\"], pattern = \"ab\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "dd782036-bcc0-49bf-9bea-2d2c99fa0f47",
             input: "words = [\"aaa\",\"bbb\"], pattern = \"aab\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "ae2c9530-6e50-4db7-9d5e-3dda8132d812",
             input: "words = [], pattern = \"abc\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "bd893dde-7e49-47c5-a79e-cee31324d91d",
             input: "words = [], pattern = \"\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "e798ba55-4943-4bca-ab93-91a10a9d9887",
             input: "words = [\"abc\",\"abc\",\"abc\"], pattern = \"abc\"",
             expected: "[\"abc\",\"abc\",\"abc\"]", orderMatters: false),
            TestCaseData(id: "8c27705d-c74e-4c8c-add1-147a69ecebda",
             input: "words = [\"abc\",\"deq\"], pattern = \"abc\"",
             expected: "[\"abc\",\"deq\"]", orderMatters: false),
            TestCaseData(id: "81eed621-1816-4ca5-884f-02c4d1f20409",
             input: "words = [\"abc\",\"deq\"], pattern = \"deq\"",
             expected: "[\"abc\",\"deq\"]", orderMatters: false),
            TestCaseData(id: "ad650820-2d0a-4dee-ac58-0d653f7b41aa",
             input: "words = [\"abc\",\"deq\"], pattern = \"xyz\"",
             expected: "[\"abc\",\"deq\"]", orderMatters: false),
            TestCaseData(id: "d75f2cc9-1fd0-4636-a0e1-a90f35bcb85d",
             input: "words = [\"abc\"], pattern = \"deq\"",
             expected: "[\"abc\"]", orderMatters: false),
            TestCaseData(id: "13500329-ea8a-48fd-83ca-bc41ff852b2c",
             input: "words = [\"abc\",\"abc\"], pattern = \"deq\"",
             expected: "[\"abc\",\"abc\"]", orderMatters: false),
            TestCaseData(id: "8b16c963-4f53-45cc-9d5f-bdc6290be73f",
             input: "words = [\"a\",\"b\"], pattern = \"a\"",
             expected: "[\"a\",\"b\"]", orderMatters: false),
            TestCaseData(id: "2e29a4ee-c510-4371-af5b-678477b66671",
             input: "words = [\"a\",\"b\"], pattern = \"b\"",
             expected: "[\"a\",\"b\"]", orderMatters: false),
            TestCaseData(id: "16ebb489-1c25-4811-8854-67ac9484bc60",
             input: "words = [\"a\",\"b\"], pattern = \"c\"",
             expected: "[\"a\",\"b\"]", orderMatters: false),
            TestCaseData(id: "c32f8421-4662-42a6-9aa5-7a0392ad7e80",
             input: "words = [\"aa\",\"bb\"], pattern = \"aa\"",
             expected: "[\"aa\",\"bb\"]", orderMatters: false),
            TestCaseData(id: "3ae2ca2f-84b6-4c06-94a1-aee4151b264d",
             input: "words = [\"aa\",\"bb\"], pattern = \"bb\"",
             expected: "[\"aa\",\"bb\"]", orderMatters: false),
            TestCaseData(id: "32a43f57-e229-48bf-806f-779b33643db0",
             input: "words = [\"aaa\",\"bbb\"], pattern = \"aaa\"",
             expected: "[\"aaa\",\"bbb\"]", orderMatters: false),
            TestCaseData(id: "2ae6bf4b-fae7-4553-801b-3a24600cb2df",
             input: "words = [\"aaa\",\"bbb\"], pattern = \"bbb\"",
             expected: "[\"aaa\",\"bbb\"]", orderMatters: false),
            TestCaseData(id: "44fa6ab9-1a4e-4d13-9a38-fd71bce47edb",
             input: "words = [\"abcd\",\"efgh\"], pattern = \"abcd\"",
             expected: "[\"abcd\",\"efgh\"]", orderMatters: false),
            TestCaseData(id: "4e5797cb-9559-4994-b0fe-0c3eaf622c9b",
             input: "words = [\"abcd\",\"efgh\"], pattern = \"efgh\"",
             expected: "[\"abcd\",\"efgh\"]", orderMatters: false),
            TestCaseData(id: "9ac99610-c2a0-4f2c-be87-d8d9cbac803a",
             input: "words = [\"abcd\",\"efgh\"], pattern = \"abce\"",
             expected: "[\"abcd\",\"efgh\"]", orderMatters: false),
            TestCaseData(id: "7d8ff2cc-bfca-4f2a-b5e4-867d4717ab11",
             input: "words = [\"abcde\",\"fghij\"], pattern = \"abcde\"",
             expected: "[\"abcde\",\"fghij\"]", orderMatters: false),
            TestCaseData(id: "74342083-42f8-4379-956c-d8e67eba4791",
             input: "words = [\"abcde\",\"fghij\"], pattern = \"fghij\"",
             expected: "[\"abcde\",\"fghij\"]", orderMatters: false),
            TestCaseData(id: "11bb38f9-5b47-48e7-920b-c39b71cafe7e",
             input: "words = [\"abcde\",\"fghij\"], pattern = \"abcdf\"",
             expected: "[\"abcde\",\"fghij\"]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-and-replace-pattern"
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

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: words array too large (\(p_words.count))"
                )
                return
            }
            let p_pattern = InputParser.parseString(params[1])
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

            // Constraint precondition checks
            guard p_pattern.count >= 1 && p_pattern.count <= 20 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= pattern.length <= 20"
                )
                return
            }
            guard p_words.count >= 1 && p_words.count <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 50"
                )
                return
            }

            let solution = Solution()
            let result = solution.findAndReplacePattern(p_words, p_pattern)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [String]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
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
