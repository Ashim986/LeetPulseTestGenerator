import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRepeatedSubstringPattern {
    private class Solution {
        func repeatedSubstringPattern(_ s: String) -> Bool {
            let doubleS = s + s
            let range = doubleS.range(of: s, options: .literal, range: Range(uncheckedBounds: (lower: doubleS.index(after: doubleS.startIndex), upper: doubleS.index(before: doubleS.endIndex))))
            return range != nil
        }
    }

    @Suite struct RepeatedSubstringPatternTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c4472fa0-b375-4e03-a7d8-6668e4a76081",
             input: "s = \"abcabc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "18d9e8bc-5b63-434d-b105-326ba1ab1d17",
             input: "s = \"abc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d4327555-1ccf-484f-9eaf-8bb6823eac2d",
             input: "s = \"a\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ed6c7bc9-63ed-4d8b-8dfd-b692f5ebd8ce",
             input: "s = \"aa\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "147c90a9-b805-47b9-a228-ff4162f05242",
             input: "s = \"abaaba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3bed4806-24ab-4312-a62c-b008a28c537c",
             input: "s = \"abacaba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "086f69cc-fd9d-404b-ad97-67d903fadbfd",
             input: "s = \"aaaaaa\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "67807dc0-b44f-4e0a-8a90-30ab3e1b67d3",
             input: "s = \"abababab\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3addca61-1a2f-4d27-82ff-6f7f7d6c814a",
             input: "s = \"abcabcabc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a69122c3-9c2b-4931-ab1d-6029ab9f7026",
             input: "s = \"\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a1ade70b-b393-49fc-b02e-69aa5d05a67a",
             input: "s = \"aabb\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "683c0a28-2e01-4aeb-a832-0a2822a01787",
             input: "s = \"abba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ba970399-ce1d-4375-a333-4df8d58472f8",
             input: "s = \"abcde\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4a9b6256-ebfa-478a-b19f-0ed312ecc1b3",
             input: "s = \"aaaa\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4ed83703-9d14-4d2c-a702-e5f62f6a3b05",
             input: "s = \"ababab\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8de0a362-838f-4cb0-be62-e8cf61d79665",
             input: "s = \"ababababab\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6aeed0a8-12db-4130-9c8f-02b70b051450",
             input: "s = \"abcabcab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a31ed97a-45d2-4785-b4d7-a5a3a99ad443",
             input: "s = \"aaaaaaa\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c0dc7875-4f81-4425-9dc4-cd27894bc41f",
             input: "s = \"abababababab\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b4c4be28-d451-416c-80c8-c8af511e6d07",
             input: "s = \"abcabcabcab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4a15e720-6ef0-4d78-9a61-9d7685c55320",
             input: "s = \"aaaaaaaab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b641bd96-9153-4512-8fdd-468bf71e55c4",
             input: "s = \"ababababababab\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "430ecd7b-a7cf-4e48-9d6f-4710b3f41cf2",
             input: "s = \"abcabcabcabc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "597c5ce6-527b-481e-b023-0a21c015ad61",
             input: "s = \"aaaaaaaabab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a59a0e27-3cdf-4b0e-a5f7-ea602ebf5390",
             input: "s = \"abababababababab\"",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "repeated-substring-pattern"
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

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.repeatedSubstringPattern(p_s)
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
