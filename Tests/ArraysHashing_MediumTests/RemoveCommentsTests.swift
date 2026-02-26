import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRemoveComments {
    private class Solution {
        func removeComments(_ source: [String]) -> [String] {
            var result: [String] = []
            var inBlock = false
            var buffer: [Character] = []

            for line in source {
                let chars = Array(line)
                var i = 0
                if !inBlock { buffer = [] }

                while i < chars.count {
                    if inBlock {
                        if i + 1 < chars.count, chars[i] == "*", chars[i + 1] == "/" {
                            inBlock = false
                            i += 2
                        } else {
                            i += 1
                        }
                    } else {
                        if i + 1 < chars.count, chars[i] == "/", chars[i + 1] == "/" {
                            break
                        }
                        if i + 1 < chars.count, chars[i] == "/", chars[i + 1] == "*" {
                            inBlock = true
                            i += 2
                            continue
                        }
                        buffer.append(chars[i])
                        i += 1
                    }
                }

                if !inBlock, !buffer.isEmpty {
                    result.append(String(buffer))
                }
            }

            return result
        }
    }

    @Suite struct RemoveCommentsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d670438c-725c-44df-98b4-0971e510425c",
             input: "source = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "5b844228-c4f6-47d4-afa7-0b7bd823903d",
             input: "source = [\"a\", \"b\", \"c\"]",
             expected: "[\"a\", \"b\", \"c\"]", orderMatters: true),
            TestCaseData(id: "5c338ab2-bf80-46f4-badc-6161679ba8e1",
             input: "source = [\"a\", \"b\", \"c\", \"d\", \"e\"]",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\"]", orderMatters: true),
            TestCaseData(id: "5bdfcc89-169c-4522-86a9-9ebe6f50a644",
             input: "source = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\"]",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\", \"f\"]", orderMatters: true),
            TestCaseData(id: "b9b39107-1538-42b6-8ed3-ba38e2113059",
             input: "source = [\"\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "ce47d067-532a-41e1-86c1-b9de921af937",
             input: "source = [\"// comment\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "6f8798a1-c5c5-4d51-a5ef-f24c5262cfea",
             input: "source = [\"/* block */\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "7f843024-b4a7-45a4-927c-e68cb97ca3ee",
             input: "source = [\"// comment\", \"// comment\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "10587b22-48a1-4eda-ab72-7e95e4d167a2",
             input: "source = [\"/* block */\", \"/* block */\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a706ca12-af78-4e82-8fea-96ed0a1735a6",
             input: "source = [\"a\", \"// comment\"]",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "876e5700-bceb-4db8-bf6c-1c159bdaff99",
             input: "source = [\"a\", \"/* block */\"]",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "2ca160ce-7dcb-46b9-b18a-16f5c48c3c32",
             input: "source = [\"// comment\", \"a\"]",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "c5954579-ee2b-425c-8d97-8b1971da821c",
             input: "source = [\"/* block */\", \"a\"]",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "11b55db0-2942-4552-a24a-756efaf044a1",
             input: "source = [\"a\", \"b\", \"// comment\"]",
             expected: "[\"a\",\"b\"]", orderMatters: true),
            TestCaseData(id: "a16dc162-3d10-48e4-a665-11ccf624d416",
             input: "source = [\"a\", \"b\", \"/* block */\"]",
             expected: "[\"a\",\"b\"]", orderMatters: true),
            TestCaseData(id: "d72b3419-2852-4b7b-b6a1-9cf451b9b7d2",
             input: "source = [\"// comment\", \"a\", \"b\"]",
             expected: "[\"a\",\"b\"]", orderMatters: true),
            TestCaseData(id: "9eb8f20a-165c-449b-ba78-5e1a1058b58d",
             input: "source = [\"/* block */\", \"a\", \"b\"]",
             expected: "[\"a\",\"b\"]", orderMatters: true),
            TestCaseData(id: "6d8840bd-5ae3-4fdd-8b60-d6a53ed22d3f",
             input: "source = [\"a\", \"// comment\", \"b\"]",
             expected: "[\"a\",\"b\"]", orderMatters: true),
            TestCaseData(id: "53b00871-18c5-46eb-84eb-ef5f375e3b26",
             input: "source = [\"a\", \"/* block */\", \"b\"]",
             expected: "[\"a\",\"b\"]", orderMatters: true),
            TestCaseData(id: "ec60ba28-e08a-4ab7-b68f-0cf2de6c08bf",
             input: "source = [\"a\", \"// comment\", \"// comment\"]",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "7188657e-d9a9-4627-a9f2-33aaf7bb5d8b",
             input: "source = [\"a\", \"/* block */\", \"/* block */\"]",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "b2762443-fc1d-4c5c-8305-32df099cbef0",
             input: "source = [\"// comment\", \"// comment\", \"a\"]",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "d910025c-d19c-42d8-9ec3-9e884eb1bc0f",
             input: "source = [\"/* block */\", \"/* block */\", \"a\"]",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "2900b750-4c1d-454d-968e-e342e6583b37",
             input: "source = [\"a\", \"// comment\", \"// comment\", \"b\"]",
             expected: "[\"a\",\"b\"]", orderMatters: true),
            TestCaseData(id: "9fe8141b-b1a3-4739-8fa7-5120a4832603",
             input: "source = [\"a\", \"/* block */\", \"/* block */\", \"b\"]",
             expected: "[\"a\",\"b\"]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "remove-comments"
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

            guard let p_source = InputParser.parseStringArray(params[0]) else {
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
            guard p_source.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: source array too large (\(p_source.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_source.count >= 1 && p_source.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= source.length <= 100"
                )
                return
            }
            guard p_source.allSatisfy({ $0.count >= 0 && $0.count <= 80 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= source[i].length <= 80"
                )
                return
            }

            let solution = Solution()
            let result = solution.removeComments(p_source)
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
