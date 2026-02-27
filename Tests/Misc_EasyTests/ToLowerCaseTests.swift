import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCToLowerCase {
    private class Solution {
        func toLowerCase(_ s: String) -> String { return s.lowercased() }
    }

    @Suite struct ToLowerCaseTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1462edef-3e62-4c43-a136-53026fecd03a",
             input: "s = \"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "7b8423a6-5cd3-4bd1-add9-964fe2313f86",
             input: "s = \"A\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "68ef167c-123e-4471-8a75-ee2a21921859",
             input: "s = \"abc\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "42055963-5c16-482c-a882-f341da719c0e",
             input: "s = \"ABC\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "81203d1a-4e24-4f62-89ec-057fda0c24ee",
             input: "s = \"123\"",
             expected: "123", orderMatters: true),
            TestCaseData(id: "721274bf-fe01-44f0-b67c-8a9fae40c00f",
             input: "s = \"!@#\"",
             expected: "!@#", orderMatters: true),
            TestCaseData(id: "58a8f78d-adcd-4462-a8f9-912a005501e1",
             input: "s = \"AbC\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "f858385c-e986-4d44-942c-783df5731528",
             input: "s = \"aAa\"",
             expected: "aaa", orderMatters: true),
            TestCaseData(id: "3e90410f-9306-4ea8-92eb-27f74317c90b",
             input: "s = \"AAA\"",
             expected: "aaa", orderMatters: true),
            TestCaseData(id: "4d95533a-f3e7-44ac-af80-f7d41b172d20",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "6b334691-e17f-44c3-8a88-b76689f84d83",
             input: "s = \"ABCDEFGHIJKLMNOPQRSTUVWXYZ\"",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "0a4b96bc-8046-482c-9f70-fc3f6d5097d6",
             input: "s = \"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\"",
             expected: "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "1e2fb491-6a21-4342-9204-6c3e1c3db1dd",
             input: "s = \"123abcABC\"",
             expected: "123abcabc", orderMatters: true),
            TestCaseData(id: "cb6012bb-8559-4d85-a168-7e8a30b1712b",
             input: "s = \"!@#abcABC\"",
             expected: "!@#abcabc", orderMatters: true),
            TestCaseData(id: "6daa9c80-d55e-404c-b92d-585a6dccff22",
             input: "s = \"abcABC123!@#\"",
             expected: "abcabc123!@#", orderMatters: true),
            TestCaseData(id: "b86dc91d-88ab-43a1-a1a5-06fe1f7d4820",
             input: "s = \"abcABCabcABC\"",
             expected: "abcabcabcabc", orderMatters: true),
            TestCaseData(id: "0cd87fd0-8033-4285-8fa1-3680bfe88806",
             input: "s = \"aAaAaAa\"",
             expected: "aaaaaaa", orderMatters: true),
            TestCaseData(id: "024a67e7-957a-4403-b6b3-495ecb60b827",
             input: "s = \"1234567890\"",
             expected: "1234567890", orderMatters: true),
            TestCaseData(id: "b9c105c6-bc53-4821-88c1-2cd7d1aab341",
             input: "s = \"!@#$%^&*()\"",
             expected: "!@#$%^&*()", orderMatters: true),
            TestCaseData(id: "76243896-45e1-4460-8545-6b324fb06505",
             input: "s = \"abcdefghijklmnopqrstuvwxyz123!@#\"",
             expected: "abcdefghijklmnopqrstuvwxyz123!@#", orderMatters: true),
            TestCaseData(id: "5e194dc7-4eea-4a26-b308-e183f393bda1",
             input: "s = \"ABCDEFGHIJKLMNOPQRSTUVWXYZ123!@#\"",
             expected: "abcdefghijklmnopqrstuvwxyz123!@#", orderMatters: true),
            TestCaseData(id: "52b464cf-7601-4acf-8095-587692643625",
             input: "s = \"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123!@#\"",
             expected: "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz123!@#", orderMatters: true),
            TestCaseData(id: "57eeb33a-134c-4fb9-8e17-923e6eb6b33f",
             input: "s = \"aa\"",
             expected: "aa", orderMatters: true),
            TestCaseData(id: "edbaf1dd-fcbf-4db8-8bb6-b0027442f14a",
             input: "s = \"aaa\"",
             expected: "aaa", orderMatters: true),
            TestCaseData(id: "a7b7ff44-e065-44d8-9aad-551a73b264a0",
             input: "s = \"aaaa\"",
             expected: "aaaa", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "to-lower-case"
            let topic = "misc"
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

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.toLowerCase(p_s)
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
