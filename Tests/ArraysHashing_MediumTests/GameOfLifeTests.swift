import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGameOfLife {
    private class Solution {
        func gameOfLife(_ board: inout [[Int]]) {
            let rows = board.count
            let cols = board.first?.count ?? 0
            guard rows > 0, cols > 0 else { return }

            let dirs = [
                (-1, -1), (-1, 0), (-1, 1),
                (0, -1),           (0, 1),
                (1, -1),  (1, 0),  (1, 1)
            ]

            func liveNeighbors(_ r: Int, _ c: Int) -> Int {
                var count = 0
                for (dr, dc) in dirs {
                    let nr = r + dr
                    let nc = c + dc
                    if nr >= 0, nr < rows, nc >= 0, nc < cols {
                        // 1 or -1 means the cell was originally live.
                        if board[nr][nc] == 1 || board[nr][nc] == -1 {
                            count += 1
                        }
                    }
                }
                return count
            }

            for r in 0..<rows {
                for c in 0..<cols {
                    let neighbors = liveNeighbors(r, c)
                    if board[r][c] == 1 {
                        if neighbors < 2 || neighbors > 3 {
                            board[r][c] = -1
                        }
                    } else {
                        if neighbors == 3 {
                            board[r][c] = 2
                        }
                    }
                }
            }

            for r in 0..<rows {
                for c in 0..<cols {
                    if board[r][c] > 0 {
                        board[r][c] = 1
                    } else {
                        board[r][c] = 0
                    }
                }
            }
        }
    }

    @Suite struct GameOfLifeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7ef5faa7-7dc4-4de0-82be-8aa102442f52",
             input: "board = [[1]]",
             expected: "[[0]]", orderMatters: true),
            TestCaseData(id: "4c4dec82-cd95-40af-a929-47be875457e0",
             input: "board = [[0]]",
             expected: "[[0]]", orderMatters: true),
            TestCaseData(id: "a426be8c-9c63-44c4-a087-c9d826fd5163",
             input: "board = [[1,1],[1,1]]",
             expected: "[[1,1],[1,1]]", orderMatters: true),
            TestCaseData(id: "fae78eec-8313-4e44-84c4-052870bf5005",
             input: "board = [[0,0],[0,0]]",
             expected: "[[0,0],[0,0]]", orderMatters: true),
            TestCaseData(id: "7cd8b0b5-4e66-4e99-84be-a2020d3662d6",
             input: "board = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "[[1,0,1],[0,0,0],[1,0,1]]", orderMatters: true),
            TestCaseData(id: "40e2fc8d-6849-42e4-a8ba-bbddd72cab1f",
             input: "board = [[0,0,0],[0,0,0],[0,0,0]]",
             expected: "[[0,0,0],[0,0,0],[0,0,0]]", orderMatters: true),
            TestCaseData(id: "747a708e-fdcb-49c0-bc22-e559761088b8",
             input: "board = [[1,0],[0,1]]",
             expected: "[[0,0],[0,0]]", orderMatters: true),
            TestCaseData(id: "1924f6d9-b487-47b4-a5cb-58226521b515",
             input: "board = [[0,1],[1,0]]",
             expected: "[[0,0],[0,0]]", orderMatters: true),
            TestCaseData(id: "a39b9511-cad1-482e-bf7e-db628f794239",
             input: "board = [[1,0,1],[0,1,0],[1,0,1]]",
             expected: "[[0,1,0],[1,0,1],[0,1,0]]", orderMatters: true),
            TestCaseData(id: "94e118ec-36f0-4d8c-a2fa-f5687572e485",
             input: "board = [[0,1,0],[0,0,1],[1,1,1]]",
             expected: "[[0,0,0],[1,0,1],[0,1,1]]", orderMatters: true),
            TestCaseData(id: "65933426-eeda-4f97-a0db-a7710101780b",
             input: "board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]",
             expected: "[[0,0,0],[1,0,1],[0,1,1],[0,1,0]]", orderMatters: true),
            TestCaseData(id: "6b373aeb-6d6c-4f11-b99a-1d2d20da01a3",
             input: "board = [[1,1],[1,0]]",
             expected: "[[1,1],[1,1]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "game-of-life"
            let topic = "arrays-hashing"
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

            guard var p_board = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as inout [[Int]]"
                )
                return
            }
            guard p_board.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_board.count >= 1 && p_board.count <= 25 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 25"
                )
                return
            }

            let solution = Solution()
            let didCrash = withCrashGuard {
                solution.gameOfLife(&p_board)
            }
            guard !didCrash else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serialize(p_board)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
