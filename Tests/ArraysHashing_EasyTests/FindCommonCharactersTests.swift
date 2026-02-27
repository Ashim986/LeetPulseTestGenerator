import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindCommonCharacters {
    private class Solution {
        func commonChars(_ words: [String]) -> [String] {
            guard let first = words.first else { return [] }

            var freq = Array(repeating: 0, count: 26)
            for byte in first.utf8 {
                let idx = Int(byte) - 97
                if idx >= 0 && idx < 26 {
                    freq[idx] += 1
                }
            }

            for word in words.dropFirst() {
                var cur = Array(repeating: 0, count: 26)
                for byte in word.utf8 {
                    let idx = Int(byte) - 97
                    if idx >= 0 && idx < 26 {
                        cur[idx] += 1
                    }
                }
                for i in 0..<26 {
                    freq[i] = min(freq[i], cur[i])
                }
            }

            var res: [String] = []
            for i in 0..<26 {
                guard freq[i] > 0 else { continue }
                let ch = Character(UnicodeScalar(i + 97).unsafelyUnwrapped)
                for _ in 0..<freq[i] {
                    res.append(String(ch))
                }
            }

            return res
        }
    }

    @Suite struct FindCommonCharactersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "51923f57-9908-440e-8e24-3609820cfb84",
             input: "words = [\"abc\",\"abc\",\"abc\"]",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "b547aa6e-5204-47dc-9f3a-b5e0602afc49",
             input: "words = [\"\",\"a\",\"b\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "5573ed28-a2d8-4c35-8e7d-54f0ab4386b5",
             input: "words = [\"a\",\"\",\"b\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "05a991d2-6397-46a2-b137-2aca3127d5fc",
             input: "words = [\"\",\"\",\"\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "413bc631-e536-42fb-88d4-262c85404472",
             input: "words = [\"a\",\"a\",\"a\"]",
             expected: "[\"a\"]", orderMatters: false),
            TestCaseData(id: "404d79ee-551c-4371-b45c-1ee96af54e2b",
             input: "words = [\"abc\",\"def\",\"ghi\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "8a7dad46-fb00-42e4-b08e-bb48979557c0",
             input: "words = [\"aaa\",\"aaa\",\"aaa\"]",
             expected: "[\"a\",\"a\",\"a\"]", orderMatters: false),
            TestCaseData(id: "f80a2b04-bb03-403a-845d-a84a18843d62",
             input: "words = [\"ab\",\"ab\",\"ab\"]",
             expected: "[\"a\",\"b\"]", orderMatters: false),
            TestCaseData(id: "e8bb27b8-1548-4444-beef-f402eca3c9c4",
             input: "words = [\"abc\",\"abcd\",\"abcde\"]",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "e32bccf6-2c10-4d85-a941-51d317235e83",
             input: "words = [\"abc\",\"bca\",\"cab\"]",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "d4f6b441-4469-4cf1-a878-bc95781c8d04",
             input: "words = [\"aaa\",\"bbb\",\"ccc\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "01c34db2-e314-4560-b82d-8f9f8ab2791b",
             input: "words = [\"a\",\"aa\",\"aaa\"]",
             expected: "[\"a\"]", orderMatters: false),
            TestCaseData(id: "cd761db5-e6fe-4623-b54a-ef1ed0fa771d",
             input: "words = [\"abc\",\"abc\",\"abc\",\"abc\"]",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "cb5502b9-80ef-4034-970a-8013d606d6c9",
             input: "words = [\"a\",\"a\",\"a\",\"a\",\"a\"]",
             expected: "[\"a\"]", orderMatters: false),
            TestCaseData(id: "02d18a94-70cd-4e7d-bc0f-cf3bf12e3ca8",
             input: "words = [\"abc\",\"abc\",\"abc\",\"abc\",\"abc\"]",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "3ef3ab40-b55b-4a18-98dd-7521f3c7af1a",
             input: "words = [\"ab\",\"ab\",\"ab\",\"ab\",\"ab\"]",
             expected: "[\"a\",\"b\"]", orderMatters: false),
            TestCaseData(id: "32cb2104-3781-4e84-bee0-c37c2bdd2124",
             input: "words = [\"abc\",\"abc\",\"abc\",\"abc\",\"abc\",\"abc\"]",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "31a64d07-04ae-43dd-b924-7f11729a13d9",
             input: "words = [\"a\",\"aa\",\"aaa\",\"aaaa\",\"aaaaa\"]",
             expected: "[\"a\"]", orderMatters: false),
            TestCaseData(id: "58b7c193-9ec8-4285-a5da-72e9d6323761",
             input: "words = [\"abc\",\"abcd\",\"abcde\",\"abcdef\",\"abcdefg\"]",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "a588b67f-c3a3-4609-bea7-3f411dffba88",
             input: "words = [\"abc\",\"bca\",\"cab\",\"acb\",\"bac\"]",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "e1b4e71f-9023-4da3-a461-37e6e25d0472",
             input: "words = [\"aaa\",\"bbb\",\"ccc\",\"ddd\",\"eee\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "5339f7ff-17a6-401a-a534-623c75da36e4",
             input: "words = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\"]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "d8955b33-d23f-4683-9517-b2445267eecf",
             input: "words = [\"a\",\"a\",\"a\",\"a\",\"a\",\"a\",\"a\",\"a\",\"a\",\"a\"]",
             expected: "[\"a\"]", orderMatters: false),
            TestCaseData(id: "8284e740-ee4f-44da-af2a-2f19c6f8b1c3",
             input: "words = [\"abc\",\"abc\",\"abc\",\"abc\",\"abc\",\"abc\",\"abc\",\"abc\",\"abc\",\"abc\"]",
             expected: "[\"a\",\"b\",\"c\"]", orderMatters: false),
            TestCaseData(id: "b3d217c2-e78b-4a96-b955-44b4d2e03207",
             input: "words = [\"ab\",\"ab\",\"ab\",\"ab\",\"ab\",\"ab\",\"ab\",\"ab\",\"ab\",\"ab\"]",
             expected: "[\"a\",\"b\"]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-common-characters"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: words array too large (\(p_words.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 100"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [String]?
            let didCrash = withCrashGuard {
                resultHolder = solution.commonChars(p_words)
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

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
