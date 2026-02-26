import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCWordLadder {
    private class Solution {
        func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
            var wordSet = Set(wordList)
            if !wordSet.contains(endWord) { return 0 }

            var queue = [(beginWord, 1)]
            var visited = Set([beginWord])

            while !queue.isEmpty {
                let (word, level) = queue.removeFirst()
                var chars = Array(word)

                for i in 0..<chars.count {
                    let original = chars[i]
                    for c in "abcdefghijklmnopqrstuvwxyz" {
                        chars[i] = c
                        let newWord = String(chars)
                        if newWord == endWord { return level + 1 }
                        if wordSet.contains(newWord) && !visited.contains(newWord) {
                            visited.insert(newWord)
                            queue.append((newWord, level + 1))
                        }
                    }
                    chars[i] = original
                }
            }

            return 0
        }
    }

    @Suite struct WordLadderTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f7fe8e28-233b-45e0-91b3-586c74956f25",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e3a823ec-53e1-40e6-be45-b87a31ca3a00",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hit\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fe88f5a2-00b6-4632-b410-d249cf3c82d7",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"cog\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "06d6d315-a9ff-4200-9926-43875989e646",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3a56705b-f9f9-4eb6-b01b-6da46f53ea9d",
             input: "beginWord = \"a\", endWord = \"b\", wordList = [\"a\",\"b\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "aa33ce57-820c-4719-b044-24fd55f27071",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\",\"cog\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "312a4fcb-c776-40e0-b66e-977cacd7c2b0",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\",\"hot\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "10819b2d-baba-419e-8ff8-28427e347423",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\",\"hot\",\"dot\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "74721a47-467a-4341-a705-e255c9fff683",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\",\"hot\",\"dot\",\"dog\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ba074677-72b5-440c-99da-4253fa52e089",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\",\"hot\",\"dot\",\"dog\",\"lot\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b1292bec-cb05-49be-b6e5-e41329af737d",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\",\"hot\",\"dot\",\"dog\",\"lot\",\"lo"
                + "g\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f0bd8197-2c59-4a6b-876d-f33b20205a4d",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\",\"hot\",\"dot\",\"dog\",\"lot\",\"lo"
                + "g\",\"cog\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "065208af-dbfa-4767-aaad-a2cc43092c00",
             input: "beginWord = \"a\", endWord = \"b\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c3945a31-373f-4142-b7bc-9672c7b74a11",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\",\"a\",\"b\",\"c\",\"d\",\"e\",\"f\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "3add2ae9-fd1f-4ceb-87e6-d9651e7fedfd",
             input: "beginWord = \"hit\", endWord = \"cog\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\",\"a\",\"b\",\"c\",\"d\",\"e\",\"f\","
                + "\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\",\"v\",\"w\",\"x\",\"y\",\"z\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "201d70a3-e850-4324-bee3-e113d27b03fa",
             input: "beginWord = \"a\", endWord = \"b\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o"
                + "\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\",\"v\",\"w\",\"x\",\"y\",\"z\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "13a640de-3aee-4561-ab80-0acce6565331",
             input: "beginWord = \"z\", endWord = \"y\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o"
                + "\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\",\"v\",\"w\",\"x\",\"y\",\"z\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "69c960a4-6917-4655-b560-2ea166caf188",
             input: "beginWord = \"hit\", endWord = \"hit\", wordList = [\"hot\",\"dot\",\"dog\",\"lot\",\"log\",\"cog\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c21a1f22-2c0b-4363-9fbc-2603f1402a4c",
             input: "beginWord = \"a\", endWord = \"c\", wordList = [\"a\",\"b\",\"c\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4671b296-b55b-45c3-908c-de075f150eae",
             input: "beginWord = \"a\", endWord = \"d\", wordList = [\"a\",\"b\",\"c\",\"d\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "508d17fa-938c-4ef2-a820-7ce3df3edb7f",
             input: "beginWord = \"a\", endWord = \"e\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ec84260e-b4e2-4e15-b1cc-7b07bd9168bf",
             input: "beginWord = \"a\", endWord = \"f\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "08e1bd65-209e-419b-8ca2-c10143789fee",
             input: "beginWord = \"a\", endWord = \"c\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bf299710-b58a-4bfc-a5e5-e83da5b36132",
             input: "beginWord = \"a\", endWord = \"d\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ec444e0c-af7a-41d2-ba8e-5d1b3415511a",
             input: "beginWord = \"a\", endWord = \"e\", wordList = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\"]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "word-ladder"
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
            guard p_beginWord.count >= 1 && p_beginWord.count <= 10 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= beginWord.length <= 10"
                )
                return
            }
            guard p_wordList.count >= 1 && p_wordList.count <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= wordList.length <= 5000"
                )
                return
            }

            let solution = Solution()
            let result = solution.ladderLength(p_beginWord, p_endWord, p_wordList)
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
