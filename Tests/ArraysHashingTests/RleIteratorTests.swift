import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class RLEIterator { var encoding: [Int]; var idx: Int = 0; init(_ encoding: [Int]) { self.encoding = encoding } func next(_ n: Int) -> Int { while idx < encoding.count { if encoding[idx] >= n { encoding[idx] -= n; return encoding[idx + 1] } else { idx += 2; n -= encoding[idx - 2] } }; return -1 } func hasNext(_ n: Int) -> Bool { return next(n) != -1 } }
}

@Suite struct RleIteratorTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "74d405f1-d5e7-4f9f-9c33-5a97bad489a2"
        let rawInput = "RLEIterator"
        let expectedOutput = "null"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "a057dcab-4d84-4899-8e71-df6bf79e2248"
        let rawInput = "['RLEIterator', 'next', 'next', 'next', 'hasNext', 'next', 'hasNext', 'next', 'next', 'hasNext']"
        let expectedOutput = "[null,8,8,8,true,5,true,5,-1,true]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "ee5b4753-0745-426e-afa7-0ab9b99cd7cf"
        let rawInput = "['RLEIterator', 'next', 'next', 'next', 'hasNext', 'next', 'hasNext', 'next', 'next', 'hasNext', 'next']"
        let expectedOutput = "[null,8,8,8,true,5,true,5,-1,true,-1]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "45f9560f-161d-4108-a37a-9380a75af7dd"
        let rawInput = "['RLEIterator', 'hasNext', 'next', 'hasNext', 'next', 'hasNext', 'next', 'hasNext', 'next']"
        let expectedOutput = "[null,true,8,true,8,true,8,true,5]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "ca4eb00d-56f0-4155-810e-4195cfd3eb06"
        let rawInput = "['RLEIterator', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']"
        let expectedOutput = "[null,8,8,8,5,5,-1,-1,-1,-1,-1]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "08b09ec3-22d9-4f3c-a109-72ebed8a50c0"
        let rawInput = "['RLEIterator', 'hasNext', 'hasNext', 'hasNext', 'hasNext', 'hasNext', 'hasNext']"
        let expectedOutput = "[null,true,true,true,true,true,true]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "9c5e69c3-620f-4049-8e3e-2b457d9d63fd"
        let rawInput = "['RLEIterator', 'next', 'hasNext', 'next', 'hasNext', 'next', 'hasNext']"
        let expectedOutput = "[null,8,true,8,true,8,true]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "37eedea2-9b87-477e-a325-da00159816b4"
        let rawInput = "['RLEIterator', 'next', 'next', 'next', 'next', 'hasNext', 'next']"
        let expectedOutput = "[null,8,8,8,5,true,5]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "28dcaec8-a41d-41c5-ac93-3548f2d33241"
        let rawInput = "['RLEIterator', 'hasNext', 'next', 'hasNext', 'next', 'hasNext', 'next', 'hasNext']"
        let expectedOutput = "[null,true,8,true,8,true,8,true]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "ad5225fd-1731-4442-b915-dc79de3fbc96"
        let rawInput = "['RLEIterator', 'next', 'hasNext', 'next', 'hasNext', 'next', 'hasNext', 'next']"
        let expectedOutput = "[null,8,true,8,true,8,true,-1]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "c66b4c05-7763-4f2f-ba35-c8e9f7ab3aac"
        let rawInput = "['RLEIterator', 'hasNext', 'hasNext', 'hasNext', 'hasNext', 'hasNext', 'hasNext', 'hasNext']"
        let expectedOutput = "[null,true,true,true,true,true,true,true]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "783fd5fb-871a-486c-bf60-eb4b3c0cbf9b"
        let rawInput = "['RLEIterator', 'next', 'next', 'next', 'next', 'next', 'next']"
        let expectedOutput = "[null,8,8,8,5,5]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "2219cf75-07a4-496c-a4d9-26cc5de7c369"
        let rawInput = "['RLEIterator', 'hasNext', 'next', 'hasNext', 'next', 'hasNext']"
        let expectedOutput = "[null,true,8,true,8,true]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "e9037a9b-bc2c-4a7e-974b-fdbc8a050caa"
        let rawInput = "['RLEIterator', 'next', 'hasNext', 'next', 'hasNext', 'next']"
        let expectedOutput = "[null,8,true,8,true,8]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "4ae7870c-7e35-4d26-8190-15140a146e71"
        let rawInput = "['RLEIterator', 'hasNext', 'hasNext', 'hasNext', 'hasNext']"
        let expectedOutput = "[null,true,true,true,true]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "98d1b66e-951d-4873-8783-6c1b8e6a3bc3"
        let rawInput = "['RLEIterator', 'next', 'next', 'next']"
        let expectedOutput = "[null,8,8,8]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "a09e5513-3487-4888-bfd8-60de0c6d5e97"
        let rawInput = "['RLEIterator', 'hasNext', 'next', 'hasNext']"
        let expectedOutput = "[null,true,8,true]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "bf1e22b9-813a-4744-8e1e-347231aaa906"
        let rawInput = "['RLEIterator', 'next', 'hasNext', 'next']"
        let expectedOutput = "[null,8,true,8]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "c2065313-609b-49fc-9d81-7fb9bb974e77"
        let rawInput = "['RLEIterator', 'hasNext', 'hasNext']"
        let expectedOutput = "[null,true,true]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "2020c886-843f-49be-8aec-e8c77d14fa99"
        let rawInput = "['RLEIterator', 'next', 'next']"
        let expectedOutput = "[null,8,8]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "8c030cb2-e7cd-47cd-a95e-1ba4e3f09362"
        let rawInput = "['RLEIterator', 'next', 'next', 'hasNext', 'next', 'hasNext', 'next']"
        let expectedOutput = "[-1,-1,true,-1,true,-1]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "2fd87cd1-449d-4d61-8a85-08dfb198a763"
        let rawInput = "['RLEIterator', 'hasNext', 'hasNext', 'next', 'hasNext', 'next', 'next', 'next']"
        let expectedOutput = "[true,true,-1,true,-1,-1,-1]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "2ab7211f-ae4a-4eac-b88b-c97cdb8788a7"
        let rawInput = "['RLEIterator', 'hasNext', 'next', 'hasNext', 'hasNext', 'next', 'hasNext', 'hasNext', 'next']"
        let expectedOutput = "[true,-1,true,true,-1,true,true,-1]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "0bb9a3cd-d470-4870-9d51-712b7e7d98d3"
        let rawInput = "['RLEIterator', 'next', 'next', 'next', 'hasNext', 'hasNext', 'hasNext', 'hasNext', 'hasNext']"
        let expectedOutput = "[-1,-1,-1,true,true,true,true,true]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
        let slug = "rle-iterator"
        let topic = "arrays-hashing"
        let testId = "3184e426-d4cc-4ae1-aef6-f109717edd02"
        let rawInput = "['RLEIterator', 'next', 'next', 'hasNext', 'next', 'next', 'hasNext', 'next', 'next', 'hasNext', 'next', 'next']"
        let expectedOutput = "[-1,-1,true,-1,-1,true,-1,-1,true,-1,-1]"
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
        let obj = RLEIterator(InputParser.parseIntArray(initArgs[0]))

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
