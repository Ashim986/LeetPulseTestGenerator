import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindAndReplaceInString {
    private class Solution {
        func findAndReplaceString(
            _ s: String,
            _ indices: [Int],
            _ sources: [String],
            _ targets: [String]
        ) -> String {
            let chars = Array(s)
            var match = Array(repeating: -1, count: chars.count)

            for i in 0..<indices.count {
                let start = indices[i]
                let src = Array(sources[i])
                guard start >= 0, start + src.count <= chars.count else { continue }
                if Array(chars[start..<start + src.count]) == src {
                    match[start] = i
                }
            }

            var index = 0
            var result = ""
            while index < chars.count {
                let i = match[index]
                if i != -1 {
                    result += targets[i]
                    index += sources[i].count
                } else {
                    result.append(chars[index])
                    index += 1
                }
            }
            return result
        }
    }

    @Suite struct FindAndReplaceInStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ca443728-00d5-4a31-8d44-3d60e4d3f1da",
             input: "s = \"abc\", indices = [1], sources = [\"b\"], targets = [\"d\"]",
             expected: "adc", orderMatters: true),
            TestCaseData(id: "6eee07f2-f7a0-4af6-9de2-5add8734ec31",
             input: "s = \"abc\", indices = [0], sources = [\"a\"], targets = [\"x\"]",
             expected: "xbc", orderMatters: true),
            TestCaseData(id: "7b865fc5-a1b6-45c1-9486-1aabe487fd5f",
             input: "s = \"abc\", indices = [], sources = [], targets = []",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "76a17c7b-7b78-48ca-a002-ffe24b28c468",
             input: "s = \"abc\", indices = [1, 2], sources = [\"b\", \"c\"], targets = [\"d\", \"e\"]",
             expected: "ade", orderMatters: true),
            TestCaseData(id: "3c5493fc-3dc2-4bdf-aa2f-ac148c5d2522",
             input: "s = \"abc\", indices = [0, 1], sources = [\"a\", \"b\"], targets = [\"x\", \"y\"]",
             expected: "xyc", orderMatters: true),
            TestCaseData(id: "e78443d0-6865-4984-b8f5-e4ce3dc937cf",
             input: "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"c\"], targets = [\"x\", \"y\", \"z\"]",
             expected: "xyz", orderMatters: true),
            TestCaseData(id: "3ab9ec7f-4e29-467a-958e-7d22470eac07",
             input: "s = \"abc\", indices = [0, 0], sources = [\"a\", \"a\"], targets = [\"x\", \"y\"]",
             expected: "ybc", orderMatters: true),
            TestCaseData(id: "16f7a245-adf7-4c65-b965-82c69f1ddb2e",
             input: "s = \"abc\", indices = [0, 2], sources = [\"a\", \"c\"], targets = [\"x\", \"y\"]",
             expected: "xby", orderMatters: true),
            TestCaseData(id: "0882fd4b-b5b1-44a0-93aa-19b54d708eda",
             input: "s = \"abc\", indices = [0, 0, 0], sources = [\"a\", \"a\", \"a\"], targets = [\"x\", \"y\", \"z\"]",
             expected: "zbc", orderMatters: true),
            TestCaseData(id: "9a38c3f3-9270-4070-aa3b-b2d251ab5632",
             input: "s = \"abc\", indices = [1, 1, 1], sources = [\"b\", \"b\", \"b\"], targets = [\"d\", \"e\", \"f\"]",
             expected: "afc", orderMatters: true),
            TestCaseData(id: "624b34d0-a4d8-4f9f-b01a-7b93ad59030f",
             input: "s = \"abc\", indices = [0, 0, 0], sources = [\"abc\", \"abc\", \"abc\"], targets = [\"x\", \"y\", \"z\"]",
             expected: "z", orderMatters: true),
            TestCaseData(id: "1ebb1669-1195-4fe0-a1f0-e1f5a2270dca",
             input: "s = \"abc\", indices = [0], sources = [\"abc\"], targets = [\"xyz\"]",
             expected: "xyz", orderMatters: true),
            TestCaseData(id: "6d2b0af4-90ab-4be5-b91e-3e6e4585ad7e",
             input: "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"c\"], targets = [\"x\", \"\", \"z\"]",
             expected: "xz", orderMatters: true),
            TestCaseData(id: "57ae86f0-7b21-4694-94e9-ba3551485504",
             input: "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"c\"], targets = [\"\", \"y\", \"z\"]",
             expected: "yz", orderMatters: true),
            TestCaseData(id: "959cf738-0b02-466d-adfa-85fe4f74a54e",
             input: "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"c\"], targets = [\"x\", \"y\", \"\"]",
             expected: "xy", orderMatters: true),
            TestCaseData(id: "3d919264-0613-4d86-8868-b1076a6c95b2",
             input: "s = \"abc\", indices = [1], sources = [\"b\"], targets = [\"bb\"]",
             expected: "abbc", orderMatters: true),
            TestCaseData(id: "74ac3cf9-fc0b-4dbb-80a0-816faf1da016",
             input: "s = \"abc\", indices = [1, 1], sources = [\"b\", \"b\"], targets = [\"d\", \"e\"]",
             expected: "aec", orderMatters: true),
            TestCaseData(id: "cbfe7707-2bb9-46c2-b227-2b44bec0d863",
             input: "s = \"abc\", indices = [0, 1, 2], sources = [\"ab\", \"bc\", \"ca\"], targets = [\"x\", \"y\", \"z\"]",
             expected: "xc", orderMatters: true),
            TestCaseData(id: "0203226a-065d-4a87-b035-cd5d3f9dad91",
             input: "s = \"abc\", indices = [0, 0, 0], sources = [\"ab\", \"ab\", \"ab\"], targets = [\"x\", \"y\", \"z\"]",
             expected: "zc", orderMatters: true),
            TestCaseData(id: "36f6534c-006c-491f-8d94-9aa98e0fe042",
             input: "s = \"abc\", indices = [0, 1, 2], sources = [\"abc\", \"abc\", \"abc\"], targets = [\"x\", \"y\", \"z\"]",
             expected: "x", orderMatters: true),
            TestCaseData(id: "98e6ffa7-227e-4c3d-b44a-1305d8e2191c",
             input: "s = \"abc\", indices = [0, 1], sources = [\"abc\", \"abc\"], targets = [\"x\", \"y\"]",
             expected: "x", orderMatters: true),
            TestCaseData(id: "47374d06-ed5e-4be0-b26d-d2c7ebf1e76d",
             input: "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"abc\"], targets = [\"x\", \"y\", \"z\"]",
             expected: "xyc", orderMatters: true),
            TestCaseData(id: "980b5729-1feb-40fe-a3b2-e15876684576",
             input: "s = \"abc\", indices = [0, 1, 2], sources = [\"abc\", \"b\", \"c\"], targets = [\"x\", \"y\", \"z\"]",
             expected: "x", orderMatters: true),
            TestCaseData(id: "298c66ba-b50d-4f88-b786-540a9f8f6cce",
             input: "s = \"abc\", indices = [0, 1, 2], sources = [\"\", \"\", \"\"], targets = [\"x\", \"y\", \"z\"]",
             expected: "INFINITE_LOOP", orderMatters: true),
            TestCaseData(id: "e0cfbad9-f01a-4d81-9d6d-eb266eff1cf8",
             input: "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"\"], targets = [\"x\", \"y\", \"z\"]",
             expected: "INFINITE_LOOP", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-and-replace-in-string"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 4 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 4, got \(params.count)"
                )
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }
            guard let p_indices = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_indices.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: indices array too large (\(p_indices.count))"
                )
                return
            }
            guard let p_sources = InputParser.parseStringArray(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as [String]"
                )
                return
            }
            guard p_sources.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: sources array too large (\(p_sources.count))"
                )
                return
            }
            guard let p_targets = InputParser.parseStringArray(params[3]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 3 as [String]"
                )
                return
            }
            guard p_targets.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: targets array too large (\(p_targets.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 1000"
                )
                return
            }
            guard p_indices.count >= 1 && p_indices.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= 100"
                )
                return
            }
            guard p_sources.allSatisfy({ $0.count >= 1 && $0.count <= 50 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= sources[i].length, targets[i].length <= 50"
                )
                return
            }
            guard p_targets.allSatisfy({ $0.count >= 1 && $0.count <= 50 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= sources[i].length, targets[i].length <= 50"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
            }
            guard !didCrash, let result = resultHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
