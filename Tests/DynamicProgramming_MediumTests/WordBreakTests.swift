import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCWordBreak {
    private class Solution {
        func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
            let words = Set(wordDict)
            let chars = Array(s)
            let n = chars.count
            var dp = [Bool](repeating: false, count: n + 1)
            dp[0] = true

            for i in 1...n {
                for j in 0..<i {
                    if dp[j] && words.contains(String(chars[j..<i])) {
                        dp[i] = true
                        break
                    }
                }
            }

            return dp[n]
        }
    }

    @Suite struct WordBreakTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e51477c5-33a0-4580-97be-5087134c5743",
             input: "s = \"applepenapple\", wordDict = [\"apple\",\"pen\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e0f4728d-9cbe-4051-a510-41af8b9ba996",
             input: "s = \"catsandog\", wordDict = [\"cats\",\"dog\",\"sand\",\"and\",\"cat\"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "38b238f4-c976-497d-9790-9e936fd279df",
             input: "s = \"\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "597be1cc-b444-4af2-a861-c5794cab0306",
             input: "s = \"a\", wordDict = []",
             expected: "false", orderMatters: true),
            TestCaseData(id: "02ef9d3d-617b-4def-ba3b-2525a27284f6",
             input: "s = \"a\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ef3e8e91-fd6b-4c06-8491-4743fa3fd85b",
             input: "s = \"ab\", wordDict = [\"a\",\"b\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6aa7eefd-c1e1-47b8-8f41-ca0bf766938a",
             input: "s = \"abc\", wordDict = [\"a\",\"b\",\"c\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3ca1d112-62d8-47b5-8577-719153ef6c14",
             input: "s = \"abcd\", wordDict = [\"a\",\"b\",\"c\",\"d\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2a871d34-3cce-4848-be3d-f2b60f36b3cf",
             input: "s = \"abcde\", wordDict = [\"a\",\"b\",\"c\",\"d\",\"e\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d331f034-97f4-4c36-88ae-7809633e3e9f",
             input: "s = \"a\", wordDict = [\"aa\"]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d606ff0d-4d53-49a7-aa73-44d82f9934f8",
             input: "s = \"aa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "64ed4ebb-d18f-45ad-8a41-835179842d58",
             input: "s = \"aaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3d6b3b31-99c8-4884-8d1e-c434b9c34d8c",
             input: "s = \"aaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "23626ecd-8800-4952-8d6c-ef5026003995",
             input: "s = \"aaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e3e0d809-dd71-4b2d-a48c-2e8066a6877d",
             input: "s = \"aaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "776b7fee-f1a5-4cad-806a-75dd43042d19",
             input: "s = \"aaaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "bc8b3d2c-fa7e-48dd-8160-616b5aa8e0e1",
             input: "s = \"aaaaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5cff2d60-f7f2-461e-a6a3-261e0ee57100",
             input: "s = \"aaaaaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a6c6b57c-bdea-47ed-a936-ea16f40634f8",
             input: "s = \"aaaaaaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9378cf07-66eb-4e5a-99e2-a64f18fb3fd0",
             input: "s = \"aaaaaaaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "05c3085c-7d97-4ba0-8792-e3f866231d6f",
             input: "s = \"aaaaaaaaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "61977df7-6b53-48a8-8fa2-28af227eb9e2",
             input: "s = \"aaaaaaaaaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "26f17075-4392-4b86-a222-2da2c3b379eb",
             input: "s = \"aaaaaaaaaaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1cd06f48-b673-4738-93cd-10fb760b4b1a",
             input: "s = \"aaaaaaaaaaaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0a85d9c1-f48c-4973-bac9-df341264865f",
             input: "s = \"aaaaaaaaaaaaaaaa\", wordDict = [\"a\"]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "word-break"
            let topic = "dynamic-programming"
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
            guard let p_wordDict = InputParser.parseStringArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [String]"
                )
                return
            }
            guard p_wordDict.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: wordDict array too large (\(p_wordDict.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 300 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 300"
                )
                return
            }
            guard p_wordDict.count >= 1 && p_wordDict.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= wordDict.length <= 1000"
                )
                return
            }
            guard p_wordDict.allSatisfy({ $0.count >= 1 && $0.count <= 20 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= wordDict[i].length <= 20"
                )
                return
            }

            let solution = Solution()
            let result = solution.wordBreak(p_s, p_wordDict)
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
