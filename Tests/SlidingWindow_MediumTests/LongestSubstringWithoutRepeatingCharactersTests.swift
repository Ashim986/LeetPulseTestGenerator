import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestSubstringWithoutRepeatingCharacters {
    private class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            let chars = Array(s)
            var lastIndex: [Character: Int] = [:]
            var left = 0
            var best = 0
            for (right, ch) in chars.enumerated() {
                if let prev = lastIndex[ch], prev >= left {
                    left = prev + 1
                }
                lastIndex[ch] = right
                best = max(best, right - left + 1)
            }
            return best
        }
    }

    @Suite struct LongestSubstringWithoutRepeatingCharactersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "FA756497-16F4-4C38-A23E-EE4D8EF231A2",
             input: "\"abcabcbb\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "E1965AA3-EB8A-479E-90A5-A3F709203312",
             input: "\"bbbbb\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "14F71826-7D9A-494E-9244-D4F84639CB86",
             input: "\"pwwkew\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "605E7DE8-52EE-4600-A5AF-72BCB226311C",
             input: "\"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "C99B620F-2277-4194-873F-6B9BDFE8DD6D",
             input: "\"a\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "97E1B46D-6799-4425-A22E-997E8B49E8B7",
             input: "\"au\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7A6839A0-1ABD-41B1-AFBD-28C7B9F923E4",
             input: "\"dvdf\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9844A45E-9A80-43C8-9C89-53F343471FF6",
             input: "\" \"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0EF38CF1-EA30-4E99-9894-A9CBBF460F8D",
             input: "\"abcdefgh\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "1F6ACB77-6ABC-4815-AB25-79F9EA4D5F28",
             input: "\"tmmzuxt\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "99024B76-1A0B-4780-AF41-D2EBB656909A",
             input: "\"ohomm\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e2399282-c5a7-4322-8706-c31f24f41a07",
             input: "s = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cf6e85a6-98ee-4b34-8f4e-29e96c8ed1f7",
             input: "s = \"a\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9b72efe0-7e39-4497-af2d-40a3ddf1c35e",
             input: "s = \"ab\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b99f7720-4465-499e-9dbc-ddb4c597c058",
             input: "s = \"aba\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "369ff494-4047-443d-803f-70c1b46aad93",
             input: "s = \"abcde\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e720cd4e-111c-40c1-9838-2e7964d4bf7f",
             input: "s = \"aaaaa\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5dc48fec-c4b3-4b33-a64f-95d44b5b5049",
             input: "s = \"abcdefabcdef\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "54cce3ed-071f-4ada-8505-a431b1e6b062",
             input: "s = \"abcdefghij\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "771d809a-540a-40f1-b349-59c1429062a8",
             input: "s = \"abcdefghijabcdefghij\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "f63d6b5e-9f88-4e73-8a44-5ac1e54368e8",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "26", orderMatters: true),
            TestCaseData(id: "f464ebcc-14ee-46d2-86ea-32942bb3fa80",
             input: "s = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "26", orderMatters: true),
            TestCaseData(id: "e45c345d-2381-473e-aeae-1b5e2dc9006a",
             input: "s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "26", orderMatters: true),
            TestCaseData(id: "81242ca4-c543-42b3-bcfd-2aa7e93ec92b",
             input: "s = \"aaaaaaaaaaaaaaaaaaaaaa\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "343eced1-3e25-4583-bc35-d00ae2125c5c",
             input: "s = \"ababababababababababab\"",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-substring-without-repeating-characters"
            let topic = "sliding-window"
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
            guard p_s.count >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= s.length <= 5 * 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.lengthOfLongestSubstring(p_s)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
