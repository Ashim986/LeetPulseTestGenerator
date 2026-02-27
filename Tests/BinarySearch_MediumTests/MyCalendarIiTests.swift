import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMyCalendarIi {
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

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "37118e5d-42ea-4b77-8b01-5e16cc981ee4",
             input: "['MyCalendarTwo', 'book', 'book', 'book']",
             expected: "[null,true,false,false]", orderMatters: true),
            TestCaseData(id: "98fe7a64-3e59-4f0e-905e-20289ab0388a",
             input: "['MyCalendarTwo', 'book', 'book']",
             expected: "[null,true,false]", orderMatters: true),
            TestCaseData(id: "ee687316-6cd6-467c-abe8-4fc64dd8e2fa",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book']",
             expected: "[null,true,false,false,false]", orderMatters: true),
            TestCaseData(id: "d1b6cce8-068c-4e51-b8f9-8ac90eb18723",
             input: "['MyCalendarTwo', 'book']",
             expected: "[null,true]", orderMatters: true),
            TestCaseData(id: "4650ae61-7512-444c-b761-35f76c850ebd",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book']",
             expected: "[null,true,false,false,false,false]", orderMatters: true),
            TestCaseData(id: "fcd521e7-eac9-410f-b15f-76284dcba35f",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book']",
             expected: "[null,true,false,false,false,false,false]", orderMatters: true),
            TestCaseData(id: "f7734ffa-87fd-424a-9fdf-fc01d83027b6",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book']",
             expected: "[null,true,false,false,false,false,false,false]", orderMatters: true),
            TestCaseData(id: "2837d8f6-809d-4daf-af99-34877a26f8f3",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']",
             expected: "[null,true,false,false,false,false,false,false,false]", orderMatters: true),
            TestCaseData(id: "d83572b5-c8a3-4b07-8846-fe2b8ad12d31",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']",
             expected: "[null,true,false,false,false,false,false,false,false,false]", orderMatters: true),
            TestCaseData(id: "02eaeef1-ae35-42a3-a6c1-afc56ddcdaf6",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']",
             expected: "[null,true,false,false,false,false,false,false,false,false,false]", orderMatters: true),
            TestCaseData(id: "e25a92a5-6666-4057-9a11-09ee6555984b",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book'"
                + ", 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book']",
             expected: "[null,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false"
                + ",false,false,false,false,false,false,false,false]", orderMatters: true),
            TestCaseData(id: "dcfc0c98-9745-4487-aa50-552f49d85b3e",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book'"
                + ", 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book'"
                + "]",
             expected: "[null,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false"
                + ",false,false,false,false,false,false,false,false,false]", orderMatters: true),
            TestCaseData(id: "c16f5e98-13ef-47cf-85e2-4276569d83e8",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book'"
                + ", 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book'"
                + ", 'book']",
             expected: "[null,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false"
                + ",false,false,false,false,false,false,false,false,false,false]", orderMatters: true),
            TestCaseData(id: "0467831c-eb46-4013-8eb6-2307371c7a3f",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book'"
                + ", 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book'"
                + ", 'book', 'book']",
             expected: "[null,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false"
                + ",false,false,false,false,false,false,false,false,false,false,false]", orderMatters: true),
            TestCaseData(id: "2af4f235-4100-42fc-99bd-ddc5822ab704",
             input: "['MyCalendarTwo', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book'"
                + ", 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book', 'book'"
                + ", 'book', 'book', 'book']",
             expected: "[null,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false"
                + ",false,false,false,false,false,false,false,false,false,false,false,false]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "my-calendar-ii"
            let topic = "binary-search"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            var objHolder: Solution.MyCalendarTwo?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.MyCalendarTwo()
            }
            guard !initDidCrash, var obj = objHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution init crashed at runtime"
                )
                return
            }

            var results: [String] = []
            let loopDidCrash = withCrashGuard {
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
            }
            guard !loopDidCrash else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution method crashed at runtime"
                )
                return
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
