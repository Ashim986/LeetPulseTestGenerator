import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseOnlyLetters {
    private class Solution {
        func reverseOnlyLetters(_ S: String) -> String {
            var s = Array(S)
            var left = 0
            var right = s.count - 1
            while left < right {
                if !isLetter(s[left]) {
                    left += 1
                } else if !isLetter(s[right]) {
                    right -= 1
                } else {
                    let temp = s[left]
                    s[left] = s[right]
                    s[right] = temp
                    left += 1
                    right -= 1
                }
            }
            return String(s)
        }

        func isLetter(_ c: Character) -> Bool {
            return (c >= "A" && c <= "Z") || (c >= "a" && c <= "z")
        }
    }

    @Suite struct ReverseOnlyLettersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4a1f0cbe-c0a3-4395-b375-04089b874310",
             input: "S = \"abc\"",
             expected: "\"cba\"", orderMatters: true),
            TestCaseData(id: "9a3b7fb4-6e4c-4fa2-9ed2-e11870456df7",
             input: "S = \"a1b2c3\"",
             expected: "\"c1b2a3\"", orderMatters: true),
            TestCaseData(id: "f1d87324-5f2f-4bb4-be40-cc2515c9ee5b",
             input: "S = \"-\"",
             expected: "\"-\"", orderMatters: true),
            TestCaseData(id: "bde15436-6f74-4675-ab73-e81c9e0ce5b8",
             input: "S = \"123\"",
             expected: "\"123\"", orderMatters: true),
            TestCaseData(id: "218545e9-93f3-442b-926f-4ab591438251",
             input: "S = \"abc123\"",
             expected: "\"cba123\"", orderMatters: true),
            TestCaseData(id: "230e5f6e-120d-4516-9fe4-0eb72d32980d",
             input: "S = \"aA\"",
             expected: "\"Aa\"", orderMatters: true),
            TestCaseData(id: "6beba1e4-eb47-4de2-9002-eedb6a592579",
             input: "S = \"a!b\"",
             expected: "\"b!a\"", orderMatters: true),
            TestCaseData(id: "74d69842-6ced-4043-9cb3-140caf260c27",
             input: "S = \"a b\"",
             expected: "\"b a\"", orderMatters: true),
            TestCaseData(id: "34def15f-d921-4c9d-8d6a-0596eed6d891",
             input: "S = \"a,b\"",
             expected: "\"b,a\"", orderMatters: true),
            TestCaseData(id: "8d02e723-a93d-47a7-9008-37312cf80782",
             input: "S = \"a_b\"",
             expected: "\"b_a\"", orderMatters: true),
            TestCaseData(id: "f134a1b6-9256-419a-b78d-267646e523a6",
             input: "S = \"a-b\"",
             expected: "\"b-a\"", orderMatters: true),
            TestCaseData(id: "aa653665-8bb0-4750-9426-0662e7169460",
             input: "S = \"a/b\"",
             expected: "\"b/a\"", orderMatters: true),
            TestCaseData(id: "7a0b01fe-30ab-4995-a13f-c611e46f79e5",
             input: "S = \"a\\b\"",
             expected: "\"b\\a\"", orderMatters: true),
            TestCaseData(id: "8832afeb-48bf-48c7-bf6a-cd7916e81f40",
             input: "S = \"a|b\"",
             expected: "\"b|a\"", orderMatters: true),
            TestCaseData(id: "84edf461-cd51-43b8-89ec-527b559b9119",
             input: "S = \"a~b\"",
             expected: "\"b~a\"", orderMatters: true),
            TestCaseData(id: "3a22544a-aa5d-47c7-9e16-32af841f70ac",
             input: "S = \"a^b\"",
             expected: "\"b^a\"", orderMatters: true),
            TestCaseData(id: "69d488fb-a209-4986-a06d-20702e496263",
             input: "S = \"a*b\"",
             expected: "\"b*a\"", orderMatters: true),
            TestCaseData(id: "3b4ebf06-c2f5-4158-91f7-ae8ceb21e444",
             input: "S = \"a(b)\"",
             expected: "\"b(a)\"", orderMatters: true),
            TestCaseData(id: "097da7ea-19e3-4448-b1b2-3702c4c10ff8",
             input: "S = \"a[b]\"",
             expected: "\"b[a]\"", orderMatters: true),
            TestCaseData(id: "c02f8d29-c041-4403-811d-3e36977b5a47",
             input: "S = \"a{b}\"",
             expected: "\"b{a}\"", orderMatters: true),
            TestCaseData(id: "6c209120-dcb3-4cdc-89d8-4af68117cbc1",
             input: "S = \"a<b>\"",
             expected: "\"b<a>\"", orderMatters: true),
            TestCaseData(id: "1eba6fe3-fbdb-47ea-99c1-eb08806a93e6",
             input: "S = \"a=b\"",
             expected: "\"b=a\"", orderMatters: true),
            TestCaseData(id: "f7f74a78-88a7-46fe-8227-34caeaea84e7",
             input: "S = \"a+b\"",
             expected: "\"b+a\"", orderMatters: true),
            TestCaseData(id: "036ee7c2-5852-4d56-9773-2af3dc036840",
             input: "S = \"\"",
             expected: "\"\"", orderMatters: true),
            TestCaseData(id: "9ec4a459-5401-4469-8799-966c95b107f5",
             input: "S = \"a\"",
             expected: "\"a\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-only-letters"
            let topic = "two-pointers"
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

            let p_S = InputParser.parseString(params[0])
            guard p_S.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: S string too long (\(p_S.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_S.count >= 1 && p_S.count <= 100 else {
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
                resultHolder = solution.reverseOnlyLetters(p_S)
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
