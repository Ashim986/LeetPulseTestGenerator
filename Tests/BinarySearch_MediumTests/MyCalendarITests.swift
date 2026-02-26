import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMyCalendarI {
    private class Solution {
        class MyCalendar {
            private var meetings: [[Int]]

            init() {
                meetings = []
            }

            func book(_ start: Int, _ end: Int) -> Bool {
                let newMeeting = [start, end]
                for meeting in meetings {
                    if newMeeting[0] < meeting[1] && newMeeting[1] > meeting[0] {
                        return false
                    }
                }
                meetings.append(newMeeting)
                meetings.sort { $0[0] < $1[0] }
                return true
            }
        }
    }

    @Suite struct MyCalendarITests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ce8710f2-bfa1-43ef-81eb-684e1f1d6457",
             input: "[\"MyCalendar\",\"book\",\"book\"]",
             expected: "[true,false]", orderMatters: true),
            TestCaseData(id: "a070e873-deb6-474e-957b-c9f3eb696c4a",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true]", orderMatters: true),
            TestCaseData(id: "ec87d6ab-7086-4d83-a48c-d6dfd0ca1a73",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true]", orderMatters: true),
            TestCaseData(id: "0ff7009e-bede-4324-b9c5-d3fec6f5483a",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true,false]", orderMatters: true),
            TestCaseData(id: "f7b48d79-9c3c-43b2-b854-b6e0623020c6",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true,false,true]", orderMatters: true),
            TestCaseData(id: "bf9ff7cf-8ba1-4ad6-a555-1becfc098e28",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true,false,true,true]", orderMatters: true),
            TestCaseData(id: "2935c34a-f327-4a26-a515-3fcde6aeaeed",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true,false,true,true,false]", orderMatters: true),
            TestCaseData(id: "371c21de-c858-4a7b-8298-286fa337c270",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true,false,true,true,false,true]", orderMatters: true),
            TestCaseData(id: "bd6d43ac-f78f-47bb-b4f5-8432e675aea6",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true,false,true,true,false,true,false]", orderMatters: true),
            TestCaseData(id: "1444c849-1184-4f78-a447-695459ae2be7",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true,false,true,true,false,true,false,false]", orderMatters: true),
            TestCaseData(id: "7a205404-a3ad-405a-80d1-89b2a75537a0",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"b"
                + "ook\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"bo"
                + "ok\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true,true,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,fa"
                + "lse,false,false,false,false,false,true,true,true]", orderMatters: true),
            TestCaseData(id: "ac33f36c-76ce-43b2-b5b6-eed9726a84b1",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"b"
                + "ook\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"bo"
                + "ok\",\"book\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true,true,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,fa"
                + "lse,false,false,false,false,false,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "636c168c-8f19-4df0-93af-84da2971eda0",
             input: "[\"MyCalendar\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"b"
                + "ook\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"book\",\"bo"
                + "ok\",\"book\",\"book\",\"book\",\"book\",\"book\"]",
             expected: "[true,false,true,true,true,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,fa"
                + "lse,false,false,false,false,false,true,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "451d66fa-61e0-4325-b6b1-914765107b5a",
             input: "['MyCalendar', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']",
             expected: "[true,false,true,true,true,false,true,false,false,false]", orderMatters: true),
            TestCaseData(id: "7af125fa-2044-4b35-918d-cbf4c1be04a1",
             input: "['MyCalendar', 'book', 'book', 'book', 'book', 'book']",
             expected: "[true,false,true,true]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "my-calendar-i"
            let topic = "binary-search"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            var obj = Solution.MyCalendar()

            var results: [String] = []
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "book":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    guard let mArg_1 = InputParser.parseInt(args[1]) else { results.append("null"); continue }
                    let rv = obj.book(mArg_0, mArg_1)
                    results.append(rv ? "true" : "false")
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
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
