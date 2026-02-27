import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCValidTicTacToeState {
    private class Solution {
        func validTicTacToe(_ board: [String]) -> Bool {
            let rows = board.map { Array($0) }
            var xCount = 0
            var oCount = 0
            for r in 0..<3 {
                for c in 0..<3 {
                    if rows[r][c] == "X" { xCount += 1 }
                    if rows[r][c] == "O" { oCount += 1 }
                }
            }

            if oCount > xCount { return false }
            if xCount - oCount > 1 { return false }

            func wins(_ p: Character) -> Bool {
                for i in 0..<3 {
                    if rows[i][0] == p && rows[i][1] == p && rows[i][2] == p { return true }
                    if rows[0][i] == p && rows[1][i] == p && rows[2][i] == p { return true }
                }
                if rows[0][0] == p && rows[1][1] == p && rows[2][2] == p { return true }
                if rows[0][2] == p && rows[1][1] == p && rows[2][0] == p { return true }
                return false
            }

            let xWin = wins("X")
            let oWin = wins("O")
            if xWin && oWin { return false }
            if xWin && xCount != oCount + 1 { return false }
            if oWin && xCount != oCount { return false }
            return true
        }
    }

    @Suite struct ValidTicTacToeStateTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1d3b3a57-de3f-484f-9428-c898fb7079ee",
             input: "board = [\"   \", \"   \", \"   \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fc1feaff-d614-45bd-8b60-9fe4b945f304",
             input: "board = [\"XXX\", \"XXX\", \"XXX\"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e51590fe-b2bc-4075-bf8a-3ca525e3bac7",
             input: "board = [\"OOO\", \"OOO\", \"OOO\"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0dee4de8-a6eb-40cd-bab7-aeeab167d7c6",
             input: "board = [\"XO \", \"XO \", \"XO \"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ed0984df-83a1-4b3a-a9cc-0856dfb1c423",
             input: "board = [\"X  \", \"X  \", \"X  \"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "64f85bcf-75b9-447f-a69a-508286558b51",
             input: "board = [\"O  \", \"O  \", \"O  \"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "34c6ed24-1366-498f-adc4-4e1ac97ae837",
             input: "board = [\"XXX\", \"OOO\", \"   \"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "245fc216-59dd-49dd-85f5-ccd8ee826846",
             input: "board = [\"OOO\", \"XXX\", \"   \"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3b0d9726-21b9-4b61-9652-4f9eaa3ed1d3",
             input: "board = [\"XO \", \"OXO\", \"XOX\"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7428e7df-06ef-4593-bdf9-65b92dc2c0e1",
             input: "board = [\"X  \", \"O  \", \"X  \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "72467bb3-637c-47a7-8342-eb4f93ce5f17",
             input: "board = [\"X  \", \"X  \", \"O  \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "91d43164-8ee7-44b5-9b59-da31b92fbc4f",
             input: "board = [\"X  \", \"O  \", \"XO \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3ed34235-b9a0-40cf-8152-952ff966e3ef",
             input: "board = [\"O  \", \"X  \", \"OX \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "12636ea9-0537-4820-be7b-f5aecbc4f09c",
             input: "board = [\"OX \", \"OX \", \"OX \"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "99e0a639-3442-4beb-8edc-cc6b77fb6a46",
             input: "board = [\"X  \", \"O  \", \"   \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2478c7c2-4060-46af-b05e-b31f0cf4e6c8",
             input: "board = [\"O  \", \"X  \", \"   \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8fc57c5b-218b-4114-a44c-6d1c8e8666a0",
             input: "board = [\"   \", \"X  \", \"O  \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6f80495e-ebaf-4908-92c8-8ea50d85a58b",
             input: "board = [\"   \", \"O  \", \"X  \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a00ad68d-220c-4646-b038-164ebce90d1c",
             input: "board = [\"X  \", \"   \", \"O  \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "573f4ed0-f6d8-4e5f-9989-8769f23ec603",
             input: "board = [\"O  \", \"   \", \"X  \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ba32ffd7-4f41-417a-9873-031faeb829d2",
             input: "board = [\"X  \", \"   \", \"   \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "edfcd782-7598-4384-b2c7-2c276b0bd225",
             input: "board = [\"   \", \"X  \", \"   \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c36d2e9f-4938-48f0-893f-dd18dff3c2da",
             input: "board = [\"   \", \"   \", \"X  \"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "351e3484-0a00-4a13-a072-3712b7e0a6a1",
             input: "board = [\"XXX\", \"   \", \"   \"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4e78f862-b244-40cd-9e44-8686da231a9b",
             input: "board = [\"OOO\", \"   \", \"   \"]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "valid-tic-tac-toe-state"
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

            guard let p_board = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_board.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: board array too large (\(p_board.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_board.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: board.length == 3"
                )
                return
            }
            guard p_board.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: board[i].length == 3"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.validTicTacToe(p_board)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
