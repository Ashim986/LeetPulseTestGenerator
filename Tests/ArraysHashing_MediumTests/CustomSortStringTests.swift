import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCustomSortString {
    private class Solution {
        func customSortString(_ S: String, _ T: String) -> String {
            let SArray = Array(S)
            let TArray = Array(T)
            var TCount: [Character: Int] = [:]
            var result = ""
            for char in TArray {
                TCount[char, default: 0] += 1
            }
            for char in SArray {
                if let count = TCount[char] {
                    result += String(repeating: char, count: count)
                    TCount[char] = nil
                }
            }
            for (char, count) in TCount {
                result += String(repeating: char, count: count)
            }
            return result
        }
    }

    @Suite struct CustomSortStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9520a87f-c9cd-4848-9801-8f8b81296915",
             input: "S = \"abc\", T = \"abc\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "d216ac75-4cf8-4d1e-862e-eb620ee0db7d",
             input: "S = \"\", T = \"abc\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "8c814a50-f532-49df-af4f-03e148e27f44",
             input: "S = \"a\", T = \"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "a6523ce0-4f45-4096-b3be-10b1aeafea48",
             input: "S = \"ab\", T = \"ba\"",
             expected: "ab", orderMatters: true),
            TestCaseData(id: "bbed1d07-8912-4cc6-ba1b-026221b23c8a",
             input: "S = \"abc\", T = \"bca\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "cc35e3cb-00a1-487b-909c-21e63e532677",
             input: "S = \"abcdefgh\", T = \"hgfedcba\"",
             expected: "abcdefgh", orderMatters: true),
            TestCaseData(id: "d0c551ca-3cd5-4b4f-b0b3-df5329604ce1",
             input: "S = \"abcdefgh\", T = \"abcdefgh\"",
             expected: "abcdefgh", orderMatters: true),
            TestCaseData(id: "4631b063-f36b-4a21-8977-0ad05f09efcf",
             input: "S = \"abcd\", T = \"dcba\"",
             expected: "abcd", orderMatters: true),
            TestCaseData(id: "172ccda9-2db6-47ff-94b1-7745e754fbdf",
             input: "S = \"abcdefghij\", T = \"abcdefghij\"",
             expected: "abcdefghij", orderMatters: true),
            TestCaseData(id: "fb0643f0-b5ed-497b-be36-c383bb7c6de6",
             input: "S = \"abcdefghij\", T = \"jihgfedcba\"",
             expected: "abcdefghij", orderMatters: true),
            TestCaseData(id: "02e8f178-6834-419b-99eb-11a80cda4ea9",
             input: "S = \"abcdefghij\", T = \"abcdefghijabcdefghij\"",
             expected: "abcdefghijabcdefghij", orderMatters: true),
            TestCaseData(id: "5206a112-44a8-4346-abd7-fbe69c9733db",
             input: "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghij\"",
             expected: "abcdefghijabcdefghijabcdefghij", orderMatters: true),
            TestCaseData(id: "440d62c1-4af5-4184-85dd-15815571830a",
             input: "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghij\"",
             expected: "abcdefghijabcdefghijabcdefghijabcdefghij", orderMatters: true),
            TestCaseData(id: "b4022677-fbb8-4123-8914-8b1dc5ea39dd",
             input: "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\"",
             expected: "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij", orderMatters: true),
            TestCaseData(id: "d8c3df4e-3afa-4f0d-8180-b96c070043e6",
             input: "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\"",
             expected: "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij", orderMatters: true),
            TestCaseData(id: "cbd13087-1a4a-4978-ab75-cfb190dab0f8",
             input: "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\"",
             expected: "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij", orderMatters: true),
            TestCaseData(id: "691c9d24-5f99-4e08-a3e4-580e888c847e",
             input: "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\"",
             expected: "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij", orderMatters: true),
            TestCaseData(id: "bd4cffb7-8355-4848-bfdc-511eb4ba3b06",
             input: "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\"",
             expected: "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij", orderMatters: true),
            TestCaseData(id: "f6cc2765-f80f-424c-875d-a1de4e2901a5",
             input: "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\"",
             expected: "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij", orderMatters: true),
            TestCaseData(id: "25c08442-686c-45bc-9ffa-ff51a036b285",
             input: "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\"",
             expected: "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij", orderMatters: true),
            TestCaseData(id: "c5cfcf6f-bcac-4953-afa1-f3bf40f73062",
             input: "S = \"abc\", T = \"aaa\"",
             expected: "aaa", orderMatters: true),
            TestCaseData(id: "db66197c-68ea-48bb-af9c-529efab72514",
             input: "S = \"abc\", T = \"cab\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "198a9d7d-09c9-4ee4-b3e9-a0ab3957dd69",
             input: "S = \"aabbcc\", T = \"abc\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "122e67bd-923f-4d9f-a01c-307fc412993a",
             input: "S = \"abc\", T = \"aabbcc\"",
             expected: "aabbcc", orderMatters: true),
            TestCaseData(id: "24116398-eab4-4199-8130-2cb7191aa211",
             input: "S = \"abc\", T = \"abcabc\"",
             expected: "aabbcc", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "custom-sort-string"
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

            let p_S = InputParser.parseString(params[0])
            guard p_S.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: S string too long (\(p_S.count))"
                )
                return
            }
            let p_T = InputParser.parseString(params[1])
            guard p_T.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: T string too long (\(p_T.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_S.count >= 1 && p_S.count <= 26 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= order.length <= 26"
                )
                return
            }
            guard p_T.count >= 1 && p_T.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 200"
                )
                return
            }

            let solution = Solution()
            let result = solution.customSortString(p_S, p_T)
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
