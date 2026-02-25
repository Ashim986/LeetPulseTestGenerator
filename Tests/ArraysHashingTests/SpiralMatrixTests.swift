import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty else { return [] }
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        var result: [Int] = []

        while top <= bottom && left <= right {
            for col in left...right { result.append(matrix[top][col]) }
            top += 1
            if top > bottom { break }

            for row in top...bottom { result.append(matrix[row][right]) }
            right -= 1
            if left > right { break }

            for col in stride(from: right, through: left, by: -1) { result.append(matrix[bottom][col]) }
            bottom -= 1
            if top > bottom { break }

            for row in stride(from: bottom, through: top, by: -1) { result.append(matrix[row][left]) }
            left += 1
        }

        return result
    }
}

@Suite struct SpiralMatrixTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "E8DFEA0E-EF1C-4CB8-BC6C-94F218F5A26D"
        let rawInput = "[[1,2,3],[4,5,6],[7,8,9]]"
        let expectedOutput = "[1,2,3,6,9,8,7,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "A1C6791F-AF6B-4D63-B7BD-07514E60DE6E"
        let rawInput = "[[1,2,3,4],[5,6,7,8],[9,10,11,12]]"
        let expectedOutput = "[1,2,3,4,8,12,11,10,9,5,6,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "2684F1C7-4166-496D-A98E-FA4FBF1A4132"
        let rawInput = "[[1]]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "77F8728E-1D18-425C-B1DD-3757843AFF6A"
        let rawInput = "[[1,2],[3,4]]"
        let expectedOutput = "[1,2,4,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "211CE6A1-BAB2-4DA7-B7A3-2AAEBC0E8A54"
        let rawInput = "[[1,2,3],[4,5,6]]"
        let expectedOutput = "[1,2,3,6,5,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "4757EFDF-14DA-40AF-9E05-3050C23266ED"
        let rawInput = "[]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "C5DAEE31-587C-44F1-99FC-DCA5D30DCD93"
        let rawInput = "[[1,1,1],[1,1,1],[1,1,1]]"
        let expectedOutput = "[1,1,1,1,1,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "0E26607A-2D55-462E-95BD-EE6F20AE1253"
        let rawInput = "[[1,2,3],[4,5,6],[7,8,9],[10,11,12]]"
        let expectedOutput = "[1,2,3,6,9,12,11,10,7,4,5,8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "C302AF3D-C2B9-4020-84C2-6800DD5339B4"
        let rawInput = "[[1,-2,3],[4,-5,6],[7,-8,9]]"
        let expectedOutput = "[1,-2,3,6,9,-8,7,4,-5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "0653E746-8F25-4385-83DF-A5B8A4C7F13C"
        let rawInput = "[[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]]"
        let expectedOutput = "[-1,-2,-3,-6,-9,-8,-7,-4,-5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "7FD25250-6607-4347-BC84-DCB90F91296B"
        let rawInput = "[[0,0,0],[0,0,0],[0,0,0]]"
        let expectedOutput = "[0,0,0,0,0,0,0,0,0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "6540532F-FD2A-4339-87EE-EBEC760A1FBA"
        let rawInput = "[[1,1,1,1],[2,2,2,2],[3,3,3,3]]"
        let expectedOutput = "[1,1,1,1,2,2,2,2,3,3,3,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "630144DB-3B18-4907-B61B-3A8472666736"
        let rawInput = "[[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]]"
        let expectedOutput = "[1,2,3,4,5,10,15,14,13,12,11,6,7,8,9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "865BA928-58DB-45B2-9DB5-5E0172C388AA"
        let rawInput = "[[1],[2],[3],[4],[5]]"
        let expectedOutput = "[1,2,3,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "36B5D462-7B4C-41C6-8709-9DB83825EC03"
        let rawInput = "[[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15]]"
        let expectedOutput = "[1,2,3,6,9,12,15,14,13,10,7,4,5,8,11]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "18E65946-C8DB-4D9F-9284-8AA7A9A2A6CF"
        let rawInput = "[[1,1,1,1,1],[2,2,2,2,2],[3,3,3,3,3],[4,4,4,4,4]]"
        let expectedOutput = "[1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "BD9A6AB5-C077-4D52-AFD1-ADB43A92A38D"
        let rawInput = "[[1,2,3,4,5,6],[7,8,9,10,11,12]]"
        let expectedOutput = "[1,2,3,4,5,6,12,11,10,9,8,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "70EB753C-1F12-44EC-93E7-94F4578C2E74"
        let rawInput = "[[1],[2],[3],[4],[5],[6]]"
        let expectedOutput = "[1,2,3,4,5,6]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "14C7A756-C67D-46A4-9541-E29D1AE0C01D"
        let rawInput = "[[1,2],[3,4],[5,6],[7,8]]"
        let expectedOutput = "[1,2,4,8,7,5,3,6]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "6823DEC4-15FA-44A8-A80C-B353D69F20A3"
        let rawInput = "[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]"
        let expectedOutput = "[1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "B185D730-3F90-4E81-BDDC-EC260DBD5169"
        let rawInput = "[[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18]]"
        let expectedOutput = "[1,2,3,4,5,6,12,18,17,16,15,14,13,7,8,9,10,11]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "6DA21814-A9F7-4C03-9BF2-B4738CA9E315"
        let rawInput = "[[1],[2],[3],[4],[5],[6],[7]]"
        let expectedOutput = "[1,2,3,4,5,6,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "58FE9596-AC5A-4AAC-83B4-1FFAE171EB7C"
        let rawInput = "[[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18]]"
        let expectedOutput = "[1,2,3,6,9,12,15,18,17,16,13,10,7,4,5,8,11,14]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "F6C19866-CE4A-4139-A867-C2DC62C413B8"
        let rawInput = "[[1,2],[3,4],[5,6],[7,8],[9,10]]"
        let expectedOutput = "[1,2,4,8,10,9,7,5,3,6]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "spiral-matrix"
        let topic = "arrays-hashing"
        let testId = "4F446854-3955-4E30-815B-E38DD3F97D2C"
        let rawInput = "[[1,2,3,4,5,6,7],[8,9,10,11,12,13,14]]"
        let expectedOutput = "[1,2,3,4,5,6,7,14,13,12,11,10,9,8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_matrix = InputParser.parse2DIntArray(params[0])
        guard p_matrix.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))")
            return
        }

        let solution = Solution()
        let result = solution.spiralOrder(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
