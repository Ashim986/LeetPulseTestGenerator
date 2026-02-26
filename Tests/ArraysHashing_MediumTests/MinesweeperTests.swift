import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinesweeper {
    private class Solution {
        func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
            let (x, y) = (click[0], click[1])
            let directions = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
            var board = board
            if board[x][y] == "M" {
                board[x][y] = "X"
                return board
            }
            var queue = [(x, y)]
            board[x][y] = "B"
            while !queue.isEmpty {
                let (currX, currY) = queue.removeFirst()
                for dir in directions {
                    let newX = currX + dir[0]
                    let newY = currY + dir[1]
                    if newX >= 0 && newX < board.count && newY >= 0 && newY < board[0].count {
                        if board[newX][newY] == "E" {
                            var count = 0
                            for dir2 in directions {
                                let newX2 = newX + dir2[0]
                                let newY2 = newY + dir2[1]
                                if newX2 >= 0 && newX2 < board.count && newY2 >= 0 && newY2 < board[0].count && board[newX2][newY2] == "M" {
                                    count += 1
                                }
                            }
                            if count > 0 {
                                board[newX][newY] = Character(String(count))
                            } else {
                                board[newX][newY] = "B"
                                queue.append((newX, newY))
                            }
                        }
                    }
                }
            }
            return board
        }
    }

    @Suite struct MinesweeperTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7c757f75-f01f-4ac9-b93f-da01d7f09ef4",
             input: "board = [[\"E\",\"E\",\"E\"],[\"E\",\"M\",\"E\"],[\"E\",\"E\",\"E\"]], click = [1,1]",
             expected: "[[\"E\",\"E\",\"E\"],[\"E\",\"X\",\"E\"],[\"E\",\"E\",\"E\"]]", orderMatters: true),
            TestCaseData(id: "b9294280-f462-43e8-92b6-4e89456aac44",
             input: "board = [[\"E\",\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\",\"E\"]], click = [3,3]",
             expected: "[[\"B\",\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "14022e8d-dcbb-4d06-b730-c7d36ff0bd1a",
             input: "board = [[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"]], click = [2,2]",
             expected: "[[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "8c763235-bd08-4cb0-9a82-4de170acdad6",
             input: "board = [[\"E\",\"E\"],[\"E\",\"E\"]], click = [1,1]",
             expected: "[[\"B\",\"B\"],[\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "fd0f16ef-92a8-4127-b580-a75a1dd9a7c6",
             input: "board = [[\"E\",\"E\"],[\"E\",\"E\"]], click = [0,1]",
             expected: "[[\"B\",\"B\"],[\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "5167c490-29d3-4590-9c0e-a561db80cd87",
             input: "board = [[\"E\",\"E\"],[\"E\",\"E\"]], click = [1,0]",
             expected: "[[\"B\",\"B\"],[\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "e7a3c03d-444b-42ce-85ee-a0246701f0c9",
             input: "board = [[\"E\",\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\",\"E\"]], click = [0,3]",
             expected: "[[\"B\",\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "81af00b4-0b14-48c4-9644-5c613ea289e3",
             input: "board = [[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"]], click = [0,2]",
             expected: "[[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "0f6d02b9-fe44-453d-9bc9-f7e3d0e22586",
             input: "board = [[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"]], click = [1,0]",
             expected: "[[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "65ccde4a-a358-43fd-b899-da961d62bc5e",
             input: "board = [[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"]], click = [2,0]",
             expected: "[[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "df772e5c-3f54-4169-9d78-efc5ca9cfd90",
             input: "board = [[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"]], click = [2,1]",
             expected: "[[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "f8d7be0c-68b7-4889-bfa9-027942c4227d",
             input: "board = [[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"]], click = [0,1]",
             expected: "[[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "7ed79344-c75f-4dcc-896c-00276ff7f416",
             input: "board = [[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\"]], click = [1,2]",
             expected: "[[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"],[\"B\",\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "bbb534b6-0680-4618-b5b0-eea2449723ff",
             input: "board = [[\"E\",\"E\",\"E\"],[\"E\",\"M\",\"E\"],[\"E\",\"E\",\"E\"]], click = [0,0]",
             expected: "[[\"1\",\"E\",\"E\"],[\"E\",\"M\",\"E\"],[\"E\",\"E\",\"E\"]]", orderMatters: true),
            TestCaseData(id: "8efad0f1-4628-4038-8adf-5d6eac80168d",
             input: "board = [[\"E\",\"E\",\"E\",\"E\",\"E\"],[\"E\",\"E\",\"M\",\"E\",\"E\"],[\"E\",\"E\",\"E\",\"E\",\"E\"],[\"E\",\"E\",\"E\",\"E\",\"E\"]"
                + "], click = [3,0]",
             expected: "[[\"B\",\"1\",\"E\",\"1\",\"B\"],[\"B\",\"1\",\"M\",\"1\",\"B\"],[\"B\",\"1\",\"1\",\"1\",\"B\"],[\"B\",\"B\",\"B\",\"B\",\"B\"]]", orderMatters: true),
            TestCaseData(id: "bdabe930-62e2-45f6-8058-3a56dcf47e2c",
             input: "board = [[\"B\",\"1\",\"E\",\"1\",\"B\"],[\"B\",\"1\",\"M\",\"1\",\"B\"],[\"B\",\"1\",\"1\",\"1\",\"B\"],[\"B\",\"B\",\"B\",\"B\",\"B\"]"
                + "], click = [1,2]",
             expected: "[[\"B\",\"1\",\"E\",\"1\",\"B\"],[\"B\",\"1\",\"X\",\"1\",\"B\"],[\"B\",\"1\",\"1\",\"1\",\"B\"],[\"B\",\"B\",\"B\",\"B\",\"B\"]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minesweeper"
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
            guard let p_click = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_click.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: click array too large (\(p_click.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_click.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: click.length == 2"
                )
                return
            }

            let solution = Solution()
            let result = solution.updateBoard(p_board, p_click)
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
