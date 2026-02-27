import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMostCommonWord {
    private class Solution {
        func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
          let paragraph = paragraph.lowercased().replacingOccurrences(of: "$|", with: "", options: .regularExpression)
          let words = paragraph.components(separatedBy: " ")
          var wordCount: [String: Int] = [:]
          let bannedSet = Set(banned.map { $0.lowercased() })
          for word in words {
            if !bannedSet.contains(word) {
              wordCount[word] = (wordCount[word] ?? 0) + 1
            }
          }
          let sortedWords = wordCount.sorted(by: { $0.value > $1.value })
          return sortedWords[sortedWords.startIndex].key
        }
    }

    @Suite struct MostCommonWordTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c931c94e-cb58-467c-af8a-37b742fed351",
             input: "paragraph = \"a\", banned = []",
             expected: "a", orderMatters: true),
            TestCaseData(id: "5190259d-7442-44ed-9e44-17face22f98b",
             input: "paragraph = \"a, b, c, d, e, f, g\", banned = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\"]",
             expected: "g", orderMatters: true),
            TestCaseData(id: "fae46b55-415c-47b0-8178-5c53c06e02a3",
             input: "paragraph = \"a, b, c, d, e, f, g, h\", banned = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\"]",
             expected: "h", orderMatters: true),
            TestCaseData(id: "bb0f264a-d128-4998-9c1d-012a026ae271",
             input: "paragraph = \"a, b, c, d, e, f, g, h, i\", banned = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\"]",
             expected: "i", orderMatters: true),
            TestCaseData(id: "56b6a53b-01be-499b-8e5b-f26c5c9a04ba",
             input: "paragraph = \"a, a, a, a, b, b, b, c, c, c\", banned = []",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "8656eef9-2ae5-4c21-9c65-a3a30e395814",
             input: "paragraph = \"a, b, c\", banned = []",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "3451fd41-764e-4b5e-a0b2-821a141ab4b3",
             input: "paragraph = \"a, a, b, b\", banned = []",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "71778dc9-3281-46d3-bcac-32e24663119d",
             input: "paragraph = \"a, a, a, b, b, b\", banned = [\"a\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "2e3fdb7d-8583-4912-83eb-cbf2600a0084",
             input: "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = []",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "a76b35e4-9345-40bf-8b64-692f3158d107",
             input: "paragraph = \"a, a, a, a, a, a, a, a, a, a\", banned = []",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "c2b7eeeb-d056-4ca8-82a4-d68bc17a862b",
             input: "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = [\"a\", \"b\", \"c\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "bc46f9e4-58f3-4129-b743-91ce25e53221",
             input: "paragraph = \"a, a, b, b, c, c\", banned = [\"a\", \"b\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "eedc81bb-0547-47f6-95c1-7300ca72afd1",
             input: "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "c69a1f8b-c6d8-41a8-88ad-5cccdb97cfe3",
             input: "paragraph = \"a, a, b, b, c, c\", banned = [\"c\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "8c3f8aad-7299-44e7-996a-764278da4beb",
             input: "paragraph = \"a, a, a, b, b, b\", banned = [\"b\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "cbb9f10e-f2c7-41ea-b8ac-3f4f6ec7ed22",
             input: "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = [\"j\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "8370797d-7c9f-47e5-8c5d-cf328d63b741",
             input: "paragraph = \"a, a, b, b, c, c\", banned = [\"a\", \"c\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "affe818d-7be4-4bc0-ab90-937ac4bd7682",
             input: "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = [\"a\", \"j\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "40348286-8592-4a25-b62b-fcba5079cfad",
             input: "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"k\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "39479378-c7e7-47b8-8516-ee22401c4f8e",
             input: "paragraph = \"a, a, a, b, b\", banned = []",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "da5a3df4-862d-4509-84d7-49bf78595a5d",
             input: "paragraph = \"a, a, b, b\", banned = [\"a\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "063d1bed-9c93-41eb-aee4-1ceb2790263c",
             input: "paragraph = \"a, b, c\", banned = [\"a\", \"b\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "3229e6dc-2a12-4a84-8757-ac2e81ed2906",
             input: "paragraph = \"a, b, c, d, e, f\", banned = []",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "862cbbb4-10e7-4e82-98a9-b2ee199e1005",
             input: "paragraph = \"a, a, a, a, b, b\", banned = [\"a\"]",
             expected: "a,", orderMatters: true),
            TestCaseData(id: "ffd1d3e7-d115-478d-8e52-8bcf575f9f7b",
             input: "paragraph = \"a, a, b, b, c, c, d, d\", banned = [\"a\", \"b\", \"c\"]",
             expected: "d,", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "most-common-word"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            let p_paragraph = InputParser.parseString(params[0])
            guard p_paragraph.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))"
                )
                return
            }
            guard let p_banned = InputParser.parseStringArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [String]"
                )
                return
            }
            guard p_banned.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: banned array too large (\(p_banned.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000"
                )
                return
            }
            guard p_banned.count >= 0 && p_banned.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= banned.length <= 100"
                )
                return
            }
            guard p_banned.allSatisfy({ $0.count >= 1 && $0.count <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= banned[i].length <= 10"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.mostCommonWord(p_paragraph, p_banned)
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
