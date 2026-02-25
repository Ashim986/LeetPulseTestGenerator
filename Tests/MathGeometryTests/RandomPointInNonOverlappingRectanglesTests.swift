import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    struct Solution {
        let rectangles: [[Int]]
        let areas: [Int]
        let prefixSums: [Int]

        init(_ rectangles: [[Int]]) {
            self.rectangles = rectangles
            var areas: [Int] = []
            var prefixSums: [Int] = [0]

            for rect in rectangles {
                areas.append((rect[2] - rect[0] + 1) * (rect[3] - rect[1] + 1))
            }

            for area in areas {
                prefixSums.append(prefixSums.last! + area)
            }

            self.areas = areas
            self.prefixSums = prefixSums
        }

        func randomPoint() -> [Int] {
            let target = Int.random(in: 1...prefixSums.last!)
            var left = 0
            var right = prefixSums.count - 1

            while left < right {
                let mid = (left + right) / 2
                if prefixSums[mid] < target {
                    left = mid + 1
                } else {
                    right = mid
                }
            }

            let rect = rectangles[left - 1]
            let x = Int.random(in: rect[0]...rect[2])
            let y = Int.random(in: rect[1]...rect[3])
            return [x, y]
        }
    }
}

@Suite struct RandomPointInNonOverlappingRectanglesTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "9cffd293-a05a-4f91-9a14-256a6dd19347"
        let rawInput = "rectangles = [[0,0,1,1]]"
        let expectedOutput = "[0, 0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "bfca7678-740e-48d2-aaf1-25d45fa9401c"
        let rawInput = "rectangles = [[-1,-1,0,0]]"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "85858cf2-5309-4790-950c-b02f63879826"
        let rawInput = "rectangles = [[10,10,11,11]]"
        let expectedOutput = "[10, 10]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "c4d4c383-f44a-42fa-970d-d91929e986a4"
        let rawInput = "rectangles = [[1,1,2,2],[3,3,4,4]]"
        let expectedOutput = "[1, 1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "4f94a0d3-b53d-4a63-b93c-59900b872e4c"
        let rawInput = "rectangles = [[1,1,1,1]]"
        let expectedOutput = "[1, 1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "a4be4480-9c86-4e33-b5f8-9064e5e77775"
        let rawInput = "rectangles = [[0,0,100,100]]"
        let expectedOutput = "[0, 0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "9844d8db-fea2-418d-9004-119d7221d681"
        let rawInput = "rectangles = [[-100,-100,0,0]]"
        let expectedOutput = "[-100, -100]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "d8787606-9d14-4212-8062-7b29131ff1ad"
        let rawInput = "rectangles = [[1,1,1,1],[1,1,1,1],[1,1,1,1]]"
        let expectedOutput = "[1, 1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "89fa05de-7379-4a5e-be57-a4b0bd103b2e"
        let rawInput = "rectangles = [[0,0,0,0]]"
        let expectedOutput = "[0, 0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "86957237-859f-4514-981c-0c4cd58f9ad4"
        let rawInput = "rectangles = [[-1,-1,-1,-1]]"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "5b1facbb-4bff-4bdb-b58b-38db622b56e3"
        let rawInput = "rectangles = [[10,10,10,10]]"
        let expectedOutput = "[10, 10]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "52972cc3-6675-415a-a210-e35499aad6eb"
        let rawInput = "rectangles = [[1,1,100,100],[2,2,3,3],[4,4,5,5]]"
        let expectedOutput = "[1, 1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "dcacfc85-a18a-4ac6-b98b-7b2924c1d787"
        let rawInput = "rectangles = [[1,1,1,1],[2,2,2,2],[3,3,3,3]]"
        let expectedOutput = "[1, 1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "fdcc595c-e098-4403-9d02-7307ed2b8046"
        let rawInput = "rectangles = [[0,0,1,1],[1,1,2,2],[2,2,3,3]]"
        let expectedOutput = "[0, 0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "33bccbe4-8267-47aa-bea6-0f2104de5c2c"
        let rawInput = "rectangles = [[-1,-1,0,0],[0,0,1,1],[1,1,2,2]]"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "0257c518-c31e-4f20-8e09-45eaa9e06fa8"
        let rawInput = "rectangles = [[10,10,11,11],[11,11,12,12],[12,12,13,13]]"
        let expectedOutput = "[10, 10]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "fcfe89e0-945e-489d-9498-65091d2b4765"
        let rawInput = "rectangles = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]"
        let expectedOutput = "[1, 1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "28096651-3708-48cc-a8c6-6749c86f8a22"
        let rawInput = "rectangles = [[0,0,0,0],[0,0,0,0],[0,0,0,0]]"
        let expectedOutput = "[0, 0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "dd7fc344-2bfa-4326-88a2-00c2f281d375"
        let rawInput = "rectangles = [[-1,-1,-1,-1],[0,0,0,0],[1,1,1,1]]"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "ee020597-25e4-437a-9711-8a61755adbda"
        let rawInput = "rectangles = [[10,10,10,10],[11,11,11,11],[12,12,12,12]]"
        let expectedOutput = "[10, 10]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "77bbcb1b-cbe4-498a-92bd-4432323dd2aa"
        let rawInput = "rectangles = [[1,1,100,100],[2,2,3,3],[4,4,5,5],[6,6,7,7]]"
        let expectedOutput = "[1, 1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "0c7415d9-de28-48c0-90cd-60a5c7dde4ed"
        let rawInput = "rectangles = [[1,1,1,1],[2,2,2,2],[3,3,3,3],[4,4,4,4]]"
        let expectedOutput = "[1, 1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "566bc826-e972-4657-8a39-9aea27ca0833"
        let rawInput = "rectangles = [[0,0,1,1],[1,1,2,2],[2,2,3,3],[3,3,4,4]]"
        let expectedOutput = "[0, 0]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "d16d5a1e-b70e-43b9-ac10-f32fca83d620"
        let rawInput = "rectangles = [[-1,-1,0,0],[0,0,1,1],[1,1,2,2],[2,2,3,3]]"
        let expectedOutput = "[-1, -1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "random-point-in-non-overlapping-rectangles"
        let topic = "math-geometry"
        let testId = "0af44df0-ed34-4987-bbbc-202905a44de7"
        let rawInput = "rectangles = [[10,10,11,11],[11,11,12,12],[12,12,13,13],[13,13,14,14]]"
        let expectedOutput = "[10, 10]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        guard initArgs.count >= 1 else { return }
        let obj = RandomPointInNonOverlappingRectangles(InputParser.parse2DIntArray(initArgs[0]))

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            results.append("null")
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
