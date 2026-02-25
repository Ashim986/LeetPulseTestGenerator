import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class TimeKeyValStore {
        var store: [String: [(String, Int)]] = [:]
        func set(_ key: String, _ value: String, _ timestamp: Int) {
            if store[key] == nil {
                store[key] = [(value, timestamp)]
            } else {
                store[key] = store[key]! + [(value, timestamp)]
                store[key]!.sort { $0.1 < $1.1 }
            }
        }
        func get(_ key: String, _ timestamp: Int) -> String {
            if store[key] == nil {
                return ""
            }
            let index = binarySearch(store[key]!, timestamp)
            if index == -1 {
                return ""
            }
            return store[key]![index].0
        }
        func binarySearch(_ list: [(String, Int)], _ target: Int) -> Int {
            var low = 0
            var high = list.count - 1
            while low <= high {
                let mid = (low + high) / 2
                if list[mid].1 <= target {
                    if mid == list.count - 1 || list[mid + 1].1 > target {
                        return mid
                    }
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            return -1
        }
    }
}

@Suite struct TimeBasedKeyValueStoreTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "158b44a3-dab9-4c7b-a9d1-8c9854f2cc06"
        let rawInput = "['TimeKeyValStore', 'set', 'get', 'set', 'get']"
        let expectedOutput = "[\"bar1\",\"bar2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "548b245b-fceb-453e-ab6a-a2187264a190"
        let rawInput = "['TimeKeyValStore', 'set', 'set', 'get']"
        let expectedOutput = "[\"bar1\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "9279ea8f-b82b-4a60-b0c7-5a7b5f7a6688"
        let rawInput = "['TimeKeyValStore', 'get', 'set', 'get']"
        let expectedOutput = "[\"\",\"bar1\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "f6337486-ee6f-4e85-9d6a-02d2a31f6848"
        let rawInput = "['TimeKeyValStore', 'set', 'get', 'set', 'get', 'get']"
        let expectedOutput = "[\"bar1\",\"bar2\",\"bar2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "9a5f4115-d3f5-4ad9-8173-675c649f42f3"
        let rawInput = "['TimeKeyValStore', 'set', 'set', 'get', 'set', 'get']"
        let expectedOutput = "[\"bar1\",\"bar2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "ed35dc44-ba4a-4a5b-b651-05e465e66fe4"
        let rawInput = "['TimeKeyValStore', 'set', 'set', 'set', 'get']"
        let expectedOutput = "[\"bar2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "9c153c56-3a26-4960-90d8-d8df51495f7e"
        let rawInput = "['TimeKeyValStore', 'set', 'get', 'get', 'set', 'get']"
        let expectedOutput = "[\"bar1\",\"bar1\",\"bar1\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "5a9a94c2-5365-43de-aa9f-7d28e51b80ce"
        let rawInput = "['TimeKeyValStore', 'set', 'set', 'get', 'get', 'get']"
        let expectedOutput = "[\"bar1\",\"bar2\",\"bar2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "55d813d7-964c-4ffd-8f1b-392c2ef5c480"
        let rawInput = "['TimeKeyValStore', 'get', 'set', 'set', 'get', 'get']"
        let expectedOutput = "[\"\",\"bar1\",\"bar2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "d60fc242-ef38-48d8-a317-1b8020088dd3"
        let rawInput = "['TimeKeyValStore', 'set', 'get', 'set', 'set', 'get']"
        let expectedOutput = "[\"bar1\",\"bar2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "ab078be4-93a2-4c12-a78e-adef3736d071"
        let rawInput = "['TimeKeyValStore', 'set', 'set', 'set', 'get', 'get', 'get']"
        let expectedOutput = "[\"bar\",\"baz\",\"qux\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "93ee0f2c-74be-4f2a-ad38-033d6bf3f70e"
        let rawInput = "['TimeKeyValStore', 'get', 'get', 'set', 'get', 'get']"
        let expectedOutput = "[\"\",\"\",\"val1\",\"val1\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "2006c63f-dadd-4127-85b6-d1df520d8567"
        let rawInput = "['TimeKeyValStore', 'set', 'get', 'get', 'get', 'set', 'get']"
        let expectedOutput = "[\"\",\"b\",\"b\",\"b\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "3406219a-9e8a-4380-82c6-abdafbf96752"
        let rawInput = "['TimeKeyValStore', 'set', 'set', 'get', 'get', 'get', 'set', 'get']"
        let expectedOutput = "[\"v1\",\"v1\",\"v2\",\"v2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "d505f224-9806-4e25-9e24-457a4aed3cb4"
        let rawInput = "['TimeKeyValStore', 'get', 'set', 'set', 'get', 'get', 'get', 'get']"
        let expectedOutput = "[\"\",\"value1\",\"value1\",\"value2\",\"value2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "3eb94f03-ba7e-4c65-a7b0-54989b2c5a10"
        let rawInput = "['TimeKeyValStore', 'set', 'get', 'set', 'set', 'get', 'get', 'get', 'get']"
        let expectedOutput = "[\"apple\",\"apple\",\"banana\",\"\",\"berry\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "beb463a0-de7d-47ec-ac34-626979959754"
        let rawInput = "['TimeKeyValStore', 'set', 'set', 'set', 'get', 'get', 'get', 'get', 'set', 'get']"
        let expectedOutput = "[\"v1\",\"v2\",\"v2\",\"v3\",\"v3\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "f5c1a0a6-a1df-45e6-9141-324c8d3fac15"
        let rawInput = "['TimeKeyValStore', 'get', 'get', 'set', 'set', 'get', 'get', 'get', 'get', 'set', 'get']"
        let expectedOutput = "[\"\",\"\",\"x\",\"x\",\"\",\"y\",\"x\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "5e158b05-a1ba-4de3-a0ee-b0aa22a5322e"
        let rawInput = "['TimeKeyValStore', 'set', 'get', 'get', 'get', 'set', 'set', 'get', 'get', 'get', 'get']"
        let expectedOutput = "[\"value1\",\"value1\",\"\",\"value1\",\"value2\",\"\",\"value3\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "9f45cc96-4c4e-4c41-bd4f-4ec3ada6f6a5"
        let rawInput = "['TimeKeyValStore', 'set', 'set', 'set', 'get', 'get', 'get', 'get', 'get', 'set', 'set', 'get']"
        let expectedOutput = "[\"1\",\"2\",\"2\",\"\",\"3\",\"2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "be4d9077-0f8c-4ce6-b93e-718b8bc88430"
        let rawInput = "['TimeKeyValStore', 'get', 'get', 'set', 'set', 'get', 'get', 'get', 'get', 'get', 'set', 'set', 'get']"
        let expectedOutput = "[\"\",\"\",\"val1\",\"val2\",\"val2\",\"\",\"\",\"bval1\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "18fc8355-3c42-41da-b296-daba6836e979"
        let rawInput = "['TimeKeyValStore', 'set', 'get', 'set', 'set', 'get', 'get', 'get', 'get', 'get', 'set', 'set', 'set', 'get']"
        let expectedOutput = "[\"bar\",\"bar\",\"bar2\",\"bar3\",\"bar3\",\"\",\"val2\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "f6aaf1a3-3546-4ad4-a201-5aaf9f73e267"
        let rawInput = "['TimeKeyValStore', 'set', 'set', 'set', 'get', 'get', 'get', 'get', 'get', 'get', 'set', 'set', 'set', 'set', 'get']"
        let expectedOutput = "[\"1\",\"2\",\"3\",\"3\",\"\",\"\",\"30\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "210c6b95-e84f-48f3-af94-10d24f87ddd8"
        let rawInput = "['TimeKeyValStore', 'get', 'get', 'set', 'set', 'get', 'get', 'get', 'get', 'get', 'get', 'set', 'set', 'set', 'set', 'get']"
        let expectedOutput = "[\"\",\"\",\"1\",\"2\",\"2\",\"\",\"\",\"\",\"30\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
        let slug = "time-based-key-value-store"
        let topic = "binary-search"
        let testId = "96299be2-cc07-4184-857c-02ca7accb429"
        let rawInput = "['TimeKeyValStore', 'set', 'get', 'get', 'get', 'set', 'set', 'get', 'get', 'get', 'get', 'get', 'set', 'set', 'set', 'set', 'get']"
        let expectedOutput = "[\"1\",\"1\",\"\",\"1\",\"2\",\"3\",\"3\",\"\",\"30\"]"
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
        let obj = TimeKeyValStore()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "set":
                obj.set(InputParser.parseString(a[0]), InputParser.parseString(a[1]), InputParser.parseInt(a[2]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseString(a[0]), InputParser.parseInt(a[1]))
                results.append("\(r)")
            case "binarySearch":
                let r = obj.binarySearch(a[0], InputParser.parseInt(a[1]))
                results.append("\(r)")
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
