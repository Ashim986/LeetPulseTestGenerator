import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCWordSearch {
    private class Solution {
        func exist(_ board: [[Character]], _ word: String) -> Bool {
            var board = board
            let m = board.count, n = board[0].count
            let word = Array(word)

            func dfs(_ i: Int, _ j: Int, _ k: Int) -> Bool {
                if k == word.count { return true }
                if i < 0 || i >= m || j < 0 || j >= n || board[i][j] != word[k] {
                    return false
                }

                let temp = board[i][j]
                board[i][j] = "#"  // Mark visited

                let found = dfs(i+1, j, k+1) || dfs(i-1, j, k+1) ||
                            dfs(i, j+1, k+1) || dfs(i, j-1, k+1)

                board[i][j] = temp  // Backtrack
                return found
            }

            for i in 0..<m {
                for j in 0..<n {
                    if dfs(i, j, 0) { return true }
                }
            }
            return false
        }
    }

    @Suite struct WordSearchTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7a81d5c1-7718-4dba-b8eb-e41d27849ccd",
             input: "board = [['A']], word = 'A'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "281a2abb-1869-465d-bcf1-acc0c5906024",
             input: "board = [['A']], word = 'B'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "82fd03ad-4898-454c-98dc-9fa156413a3b",
             input: "board = [['A','B']], word = 'AB'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a4da1292-c512-4d1c-b0c2-2c3edc8306d4",
             input: "board = [['A'],['B']], word = 'AB'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5e80a04c-8731-49a2-bdb6-e98ba0577ef4",
             input: "board = [['A','B','C'],['D','E','F']], word = 'ABC'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "93afab7e-daad-4f8a-afc6-894fd34407f4",
             input: "board = [['A','B','C'],['D','E','F']], word = 'DEF'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "76c9cbbc-3dc5-4a16-b40a-e34b2b1df82b",
             input: "board = [['A','B','C'],['D','E','F']], word = 'ABF'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9aa5b111-4179-4370-878d-392bf7ce3820",
             input: "board = [['A','B','C'],['D','E','F']], word = 'FED'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3f464670-6cdc-4b4f-bfad-1ce11539d338",
             input: "board = [['A','B','C'],['D','E','F']], word = 'ABCDEF'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b462d23d-a0e3-4ab0-a3dc-6c864b8c0663",
             input: "board = [['A','A','A'],['A','A','A']], word = 'AAA'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "96be541d-dd99-4fd4-b371-cf80fe0fe041",
             input: "board = [['A','B','C'],['D','E','F']], word = ''",
             expected: "true", orderMatters: true),
            TestCaseData(id: "340c2b80-5444-4e6d-998a-e76005fa1068",
             input: "board = [], word = 'A'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4504e33b-d560-4e93-ab9f-e3cb1b7f610e",
             input: "board = [['A']], word = ''",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0c84dff3-4d53-4dee-a21f-82ea2587cde2",
             input: "board = [['A','B','C'],['D','E','F']], word = 'ABCDEFG'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "46fab3c9-7cb1-4502-ad1e-ab4e73416ce6",
             input: "board = [['A','B','C'],['D','E','F']], word = 'GFEDCBA'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "75196446-ce86-4948-b895-b3f6fa980362",
             input: "board = [['A','B','C'],['D','E','F']], word = 'Z'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "398dada8-62d3-4252-94e3-ebac0f233a5b",
             input: "board = [['A','B','C'],['D','E','F']], word = 'ABCZ'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6b66a6e5-7210-4031-af60-916664480d4e",
             input: "board = [['A','B','C'],['D','E','F']], word = 'ZABC'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "35558d62-2deb-4940-9748-95ba8d6d24f7",
             input: "board = [['A','B','C'],['D','E','F']], word = 'ABCABC'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e2dcf51a-03c7-429c-a0e5-1b0744338586",
             input: "board = [['A','B','C'],['D','E','F'],['G','H','I']], word = 'ABC'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f988dbe3-f436-4d26-85da-b16192472252",
             input: "board = [['A','B','C'],['D','E','F'],['G','H','I']], word = 'DEF'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ef8558c9-7e33-414c-8dd9-f20b2b427e36",
             input: "board = [['A','B','C'],['D','E','F'],['G','H','I']], word = 'GHI'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8f9d9db5-1dce-40b2-9c3c-cf1b060e6fa1",
             input: "board = [['A','B','C'],['D','E','F'],['G','H','I']], word = 'ADG'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7a9337b1-3acc-4146-b55c-628c3b8a9d1c",
             input: "board = [['A','B','C'],['D','E','F'],['G','H','I']], word = 'CEG'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8fabb779-44e4-46b6-9be2-f29b60cd3b6a",
             input: "board = [['A','B','C'],['D','E','F'],['G','H','I']], word = 'ABCDEF'",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "word-search"
            let topic = "backtracking"
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
            let p_word = InputParser.parseString(params[1])
            guard p_word.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: word string too long (\(p_word.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_word.count >= 1 && p_word.count <= 15 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= word.length <= 15"
                )
                return
            }

            let solution = Solution()
            let result = solution.exist(p_board, p_word)
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
