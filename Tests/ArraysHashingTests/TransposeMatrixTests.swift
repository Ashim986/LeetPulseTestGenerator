import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        return matrix[0].indices.map { index in
            matrix.map { $0[index] }
        }
    }
}

@Suite struct TransposeMatrixTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "c7906029-eaf6-4710-9c19-5c06e1a626ed"
        let rawInput = "matrix = [[1]]"
        let expectedOutput = "[[1]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "a505691e-8071-4ff5-9efd-eef87eb58924"
        let rawInput = "matrix = [[1,2]]"
        let expectedOutput = "[[1],[2]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "7bd72f22-e21e-4dc4-b302-4299b545dab7"
        let rawInput = "matrix = [[1],[2]]"
        let expectedOutput = "[[1,2]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "40675e87-57d8-4eb2-b73a-aac89e47aba2"
        let rawInput = "matrix = [[1,2,3,4,5]]"
        let expectedOutput = "[[1],[2],[3],[4],[5]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "ca7e69ce-0ffa-41ff-a9c4-fee23ece7f35"
        let rawInput = "matrix = [[1],[2],[3],[4],[5]]"
        let expectedOutput = "[[1,2,3,4,5]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "5c4a507c-c8fb-4427-8a12-89865f588c3b"
        let rawInput = "matrix = [[-1,-2,-3],[-4,-5,-6]]"
        let expectedOutput = "[[-1,-4],[-2,-5],[-3,-6]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "91e35e2e-0527-4bc3-b0c4-4dbc815492a9"
        let rawInput = "matrix = [[1,1,1],[2,2,2],[3,3,3]]"
        let expectedOutput = "[[1,2,3],[1,2,3],[1,2,3]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "1073b1a8-d38c-4a7a-b340-be0215295bf9"
        let rawInput = "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12]]"
        let expectedOutput = "[[1,4,7,10],[2,5,8,11],[3,6,9,12]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "cd086e04-1666-4b12-9af5-5783ad389bfd"
        let rawInput = "matrix = [[10,20,30],[40,50,60],[70,80,90]]"
        let expectedOutput = "[[10,40,70],[20,50,80],[30,60,90]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "a998459c-9016-4fe4-89a1-ba6bf7abae82"
        let rawInput = "matrix = [[1,2,3,4,5,6,7,8,9,10]]"
        let expectedOutput = "[[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "30fb10d5-5854-439c-bc7b-5d7f1ac42653"
        let rawInput = "matrix = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]]"
        let expectedOutput = "[[1,2,3,4,5,6,7,8,9,10]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "31bc9898-48fc-4751-a90e-eeb171986d51"
        let rawInput = "matrix = [[1,1],[1,1],[1,1]]"
        let expectedOutput = "[[1,1,1],[1,1,1]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "b632b96c-dffe-4728-8ace-20ca05b5bbc5"
        let rawInput = "matrix = [[1,2],[3,4],[5,6],[7,8]]"
        let expectedOutput = "[[1,3,5,7],[2,4,6,8]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "6648df40-dfec-4d5a-a47a-385be076e3eb"
        let rawInput = "matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]"
        let expectedOutput = "[[1,5,9],[2,6,10],[3,7,11],[4,8,12]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "2ba412da-051d-4a9e-96e4-edb5e139a77b"
        let rawInput = "matrix = [[1,2,3,4,5],[6,7,8,9,10]]"
        let expectedOutput = "[[1,6],[2,7],[3,8],[4,9],[5,10]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "ef20973c-538a-41c9-b1d8-f2580de8b7b2"
        let rawInput = "matrix = [[1,2],[3,4],[5,6],[7,8],[9,10]]"
        let expectedOutput = "[[1,3,5,7,9],[2,4,6,8,10]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "3801dda8-b73b-460c-b1e8-89aa3c10afb0"
        let rawInput = "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15]]"
        let expectedOutput = "[[1,4,7,10,13],[2,5,8,11,14],[3,6,9,12,15]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "03ed8b51-552c-48c3-bdb2-f1cd8c2e51ed"
        let rawInput = "matrix = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]]"
        let expectedOutput = "[[1,6,11],[2,7,12],[3,8,13],[4,9,14],[5,10,15]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "0219a19e-e661-4c85-9815-2b1fb2ccbd5e"
        let rawInput = "matrix = [[1,2,3,4,5,6],[7,8,9,10,11,12]]"
        let expectedOutput = "[[1,7],[2,8],[3,9],[4,10],[5,11],[6,12]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "4995468d-c178-4240-9769-be3d0a11032f"
        let rawInput = "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18]]"
        let expectedOutput = "[[1,4,7,10,13,16],[2,5,8,11,14,17],[3,6,9,12,15,18]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "23b0f261-3abb-4121-a1cf-b6a63f9c8dfb"
        let rawInput = "matrix = [[1,1,1,1,1],[2,2,2,2,2],[3,3,3,3,3]]"
        let expectedOutput = "[[1,2,3],[1,2,3],[1,2,3],[1,2,3],[1,2,3]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "95fd221d-a302-4b68-b073-8328a61e5205"
        let rawInput = "matrix = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20]]"
        let expectedOutput = "[[1,6,11,16],[2,7,12,17],[3,8,13,18],[4,9,14,19],[5,10,15,20]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "f598f262-4ecf-4128-b15c-be57680f223d"
        let rawInput = "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21]]"
        let expectedOutput = "[[1,4,7,10,13,16,19],[2,5,8,11,14,17,20],[3,6,9,12,15,18,21]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "cba361bb-4583-494d-82c7-cb46c70ef9b6"
        let rawInput = "matrix = [[1,2,3,4,5,6,7,8,9,10,11,12]]"
        let expectedOutput = "[[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "transpose-matrix"
        let topic = "arrays-hashing"
        let testId = "087c0c84-5c9f-47aa-a0d2-9f7e0c7b660a"
        let rawInput = "matrix = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]]"
        let expectedOutput = "[[1,2,3,4,5,6,7,8,9,10,11,12]]"
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
        let result = solution.transpose(p_matrix)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
