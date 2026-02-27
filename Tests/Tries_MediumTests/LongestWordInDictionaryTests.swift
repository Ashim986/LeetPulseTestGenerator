import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestWordInDictionary {
    private class Solution {
        class TrieNode {
            var children: [Character: TrieNode] = [:]
            var endOfWord = false
        }

        class Trie {
            var root: TrieNode

            init() {
                root = TrieNode()
            }

            func insert(_ word: String) {
                var node = root
                for char in word {
                    if node.children[char] == nil {
                        node.children[char] = TrieNode()
                    }
                    node = node.children[char].unsafelyUnwrapped
                }
                node.endOfWord = true
            }

            func search(_ word: String) -> Bool {
                var node = root
                for char in word {
                    if node.children[char] == nil {
                        return false
                    }
                    node = node.children[char].unsafelyUnwrapped
                }
                return node.endOfWord
            }
        }

        func longestWord(_ words: [String]) -> String {
            let trie = Trie()
            for word in words {
                trie.insert(word)
            }
            var longestWord = ""
            for word in words.sorted(by: { $0.count > $1.count }) {
                var isFormed = true
                for i in 1...word.count {
                    let substring = String(word.prefix(i))
                    if !trie.search(substring) {
                        isFormed = false
                        break
                    }
                }
                if isFormed {
                    longestWord = word
                    break
                }
            }
            return longestWord
        }
    }

    @Suite struct LongestWordInDictionaryTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "200d0442-370c-4319-addf-aeda8901d3d8",
             input: "words = [\"a\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "46924aca-04ec-4ee4-a1e9-535bc29d7d4f",
             input: "words = []",
             expected: "\"\"", orderMatters: true),
            TestCaseData(id: "00617d16-c63e-432b-925c-6ab36accc42b",
             input: "words = [\"a\",\"b\",\"c\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "bbb43a62-8cdd-4efb-afc8-27c6efd8e4ca",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "60540a34-a586-4d03-aa7a-719f21481e5f",
             input: "words = [\"banana\",\"ban\",\"ba\",\"b\"]",
             expected: "b", orderMatters: true),
            TestCaseData(id: "54387f8e-8337-438a-9195-b8492fecadf1",
             input: "words = [\"word\",\"wor\",\"wo\",\"w\"]",
             expected: "w", orderMatters: true),
            TestCaseData(id: "b46d1b8a-ea0c-438e-837d-6ba906d1d0a7",
             input: "words = [\"a\",\"aa\",\"aaa\",\"aaaa\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "e621ae15-6d88-417b-bf4f-e734f3b5b991",
             input: "words = [\"b\",\"bb\",\"bbb\",\"bbbb\"]",
             expected: "b", orderMatters: true),
            TestCaseData(id: "ac690377-14a6-42a1-8182-8a447af2dfa0",
             input: "words = [\"c\",\"cc\",\"ccc\",\"cccc\"]",
             expected: "c", orderMatters: true),
            TestCaseData(id: "53e80d56-ca0b-4915-8ab8-0d4cd3755d1c",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"application\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "779979aa-ad6b-4558-9d97-af3aa95a7a72",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apply\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "67d3cea4-cc26-4637-a38f-1732c0e4db6d",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apart\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "d8eac0a3-d8d1-4e6a-81a9-0eadcaa21b67",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apt\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "91719b44-5ae4-4030-b842-f0d6bc4d64de",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apex\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "c970108e-7082-4a0f-a427-5ae5b434f29c",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apricot\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "c103901d-9eae-44d0-bcbd-bf6e2ccb7d19",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apron\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "46e1f7dd-9988-45b8-a8df-2034eb2dd4aa",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apology\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "e6b121e0-53f7-45fa-8764-9ddd88127de4",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apostle\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "24f1f95f-bd05-42e5-8061-7f6de5e7aecb",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apothecary\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "29a9d60a-1a43-4919-a317-ef27d1d7eab4",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apricots\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "c8890f1e-bada-4b3b-b883-a78dd36453fa",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"aprons\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "b9e37e4d-9ffa-478c-a1ba-d51df0bc84a0",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apologies\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "225bb32a-3576-4607-9428-a496a6b9228c",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apostles\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "cc9b903f-761e-4203-a168-9a8bede60559",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apothecaries\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "5bf6f7c0-48ef-48d8-ac3d-cefde45909e4",
             input: "words = [\"apple\",\"app\",\"ap\",\"a\",\"apricot\",\"apron\",\"apology\",\"apostle\",\"apothecary\"]",
             expected: "a", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
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

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: words array too large (\(p_words.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 1000"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 30"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.longestWord(p_words)
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
