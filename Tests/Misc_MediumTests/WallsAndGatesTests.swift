import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func wallsAndGates(_ rooms: inout [[Int]]) {
        let m = rooms.count, n = rooms[0].count
        let INF = 2147483647
        var queue: [(Int, Int)] = []

        for i in 0..<m {
            for j in 0..<n {
                if rooms[i][j] == 0 { queue.append((i, j)) }
            }
        }

        let dirs = [(0,1),(0,-1),(1,0),(-1,0)]
        while !queue.isEmpty {
            let (i, j) = queue.removeFirst()
            for (di, dj) in dirs {
                let ni = i + di, nj = j + dj
                if ni >= 0 && ni < m && nj >= 0 && nj < n && rooms[ni][nj] == INF {
                    rooms[ni][nj] = rooms[i][j] + 1
                    queue.append((ni, nj))
                }
            }
        }
    }
}

@Suite struct WallsAndGatesTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "a6901204-7cd0-4775-b1bc-9d52064cedc1"
        let rawInput = "rooms = [[0]]"
        let expectedOutput = "[[0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "c48b58fe-907e-4fef-aa35-1edaa51a8a35"
        let rawInput = "rooms = [[-1]]"
        let expectedOutput = "[[-1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_2() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "23d03cca-eed4-433f-b864-0913fbae374c"
        let rawInput = "rooms = [[2147483647]]"
        let expectedOutput = "[[2147483647]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_3() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "2e1111b1-5691-42f6-ba40-4b95ce6865f4"
        let rawInput = "rooms = [[-1, 0], [0, -1]]"
        let expectedOutput = "[[-1, 0], [0, -1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_4() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "e6b2b2a8-3ad7-48de-8c32-44cfcb7b6812"
        let rawInput = "rooms = [[2147483647, -1], [-1, 2147483647]]"
        let expectedOutput = "[[2147483647, -1], [-1, 2147483647]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_5() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "22c1903b-3216-4e77-96e4-aebcdbd70d58"
        let rawInput = "rooms = [[0, 0], [0, 0]]"
        let expectedOutput = "[[0, 0], [0, 0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_6() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "36a126e8-200a-4276-a8a7-5a07fa2bb518"
        let rawInput = "rooms = [[-1, -1], [-1, -1]]"
        let expectedOutput = "[[-1, -1], [-1, -1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_7() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "bb225406-e058-4762-86de-3774a160d08b"
        let rawInput = "rooms = [[2147483647, 2147483647], [2147483647, 2147483647]]"
        let expectedOutput = "[[2147483647, 2147483647], [2147483647, 2147483647]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_8() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "70b76d05-8a9b-43e5-b200-370011a158b4"
        let rawInput = "rooms = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]"
        let expectedOutput = "[[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_9() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "1d3a35bf-5f47-472b-8522-dc3af281b784"
        let rawInput = "rooms = [[-1, -1], [-1, -1], [-1, -1], [-1, -1], [-1, -1]]"
        let expectedOutput = "[[-1, -1], [-1, -1], [-1, -1], [-1, -1], [-1, -1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_10() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "1a6513de-ccdf-44ca-bf03-53ca987fe8a6"
        let rawInput = "rooms = [[2147483647, 2147483647], [2147483647, 2147483647], [2147483647, 2147483647], [2147483647, 2147483647], [2147483647, 2147483647]]"
        let expectedOutput = "[[2147483647, 2147483647], [2147483647, 2147483647], [2147483647, 2147483647], [2147483647, 2147483647], [2147483647, 2147483647]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_11() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "ed0bfa2e-4079-4974-a0e3-d95abc89f993"
        let rawInput = "rooms = [[-1, 0, -1, 0, -1, 0], [0, -1, 0, -1, 0, -1], [-1, 0, -1, 0, -1, 0], [0, -1, 0, -1, 0, -1], [-1, 0, -1, 0, -1, 0], [0, -1, 0, -1, 0, -1]]"
        let expectedOutput = "[[-1, 0, -1, 0, -1, 0], [0, -1, 0, -1, 0, -1], [-1, 0, -1, 0, -1, 0], [0, -1, 0, -1, 0, -1], [-1, 0, -1, 0, -1, 0], [0, -1, 0, -1, 0, -1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_12() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "c72cd3a9-c6ae-4eed-b0c7-4fd66074b7b0"
        let rawInput = "rooms = [[0, -1], [-1, 0]]"
        let expectedOutput = "[[0,-1],[-1,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_13() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "4c543fe9-7e65-4889-8053-aa8bc41621c3"
        let rawInput = "rooms = [[0, -1, 0], [-1, 0, -1], [0, -1, 0]]"
        let expectedOutput = "[[0,-1,0],[-1,0,-1],[0,-1,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_14() async {
        let slug = "walls-and-gates"
        let topic = "misc"
        let testId = "a4b44692-5bdf-43eb-9f93-415a7a7c5153"
        let rawInput = "rooms = [[0, -1, 0, -1, 0, -1], [-1, 0, -1, 0, -1, 0], [0, -1, 0, -1, 0, -1], [-1, 0, -1, 0, -1, 0], [0, -1, 0, -1, 0, -1], [-1, 0, -1, 0, -1, 0]]"
        let expectedOutput = "[[0,-1,0,-1,0,-1],[-1,0,-1,0,-1,0],[0,-1,0,-1,0,-1],[-1,0,-1,0,-1,0],[0,-1,0,-1,0,-1],[-1,0,-1,0,-1,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard var p_rooms = InputParser.parse2DIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as inout [[Int]]: '\(params[0])'")
            return
        }
        guard p_rooms.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            solution.wallsAndGates(&p_rooms)
            let computedOutput = OutputSerializer.serialize(p_rooms)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
