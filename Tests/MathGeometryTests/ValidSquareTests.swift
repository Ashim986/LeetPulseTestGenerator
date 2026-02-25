import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        let points: [[Int]] = [p1, p2, p3, p4]
        var distances: [Int] = []
        let centerX = (Double(p1[0]) + Double(p2[0]) + Double(p3[0]) + Double(p4[0])) / 4.0
        let centerY = (Double(p1[1]) + Double(p2[1]) + Double(p3[1]) + Double(p4[1])) / 4.0

        for point in points {
            let distance = Int((Double(point[0]) - centerX) * (Double(point[0]) - centerX) + (Double(point[1]) - centerY) * (Double(point[1]) - centerY))
            distances.append(distance)
        }
        distances.sort()

        return distances[0] == distances[1] && distances[1] == distances[2] && distances[2] == distances[3] && distances.count > 4 && distances[4] == distances[5]
    }
}

@Suite struct ValidSquareTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "fbe3076f-2371-44aa-9325-862176b6fe3a"
        let rawInput = "p1 = [0,0], p2 = [0,1], p3 = [1,1], p4 = [1,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "d8022f03-08cb-43c2-a0f6-5f455cdf2f8c"
        let rawInput = "p1 = [1,0], p2 = [1,1], p3 = [0,1], p4 = [0,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "4e792332-dd10-4ed8-97b7-bf64c2675715"
        let rawInput = "p1 = [0,0], p2 = [1,0], p3 = [1,1], p4 = [0,1]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "ab1589ed-1bdd-49a5-8e38-9aa7af524500"
        let rawInput = "p1 = [0,0], p2 = [0,0], p3 = [1,1], p4 = [1,1]"
        let expectedOutput = "false"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "eed002bc-5a13-49c3-8bdd-376fcf7f717b"
        let rawInput = "p1 = [0,0], p2 = [1,1], p3 = [2,2], p4 = [3,3]"
        let expectedOutput = "false"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "7394b1e2-657b-42c3-813d-6123d8f641b4"
        let rawInput = "p1 = [0,0], p2 = [0,1], p3 = [1,0], p4 = [1,1]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "fccfb0e9-f648-41ca-9895-ddd39c2f6c06"
        let rawInput = "p1 = [0,0], p2 = [1,0], p3 = [0,1], p4 = [1,1]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "28f9b48b-f27b-44ae-9085-ee324d02e67c"
        let rawInput = "p1 = [1,1], p2 = [2,2], p3 = [3,3], p4 = [4,4]"
        let expectedOutput = "false"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "61a78017-dc16-401a-9aa2-0a82eed6d66a"
        let rawInput = "p1 = [0,0], p2 = [0,2], p3 = [2,2], p4 = [2,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "d12e73b2-e216-434e-8c68-836c710af83c"
        let rawInput = "p1 = [0,0], p2 = [0,3], p3 = [3,3], p4 = [3,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "19ad865f-7169-426c-835e-f45423f5c16e"
        let rawInput = "p1 = [0,0], p2 = [0,4], p3 = [4,4], p4 = [4,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "85d531a6-1f10-4216-a5af-3a998b840830"
        let rawInput = "p1 = [0,0], p2 = [0,5], p3 = [5,5], p4 = [5,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "fa2c74f6-0d9c-41e0-af87-a64db2d56019"
        let rawInput = "p1 = [0,0], p2 = [0,-1], p3 = [-1,-1], p4 = [-1,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "02d15c01-21b0-4fb6-abff-cf3fa1d43aa6"
        let rawInput = "p1 = [0,0], p2 = [0,-2], p3 = [-2,-2], p4 = [-2,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "cbe554cf-4ddd-4a48-926d-a46e80d74743"
        let rawInput = "p1 = [0,0], p2 = [0,-3], p3 = [-3,-3], p4 = [-3,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "dad9ddee-5d80-4f53-b7f9-d53f3cc7e338"
        let rawInput = "p1 = [0,0], p2 = [0,-4], p3 = [-4,-4], p4 = [-4,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "125f2c2c-6090-478c-a81b-20c72e195632"
        let rawInput = "p1 = [0,0], p2 = [0,-5], p3 = [-5,-5], p4 = [-5,0]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "cdcbd10c-1418-4631-a70e-a38dbd4ddab7"
        let rawInput = "p1 = [0,0], p2 = [2,0], p3 = [2,2], p4 = [0,2]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "533037e8-46a8-42a4-8611-76574e63e7c5"
        let rawInput = "p1 = [0,0], p2 = [3,0], p3 = [3,3], p4 = [0,3]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "181931e1-9038-4d14-9b9b-1d8114ca3900"
        let rawInput = "p1 = [0,0], p2 = [4,0], p3 = [4,4], p4 = [0,4]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "b34bc992-92b8-444e-9fe6-74d661585de4"
        let rawInput = "p1 = [0,0], p2 = [5,0], p3 = [5,5], p4 = [0,5]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "c902aa40-f955-4bbd-929c-8cf5cf6baf32"
        let rawInput = "p1 = [0,0], p2 = [-1,0], p3 = [-1,-1], p4 = [0,-1]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "a4dcebf2-1306-480d-88d0-9fcb2f0eab90"
        let rawInput = "p1 = [0,0], p2 = [-2,0], p3 = [-2,-2], p4 = [0,-2]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "0c183c1f-0c47-4deb-82f5-ecd6a9d39055"
        let rawInput = "p1 = [0,0], p2 = [-3,0], p3 = [-3,-3], p4 = [0,-3]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "valid-square"
        let topic = "math-geometry"
        let testId = "2e64ee8c-7a5c-4373-b65b-9b3c2246b944"
        let rawInput = "p1 = [0,0], p2 = [-4,0], p3 = [-4,-4], p4 = [0,-4]"
        let expectedOutput = "true"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_p1 = InputParser.parseIntArray(params[0])
        guard p_p1.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p1 array too large (\(p_p1.count))")
            return
        }
        let p_p2 = InputParser.parseIntArray(params[1])
        guard p_p2.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p2 array too large (\(p_p2.count))")
            return
        }
        let p_p3 = InputParser.parseIntArray(params[2])
        guard p_p3.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p3 array too large (\(p_p3.count))")
            return
        }
        let p_p4 = InputParser.parseIntArray(params[3])
        guard p_p4.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: p4 array too large (\(p_p4.count))")
            return
        }

        let solution = Solution()
        let result = solution.validSquare(p_p1, p_p2, p_p3, p_p4)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
