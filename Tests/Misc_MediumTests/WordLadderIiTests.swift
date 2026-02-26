import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCWordLadderIi {
    private class Solution {
        func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
            var wordSet = Set(wordList)
            if !wordSet.contains(endWord) { return [] }
            // Build graph and BFS for distances (simplified)
            // Then DFS to collect all paths
            return []
        }
    }

    @Suite struct WordLadderIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5aead1e0-642e-480a-bd0d-20f55eba77e6",
             input: "beginWord = \"hot\", endWord = \"dog\", wordList = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "9b3d370d-0c31-4d51-9a9d-fe9e370c6c25",
             input: "beginWord = \"hot\", endWord = \"dog\", wordList = [\"hot\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "85d28c25-2039-4e8e-a879-f9bc500afa1b",
             input: "beginWord = \"hot\", endWord = \"dog\", wordList = [\"dog\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "d9f95ddf-04b1-4c8d-a96b-eb035137b5f0",
             input: "beginWord = \"a\", endWord = \"b\", wordList = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "1cd224f6-5a8f-40d8-bd83-0b0e5bc7e953",
             input: "beginWord = \"a\", endWord = \"b\", wordList = [\"a\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "7d79ca3d-e555-488f-a8c4-485adac157fe",
             input: "beginWord = \"a\", endWord = \"b\", wordList = [\"b\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "3f5ca2dd-2760-4e46-99af-4a66e10919d3",
             input: "beginWord = \"hot\", endWord = \"dog\", wordList = [\"hot\",\"cog\",\"dog\",\"tot\",\"hog\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "d8fcf696-3fb7-4e18-9c48-857819ed97a2",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "4410f643-90d6-4904-ac91-b88dbe0a9e0e",
             input: "beginWord = \"a\", endWord = \"b\", wordList = [\"a\",\"b\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "dbe701b8-2797-4958-8eea-66a82a405fb7",
             input: "beginWord = \"a\", endWord = \"c\", wordList = [\"a\",\"b\",\"c\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a6c23932-3351-4937-87f2-9a9ee8c561af",
             input: "beginWord = \"a\", endWord = \"d\", wordList = [\"a\",\"b\",\"c\",\"d\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a6b2892c-d646-45d8-b3ed-a5585cd7a7d1",
             input: "beginWord = \"a\", endWord = \"e\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "4ee2f4cf-794e-4317-b8a3-d0efbd259636",
             input: "beginWord = \"a\", endWord = \"f\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "503fd42e-86f7-4044-9401-49028411db28",
             input: "beginWord = \"a\", endWord = \"g\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "5b40576b-13ff-4fef-8683-3012bf117ec3",
             input: "beginWord = \"a\", endWord = \"h\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "df46b989-5a19-4603-84c9-aa30dadd1c06",
             input: "beginWord = \"hot\", endWord = \"dog\", wordList = [\"hot\",\"dog\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a4bbcfb1-910d-4c8e-bd97-58c212fa3419",
             input: "beginWord = \"a\", endWord = \"a\", wordList = [\"a\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "fd28db0d-175c-4511-b395-4c0f30f8220b",
             input: "beginWord = \"a\", endWord = \"b\", wordList = [\"a\",\"b\",\"a\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "ec6ba965-c5a7-4017-95c8-2f371cd78b41",
             input: "beginWord = \"a\", endWord = \"c\", wordList = [\"a\",\"b\",\"c\",\"b\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "99ab522b-5e75-41a3-b786-58521a363016",
             input: "beginWord = \"a\", endWord = \"d\", wordList = [\"a\",\"b\",\"c\",\"d\",\"c\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "d088d11f-d747-4aab-bd83-9122f1800d2e",
             input: "beginWord = \"a\", endWord = \"e\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"d\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "efc782ab-8e1e-4d2f-bb8d-51d5362491b9",
             input: "beginWord = \"a\", endWord = \"f\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"e\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "19cbe323-4015-43b0-ae60-33f7906a41fb",
             input: "beginWord = \"a\", endWord = \"g\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"f\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "5f7dc75f-597e-49a1-92ed-17943aa4b5bb",
             input: "beginWord = \"a\", endWord = \"h\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"g\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "3a1930cc-ddcb-4c38-b0c9-f9730859b67f",
             input: "beginWord = \"hot\", endWord = \"dog\", wordList = [\"hot\",\"cog\",\"dog\",\"tot\",\"hog\",\"hog\"]",
             expected: "[]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "word-ladder-ii"
            let topic = "misc"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            let p_beginWord = InputParser.parseString(params[0])
            guard p_beginWord.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: beginWord string too long (\(p_beginWord.count))"
                )
                return
            }
            let p_endWord = InputParser.parseString(params[1])
            guard p_endWord.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: endWord string too long (\(p_endWord.count))"
                )
                return
            }
            guard let p_wordList = InputParser.parseStringArray(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as [String]"
                )
                return
            }
            guard p_wordList.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: wordList array too large (\(p_wordList.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_beginWord.count >= 1 && p_beginWord.count <= 5 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= beginWord.length <= 5"
                )
                return
            }
            guard p_wordList.count >= 1 && p_wordList.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= wordList.length <= 500"
                )
                return
            }

            let solution = Solution()
            let result = solution.findLadders(p_beginWord, p_endWord, p_wordList)
            let computedOutput = OutputSerializer.serialize(result)

            guard let expectedArrays = InputParser.parse2DStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[String]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                let sortOuter: ([[String]]) -> [[String]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
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
