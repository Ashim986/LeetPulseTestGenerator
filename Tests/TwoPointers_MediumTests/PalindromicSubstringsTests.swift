import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPalindromicSubstrings {
    private class Solution {
        func countSubstrings(_ s: String) -> Int {
            let chars = Array(s)
            var count = 0

            func expand(_ left: Int, _ right: Int) -> Int {
                var l = left, r = right, cnt = 0
                while l >= 0 && r < chars.count && chars[l] == chars[r] {
                    cnt += 1
                    l -= 1; r += 1
                }
                return cnt
            }

            for i in 0..<chars.count {
                count += expand(i, i)      // Odd
                count += expand(i, i + 1)  // Even
            }

            return count
        }
    }

    @Suite struct PalindromicSubstringsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c8fc039d-3236-40e7-97de-6ed52e7d2b71",
             input: "s = \"abc\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "fc185f7d-faf2-49c5-93d1-69b104559c8f",
             input: "s = \"abcd\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "d4fbe8a9-1b03-493e-814c-121b0335c484",
             input: "s = \"a\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ac08dff0-9984-4619-a061-79c378cae57e",
             input: "s = \"racecar\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "1f455b7a-99cc-4e81-8520-826a895cd2d8",
             input: "s = \"civic\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "e3448217-70de-4af9-b902-27747574d69b",
             input: "s = \"pop\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "db94298e-8156-403d-98cd-2088b9170261",
             input: "s = \"madam\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "76a4bfbc-bbf4-4483-bd50-1a02328441ba",
             input: "s = \"aibohphobia\"",
             expected: "16", orderMatters: true),
            TestCaseData(id: "830e7152-6009-428c-83f1-e3a86c17e631",
             input: "s = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "79e2eba4-34c5-4eef-bcd9-a53254283a2f",
             input: "s = \"aaaaa\"",
             expected: "15", orderMatters: true),
            TestCaseData(id: "a22f8cd4-bd79-4781-a955-637629d358ad",
             input: "s = \"aaaaaa\"",
             expected: "21", orderMatters: true),
            TestCaseData(id: "357392c3-f090-4df2-91dc-fb070dac75fd",
             input: "s = \"abcdefgh\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "0ced8e7f-b4d9-4845-90d6-d00d6d2dc781",
             input: "s = \"hgfedcba\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "f834ba33-5b67-4f29-9b54-f645ad4a5d3f",
             input: "s = \"abcdefgha\"",
             expected: "9", orderMatters: true),
            TestCaseData(id: "0e33c58f-dffa-4059-959f-7486f45aaab0",
             input: "s = \"abcdefghab\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "bb8e064c-8b31-42b5-a00d-765ed0ef8ca2",
             input: "s = \"abba\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "6a6a0f25-46d4-4fca-995b-155894b437b8",
             input: "s = \"radar\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "9468ee2d-8920-47bc-a058-dc7d36f94fa9",
             input: "s = \"level\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "5a53a8ff-5a05-43d7-8d2b-934c2abb0191",
             input: "s = \"rotator\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d50e196b-ba3a-445d-bda9-f64004f8c8d8",
             input: "s = \"repaper\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "45e7b5ad-ee51-4e7c-9999-f1b69bab4592",
             input: "s = \"deified\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "adb93e3f-ebb7-4021-893a-50b1c4279682",
             input: "s = \"refer\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "64440864-b29c-4ff0-8273-c7cd07829e66",
             input: "s = \"noon\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "c29d39c4-ae38-4194-8196-c43f668d75c8",
             input: "s = \"tattarrattat\"",
             expected: "24", orderMatters: true),
            TestCaseData(id: "db0d1abe-80f1-4f1d-b5a9-0474da994edd",
             input: "s = \"ababab\"",
             expected: "12", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "palindromic-substrings"
            let topic = "two-pointers"
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
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.countSubstrings(p_s)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
