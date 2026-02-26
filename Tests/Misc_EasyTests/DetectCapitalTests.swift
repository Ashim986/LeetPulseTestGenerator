import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDetectCapital {
    private class Solution {
        func detectCapitalUse(_ word: String) -> Bool {
            return word == word.uppercased() || word == word.lowercased() || (word.prefix(1) == word.prefix(1).uppercased() && word.dropFirst() == word.dropFirst().lowercased())
        }
    }

    @Suite struct DetectCapitalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "883f7cca-595f-44d2-9b38-ee6d6ac01ab6",
             input: "word = \"a\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3e9d6d99-c897-4b22-a41d-ea9c66378eba",
             input: "word = \"A\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7985ccfc-aca7-4bfe-8e1f-24d8982f41a3",
             input: "word = \"\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "869ece83-4cdb-4659-9b0f-55d98e64f2c2",
             input: "word = \"aB\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1f156389-3770-4ad8-87ee-d5d587744551",
             input: "word = \"USAa\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "19a4ade3-a061-4b1d-90ee-6c644a865fb4",
             input: "word = \"USAA\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "324b572b-2ccb-409d-b0e4-ca8377e1faf6",
             input: "word = \"LEETCODE\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "57036290-2e35-49f0-a73a-575110ef0810",
             input: "word = \"lEETcODE\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bfee6790-5335-4182-8c75-756752cce38b",
             input: "word = \"Ab\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "402ff39b-c23f-4c7a-b486-198330764ed0",
             input: "word = \"LeetCode\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "03a57640-7390-4186-9450-256c3c133f10",
             input: "word = \"USA\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "93ea7361-f1be-4780-883f-f082e9fad336",
             input: "word = \"FlaG\"",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "detect-capital"
            let topic = "misc"
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

            let p_word = InputParser.parseString(params[0])
            guard p_word.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: word string too long (\(p_word.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_word.count >= 1 && p_word.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= word.length <= 100"
                )
                return
            }

            let solution = Solution()
            let result = solution.detectCapitalUse(p_word)
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
