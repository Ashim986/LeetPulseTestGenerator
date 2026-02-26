import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUncommonWordsFromTwoSentences {
    private class Solution {
        func findUncommonWords(_ sentence1: String, _ sentence2: String) -> [String] {
            let words = (sentence1 + " " + sentence2).components(separatedBy: " ")
            var count: [String: Int] = [:]
            var result: [String] = []

            for word in words {
                let lowerWord = word.lowercased()
                if count[lowerWord] != nil {
                    count[lowerWord]? += 1
                } else {
                    count[lowerWord] = 1
                }
            }

            for word in words {
                let lowerWord = word.lowercased()
                if count[lowerWord] == 1 {
                    result.append(word)
                }
            }

            return Array(Set(result))
        }
    }

    @Suite struct UncommonWordsFromTwoSentencesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b2a04abe-f1aa-487f-9b51-f7db53007062",
             input: "sentence1 = \"a\", sentence2 = \"b\"",
             expected: "[\"a\", \"b\"]", orderMatters: false),
            TestCaseData(id: "e4550d35-6c39-43c1-9481-dc30a50798bd",
             input: "sentence1 = \"a b\", sentence2 = \"a b\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "a49e9a1f-2cf4-4155-8bcd-395e47aaa3f0",
             input: "sentence1 = \"a b c\", sentence2 = \"d e f\"",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\", \"f\"]", orderMatters: false),
            TestCaseData(id: "4b97ebd4-ad6d-4625-965a-b34a4b741210",
             input: "sentence1 = \"hello world\", sentence2 = \"world hello\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "a0e21295-1704-45a7-985f-aadc29fd0ddf",
             input: "sentence1 = \"hello\", sentence2 = \"hello world\"",
             expected: "[\"world\"]", orderMatters: false),
            TestCaseData(id: "ddc25cb7-7b9e-4c07-8434-4cb631b27a52",
             input: "sentence1 = \"hello world\", sentence2 = \"hello\"",
             expected: "[\"world\"]", orderMatters: false),
            TestCaseData(id: "fa468016-279f-4733-99dc-90d884b1f66c",
             input: "sentence1 = \"a b c d e\", sentence2 = \"f g h i j\"",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\"]", orderMatters: false),
            TestCaseData(id: "4c1ab918-3a04-446b-ab6b-0465783a36b4",
             input: "sentence1 = \"a b c\", sentence2 = \"c b a\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "961bec80-4f02-4bba-abd5-db251e76f813",
             input: "sentence1 = \"a b c d\", sentence2 = \"d c b a\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "79b57dfd-96e0-4d16-a5cc-03b2ca2450ad",
             input: "sentence1 = \"hello world\", sentence2 = \"hello world hello world\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "8aaf126e-fbaa-4c6f-92f9-ea5a8e7bcda6",
             input: "sentence1 = \"hello world hello world\", sentence2 = \"hello world\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "6aed8d1b-9ff0-42e1-9585-0030e74ab720",
             input: "sentence1 = \"a b c\", sentence2 = \"a b c a b c\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "58e6d7dc-03e2-4e63-8858-520a1c4b08f2",
             input: "sentence1 = \"a b c a b c\", sentence2 = \"a b c\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "400c4756-ab3a-414d-b84b-af8fc97330b8",
             input: "sentence1 = \"a\", sentence2 = \"b c d e f g h i j k l m n o p q r s t u v w x y z\"",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \""
                + "t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\"]", orderMatters: false),
            TestCaseData(id: "43e039e2-32f4-4ac3-b7eb-c3117efc4f5e",
             input: "sentence1 = \"a b c d e f g h i j k l m n o p q r s t u v w x y z\", sentence2 = \"a\"",
             expected: "[\"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \"t\", \""
                + "u\", \"v\", \"w\", \"x\", \"y\", \"z\"]", orderMatters: false),
            TestCaseData(id: "ee87962b-c1a3-4aa9-a72a-2048e00f477d",
             input: "sentence1 = \"\", sentence2 = \"\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "61f1ef3f-8ce0-4b56-830f-35cec7268db4",
             input: "sentence1 = \"\", sentence2 = \"hello world\"",
             expected: "[\"\",\"hello\",\"world\"]", orderMatters: false),
            TestCaseData(id: "c87a2bb5-9d2f-47b9-8699-11022eabe277",
             input: "sentence1 = \"hello\", sentence2 = \"\"",
             expected: "[\"\",\"hello\"]", orderMatters: false),
            TestCaseData(id: "0cfe6b86-b324-4bc9-985d-0dffb7b03499",
             input: "sentence1 = \"a a a\", sentence2 = \"b b b\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "d09f33b8-19f9-4294-92c1-2ae0f5eb4214",
             input: "sentence1 = \"hello world\", sentence2 = \"world hello again\"",
             expected: "[\"again\"]", orderMatters: false),
            TestCaseData(id: "55bdf240-97fd-438f-9f0d-bca36fed4fd5",
             input: "sentence1 = \"a\", sentence2 = \"a a\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "810e30ea-2eb7-4340-a556-020d8d887d5b",
             input: "sentence1 = \"a a\", sentence2 = \"a\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "e646a18e-e719-4e51-9084-b94b3ff5662f",
             input: "sentence1 = \"hello\", sentence2 = \"hello hello\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "a2a37010-e6cd-45f7-9340-5541b17dcbf1",
             input: "sentence1 = \"hello hello\", sentence2 = \"hello\"",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "8ca0e68f-b0c3-469f-8c26-b6cae57f5487",
             input: "sentence1 = \"hello world\", sentence2 = \"world hello world\"",
             expected: "[]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "uncommon-words-from-two-sentences"
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

            let p_sentence1 = InputParser.parseString(params[0])
            guard p_sentence1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: sentence1 string too long (\(p_sentence1.count))"
                )
                return
            }
            let p_sentence2 = InputParser.parseString(params[1])
            guard p_sentence2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: sentence2 string too long (\(p_sentence2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_sentence1.count >= 1 && p_sentence1.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 200"
                )
                return
            }
            guard p_sentence2.count >= 1 && p_sentence2.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 200"
                )
                return
            }

            let solution = Solution()
            let result = solution.findUncommonWords(p_sentence1, p_sentence2)
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
