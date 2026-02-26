import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCVerifyingAnAlienDictionary {
    private class Solution {
        func isAlienSorted(_ words: [String], _ order: String) -> Bool {
            let orderMap: [Character: Int] = Dictionary(uniqueKeysWithValues: order.enumerated().map { ($0.element, $0.offset) })

            for index in 0..<words.count - 1 {
                let word1 = words[index]
                let word2 = words[index + 1]

                var i = 0
                var j = 0

                while i < word1.count && j < word2.count {
                    if orderMap[word1[word1.index(word1.startIndex, offsetBy: i)]] ?? Int.max < orderMap[word2[word2.index(word2.startIndex, offsetBy: j)]] ?? Int.max {
                        break
                    } else if orderMap[word1[word1.index(word1.startIndex, offsetBy: i)]] ?? Int.max > orderMap[word2[word2.index(word2.startIndex, offsetBy: j)]] ?? Int.max {
                        return false
                    }

                    i += 1
                    j += 1
                }

                if j == word2.count && i < word1.count {
                    return false
                }
            }

            return true
        }
    }

    @Suite struct VerifyingAnAlienDictionaryTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "40f91047-6d3c-41c3-b48f-185d9734928c",
             input: "words = [\"abc\",\"abcd\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a4c58f21-2548-429e-a7ba-2601a3f4dd18",
             input: "words = [\"abcd\",\"abc\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3c612f1d-b96c-47ff-be80-840ed360b746",
             input: "words = [\"a\",\"b\",\"c\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8f0733ea-34db-4102-815c-f344cfd4f8fe",
             input: "words = [\"c\",\"b\",\"a\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3b5ef255-416e-474a-96f0-c260b0cd34ea",
             input: "words = [\"a\",\"b\",\"c\"], order = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b930d18c-4bbf-4dd1-a169-617d1d447b19",
             input: "words = [\"z\",\"y\",\"x\"], order = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "812428c5-5807-462b-8047-2924ff4c41ca",
             input: "words = [\"hello\",\"hello\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7a01b2a4-1579-4147-90e3-f909537386f4",
             input: "words = [\"hello\",\"world\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ec9be22d-f3d9-4ea5-98e8-7710cc115868",
             input: "words = [\"world\",\"hello\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "33112a0f-3222-493d-a4e1-838cb708c8d7",
             input: "words = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\","
                + "\"v\",\"w\",\"x\",\"y\",\"z\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "354d2040-cb1d-409f-b132-5b0f1ae35a91",
             input: "words = [\"z\",\"y\",\"x\",\"w\",\"v\",\"u\",\"t\",\"s\",\"r\",\"q\",\"p\",\"o\",\"n\",\"m\",\"l\",\"k\",\"j\",\"i\",\"h\",\"g\",\"f\","
                + "\"e\",\"d\",\"c\",\"b\",\"a\"], order = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "647b7c3a-e165-49f8-8088-830e34613c37",
             input: "words = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\","
                + "\"v\",\"w\",\"x\",\"y\",\"z\"], order = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "acd2cb99-f32c-4ea7-9912-368de17e4600",
             input: "words = [\"apple\",\"banana\",\"cherry\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7d229601-07a7-477b-8ec1-2bffe5497a51",
             input: "words = [\"cherry\",\"banana\",\"apple\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "cbd20f4d-84f9-400d-9bb4-d82cc7f31ead",
             input: "words = [\"apple\",\"banana\",\"cherry\"], order = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "55960973-1fd6-44ff-8e85-a253d4c1d86a",
             input: "words = [\"cherry\",\"banana\",\"apple\"], order = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6777fdf5-81b8-46ef-be1d-378762788197",
             input: "words = [\"a\",\"b\",\"c\"], order = \"abc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "19d66ebb-bae4-4e0d-8f5d-af3c1d917f3a",
             input: "words = [\"c\",\"b\",\"a\"], order = \"abc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1f6f8daa-c732-43fa-a672-435c8a13c34c",
             input: "words = [\"a\",\"b\",\"c\"], order = \"bca\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "74e86b84-e188-4805-af95-2b2ee56d1a69",
             input: "words = [\"a\",\"b\",\"c\"], order = \"acb\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7be0e249-5a0d-454b-bc14-583696df85a3",
             input: "words = [\"c\",\"b\",\"a\"], order = \"acb\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "001e64ab-86dc-48e4-9a7b-25a6683a433a",
             input: "words = [], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0d37c76b-dade-4fbc-9317-d2455bde3726",
             input: "words = [\"\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "943e88a4-f8c1-4555-af72-7087cc4aa489",
             input: "words = [\"a\"], order = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5e695e3c-d66a-4b5f-b71e-0aeaf7dbd43c",
             input: "words = [\"c\",\"b\",\"a\"], order = \"bca\"",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "verifying-an-alien-dictionary"
            let topic = "arrays-hashing"
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
            let p_order = InputParser.parseString(params[1])
            guard p_order.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: order string too long (\(p_order.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 100"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 20 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 20"
                )
                return
            }
            guard p_order.count == 26 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: order.length == 26"
                )
                return
            }

            let solution = Solution()
            let result = solution.isAlienSorted(p_words, p_order)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
