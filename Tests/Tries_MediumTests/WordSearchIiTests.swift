import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCWordSearchIi {
    private class Solution {
        func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
            class TrieNode {
                var children: [TrieNode?] = Array(repeating: nil, count: 26)
                var word: String? = nil
            }

            let root = TrieNode()
            for word in words {
                var node = root
                for char in word {
                    let index = Int(char.asciiValue.unsafelyUnwrapped - Character("a").asciiValue.unsafelyUnwrapped)
                    if node.children[index] == nil { node.children[index] = TrieNode() }
                    node = node.children[index].unsafelyUnwrapped
                }
                node.word = word
            }

            var board = board
            let rows = board.count
            let cols = board.first?.count ?? 0
            var results: [String] = []
            let dirs = [(1,0),(-1,0),(0,1),(0,-1)]

            func dfs(_ r: Int, _ c: Int, _ node: TrieNode) {
                let char = board[r][c]
                let index = Int(char.asciiValue.unsafelyUnwrapped - Character("a").asciiValue.unsafelyUnwrapped)
                guard let next = node.children[index] else { return }

                if let word = next.word {
                    results.append(word)
                    next.word = nil
                }

                board[r][c] = "#"
                for (dr, dc) in dirs {
                    let nr = r + dr
                    let nc = c + dc
                    if nr >= 0, nr < rows, nc >= 0, nc < cols, board[nr][nc] != "#" {
                        dfs(nr, nc, next)
                    }
                }
                board[r][c] = char
            }

            for r in 0..<rows {
                for c in 0..<cols {
                    dfs(r, c, root)
                }
            }
            return results
        }
    }

    @Suite struct WordSearchIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "cd27884b-858b-4ba7-a615-dd6285e0c234",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"abcb\"]']]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "6aeb520f-79f8-405d-a32e-da4dfa22a52a",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"a\"],[\"a\",\"a\"]]', '[\"aa\"]']]",
             expected: "[\"aa\"]", orderMatters: true),
            TestCaseData(id: "1f8a4631-cb6d-49c5-994b-acaf6071dd58",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"abcd\"]']]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "0807e892-86af-488b-8784-fede3b1e85c8",
             input: "[['WordSearch', 'find'], ['[[\"o\",\"a\"],[\"e\",\"t\"]]', '[\"oath\",\"pea\"]']]",
             expected: "[\"oath\"]", orderMatters: true),
            TestCaseData(id: "d0e7d60c-1e09-4b35-81a3-b5b6284c38ef",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"ab\",\"cd\"]']]",
             expected: "[\"ab\",\"cd\"]", orderMatters: true),
            TestCaseData(id: "d7077ff5-44e6-4dff-8502-600d9398a677",
             input: "[['WordSearch', 'find'], ['[[\"a\"],[\"b\"]]', '[\"ab\"]']]",
             expected: "[\"ab\"]", orderMatters: true),
            TestCaseData(id: "00025565-5d45-4c71-b6b6-4c934bf4ef5b",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"abc\"]']]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "8d5a91d2-a1d1-4661-ad60-5a0695c6f0a8",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"a\"],[\"a\",\"a\"]]', '[\"aaaa\"]']]",
             expected: "[\"aaaa\"]", orderMatters: true),
            TestCaseData(id: "6b90ced9-cab0-4284-b0eb-e9e64a8eda06",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"abcd\",\"ab\"]']]",
             expected: "[\"ab\"]", orderMatters: true),
            TestCaseData(id: "c7b8ae10-65c6-4a23-a124-b3f6fa36fe23",
             input: "[['WordSearch', 'find'], ['[[\"o\",\"a\",\"a\",\"n\"],[\"e\",\"t\",\"a\",\"e\"],[\"i\",\"h\",\"k\",\"r\"],[\"i\",\"f\",\"l\",\"v\"]]', '"
                + "[\"oath\",\"pea\",\"eat\",\"rain\"]']]",
             expected: "[\"oath\",\"eat\"]", orderMatters: true),
            TestCaseData(id: "1fcd3c10-5492-4e9e-b070-ec5a495b7900",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"ab\",\"cd\",\"abcd\"]']]",
             expected: "[\"ab\",\"abcd\",\"cd\"]", orderMatters: true),
            TestCaseData(id: "557a95ec-2e42-4e46-a079-444a9ee68619",
             input: "[['WordSearch', 'find'], ['[[\"a\"],[\"b\"],[\"c\"]]', '[\"abc\"]']]",
             expected: "[\"abc\"]", orderMatters: true),
            TestCaseData(id: "232e10e9-e905-4682-8a63-1bebce522510",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"ab\",\"cd\",\"abc\"]']]",
             expected: "[\"abc\",\"ab\",\"cd\"]", orderMatters: true),
            TestCaseData(id: "6b74252d-27bd-486a-b60f-b89bf2532f79",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"a\"],[\"a\",\"a\"]]', '[\"aaaa\",\"aa\"]']]",
             expected: "[\"aa\",\"aaaa\"]", orderMatters: true),
            TestCaseData(id: "6d184e14-927d-478c-be5a-3bc6cd3419a4",
             input: "[['WordSearch', 'find'], ['[[\"o\",\"a\",\"a\",\"n\"],[\"e\",\"t\",\"a\",\"e\"],[\"i\",\"h\",\"k\",\"r\"],[\"i\",\"f\",\"l\",\"v\"]]', '"
                + "[\"oath\",\"pea\",\"eat\",\"rain\",\"o\"]']]",
             expected: "[\"o\",\"oath\",\"eat\",\"rain\"]", orderMatters: true),
            TestCaseData(id: "7af2bb03-1ca9-453d-92fe-14c132997cf1",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"ab\",\"cd\",\"abcd\",\"abc\"]']]",
             expected: "[\"ab\",\"abcd\",\"abc\",\"cd\"]", orderMatters: true),
            TestCaseData(id: "b2fc5fa7-95bf-4a96-b8d6-4dbc85f57600",
             input: "[['WordSearch', 'find'], ['[[\"a\"],[\"b\"],[\"c\"]]', '[\"abc\",\"ab\"]']]",
             expected: "[\"abc\",\"ab\"]", orderMatters: true),
            TestCaseData(id: "a1ca6268-ab48-49e3-b92c-0321ec8d7347",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"ab\",\"cd\",\"abc\",\"abcd\"]']]",
             expected: "[\"ab\",\"abcd\",\"abc\",\"cd\"]", orderMatters: true),
            TestCaseData(id: "819f617b-1788-4b06-9e9d-fc3089efcb17",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"a\"],[\"a\",\"a\"]]', '[\"aaaa\",\"aa\",\"a\"]']]",
             expected: "[\"a\",\"aa\",\"aaaa\"]", orderMatters: true),
            TestCaseData(id: "3e3b92ad-0b3e-4297-9c71-37f17a38bcc4",
             input: "[['WordSearch', 'find'], ['[[\"o\",\"a\",\"a\",\"n\"],[\"e\",\"t\",\"a\",\"e\"],[\"i\",\"h\",\"k\",\"r\"],[\"i\",\"f\",\"l\",\"v\"]]', '"
                + "[\"oath\",\"pea\",\"eat\",\"rain\",\"o\",\"oa\"]']]",
             expected: "[\"o\",\"oa\",\"oath\",\"eat\",\"rain\"]", orderMatters: true),
            TestCaseData(id: "ad4156a7-ea2b-475d-942f-38f8a62b836b",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"ab\",\"cd\",\"abcd\",\"abc\",\"ab\"]']]",
             expected: "[\"ab\",\"abc\",\"abcd\",\"cd\"]", orderMatters: true),
            TestCaseData(id: "4f85aaf2-0006-4b57-bcfe-10860303b321",
             input: "[['WordSearch', 'find'], ['[[\"a\"],[\"b\"],[\"c\"]]', '[\"abc\",\"ab\",\"a\"]']]",
             expected: "[\"a\",\"ab\",\"abc\"]", orderMatters: true),
            TestCaseData(id: "08efcf6f-b519-4682-aef8-553663144ff5",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"b\"],[\"c\",\"d\"]]', '[\"ab\",\"cd\",\"abc\",\"abcd\",\"ab\",\"a\"]']]",
             expected: "[\"a\",\"ab\",\"abc\",\"abcd\",\"cd\"]", orderMatters: true),
            TestCaseData(id: "2f085e05-bd87-43a0-ac9d-9f72bc3afd3d",
             input: "[['WordSearch', 'find'], ['[[\"a\",\"a\"],[\"a\",\"a\"]]', '[\"aaaa\",\"aa\",\"a\",\"aaaaa\"]']]",
             expected: "[\"a\",\"aa\",\"aaaa\"]", orderMatters: true),
            TestCaseData(id: "4f411bba-3435-4b60-b641-6dd4b0ee93f5",
             input: "[['WordSearch', 'find'], ['[[\"o\",\"a\",\"a\",\"n\"],[\"e\",\"t\",\"a\",\"e\"],[\"i\",\"h\",\"k\",\"r\"],[\"i\",\"f\",\"l\",\"v\"]]', '"
                + "[\"oath\",\"pea\",\"eat\",\"rain\",\"o\",\"oa\",\"oat\"]']]",
             expected: "[\"oath\",\"o\",\"oa\",\"oat\",\"eat\",\"pea\",\"rain\"]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "word-search-ii"
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

            guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Character]]"
                )
                return
            }
            guard p_board.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))"
                )
                return
            }
            guard let p_words = InputParser.parseStringArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [String]"
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
            guard p_words.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 3 * 104"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 10"
                )
                return
            }

            let solution = Solution()
            let result = solution.findWords(p_board, p_words)
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
