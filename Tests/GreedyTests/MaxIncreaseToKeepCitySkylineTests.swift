import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
      let m = grid.count
      let n = grid[0].count
      var rowMax = [Int](repeating: 0, count: m)
      var colMax = [Int](repeating: 0, count: n)
      for i in 0..<m {
        for j in 0..<n {
          rowMax[i] = max(rowMax[i], grid[i][j])
          colMax[j] = max(colMax[j], grid[i][j])
        }
      }
      var res = 0
      for i in 0..<m {
        for j in 0..<n {
          res += min(rowMax[i], colMax[j]) - grid[i][j]
        }
      }
      return res
    }
}

@Suite struct MaxIncreaseToKeepCitySkylineTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "c3279eb9-9f19-440e-b8ab-994b9aac4cc3"
        let rawInput = "grid = [[1,1,1],[1,1,1],[1,1,1]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "97ef516d-37e1-4be4-aa4f-01a5f72b88dc"
        let rawInput = "grid = [[5,5,5],[5,5,5],[5,5,5]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "2bc6c366-a993-49ae-8332-3c5c1186248e"
        let rawInput = "grid = [[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "02d48cf4-13aa-47bd-80e6-be3d6216ee1e"
        let rawInput = "grid = [[10,10,10],[10,10,10],[10,10,10]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "232d771a-838f-4c84-b0cb-b064f16d1f63"
        let rawInput = "grid = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "72f6acdb-b626-42d8-b6d0-b8a81a718b4a"
        let rawInput = "grid = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "504adb0f-4015-4110-b358-8de55ca2e0c0"
        let rawInput = "grid = [[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "1ee3a7e9-f7e3-40c0-b791-d696100a0871"
        let rawInput = "grid = [[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "372e6a07-52a8-4c76-8305-ba74a9095026"
        let rawInput = "grid = [[10,10,10,10,10,10],[10,10,10,10,10,10],[10,10,10,10,10,10],[10,10,10,10,10,10],[10,10,10,10,10,10],[10,10,10,10,10,10]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "8d21e6ef-4e54-4234-a585-a6b4f0223975"
        let rawInput = "grid = [[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "4b221fbe-2a2d-4045-9840-d3ddf2ad40ee"
        let rawInput = "grid = [[10,10,10,10,10,10,10],[10,10,10,10,10,10,10],[10,10,10,10,10,10,10],[10,10,10,10,10,10,10],[10,10,10,10,10,10,10],[10,10,10,10,10,10,10],[10,10,10,10,10,10,10]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "de272586-955c-4bad-917d-2bc7878d6687"
        let rawInput = "grid = [[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "4f84a2d3-f6ac-4242-b37f-b0cb15059062"
        let rawInput = "grid = [[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10]]"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "09a368b2-88fa-475c-9cfc-d90500b7fc84"
        let rawInput = "grid = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]"
        let expectedOutput = "-24"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "64c52a10-e821-4c0e-b64e-5f78fa4efed2"
        let rawInput = "grid = [[16,15,14,13],[12,11,10,9],[8,7,6,5],[4,3,2,1]]"
        let expectedOutput = "-24"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "b36c1672-7d5e-4245-a012-172178978ea2"
        let rawInput = "grid = [[10,20,30,40,50],[50,40,30,20,10],[10,20,30,40,50],[50,40,30,20,10],[10,20,30,40,50]]"
        let expectedOutput = "-500"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "e128721f-ac74-41f8-9f73-7abc8aca6ad8"
        let rawInput = "grid = [[1,2,3],[4,5,6],[7,8,9]]"
        let expectedOutput = "-9"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "cc922346-2487-4d14-a89a-755b86561441"
        let rawInput = "grid = [[9,8,7],[6,5,4],[3,2,1]]"
        let expectedOutput = "-9"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "ad083198-1714-4ae9-860b-c689e315af14"
        let rawInput = "grid = [[1,1,1],[1,10,1],[1,1,1]]"
        let expectedOutput = "-9"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "ef0ac282-3680-4dcd-97ac-557a43ce186d"
        let rawInput = "grid = [[10,1,1],[1,10,1],[1,1,10]]"
        let expectedOutput = "-27"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "b7b87ca0-16a7-412a-b3de-a57be78a8fcd"
        let rawInput = "grid = [[1,10,1],[1,1,1],[1,1,10]]"
        let expectedOutput = "-18"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "35d0237e-3dbd-4bbe-af42-bcdd1eb1f6d9"
        let rawInput = "grid = [[1,1,10],[1,1,1],[10,1,1]]"
        let expectedOutput = "-18"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "7db8f58a-5927-4cc0-a8b2-6087f1ac054b"
        let rawInput = "grid = [[1,1,1],[1,10,1],[10,1,10]]"
        let expectedOutput = "-18"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "ca2e5fe4-7234-419f-aea9-4f74968caaac"
        let rawInput = "grid = [[10,10,10],[1,1,1],[10,10,10]]"
        let expectedOutput = "-18"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "max-increase-to-keep-city-skyline"
        let topic = "greedy"
        let testId = "8e98d31b-c731-4a40-8ad3-45e3d868f036"
        let rawInput = "grid = [[1,1,1],[10,10,10],[1,1,1]]"
        let expectedOutput = "-18"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_grid = InputParser.parse2DIntArray(params[0])
        guard p_grid.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))")
            return
        }

        let solution = Solution()
        let result = solution.maxIncreaseKeepingSkyline(p_grid)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
