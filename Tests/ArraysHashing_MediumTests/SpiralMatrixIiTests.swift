import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var counter = 1
        var directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        var directionIndex = 0
        var row = 0
        var col = 0
        while counter <= n * n {
            matrix[row][col] = counter
            counter += 1
            let nextRow = row + directions[directionIndex][0]
            let nextCol = col + directions[directionIndex][1]
            if nextRow < 0 || nextRow >= n || nextCol < 0 || nextCol >= n || matrix[nextRow][nextCol] != 0 {
                directionIndex = (directionIndex + 1) % 4
            }
            row += directions[directionIndex][0]
            col += directions[directionIndex][1]
        }
        return matrix
    }
}

@Suite struct SpiralMatrixIiTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "spiral-matrix-ii"
        let topic = "arrays-hashing"
        let testId = "d791dc99-89f6-41d0-88f6-7ea679f431fd"
        let rawInput = "n = 3"
        let expectedOutput = "[[1,2,3],[8,9,4],[7,6,5]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_n = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.generateMatrix(p_n)
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "spiral-matrix-ii"
        let topic = "arrays-hashing"
        let testId = "7b165eb5-db74-4776-b7a6-45f12eea2c30"
        let rawInput = "n = 1"
        let expectedOutput = "[[1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_n = InputParser.parseInt(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as Int: '\(params[0])'")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 20 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 20")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.generateMatrix(p_n)
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse expected output as [[Int]]")
                #expect(Bool(false), "Test \(testId): failed to parse expected output")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
            }
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
