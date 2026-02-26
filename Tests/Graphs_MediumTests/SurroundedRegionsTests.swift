import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSurroundedRegions {
    private class Solution {
        func solve(_ board: inout [[Character]]) {
            guard !board.isEmpty else { return }
            let m = board.count, n = board[0].count

            func dfs(_ i: Int, _ j: Int) {
                guard i >= 0 && i < m && j >= 0 && j < n && board[i][j] == "O" else { return }
                board[i][j] = "S"
                dfs(i+1, j); dfs(i-1, j); dfs(i, j+1); dfs(i, j-1)
            }

            // Mark border-connected O's
            for i in 0..<m {
                dfs(i, 0); dfs(i, n-1)
            }
            for j in 0..<n {
                dfs(0, j); dfs(m-1, j)
            }

            // Flip: O->X, S->O
            for i in 0..<m {
                for j in 0..<n {
                    if board[i][j] == "O" { board[i][j] = "X" }
                    else if board[i][j] == "S" { board[i][j] = "O" }
                }
            }
        }
    }

    @Suite struct SurroundedRegionsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "55fbe2cf-e4c4-4bad-a9a6-f9073312c4a7",
             input: "board = [[\"X\"]]",
             expected: "[[\"X\"]]", orderMatters: true),
            TestCaseData(id: "58aa9092-6465-4f45-8c73-3e3b0a8034af",
             input: "board = [[\"O\"]]",
             expected: "[[\"O\"]]", orderMatters: true),
            TestCaseData(id: "6ac06379-bd2c-4765-9999-a658e8ead584",
             input: "board = [[\"X\",\"O\"],[\"O\",\"X\"]]",
             expected: "[[\"X\",\"O\"],[\"O\",\"X\"]]", orderMatters: true),
            TestCaseData(id: "bd1afb4f-d58f-45fb-8723-c24ca0596072",
             input: "board = [[\"X\",\"X\"],[\"X\",\"X\"]]",
             expected: "[[\"X\",\"X\"],[\"X\",\"X\"]]", orderMatters: true),
            TestCaseData(id: "99ac8ec9-3ba7-4906-9697-c418f746ffda",
             input: "board = [[\"O\",\"O\"],[\"O\",\"O\"]]",
             expected: "[[\"O\",\"O\"],[\"O\",\"O\"]]", orderMatters: true),
            TestCaseData(id: "cd9530f0-d7d4-40ab-b7eb-548d5f632a25",
             input: "board = [[\"X\",\"O\",\"X\"],[\"O\",\"X\",\"O\"],[\"X\",\"O\",\"X\"]]",
             expected: "[[\"X\",\"O\",\"X\"],[\"O\",\"X\",\"O\"],[\"X\",\"O\",\"X\"]]", orderMatters: true),
            TestCaseData(id: "5a3953f0-27e3-415a-9d48-4e9855afe415",
             input: "board = [[\"O\",\"O\",\"O\"],[\"O\",\"O\",\"O\"],[\"O\",\"O\",\"O\"]]",
             expected: "[[\"O\",\"O\",\"O\"],[\"O\",\"O\",\"O\"],[\"O\",\"O\",\"O\"]]", orderMatters: true),
            TestCaseData(id: "e6a76ba9-30a2-40e1-86b9-7174687f3c83",
             input: "board = [[\"X\",\"X\",\"X\"],[\"X\",\"O\",\"X\"],[\"X\",\"X\",\"X\"]]",
             expected: "[[\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\"]]", orderMatters: true),
            TestCaseData(id: "6e8fbd9e-910c-4f6b-a869-ede57a87f6ad",
             input: "board = [[\"O\",\"X\",\"O\",\"X\"],[\"X\",\"O\",\"X\",\"O\"],[\"O\",\"X\",\"O\",\"X\"],[\"X\",\"O\",\"X\",\"O\"]]",
             expected: "[[\"O\",\"X\",\"O\",\"X\"],[\"X\",\"O\",\"X\",\"O\"],[\"O\",\"X\",\"O\",\"X\"],[\"X\",\"O\",\"X\",\"O\"]]", orderMatters: true),
            TestCaseData(id: "e296a302-ef57-4154-b454-d4c8a8be350c",
             input: "board = [[\"X\",\"X\",\"O\",\"O\"],[\"X\",\"X\",\"O\",\"O\"],[\"O\",\"O\",\"X\",\"X\"],[\"O\",\"O\",\"X\",\"X\"]]",
             expected: "[[\"X\",\"X\",\"O\",\"O\"],[\"X\",\"X\",\"O\",\"O\"],[\"O\",\"O\",\"X\",\"X\"],[\"O\",\"O\",\"X\",\"X\"]]", orderMatters: true),
            TestCaseData(id: "2a0a4c47-b439-4d2e-ac3b-9f29e30a047f",
             input: "board = [[\"O\",\"O\",\"X\",\"X\"],[\"O\",\"O\",\"X\",\"X\"],[\"X\",\"X\",\"O\",\"O\"],[\"X\",\"X\",\"O\",\"O\"]]",
             expected: "[[\"O\",\"O\",\"X\",\"X\"],[\"O\",\"O\",\"X\",\"X\"],[\"X\",\"X\",\"O\",\"O\"],[\"X\",\"X\",\"O\",\"O\"]]", orderMatters: true),
            TestCaseData(id: "492b9bee-718f-4a6f-883f-39b3433eff3b",
             input: "board = [[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"O\",\"O\",\"X\"],[\"X\",\"O\",\"O\",\"X\"],[\"X\",\"X\",\"X\",\"X\"]]",
             expected: "[[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"]]", orderMatters: true),
            TestCaseData(id: "8d1e5440-2340-4797-9fbb-4a698848d74c",
             input: "board = [[\"O\",\"O\",\"O\",\"O\"],[\"O\",\"X\",\"X\",\"O\"],[\"O\",\"X\",\"X\",\"O\"],[\"O\",\"O\",\"O\",\"O\"]]",
             expected: "[[\"O\",\"O\",\"O\",\"O\"],[\"O\",\"X\",\"X\",\"O\"],[\"O\",\"X\",\"X\",\"O\"],[\"O\",\"O\",\"O\",\"O\"]]", orderMatters: true),
            TestCaseData(id: "3d56b2cc-e7de-429d-9fa3-003a76e3bf1c",
             input: "board = [[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"]]",
             expected: "[[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"X\"]]", orderMatters: true),
            TestCaseData(id: "314fce62-bfda-4478-aa1d-5dcece60c80a",
             input: "board = [[\"O\",\"O\",\"O\",\"O\"],[\"O\",\"O\",\"O\",\"O\"],[\"O\",\"O\",\"O\",\"O\"],[\"O\",\"O\",\"O\",\"O\"]]",
             expected: "[[\"O\",\"O\",\"O\",\"O\"],[\"O\",\"O\",\"O\",\"O\"],[\"O\",\"O\",\"O\",\"O\"],[\"O\",\"O\",\"O\",\"O\"]]", orderMatters: true),
            TestCaseData(id: "b690d184-ae9e-4faf-a9bc-8c4b8acf6a03",
             input: "board = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "21bf8f93-27db-4102-be6a-78751f49b12c",
             input: "board = [[\"X\",\"O\",\"X\",\"X\"],[\"O\",\"X\",\"O\",\"X\"],[\"X\",\"O\",\"X\",\"O\"],[\"O\",\"X\",\"O\",\"X\"]]",
             expected: "[[\"X\",\"O\",\"X\",\"X\"],[\"O\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"O\"],[\"O\",\"X\",\"O\",\"X\"]]", orderMatters: true),
            TestCaseData(id: "230d2d3d-010c-43e7-80c7-9f596f42e982",
             input: "board = [[\"O\",\"X\",\"O\"],[\"X\",\"O\",\"X\"],[\"O\",\"X\",\"O\"]]",
             expected: "[[\"O\",\"X\",\"O\"],[\"X\",\"X\",\"X\"],[\"O\",\"X\",\"O\"]]", orderMatters: true),
            TestCaseData(id: "908ed1e2-0867-4f86-a0aa-e5dbca32a8f5",
             input: "board = [[\"X\",\"X\",\"O\"],[\"X\",\"O\",\"X\"],[\"O\",\"X\",\"X\"]]",
             expected: "[[\"X\",\"X\",\"O\"],[\"X\",\"X\",\"X\"],[\"O\",\"X\",\"X\"]]", orderMatters: true),
            TestCaseData(id: "25325a69-7cea-4de4-93f9-2d440eaf6eb5",
             input: "board = [[\"X\",\"O\",\"X\",\"O\"],[\"O\",\"X\",\"O\",\"X\"],[\"X\",\"O\",\"X\",\"O\"],[\"O\",\"X\",\"O\",\"X\"]]",
             expected: "[[\"X\",\"O\",\"X\",\"O\"],[\"O\",\"X\",\"X\",\"X\"],[\"X\",\"X\",\"X\",\"O\"],[\"O\",\"X\",\"O\",\"X\"]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "surrounded-regions"
            let topic = "graphs"
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

            guard var p_board = InputParser.parse2DCharacterArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as inout [[Character]]"
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

            let solution = Solution()
            solution.solve(&p_board)
            let computedOutput = OutputSerializer.serialize(p_board)

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
