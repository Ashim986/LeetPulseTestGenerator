import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReplaceWords {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var isWord = false
    }
    private class Solution {
        func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
            let trie = TrieNode()
            for word in dictionary {
                var node = trie
                for char in word {
                    if node.children[char] == nil {
                        node.children[char] = TrieNode()
                    }
                    node = node.children[char].unsafelyUnwrapped
                }
                node.isWord = true
            }
            let words = sentence.components(separatedBy: " ")
            var result: [String] = []
            for word in words {
                var node = trie
                var prefix = ""
                for char in word {
                    prefix += String(char)
                    if node.children[char] == nil {
                        break
                    }
                    node = node.children[char].unsafelyUnwrapped
                    if node.isWord {
                        result.append(prefix)
                        break
                    }
                }
                if !node.isWord {
                    result.append(word)
                }
            }
            return result.joined(separator: " ")
        }
    }

    @Suite struct ReplaceWordsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "370c2a7b-3608-449a-88dd-d70fd26d865f",
             input: "dictionary = [\"a\"], sentence = \"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "e376b5db-7f02-4d16-9b0e-d80331b3a298",
             input: "dictionary = [\"a\"], sentence = \"aa\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "81ef16ca-aa13-4526-be4c-62eb2d3af569",
             input: "dictionary = [\"a\"], sentence = \"aaa\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "5ce7083a-c7cc-4dbf-a03b-8f8b4c1801bb",
             input: "dictionary = [\"cat\"], sentence = \"cat\"",
             expected: "cat", orderMatters: true),
            TestCaseData(id: "1b01ad27-4671-45c3-96e0-2766363ddcc0",
             input: "dictionary = [\"cat\"], sentence = \"cattle\"",
             expected: "cat", orderMatters: true),
            TestCaseData(id: "4f162f4b-164d-48a1-9a17-c8ab5ccd7220",
             input: "dictionary = [\"cat\"], sentence = \"category\"",
             expected: "cat", orderMatters: true),
            TestCaseData(id: "8e1f6484-d871-4e84-93f2-9674e44acde7",
             input: "dictionary = [\"cat\", \"dog\"], sentence = \"cattle dog\"",
             expected: "cat dog", orderMatters: true),
            TestCaseData(id: "34b726bd-0c1d-4457-aa63-697eea00dc32",
             input: "dictionary = [\"cat\", \"dog\"], sentence = \"category dog\"",
             expected: "cat dog", orderMatters: true),
            TestCaseData(id: "4e7f4886-557c-4618-a34a-01c25e725b1b",
             input: "dictionary = [\"cat\", \"dog\"], sentence = \"cattle category\"",
             expected: "cat cat", orderMatters: true),
            TestCaseData(id: "cfe29adb-cc79-4cb0-b792-c83a55d0df64",
             input: "dictionary = [], sentence = \"hello world\"",
             expected: "hello world", orderMatters: true),
            TestCaseData(id: "7a9ab5a7-3092-4364-96c0-2186011e6f12",
             input: "dictionary = [\"hello\"], sentence = \"hello world\"",
             expected: "hello world", orderMatters: true),
            TestCaseData(id: "a100b423-822e-44c3-87b3-c44ee5639579",
             input: "dictionary = [\"hello\"], sentence = \"hellohello\"",
             expected: "hello", orderMatters: true),
            TestCaseData(id: "246f0adc-da7e-4a6e-a602-5b0a12ed91ef",
             input: "dictionary = [\"hello\"], sentence = \"hellohellohello\"",
             expected: "hello", orderMatters: true),
            TestCaseData(id: "f0b9b0b8-d610-45b9-8e64-1f9298f65971",
             input: "dictionary = [\"a\", \"aa\"], sentence = \"aaa\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "b49498f2-7f2e-4e0a-a1e9-ab8270ce6265",
             input: "dictionary = [\"a\", \"aa\"], sentence = \"aaaa\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "186a6a7e-77be-4d45-a83d-1d02ba81d025",
             input: "dictionary = [\"a\", \"aa\"], sentence = \"aaaaa\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "59eebd3a-1c35-4377-90e2-a6b699b332ea",
             input: "dictionary = [\"apple\"], sentence = \"appleapple\"",
             expected: "apple", orderMatters: true),
            TestCaseData(id: "71fa7a09-afc6-46e8-93f0-27ef69eb42e2",
             input: "dictionary = [\"apple\"], sentence = \"appleappleapple\"",
             expected: "apple", orderMatters: true),
            TestCaseData(id: "7a64643f-7862-44e0-8cec-ab49b6b89f05",
             input: "dictionary = [\"apple\"], sentence = \"appleappleappleapple\"",
             expected: "apple", orderMatters: true),
            TestCaseData(id: "3497c23b-fca3-4185-9e5c-9a0f645a97dd",
             input: "dictionary = [\"a\", \"b\"], sentence = \"ab\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "cedee841-c0f1-4436-bfb3-f31cbd3456eb",
             input: "dictionary = [\"a\", \"b\"], sentence = \"ba\"",
             expected: "b", orderMatters: true),
            TestCaseData(id: "d6aeb0ed-a1f6-4913-b24f-861228b61856",
             input: "dictionary = [\"a\", \"b\"], sentence = \"aba\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "6b405630-0fd4-411c-8646-fb1740a414cf",
             input: "dictionary = [\"\"], sentence = \"hello world\"",
             expected: "", orderMatters: true),
            TestCaseData(id: "c4023bc3-7991-470d-adf8-bb88906af86a",
             input: "dictionary = [\"a\", \"b\", \"c\"], sentence = \"abc\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "14bbc0ce-2345-440e-9c85-55a91620f335",
             input: "dictionary = [\"a\", \"b\", \"c\"], sentence = \"bca\"",
             expected: "b", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "replace-words"
            let topic = "tries"
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

            guard let p_dictionary = InputParser.parseStringArray(params[0]) else {
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
            guard p_dictionary.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: dictionary array too large (\(p_dictionary.count))"
                )
                return
            }
            let p_sentence = InputParser.parseString(params[1])
            guard p_sentence.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: sentence string too long (\(p_sentence.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_dictionary.count >= 1 && p_dictionary.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= dictionary.length <= 1000"
                )
                return
            }
            guard p_dictionary.allSatisfy({ $0.count >= 1 && $0.count <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= dictionary[i].length <= 100"
                )
                return
            }
            guard p_sentence.count >= 1 && p_sentence.count <= 106 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= sentence.length <= 106"
                )
                return
            }

            let solution = Solution()
            let result = solution.replaceWords(p_dictionary, p_sentence)
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
