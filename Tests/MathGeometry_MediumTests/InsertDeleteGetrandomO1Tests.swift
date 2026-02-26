import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class RandomizedSet {
        var dict: [Int: Int] = [:]
        var elements: [Int] = []
        func insert(_ val: Int) -> Bool {
            if dict.keys.contains(val) {
                return false
            }
            dict[val] = elements.count
            elements.append(val)
            return true
        }
        func remove(_ val: Int) -> Bool {
            if let index = dict[val] {
                let last = elements.last!
                elements[index] = last
                dict[last] = index
                elements.removeLast()
                dict.removeValue(forKey: val)
                return true
            }
            return false
        }
        func getRandom() -> Int {
            return elements.randomElement()!
        }
    }
}

@Suite struct InsertDeleteGetrandomO1Tests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "d1c4e8a8-8e7f-4900-85d2-b54dcfe3a1bc"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"remove\",\"insert\",\"insert\",\"remove\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_1() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "554f2e94-4ce6-4c77-a0d1-fa0e61c90528"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_2() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "d1682692-9947-4c1b-a25a-8b680c1ac506"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\"]"
        let expectedOutput = "[null,true,false,true,true,true,true,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_3() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "f95c516a-0e43-4545-bb26-57aeabf004a8"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"getRandom\",\"remove\",\"insert\",\"getRandom\"]"
        let expectedOutput = "[null,true,false,true,1,true,false,2]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_4() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "c0602f12-d5d0-4244-bbe4-2140df6fce90"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"getRandom\",\"remove\",\"insert\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,1,true,true,2]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_5() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "b071064a-0126-497a-b5ac-86f6c01deba6"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"getRandom\",\"remove\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,1,true,1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_6() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "50e001e9-a67c-438a-9d5a-58d85cf0ed7b"
        let rawInput = "[\"RandomizedSet\",\"remove\",\"insert\",\"remove\",\"insert\",\"getRandom\"]"
        let expectedOutput = "[null,false,true,true,true,2]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_7() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "55d0dc56-4434-4948-ae42-1fc68f19e608"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"getRandom\",\"remove\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,1,true,1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_8() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "4cc4f7c7-aa5e-40a6-b48a-ea407b2cad80"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"remove\",\"insert\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,3]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_9() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "1d7fc6b5-bd1f-4d6d-b350-1cf3ba13c9f3"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"remove\",\"insert\",\"remove\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,3]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_10() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "e544c527-54b0-4456-aefc-b31b48844f20"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"remove\",\"remove\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,2]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_11() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "d3f4b983-a081-4597-88c1-ba37eec613ae"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"remove\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,3]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_12() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "d57be839-857c-4d9e-9aa8-bfc4c2e8426f"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"remove\",\"insert\",\"insert\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,2]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_13() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "88e1cd7b-ed86-41d6-9f80-0f691fe7d547"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"getRandom\",\"remove\"]"
        let expectedOutput = "[null,true,true,true,true,true,1,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_14() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "c5ad945c-b77a-47b3-800e-41ca6bc6778b"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"remove\",\"insert\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,3]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_15() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "fd608459-f1d7-4a78-9bb4-3763173083a3"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"remove\",\"insert\",\"remove\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,3]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_16() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "21a37256-d152-40eb-bc8f-15de758a9c1f"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"remove\",\"insert\",\"insert\",\"insert\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,2]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_17() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "4eaa34aa-c85a-4fba-a8a3-4823bb4ccc15"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"remove\",\"remove\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,3]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_18() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "5317687f-c0a4-40df-8eed-6ab7fb7fbd38"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"insert\",\"remove\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,3]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_19() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "6f098b72-52f5-496e-8f59-5efb7af972f2"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,1]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_20() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "517e04f2-2465-405c-8dc2-8f9cbd08f5a5"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"remove\",\"remove\",\"insert\",\"insert\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,3]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_21() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "2e600a4c-ceb0-41b1-a562-369b02754203"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"insert\",\"insert\",\"getRandom\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,2]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_22() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "57066931-66ea-455a-8d01-64d363a9c42e"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"remove\",\"remove\",\"remove\"]"
        let expectedOutput = "[null,true,true,true,true,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_23() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "a782baaa-dec9-449b-99e6-5f2ab8d57d0f"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"insert\",\"remove\"]"
        let expectedOutput = "[null,true,true,true,true,true,true,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_24() async {
        let slug = "insert-delete-getrandom-o1"
        let topic = "math-geometry"
        let testId = "1ec94497-1db9-4f72-b1e4-690eccfa739e"
        let rawInput = "[\"RandomizedSet\",\"insert\",\"remove\",\"insert\",\"insert\",\"insert\",\"remove\",\"insert\"]"
        let expectedOutput = "[null,true,false,true,true,true,false,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.RandomizedSet()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                let r = obj.insert(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "remove":
                let r = obj.remove(InputParser.parseInt(a[0]))
                results.append(r ? "true" : "false")
            case "getRandom":
                let r = obj.getRandom()
                results.append("\(r)")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

}
