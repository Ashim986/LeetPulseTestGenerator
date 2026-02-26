import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCIsomorphicStrings {
    private class Solution {
        func isIsomorphic(_ s: String, _ t: String) -> Bool {
            let s = Array(s)
            let t = Array(t)
            if s.count != t.count {
                return false
            }
            var sToTMap: [Character: Character] = [:]
            var tToSMap: [Character: Character] = [:]
            for i in 0..<s.count {
                if let tValue = sToTMap[s[i]] {
                    if tValue != t[i] {
                        return false
                    }
                }
                else if let sValue = tToSMap[t[i]] {
                    if sValue != s[i] {
                        return false
                    }
                }
                else {
                    sToTMap[s[i]] = t[i]
                    tToSMap[t[i]] = s[i]
                }
            }
            return true
        }
    }

    @Suite struct IsomorphicStringsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bf554d95-7692-4da9-8c8e-64fa65ed63e6",
             input: "s = \"ab\", t = \"cd\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "61074c42-1866-4b11-abfc-6bf285901af8",
             input: "s = \"abc\", t = \"def\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "efcbd759-9c65-425d-a3ed-9dfbbd2fde0a",
             input: "s = \"abcd\", t = \"dcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "bb63c58b-a244-4d6f-a33c-98dc37eedc9c",
             input: "s = \"a\", t = \"b\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "48a16d41-2b00-44f9-b626-633d12e7f07a",
             input: "s = \"\", t = \"\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7ce2133d-b103-429c-83e7-e9aae6160165",
             input: "s = \"a\", t = \"\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e69513d0-d4e2-450e-af50-300d37088a6e",
             input: "s = \"\", t = \"a\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6add28fb-197c-45b6-bdb7-94190e455bcf",
             input: "s = \"aaa\", t = \"bbb\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2cfcc316-9fde-498d-bc67-133d7461c5cf",
             input: "s = \"abab\", t = \"cdcd\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "410a9758-cf34-4035-80b4-1e6931140c2e",
             input: "s = \"abcabc\", t = \"defdef\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a9cfd7ed-eba8-4fed-8c4c-8db069e1c769",
             input: "s = \"abcdefgh\", t = \"ijklmnop\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b7282324-108d-454c-a584-75c606ede9b5",
             input: "s = \"abcdefgh\", t = \"abcdefgh\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "df997b7b-8654-4fe1-ba71-cde85630eeee",
             input: "s = \"abcdefgh\", t = \"hgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "934bf48e-8cad-44c8-87f6-4a17f34d7f16",
             input: "s = \"abcdefgh\", t = \"hgfedcbg\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "12a8eabe-f6e7-4e60-bdeb-a15524608e34",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", t = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "aedbd4f2-490c-44f9-a7f8-8210f9694d1e",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", t = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "dbbdee8e-60f5-4bd4-ab33-0fd8ea0eb440",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", t = \"zyxwvutsrqponmlkjihgfedcbz\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d5b00f37-d178-4ed9-be0d-6b668145d351",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", t = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a1551fe1-bfd0-4e69-9bd5-66f0df402d8a",
             input: "s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\", t = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "33100fbc-a800-47cc-9c6a-fc972c792f7e",
             input: "s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\", t = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "edcc983e-1f95-4eb8-90c8-7f142a98feee",
             input: "s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\", t = \"zyxwvutsrqponmlkjihgfedcbazyxwvutsrqponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "16a03552-a478-4b63-810b-c4ca5f398ba0",
             input: "s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\", t = \"zyxwvutsrqponmlkjihgfedcbazyxwvutsrqponmlkjihgfedcbz\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "fc086a95-f1e8-4358-a025-8c60100c220b",
             input: "s = \"aaaa\", t = \"bbbb\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "196b0d02-3601-4f5b-b3eb-cf7430abe886",
             input: "s = \"aaaa\", t = \"bbbc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "08ac6717-cb0d-4d4d-b9cd-b0aa78475c39",
             input: "s = \"aaaa\", t = \"aaaa\"",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "isomorphic-strings"
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
            let p_t = InputParser.parseString(params[1])
            guard p_t.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: t string too long (\(p_t.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 50000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 5 * 10^4"
                )
                return
            }

            let solution = Solution()
            let result = solution.isIsomorphic(p_s, p_t)
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
