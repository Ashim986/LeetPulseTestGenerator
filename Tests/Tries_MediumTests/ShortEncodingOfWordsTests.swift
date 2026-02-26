import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCShortEncodingOfWords {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var isEndOfWord = false
    }

    private class Solution {
        func minimumLengthEncoding(_ words: [String]) -> Int {
            let root = TrieNode()
            var nodes: [TrieNode] = []
            for word in words {
                var node = root
                for char in word.reversed() {
                    if node.children[char] == nil {
                        node.children[char] = TrieNode()
                    }
                    node = node.children[char].unsafelyUnwrapped
                }
                node.isEndOfWord = true
                nodes.append(node)
            }
            var res = 0
            for node in nodes {
                var temp: TrieNode? = node
                var len = 0
                while temp != nil && temp.unsafelyUnwrapped.children.count == 1 && !temp.unsafelyUnwrapped.isEndOfWord {
                    len += 1
                    temp = temp.unsafelyUnwrapped.children.first?.value
                }
                if temp != nil {
                    res += len + 1
                }
            }
            return res
        }
    }

    @Suite struct ShortEncodingOfWordsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5f288bd8-e47e-4b9a-870c-3e90723fb1cc",
             input: "words = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8130d4a8-8330-4a15-b720-a9fd265bfcfe",
             input: "words = [\"a\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "00a76452-9f03-422f-870c-aa95a7720931",
             input: "words = [\"abc\", \"def\"]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "e0cbeb0e-31f0-46d6-b495-547a429bb28c",
             input: "words = [\"abc\", \"abcd\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "fa14d1c8-4b74-4c88-849a-b8667a1083cf",
             input: "words = [\"abcd\", \"abc\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "37b3c698-1029-4a81-bc18-aeefb0261934",
             input: "words = [\"a\", \"b\", \"c\"]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "be67c44e-13f0-45c7-a2a7-53e9fb368a81",
             input: "words = [\"time\", \"me\", \"bell\", \"time\"]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "910e8798-51aa-42fd-9fd9-c593885d3702",
             input: "words = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", "
                + "\"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\"]",
             expected: "52", orderMatters: true),
            TestCaseData(id: "0a54e37e-801e-4063-b939-0f56f2217a4f",
             input: "words = [\"abcdefghijklmnopqrstuvwxyz\"]",
             expected: "27", orderMatters: true),
            TestCaseData(id: "3df50063-e14c-4e8f-a2ab-7a3d433f32b2",
             input: "words = [\"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\"]",
             expected: "27", orderMatters: true),
            TestCaseData(id: "57373b98-11f2-4829-b993-4d68b58cb636",
             input: "words = [\"a\", \"a\", \"a\", \"a\", \"a\", \"a\", \"a\", \"a\", \"a\", \"a\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2ba44dcd-b671-4da2-b645-4dbb6608a618",
             input: "words = [\"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\","
                + " \"abcdefghijklmnopqrstuvwxyz\"]",
             expected: "27", orderMatters: true),
            TestCaseData(id: "53e354aa-27c3-4ba3-a8bc-406c8b73263e",
             input: "words = [\"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\","
                + " \"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\", \"abcde"
                + "fghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\"]",
             expected: "27", orderMatters: true),
            TestCaseData(id: "8aee83e2-27e6-4363-9a3e-3e027a7e5236",
             input: "words = [\"apple\", \"app\", \"ap\"]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "d66e66fc-cf8b-473c-827f-6ac7f6f67a41",
             input: "words = [\"apple\", \"app\", \"ap\", \"a\"]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "aab01f9c-aeb7-4577-ad9d-cb4507b78c72",
             input: "words = [\"a\", \"aa\", \"aaa\"]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "cf2d146e-56b9-4659-8f44-ed09d34bdd81",
             input: "words = [\"aaa\", \"aa\", \"a\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "f9191904-ad47-4769-8ef0-ed2b3b768ae2",
             input: "words = [\"abc\", \"abc\", \"abc\"]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "9c447dc8-d870-4887-a2b9-4a66194b3e73",
             input: "words = [\"a\", \"aa\", \"aaa\", \"aaaa\", \"aaaaa\", \"aaaaaa\", \"aaaaaaa\", \"aaaaaaaa\", \"aaaaaaaaa\", \"aaaaaaaaaa\"]",
             expected: "65", orderMatters: true),
            TestCaseData(id: "dff8a3df-6fb5-49b7-b327-f894dd215341",
             input: "words = [\"\", \"a\", \"aa\", \"aaa\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "2be7e234-0726-4473-8f2d-69d4c64db5e7",
             input: "words = [\"a\", \"\", \"aa\", \"aaa\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "fe27864f-017b-4081-9c8d-4d4669796727",
             input: "words = [\"a\", \"aa\", \"\", \"aaa\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "5d4d5a26-5c2a-464a-a9a1-172d7bec431c",
             input: "words = [\"a\", \"aa\", \"aaa\", \"\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "de32cbad-6bb1-45f6-828a-c9d625732b90",
             input: "words = [\"abc\", \"abcde\", \"abcdef\", \"abcdefg\", \"abcdefgh\", \"abcdefghi\", \"abcdefghij\"]",
             expected: "55", orderMatters: true),
            TestCaseData(id: "f850dcc4-4189-43f4-b2e2-143201d15793",
             input: "words = [\"abcdefghij\", \"abcdefghi\", \"abcdefgh\", \"abcdefg\", \"abcdef\", \"abcde\", \"abcd\", \"abc\"]",
             expected: "60", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "short-encoding-of-words"
            let topic = "tries"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
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

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 2000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 2000"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 7 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 7"
                )
                return
            }

            let solution = Solution()
            let result = solution.minimumLengthEncoding(p_words)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
