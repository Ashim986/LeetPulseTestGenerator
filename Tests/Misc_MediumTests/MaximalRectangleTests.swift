import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty { return 0 }
        let m = matrix.count, n = matrix[0].count
        var heights = [Int](repeating: 0, count: n)
        var maxArea = 0

        func largestRect(_ h: [Int]) -> Int {
            var stack: [Int] = []
            var h = h + [0]
            var area = 0
            for i in 0..<h.count {
                while !stack.isEmpty && h[i] < h[stack.last!] {
                    let height = h[stack.removeLast()]
                    let width = stack.isEmpty ? i : i - stack.last! - 1
                    area = max(area, height * width)
                }
                stack.append(i)
            }
            return area
        }

        for i in 0..<m {
            for j in 0..<n {
                heights[j] = matrix[i][j] == "1" ? heights[j] + 1 : 0
            }
            maxArea = max(maxArea, largestRect(heights))
        }
        return maxArea
    }
}

@Suite struct MaximalRectangleTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "76fcdc62-84ea-4c8e-9c80-4185d90fa688"
        let rawInput = "matrix = [[\"1\"]]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_1() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "0a7b67c9-23df-4292-9dff-3261ed3d323c"
        let rawInput = "matrix = [[\"0\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_2() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "0bf40eb5-70f4-4787-bb1e-0da4445117ad"
        let rawInput = "matrix = [[\"1\",\"0\"],[\"1\",\"0\"]]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_3() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "211ac7b9-8d18-415f-939f-5716eebe2f1d"
        let rawInput = "matrix = [[\"0\",\"0\"],[\"0\",\"0\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_4() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "7d095fa4-d4e9-4848-89e6-ceeaa183ac16"
        let rawInput = "matrix = [[\"1\",\"1\"],[\"1\",\"1\"]]"
        let expectedOutput = "4"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_5() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "4605c1b9-3a82-4daa-b190-e753e1360c28"
        let rawInput = "matrix = [[\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\"]]"
        let expectedOutput = "9"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_6() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "44c30390-e4e9-4bcb-bbb3-85172ec965d6"
        let rawInput = "matrix = [[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_7() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "1cecab09-a9f3-4931-9d18-cc06389f61ec"
        let rawInput = "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]"
        let expectedOutput = "15"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_8() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "ca7db707-0833-42f1-b152-3c45f61ada75"
        let rawInput = "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_9() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "e7a26634-5e0b-4cf5-a1e1-563e2f1a8f62"
        let rawInput = "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]"
        let expectedOutput = "20"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_10() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "f3a9a716-3e75-4ee1-af08-4d5765b8032e"
        let rawInput = "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_11() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "46a0b190-cab0-433b-b8ec-f067b8cbd359"
        let rawInput = "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]"
        let expectedOutput = "25"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_12() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "7922ab2b-cbe2-4e82-8fc0-dde4cf44c6e0"
        let rawInput = "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_13() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "27126987-251a-4105-8fdb-9300a1cc2602"
        let rawInput = "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]"
        let expectedOutput = "30"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_14() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "62353c0a-56ce-46b3-80c6-c1abea680abc"
        let rawInput = "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_15() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "9fe924e7-1024-4999-9538-95b3deb5b91c"
        let rawInput = "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]"
        let expectedOutput = "35"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_16() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "b024db01-b8e1-4eb5-adae-a1cac48a3016"
        let rawInput = "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_17() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "96f685ad-4864-4adc-8eb8-5fd142cfbf05"
        let rawInput = "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]"
        let expectedOutput = "40"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_18() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "5ad99def-a74e-474a-9661-dd49d0381952"
        let rawInput = "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_19() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "1c28b538-86a9-4a2a-a8f4-0a3369e06867"
        let rawInput = "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]"
        let expectedOutput = "45"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_20() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "b2e33326-c378-4575-bc14-092a0d0d6536"
        let rawInput = "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_21() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "c69f8ad7-e2f4-4ff3-bb6b-770d393d78cb"
        let rawInput = "matrix = []"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_22() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "d4b207f1-7344-49fd-8bdf-a091ee80b936"
        let rawInput = "matrix = [[\"1\",\"0\",\"1\"],[\"0\",\"1\",\"0\"],[\"1\",\"0\",\"1\"]]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_23() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "5f773f33-a964-4086-b5de-38f6478fff6b"
        let rawInput = "matrix = [[\"1\",\"0\",\"1\",\"0\",\"1\"],[\"0\",\"1\",\"0\",\"1\",\"0\"],[\"1\",\"0\",\"1\",\"0\",\"1\"]]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_24() async {
        let slug = "maximal-rectangle"
        let topic = "misc"
        let testId = "0f0f33d3-58e2-4723-95b2-468df4919415"
        let rawInput = "matrix = [[\"1\",\"0\",\"1\",\"0\",\"1\"],[\"0\",\"1\",\"0\",\"1\",\"0\"],[\"1\",\"0\",\"1\",\"0\",\"1\"],[\"0\",\"1\",\"0\",\"1\",\"0\"]]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [[Character]]: '\(params[0])'")
            return
        }
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

}
