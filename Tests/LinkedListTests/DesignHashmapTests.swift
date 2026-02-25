import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class MyHashMap {
        let size = 1000
        var buckets: [[(Int, Int)]] = Array(repeating: [], count: size)
        func _hash(_ key: Int) -> Int {
            return abs(key) % size
        }
        func put(_ key: Int, _ value: Int) {
            let index = _hash(key)
            for (i, node) in buckets[index].enumerated() {
                if node.0 == key {
                    buckets[index][i].1 = value
                    return
                }
            }
            buckets[index].append((key, value))
        }
        func get(_ key: Int) -> Int {
            let index = _hash(key)
            for node in buckets[index] {
                if node.0 == key {
                    return node.1
                }
            }
            return -1
        }
        func remove(_ key: Int) {
            let index = _hash(key)
            for (i, node) in buckets[index].enumerated() {
                if node.0 == key {
                    buckets[index].remove(at: i)
                    return
                }
            }
        }
    }
}

@Suite struct DesignHashmapTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "774683d4-ec5b-4479-bdb4-0663bebb4f8a"
        let rawInput = "[\"MyHashMap\",\"put\",\"get\",\"put\",\"get\",\"remove\",\"get\"]"
        let expectedOutput = "[null,null,1,null,1,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "1c60c55d-283c-4b40-99e0-e6306d395682"
        let rawInput = "[\"MyHashMap\",\"put\",\"put\",\"get\",\"remove\",\"get\"]"
        let expectedOutput = "[null,null,null,1,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "eeb97e09-5229-4cad-b8b6-71d1f915c1a9"
        let rawInput = "[\"MyHashMap\",\"put\",\"get\",\"remove\",\"get\"]"
        let expectedOutput = "[null,null,1,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "ebb5d8da-c4d0-408c-a953-436063025bad"
        let rawInput = "[\"MyHashMap\",\"put\",\"put\",\"get\",\"get\",\"remove\",\"get\"]"
        let expectedOutput = "[null,null,null,1,1,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "9c538003-d1f5-4fec-840c-7a64a8d1f7ee"
        let rawInput = "[\"MyHashMap\",\"put\",\"remove\",\"get\"]"
        let expectedOutput = "[null,null,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "ad4d6070-1d46-4af8-bc6e-3e7c528613ae"
        let rawInput = "[\"MyHashMap\",\"get\",\"put\",\"get\",\"remove\",\"get\"]"
        let expectedOutput = "[null,-1,null,1,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "a4cc6f3f-4d75-4bdd-b806-f396dd2d8951"
        let rawInput = "[\"MyHashMap\",\"put\",\"get\",\"put\",\"remove\",\"get\"]"
        let expectedOutput = "[null,null,1,null,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "91cf9e89-fe3e-436e-9ec4-6fa50eab8e1c"
        let rawInput = "[\"MyHashMap\",\"put\",\"put\",\"remove\",\"get\",\"get\"]"
        let expectedOutput = "[null,null,null,null,-1,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "3948f1ed-e87f-4dff-9f09-f6d7bdb1b9f2"
        let rawInput = "[\"MyHashMap\",\"put\",\"get\",\"get\",\"remove\",\"get\"]"
        let expectedOutput = "[null,null,1,1,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "4e37c8a8-544d-4e30-8139-75004c3089b6"
        let rawInput = "[\"MyHashMap\",\"put\",\"put\",\"get\",\"get\",\"get\",\"remove\",\"get\"]"
        let expectedOutput = "[null,null,null,1,1,1,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "241d3eeb-1837-4c6f-bad3-a4c07c8f1cb3"
        let rawInput = "[\"MyHashMap\",\"put\",\"put\",\"put\",\"get\",\"get\",\"get\",\"remove\",\"get\",\"get\"]"
        let expectedOutput = "[null,null,null,null,1,2,3,null,-1,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "456ac390-07cc-4c29-8188-9260cb5a28af"
        let rawInput = "[\"MyHashMap\",\"put\",\"get\",\"put\",\"get\",\"remove\",\"get\",\"put\",\"get\"]"
        let expectedOutput = "[null,null,1,null,2,null,-1,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "50bef4a5-d3e0-47b3-9631-a6d5e0a0c41c"
        let rawInput = "[\"MyHashMap\",\"put\",\"put\",\"get\",\"remove\",\"put\",\"get\"]"
        let expectedOutput = "[null,null,null,1,null,null,2]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "8b080bd4-b48e-468e-96ff-2f490add93d5"
        let rawInput = "[\"MyHashMap\",\"put\",\"get\",\"remove\",\"put\",\"get\"]"
        let expectedOutput = "[null,null,1,null,null,2]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "f73216d2-9d5d-4e37-9016-4388bba32f4f"
        let rawInput = "[\"MyHashMap\",\"put\",\"put\",\"get\",\"get\",\"remove\",\"put\",\"get\"]"
        let expectedOutput = "[null,null,null,1,2,null,null,3]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "7bacc030-43f6-421f-8715-dbad804719ec"
        let rawInput = "[\"MyHashMap\",\"put\",\"put\",\"put\",\"get\",\"get\",\"get\",\"remove\",\"get\",\"get\",\"get\"]"
        let expectedOutput = "[null,null,null,null,1,2,3,null,-1,-1,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "78ef5f89-2248-4d4e-abde-7e1a78494bce"
        let rawInput = "[\"MyHashMap\",\"put\",\"get\",\"put\",\"get\",\"remove\",\"get\",\"put\",\"get\",\"get\"]"
        let expectedOutput = "[null,null,1,null,2,null,-1,null,-1,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "35f96a5d-3836-4977-a5ac-05055adf260b"
        let rawInput = "[\"MyHashMap\",\"put\",\"put\",\"get\",\"get\",\"remove\",\"put\",\"get\",\"get\"]"
        let expectedOutput = "[null,null,null,1,2,null,null,3,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "a9fb95fc-3121-448a-81f5-11dbe1841081"
        let rawInput = "[\"MyHashMap\",\"put\",\"get\",\"remove\",\"put\",\"get\",\"get\"]"
        let expectedOutput = "[null,null,1,null,null,2,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "ebe7cb16-e929-466e-b8ea-18bbc3fefbe7"
        let rawInput = "[\"MyHashMap\",\"put\",\"put\",\"get\",\"get\",\"get\",\"remove\",\"get\",\"put\",\"get\"]"
        let expectedOutput = "[null,null,null,1,2,3,null,-1,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "c09c8a26-738d-440e-94fe-d4ee7d9a38f5"
        let rawInput = "['MyHashMap', 'put', 'get', 'put', 'get', 'remove', 'get']"
        let expectedOutput = "[null,null,1,null,2,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "32ab355c-a22a-4387-84d1-75e253fb061c"
        let rawInput = "['MyHashMap', 'put', 'put', 'get', 'remove', 'get']"
        let expectedOutput = "[null,null,null,2,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "d43b34a1-edad-4941-b80c-92831782da24"
        let rawInput = "['MyHashMap', 'put', 'remove', 'get']"
        let expectedOutput = "[null,null,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "423cdaf3-5fcb-4169-abde-72f7b3770a46"
        let rawInput = "['MyHashMap', 'put', 'put', 'get', 'get', 'remove', 'put', 'get']"
        let expectedOutput = "[null,null,null,10,20,null,null,20]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
        let slug = "design-hashmap"
        let topic = "linked-list"
        let testId = "06de2879-12a0-41c0-a22d-a1c980453eb0"
        let rawInput = "['MyHashMap', 'put', 'put', 'put', 'get', 'get', 'get', 'remove', 'get']"
        let expectedOutput = "[null,null,null,null,15,20,-1,null,-1]"
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
        let obj = MyHashMap()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "_hash":
                let r = obj._hash(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "put":
                obj.put(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append("null")
            case "get":
                let r = obj.get(InputParser.parseInt(a[0]))
                results.append("\(r)")
            case "remove":
                obj.remove(InputParser.parseInt(a[0]))
                results.append("null")
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
