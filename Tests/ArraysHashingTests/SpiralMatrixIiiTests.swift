import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func spiralMatrixIII(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        var res = [[Int]](repeating: [Int](repeating: 0, count: C), count: R)
        var cnt = 1
        var i = r0
        var j = c0
        var dir = 0
        while cnt <= R * C {
            res[i][j] = cnt
            cnt += 1
            var ii = i + directions[dir].0
            var jj = j + directions[dir].1
            if ii >= 0, ii < R, jj >= 0, jj < C, res[ii][jj] == 0 {
                i = ii
                j = jj
            } else {
                dir = (dir + 1) % 4
                i += directions[dir].0
                j += directions[dir].1
            }
        }
        return res
    }
}

@Suite struct SpiralMatrixIiiTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "spiral-matrix-iii"
        let topic = "arrays-hashing"
        let testId = "3bb4ccba-0cb7-493a-ae0c-d13d551cfb73"
        let rawInput = "rows = 1, cols = 4, rStart = 0, cStart = 0"
        let expectedOutput = "[[0,0],[0,1],[0,2],[0,3]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_R = InputParser.parseInt(params[0])
        let p_C = InputParser.parseInt(params[1])
        let p_r0 = InputParser.parseInt(params[2])
        let p_c0 = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.spiralMatrixIII(p_R, p_C, p_r0, p_c0)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "spiral-matrix-iii"
        let topic = "arrays-hashing"
        let testId = "1ce87104-9fca-4f35-b204-ab5f8caaa3d5"
        let rawInput = "rows = 5, cols = 6, rStart = 1, cStart = 4"
        let expectedOutput = "[[1,4],[1,5],[2,5],[2,4],[2,3],[1,3],[0,3],[0,4],[0,5],[3,5],[3,4],[3,3],[3,2],[2,2],[1,2],[0,2],[4,5],[4,4],[4,3],[4,2],[4,1],[3,1],[2,1],[1,1],[0,1],[4,0],[3,0],[2,0],[1,0],[0,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_R = InputParser.parseInt(params[0])
        let p_C = InputParser.parseInt(params[1])
        let p_r0 = InputParser.parseInt(params[2])
        let p_c0 = InputParser.parseInt(params[3])

        let solution = Solution()
        let result = solution.spiralMatrixIII(p_R, p_C, p_r0, p_c0)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
