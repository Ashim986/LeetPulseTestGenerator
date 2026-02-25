import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class MedianFinder {
        private var lower: [Int] = []  // max-heap (negate values)
        private var upper: [Int] = []  // min-heap

        func addNum(_ num: Int) {
            // Add to lower (max-heap)
            lower.append(-num)
            lower.sort()

            // Move largest from lower to upper
            upper.append(-lower.removeFirst())
            upper.sort()

            // Balance: upper can't be larger
            if upper.count > lower.count {
                lower.append(-upper.removeFirst())
                lower.sort()
            }
        }

        func findMedian() -> Double {
            if lower.count > upper.count {
                return Double(-lower.first!)
            }
            return Double(-lower.first! + upper.first!) / 2.0
        }
    }
}

@Suite struct FindMedianFromDataStreamTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "afce19fb-47b7-4c9f-83f0-4ac45bc1c4be"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[1],[],[-1],[-2],[],[]]"
        let expectedOutput = "[null,null,1,null,null,-1,-1]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "a9cdea4e-709a-449f-8ae8-f64fa7802cde"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[2],[],[-2],[-1],[],[1],[]]"
        let expectedOutput = "[null,null,2,null,null,-1,null,0.0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "8132b1b4-fa27-498c-af96-131b7c2bef37"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[3],[],[-3],[0],[],[4],[-7],[],[]]"
        let expectedOutput = "[null,null,3,null,null,0,null,null,0,0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "303795c3-828c-41a7-af34-5b3c3c4a62b2"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[4],[],[-4],[]]"
        let expectedOutput = "[null,null,4,null,0.0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "6a35e43f-70ce-48ba-b6b7-78bdad2fd869"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[5],[],[-5],[2],[],[0],[]]"
        let expectedOutput = "[null,null,5,null,null,2,null,1.0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "db823389-92f2-4b55-85f5-a060d0537f67"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[6],[],[-6],[3],[],[2],[]]"
        let expectedOutput = "[null,null,6,null,null,3,null,2.5]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "4a095970-bc2b-48d0-b828-f1593f2567be"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[7],[],[-7],[-3],[],[5],[1],[],[]]"
        let expectedOutput = "[null,null,7,null,null,-3,null,null,1,1]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "4a229a12-c890-4c56-95e8-05ebb0259e47"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[8],[],[-8],[]]"
        let expectedOutput = "[null,null,8,null,0.0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "fb2a329a-6a6c-4e52-90ef-111efab4e309"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[9],[],[-9],[-1],[],[]]"
        let expectedOutput = "[null,null,9,null,null,-1,-1]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "db4b6116-8193-41e9-8c1e-e6dbff571086"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[10],[],[-10],[0],[],[3],[0],[],[]]"
        let expectedOutput = "[null,null,10,null,null,0,null,null,0,0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "95e47b34-9db0-4d22-aa3d-1603d303cc47"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[11],[],[-11],[1],[],[-5],[9],[],[]]"
        let expectedOutput = "[null,null,11,null,null,1,null,null,1,1]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "96041d88-2b49-4546-8b2a-b143bb554492"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[12],[],[-12],[]]"
        let expectedOutput = "[null,null,12,null,0.0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "42beb2d9-bebb-4349-982d-aa0f40efad27"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[13],[],[-13],[3],[],[]]"
        let expectedOutput = "[null,null,13,null,null,3,3]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "631193f7-1f70-40b2-887c-acc7e85dc4c6"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[14],[],[-14],[-3],[],[4],[]]"
        let expectedOutput = "[null,null,14,null,null,-3,null,0.5]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "3f4ab396-a1a0-4f4d-8168-ff08f32e1be5"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[15],[],[-15],[-2],[],[-4],[17],[],[0],[]]"
        let expectedOutput = "[null,null,15,null,null,-2,null,null,-2,null,-1.0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "49a88b07-b4e8-40df-be58-7729f238019a"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[16],[],[-16],[]]"
        let expectedOutput = "[null,null,16,null,0.0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "fdc4fe4a-4c9b-4b74-b99e-b9f599848387"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[17],[],[-17],[0],[],[]]"
        let expectedOutput = "[null,null,17,null,null,0,0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "7ad5c870-83e7-410d-825c-76f96c92765c"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[18],[],[-18],[1],[],[5],[]]"
        let expectedOutput = "[null,null,18,null,null,1,null,3.0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "bac51bb9-53e3-485d-a7f1-71854130e6c7"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[19],[],[-19],[2],[],[-3],[25],[],[]]"
        let expectedOutput = "[null,null,19,null,null,2,null,null,2,2]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "cbef9faa-a200-4001-9101-a74a063ecc4a"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[20],[],[-20],[0],[],[]]"
        let expectedOutput = "[null,null,20,null,null,0,0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "acb68f1f-9efb-43b5-b933-cfc9e0308cbe"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[21],[],[-21],[-3],[],[]]"
        let expectedOutput = "[null,null,21,null,null,-3,-3]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "8a5f5a53-7460-48b8-859c-3b53de5df286"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[22],[],[-22],[-2],[],[-5],[]]"
        let expectedOutput = "[null,null,22,null,null,-2,null,-3.5]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "bb86fa9a-161b-45d1-8b34-45c55c42d901"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"findMedian\"]\narguments = [[],[23],[],[-23],[-1],[],[-2],[33],[],[]]"
        let expectedOutput = "[null,null,23,null,null,-1,null,null,-1,-1]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "4fd03191-25d8-472a-b574-5cd99ecbf716"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[24],[],[-24],[]]"
        let expectedOutput = "[null,null,24,null,0.0]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "find-median-from-data-stream"
        let topic = "heap-priority-queue"
        let testId = "912a1782-9f7f-4ac6-a9ff-6415e89c11a0"
        let rawInput = "operations = [\"MedianFinder\",\"addNum\",\"findMedian\",\"addNum\",\"addNum\",\"findMedian\",\"addNum\",\"findMedian\"]\narguments = [[],[25],[],[-25],[1],[],[0],[]]"
        let expectedOutput = "[null,null,25,null,null,1,null,0.5]"
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
        let obj = MedianFinder()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addNum":
                obj.addNum(InputParser.parseInt(a[0]))
                results.append("null")
            case "findMedian":
                let r = obj.findMedian()
                results.append(OutputSerializer.serializeDouble(r))
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
