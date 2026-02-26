import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTopKFrequentWords {
    private class Solution {
        let topKFrequent = { (words: [String], k: Int) -> [String] in
            let wordCount = Dictionary(grouping: words, by: { $0 }).mapValues { $0.count }
            var heap = [(word: String, count: Int)]()
            for (word, count) in wordCount {
                heap.append((word, count))
            }
            heap.sort { $0.count > $1.count || ($0.count == $1.count && $0.word < $1.word) }
            return Array(heap.prefix(k)).map { $0.word }
        }
    }

    @Suite struct TopKFrequentWordsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c807e573-3eab-4aa1-b8d8-dc7197c9bd3b",
             input: "words = [\"a\",\"b\",\"c\"], k = 3",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: true),
            TestCaseData(id: "db47dce3-f4e1-459f-b2d6-064f9e5994b8",
             input: "words = [\"a\",\"a\",\"a\"], k = 1",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "714e5f67-8b4f-49ed-879e-06095937f97d",
             input: "words = [\"a\",\"b\",\"c\"], k = 1",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "19e440e8-3ec6-4c6c-9c83-642766c9e3c8",
             input: "words = [], k = 2",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "cb6035f0-ec8b-470d-8897-d53045a8438a",
             input: "words = [\"a\"], k = 1",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "bf735007-eba2-40b7-88af-c100e73f20ce",
             input: "words = [\"a\",\"b\",\"c\"], k = 0",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "b1344f17-24d5-4667-916a-add44a9314de",
             input: "words = [\"a\",\"a\",\"b\",\"b\",\"c\"], k = 2",
             expected: "[\"a\",\"b\"]", orderMatters: true),
            TestCaseData(id: "b1c143c9-e2b4-45fa-8347-203c92a2f1aa",
             input: "words = [\"a\",\"b\",\"c\",\"d\",\"e\"], k = 5",
             expected: "[\"a\",\"b\",\"c\",\"d\",\"e\"]", orderMatters: true),
            TestCaseData(id: "c6f7963d-532c-43ec-b584-06a903c12aef",
             input: "words = [\"a\",\"a\",\"a\",\"b\",\"b\",\"c\"], k = 3",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: true),
            TestCaseData(id: "46a1c7e5-863c-4b5b-8e46-e7bdce9a48a7",
             input: "words = [\"z\",\"y\",\"x\"], k = 3",
             expected: "[\"z\",\"y\",\"x\"]", orderMatters: true),
            TestCaseData(id: "e01441a9-d4bf-4719-8c99-15ffef367a31",
             input: "words = [\"apple\",\"banana\",\"cherry\"], k = 3",
             expected: "[\"apple\",\"banana\",\"cherry\"]", orderMatters: true),
            TestCaseData(id: "1a355dc3-bba6-4ed0-b4a0-56d241372418",
             input: "words = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\"], k = 4",
             expected: "[\"a\",\"b\",\"c\",\"d\"]", orderMatters: true),
            TestCaseData(id: "306ed016-7f45-44bb-8b94-617da86bd771",
             input: "words = [\"hello\",\"world\",\"hello\",\"world\"], k = 2",
             expected: "[\"hello\",\"world\"]", orderMatters: true),
            TestCaseData(id: "88fbe2cc-3b15-4dcd-be02-252707bd1d66",
             input: "words = [\"a\",\"a\",\"b\",\"b\",\"c\",\"c\"], k = 2",
             expected: "[\"a\",\"b\"]", orderMatters: true),
            TestCaseData(id: "6f693636-eb6b-4be5-a34a-934791f841af",
             input: "words = [\"x\",\"y\",\"z\",\"x\",\"y\",\"z\"], k = 3",
             expected: "[\"x\",\"y\",\"z\"]", orderMatters: true),
            TestCaseData(id: "bf8ad6dc-beea-4fa3-b92d-f773a1750cc0",
             input: "words = [\"abc\",\"def\",\"ghi\"], k = 3",
             expected: "[\"abc\",\"def\",\"ghi\"]", orderMatters: true),
            TestCaseData(id: "7810391f-4da1-47a8-8b21-645de27f2acf",
             input: "words = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\"], k = 7",
             expected: "[\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\"]", orderMatters: true),
            TestCaseData(id: "d25da584-0f9a-481a-a7bc-24fa904c913e",
             input: "words = [\"apple\",\"banana\",\"orange\"], k = 3",
             expected: "[\"apple\",\"banana\",\"orange\"]", orderMatters: true),
            TestCaseData(id: "71016601-0f4b-40ae-9d5f-d830dc69054c",
             input: "words = [\"hello\",\"hello\",\"hello\"], k = 1",
             expected: "[\"hello\"]", orderMatters: true),
            TestCaseData(id: "99ff9693-00ae-4e82-8395-e8f00e7312c0",
             input: "words = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\"], k = 8",
             expected: "[\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\"]", orderMatters: true),
            TestCaseData(id: "75ec1639-153b-4d7d-8368-5729eb8190ec",
             input: "words = [\"x\",\"x\",\"x\",\"y\",\"y\",\"y\"], k = 2",
             expected: "[\"x\",\"y\"]", orderMatters: true),
            TestCaseData(id: "95d3c0a0-051d-403c-aee4-eeeb255a7b11",
             input: "words = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\"], k = 9",
             expected: "[\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\"]", orderMatters: true),
            TestCaseData(id: "aa4d355b-5544-4ae3-b16b-d517b9e2ae5d",
             input: "words = [\"apple\",\"banana\",\"cherry\",\"date\"], k = 4",
             expected: "[\"apple\",\"banana\",\"cherry\",\"date\"]", orderMatters: true),
            TestCaseData(id: "a5a072f1-f138-4cee-9d9f-1241728a9abf",
             input: "words = [\"hello\",\"world\",\"abc\",\"def\"], k = 4",
             expected: "[\"hello\",\"world\",\"abc\",\"def\"]", orderMatters: true),
            TestCaseData(id: "ab9c25f4-316d-4f8b-af22-7429a40969c1",
             input: "words = [\"a\",\"a\",\"b\",\"b\",\"c\",\"c\",\"d\"], k = 3",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "top-k-frequent-words"
            let topic = "tries"
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

            guard let p_words = InputParser.parseStringArray(params[0]) else {
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 500"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 10"
                )
                return
            }

            let solution = Solution()
            let result = solution.topKFrequent(p_words, p_k)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[Str', using string equality
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
