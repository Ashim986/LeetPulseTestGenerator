import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class MyCalendarTwo {
        var events: [(Int, Int)]
        var doubleBooked: [(Int, Int)]
        init() { events = []; doubleBooked = [] }
        func book(_ start: Int, _ end: Int) -> Bool {
            for event in doubleBooked {
                if start < event.1 && end > event.0 {
                    return false
                }
            }
            for event in events {
                if start < event.1 && end > event.0 {
                    doubleBooked.append((max(start, event.0), min(end, event.1)))
                }
            }
            events.append((start, end))
            return true
        }
    }
}

@Suite struct MyCalendarIiTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "37118e5d-42ea-4b77-8b01-5e16cc981ee4"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "98fe7a64-3e59-4f0e-905e-20289ab0388a"
        let rawInput = "['MyCalendarTwo', 'book', 'book']"
        let expectedOutput = "[null,true,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "ee687316-6cd6-467c-abe8-4fc64dd8e2fa"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "d1b6cce8-068c-4e51-b8f9-8ac90eb18723"
        let rawInput = "['MyCalendarTwo', 'book']"
        let expectedOutput = "[null,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "4650ae61-7512-444c-b761-35f76c850ebd"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "fcd521e7-eac9-410f-b15f-76284dcba35f"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "f7734ffa-87fd-424a-9fdf-fc01d83027b6"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "2837d8f6-809d-4daf-af99-34877a26f8f3"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "d83572b5-c8a3-4b07-8846-fe2b8ad12d31"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "02eaeef1-ae35-42a3-a6c1-afc56ddcdaf6"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false,false,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "e25a92a5-6666-4057-9a11-09ee6555984b"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "dcfc0c98-9745-4487-aa50-552f49d85b3e"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "c16f5e98-13ef-47cf-85e2-4276569d83e8"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "0467831c-eb46-4013-8eb6-2307371c7a3f"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
        let slug = "my-calendar-ii"
        let topic = "binary-search"
        let testId = "2af4f235-4100-42fc-99bd-ddc5822ab704"
        let rawInput = "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']"
        let expectedOutput = "[null,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
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
            var obj = Solution.MyCalendarTwo()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "book":
                let r = obj.book(InputParser.parseInt(a[0]), InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
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
