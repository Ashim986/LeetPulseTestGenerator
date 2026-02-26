import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfMatchingSubsequences {
    private class Solution {
        func numMatchingSubseq(_ S: String, _ words: [String]) -> Int {
            var count = 0
            var charIndex: [Character: [Int]] = [:]
            for (i, char) in S.enumerated() {
                if charIndex[char] == nil {
                    charIndex[char] = [i]
                } else {
                    charIndex[char]?.append(i)
                }
            }
            for word in words {
                var wordIndex = 0
                var prevIndex = -1
                while wordIndex < word.count {
                    if let indices = charIndex[word[word.index(word.startIndex, offsetBy: wordIndex)]] {
                        var nextIndex = -1
                        for index in indices {
                            if index > prevIndex {
                                nextIndex = index
                                break
                            }
                        }
                        if nextIndex == -1 {
                            break
                        }
                        prevIndex = nextIndex
                        wordIndex += 1
                    } else {
                        break
                    }
                }
                if wordIndex == word.count {
                    count += 1
                }
            }
            return count
        }
    }

    @Suite struct NumberOfMatchingSubsequencesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ca66fef8-395b-4bcd-bb39-02f11368ce8e",
             input: "S = \"abc\", words = [\"a\",\"b\",\"c\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "102d1a19-7040-4853-a088-a43ad721f111",
             input: "S = \"abc\", words = [\"abc\",\"abcd\",\"abce\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8ee5feb8-36d3-485d-b4e3-5a17f78e2aac",
             input: "S = \"\", words = [\"a\",\"b\",\"c\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "41eed5f7-4993-49cc-b08d-9d57266d0f4f",
             input: "S = \"a\", words = [\"a\",\"b\",\"c\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c43d2d9f-e00d-4683-ba61-d5f724776500",
             input: "S = \"abc\", words = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "00909111-0486-4ea0-ab71-d67e9ecbdbcd",
             input: "S = \"abc\", words = [\"abc\",\"abc\",\"abc\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d3f7cd78-8dd2-423d-a7e1-9c9949a47e6e",
             input: "S = \"abcde\", words = [\"a\",\"b\",\"c\",\"d\",\"e\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "75666235-9310-4d03-b3fc-a75f7f9e6622",
             input: "S = \"abcde\", words = [\"abc\",\"bcd\",\"cde\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ef30397a-af7f-4f35-883c-98a77672c09b",
             input: "S = \"aabbcc\", words = [\"ab\",\"bc\",\"cc\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a11434de-d89d-476d-87bb-ece5aac1b920",
             input: "S = \"abcde\", words = [\"abcde\",\"abcde\",\"abcde\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a2602bad-0730-4339-a6ec-8bcc3caefc70",
             input: "S = \"abc\", words = [\"abc\",\"def\",\"ghi\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a1df7a63-efa1-4f9a-b0e8-96b042568bce",
             input: "S = \"abc\", words = [\"abc\",\"abc\",\"def\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5b4f169c-ac41-4f02-82ca-2e46be1a9cd9",
             input: "S = \"abc\", words = [\"def\",\"ghi\",\"jkl\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "32ee385b-c356-444b-bc5d-5d2dfad1dea1",
             input: "S = \"abcde\", words = [\"abc\",\"def\",\"ghi\",\"jkl\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d7d70701-b886-4285-95bc-0fda391a7979",
             input: "S = \"abcde\", words = [\"abc\",\"bcd\",\"cde\",\"def\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e344abce-dcc7-40de-afff-4615c2bbc92a",
             input: "S = \"abcde\", words = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "68088d5a-9521-4937-9eaf-96a1aec1a68f",
             input: "S = \"a\", words = [\"a\",\"a\",\"a\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "5fc6c3ef-bebe-4e88-8370-ab7544ef330f",
             input: "S = \"ab\", words = [\"a\",\"b\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3698ef3f-da14-436b-82f2-165547890121",
             input: "S = \"abc\", words = [\"abc\",\"abc\",\"abc\",\"abc\",\"abc\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "257bb7a9-ac06-4576-9a80-bd4e6c6df39a",
             input: "S = \"abcde\", words = [\"abc\",\"bcd\",\"cde\",\"def\",\"efg\",\"fgh\",\"ghi\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "abfc3dbf-65e0-4ef6-b18b-c78935006aba",
             input: "S = \"abc\", words = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1a663550-66e1-4052-84a8-bc3ba060dfec",
             input: "S = \"abc\", words = [\"abc\",\"abc\",\"abc\",\"abc\",\"abc\",\"abc\"]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "d370ec23-b372-4683-86ee-b428a4472166",
             input: "S = \"abcde\", words = [\"abc\",\"bcd\",\"cde\",\"def\",\"efg\",\"fgh\",\"ghi\",\"hij\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f5b2ab2b-f4bd-4049-90a0-dca7c076cc69",
             input: "S = \"abc\", words = [\"ab\",\"bc\",\"ac\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a6ad1767-21eb-452d-89ec-b12161dd126d",
             input: "S = \"abcde\", words = [\"abcd\",\"bcde\",\"cde\"]",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-matching-subsequences"
            let topic = "binary-search"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            let p_S = InputParser.parseString(params[0])
            guard p_S.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: S string too long (\(p_S.count))"
                )
                return
            }
            guard let p_words = InputParser.parseStringArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [String]"
                )
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: words array too large (\(p_words.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_S.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 5 * 104"
                )
                return
            }
            guard p_words.count >= 1 && p_words.count <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 5000"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 50 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 50"
                )
                return
            }

            let solution = Solution()
            let result = solution.numMatchingSubseq(p_S, p_words)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
