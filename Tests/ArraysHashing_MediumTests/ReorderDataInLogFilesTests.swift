import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReorderDataInLogFiles {
    private class Solution {
        func reorderLogFiles(_ logs: [String]) -> [String] {
            var letters: [(original: String, id: String, content: String)] = []
            var digits: [String] = []

            for log in logs {
                let parts = log.split(separator: " ", maxSplits: 1, omittingEmptySubsequences: true)
                guard parts.count == 2 else {
                    digits.append(log)
                    continue
                }
                let id = String(parts[0])
                let content = String(parts[1])
                if let first = content.first, first.isNumber {
                    digits.append(log)
                } else {
                    letters.append((log, id, content))
                }
            }

            letters.sort { a, b in
                if a.content == b.content { return a.id < b.id }
                return a.content < b.content
            }

            return letters.map { $0.original } + digits
        }
    }

    @Suite struct ReorderDataInLogFilesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c673dffc-8485-413e-b716-7ba6db6fdf18",
             input: "logs = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "503883f8-6d8d-4729-8a1e-e5b61694bda4",
             input: "logs = [\"dig1 8 1 5 1\"]",
             expected: "[\"dig1 8 1 5 1\"]", orderMatters: true),
            TestCaseData(id: "d2c376fb-1257-4e76-8ffd-922ebb04b01e",
             input: "logs = [\"let1 art can\", \"dig2 3 6\"]",
             expected: "[\"let1 art can\", \"dig2 3 6\"]", orderMatters: true),
            TestCaseData(id: "9214c00a-5a96-4162-91ad-d2846a334299",
             input: "logs = [\"dig1 8 1 5 1\", \"dig2 3 6\"]",
             expected: "[\"dig1 8 1 5 1\", \"dig2 3 6\"]", orderMatters: true),
            TestCaseData(id: "bece6795-9628-4628-a5b9-8e599d03f1df",
             input: "logs = [\"let1 art can\", \"let2 own kit dig\"]",
             expected: "[\"let1 art can\", \"let2 own kit dig\"]", orderMatters: true),
            TestCaseData(id: "d37483e4-d60f-46aa-9c63-9abc263a36d4",
             input: "logs = [\"dig1 8 1 5 1\", \"let1 art can\", \"dig2 3 6\", \"let2 own kit dig\"]",
             expected: "[\"let1 art can\", \"let2 own kit dig\", \"dig1 8 1 5 1\", \"dig2 3 6\"]", orderMatters: true),
            TestCaseData(id: "76bd85ca-5473-4cb7-98e5-d3a48c35c069",
             input: "logs = [\"let1 art can\", \"let2 own kit dig\", \"let3 art zero\"]",
             expected: "[\"let1 art can\", \"let3 art zero\", \"let2 own kit dig\"]", orderMatters: true),
            TestCaseData(id: "d0335a79-1b2f-4be8-a08e-756144bcd3b4",
             input: "logs = [\"dig1 8 1 5 1\", \"dig2 3 6\", \"dig3 4 7\"]",
             expected: "[\"dig1 8 1 5 1\", \"dig2 3 6\", \"dig3 4 7\"]", orderMatters: true),
            TestCaseData(id: "34c9e304-2fa3-4871-b9a0-107bc9c4c792",
             input: "logs = [\"let1 art can\", \"let1 art can\"]",
             expected: "[\"let1 art can\", \"let1 art can\"]", orderMatters: true),
            TestCaseData(id: "b9fc878f-ea59-4db7-8f35-1f611acf8de4",
             input: "logs = [\"dig1 8 1 5 1\", \"dig1 8 1 5 1\"]",
             expected: "[\"dig1 8 1 5 1\", \"dig1 8 1 5 1\"]", orderMatters: true),
            TestCaseData(id: "2fd3e6b0-bf05-4cb5-b294-55f03f11ae1e",
             input: "logs = [\"let1 art can\", \"dig2 3 6\", \"let2 own kit dig\", \"dig1 8 1 5 1\"]",
             expected: "[\"let1 art can\", \"let2 own kit dig\", \"dig1 8 1 5 1\", \"dig2 3 6\"]", orderMatters: true),
            TestCaseData(id: "93984a6f-1c6a-475b-b609-eea9961394ba",
             input: "logs = [\"dig1 8 1 5 1\", \"let1 art can\", \"let2 own kit dig\", \"let3 art zero\", \"dig2 3 6\"]",
             expected: "[\"let1 art can\", \"let3 art zero\", \"let2 own kit dig\", \"dig1 8 1 5 1\", \"dig2 3 6\"]", orderMatters: true),
            TestCaseData(id: "155f2b27-87c1-4d3f-a636-5db1261a6099",
             input: "logs = [\"let1 art can\", \"let2 own kit dig\", \"let3 art zero\", \"let4 act car\"]",
             expected: "[\"let1 art can\", \"let3 art zero\", \"let2 own kit dig\", \"let4 act car\"]", orderMatters: true),
            TestCaseData(id: "4cdd024d-c909-4fb8-9ec9-f5a5fbf68fac",
             input: "logs = [\"dig1 8 1 5 1\", \"dig2 3 6\", \"dig3 4 7\", \"dig4 5 8\"]",
             expected: "[\"dig1 8 1 5 1\", \"dig2 3 6\", \"dig3 4 7\", \"dig4 5 8\"]", orderMatters: true),
            TestCaseData(id: "39316a0b-0f5a-48e2-a9ff-b501cbd96dc0",
             input: "logs = [\"let1 art can\", \"let2 own kit dig\", \"let3 art zero\", \"let4 act car\", \"let5 own kit dig\"]",
             expected: "[\"let1 art can\", \"let3 art zero\", \"let2 own kit dig\", \"let4 act car\", \"let5 own kit dig\"]", orderMatters: true),
            TestCaseData(id: "50fc8d74-0a24-4739-b6f9-17a96b4c380d",
             input: "logs = [\"dig1 8 1 5 1\", \"dig2 3 6\", \"dig3 4 7\", \"dig4 5 8\", \"dig5 6 9\"]",
             expected: "[\"dig1 8 1 5 1\", \"dig2 3 6\", \"dig3 4 7\", \"dig4 5 8\", \"dig5 6 9\"]", orderMatters: true),
            TestCaseData(id: "bbdcead9-cbc5-4fde-9731-218aab97361e",
             input: "logs = [\"let1 art can\", \"let2 own kit dig\", \"let3 art zero\", \"let4 act car\", \"let5 own kit dig\", \"let6 art can\"]",
             expected: "[\"let1 art can\", \"let6 art can\", \"let3 art zero\", \"let2 own kit dig\", \"let4 act car\", \"let5 own kit dig\"]", orderMatters: true),
            TestCaseData(id: "5cb5bf63-ee10-42d4-9735-2a80d18cd0c0",
             input: "logs = [\"dig1 8 1 5 1\", \"dig2 3 6\", \"dig3 4 7\", \"dig4 5 8\", \"dig5 6 9\", \"dig6 7 10\"]",
             expected: "[\"dig1 8 1 5 1\", \"dig2 3 6\", \"dig3 4 7\", \"dig4 5 8\", \"dig5 6 9\", \"dig6 7 10\"]", orderMatters: true),
            TestCaseData(id: "bda3948e-6ad2-42b5-9c63-78de17913b53",
             input: "logs = [\"let1 art can\", \"let2 own kit dig\", \"let3 art zero\", \"let4 act car\", \"let5 own kit dig\", \"let6 art can\", \"let7 own "
                + "kit dig\"]",
             expected: "[\"let1 art can\", \"let6 art can\", \"let3 art zero\", \"let2 own kit dig\", \"let4 act car\", \"let5 own kit dig\", \"let7 own kit dig"
                + "\"]", orderMatters: true),
            TestCaseData(id: "4705b26b-8e34-4325-9034-e45320ce1a25",
             input: "logs = [\"dig1 8 1 5 1\", \"dig2 3 6\", \"dig3 4 7\", \"dig4 5 8\", \"dig5 6 9\", \"dig6 7 10\", \"dig7 8 11\"]",
             expected: "[\"dig1 8 1 5 1\", \"dig2 3 6\", \"dig3 4 7\", \"dig4 5 8\", \"dig5 6 9\", \"dig6 7 10\", \"dig7 8 11\"]", orderMatters: true),
            TestCaseData(id: "5f804a45-f6eb-451d-bbaf-6831d2750fd0",
             input: "logs = [\"dig1 8 1 5 1\",\"let1 art can\",\"dig2 3 6\",\"let2 own kit dig\",\"let3 art zero\"]",
             expected: "[\"let1 art can\",\"let3 art zero\",\"let2 own kit dig\",\"dig1 8 1 5 1\",\"dig2 3 6\"]", orderMatters: true),
            TestCaseData(id: "11cd1c74-dc77-44ee-9088-1468959406fb",
             input: "logs = [\"a1 9 2 3 1\",\"g1 act car\",\"zo4 4 7\",\"ab1 off key dog\",\"a8 act zoo\"]",
             expected: "[\"g1 act car\",\"a8 act zoo\",\"ab1 off key dog\",\"a1 9 2 3 1\",\"zo4 4 7\"]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reorder-data-in-log-files"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_logs = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_logs.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: logs array too large (\(p_logs.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_logs.count >= 1 && p_logs.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= logs.length <= 100"
                )
                return
            }
            guard p_logs.allSatisfy({ $0.count >= 3 && $0.count <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 3 <= logs[i].length <= 100"
                )
                return
            }

            let solution = Solution()
            let result = solution.reorderLogFiles(p_logs)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [String]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
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
