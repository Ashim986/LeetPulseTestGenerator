import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func countBattleships(_ board: [[Character]]) -> Int {
        guard !board.isEmpty else { return 0 }
        let rows = board.count
        let cols = board[0].count
        var count = 0
        for r in 0..<rows {
            for c in 0..<cols {
                guard board[r][c] == "X" else { continue }
                if r > 0, board[r - 1][c] == "X" { continue }
                if c > 0, board[r][c - 1] == "X" { continue }
                count += 1
            }
        }
        return count
    }
}

@Suite struct BattleshipsInABoardTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "6dfe274a-7680-47c0-9db4-7e589d9845af"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"]]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "83de5f1d-b8b0-4536-8652-2738cc27978f"
        let rawInput = "board = [[\"X\",\"X\",\".\",\".\"]]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_2() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "9104febe-35e0-49f6-aeae-4636c47b22bc"
        let rawInput = "board = [[\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_3() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "439bad17-fe3d-4607-a449-5a3b649bfb9e"
        let rawInput = "board = [[\"X\",\".\",\".\",\"X\"], [\".\",\".\",\".\",\".\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_4() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "8dceeb1a-08a0-41aa-8e36-ca077a68b77a"
        let rawInput = "board = [[\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_5() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "1b4d96f9-c329-4a6c-876d-21b69e379b0d"
        let rawInput = "board = [[\"X\",\"X\",\"X\",\"X\"]]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_6() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "57c45274-0479-4e64-8d86-b0ca8eb4bd05"
        let rawInput = "board = [[\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_7() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "c85272f4-28d4-4343-8fd3-5111fb7ba3ad"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_8() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "2341e7a8-ca6e-4c3c-a4f1-64eaf65c7e98"
        let rawInput = "board = [[\"X\",\"X\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_9() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "617961eb-8c28-4367-9442-90fa321c8f90"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_10() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "37f3ea39-b4c3-4a89-8417-de53144f600c"
        let rawInput = "board = [[\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_11() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "a4449325-5518-4158-b737-0a47104c8210"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_12() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "9d990c28-f509-44af-a33a-de7bae751ca7"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_13() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "d278706c-8fa6-4b88-a32b-96f7185b85da"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_14() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "ef802a12-a9db-466d-8891-780b7b8e855c"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_15() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "86c9bc5f-3190-44d6-aed1-4ae12695d2cc"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_16() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "b89c49cc-ef10-44c0-bfc5-17f7d7c5fc2c"
        let rawInput = "board = [[\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_17() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "524fff90-0560-4ff6-8b3f-f301900f2c44"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_18() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "b57890f2-3b1e-4673-879b-24454d642e10"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_19() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "72ae6109-83c7-4297-a8c9-8b533c268a9e"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_20() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "8d49c3fc-2ae8-411a-9e8e-e6dfc8f3525c"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_21() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "5e3969d2-4ae4-46a8-92db-b13d8122620d"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_22() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "d502aeec-1490-4766-b668-196aee8000e4"
        let rawInput = "board = [[\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_23() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "3601e4d2-38db-4817-94a6-34eea9bc0f33"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_24() async {
        let slug = "battleships-in-a-board"
        let topic = "arrays-hashing"
        let testId = "961b95b3-b273-4c88-9740-f151909aec65"
        let rawInput = "board = [[\"X\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\".\"] , [\".\",\".\",\".\",\"X\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_board = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_board.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.countBattleships(p_board)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
