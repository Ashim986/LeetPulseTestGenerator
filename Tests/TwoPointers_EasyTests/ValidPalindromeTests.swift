import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCValidPalindrome {
    private class Solution {
        func isPalindrome(_ s: String) -> Bool {
            let chars = Array(s.lowercased())
            var left = 0, right = chars.count - 1

            while left < right {
                while left < right && !chars[left].isLetter && !chars[left].isNumber {
                    left += 1
                }
                while left < right && !chars[right].isLetter && !chars[right].isNumber {
                    right -= 1
                }
                if chars[left] != chars[right] { return false }
                left += 1
                right -= 1
            }
            return true
        }
    }

    @Suite struct ValidPalindromeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "94958795-709C-41ED-9030-4C763F7223A8",
             input: "A man, a plan, a canal: Panama",
             expected: "true", orderMatters: true),
            TestCaseData(id: "B974B30C-D155-4871-8E63-3147CF2F43D8",
             input: "race a car",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6B809D89-B942-4F9E-90E7-04DB255C94D3",
             input: "a",
             expected: "true", orderMatters: true),
            TestCaseData(id: "28B19DD5-1D3B-4123-A4AA-5BD6527E4491",
             input: "ab",
             expected: "false", orderMatters: true),
            TestCaseData(id: "56B147A5-FA9F-4BE1-9947-08A8A33F4355",
             input: "aba",
             expected: "true", orderMatters: true),
            TestCaseData(id: "A01BBC59-0B74-4068-9AB8-220561A6AAC3",
             input: "No 'x' in Nixon",
             expected: "true", orderMatters: true),
            TestCaseData(id: "241B3A40-AA41-42CA-9B07-82CF9B30FBF2",
             input: "Not a palindrome",
             expected: "false", orderMatters: true),
            TestCaseData(id: "63E0206F-3BCC-4BC7-AE63-1FD46481B095",
             input: "Was it a car or a cat I saw?",
             expected: "true", orderMatters: true),
            TestCaseData(id: "368B9602-2FEE-447E-AA2F-00B07671E072",
             input: "12321",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5F7416DC-249A-43AE-A566-79D1E44305E3",
             input: "123456",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2DA536A6-1CC4-4704-9CF5-993C7895C90B",
             input: "Madam",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2C29EC9A-F165-4D5A-AE9E-2DC06FFC6C71",
             input: "Radar",
             expected: "true", orderMatters: true),
            TestCaseData(id: "232650FC-EBED-4644-AFE8-9AD194F988DE",
             input: "Level",
             expected: "true", orderMatters: true),
            TestCaseData(id: "E247F712-393E-4209-99AC-A727CE03BA2D",
             input: "Deed",
             expected: "true", orderMatters: true),
            TestCaseData(id: "57478D35-B324-4510-9142-CE4C015A77A8",
             input: "Civic",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5793935A-3DC1-43EF-89D4-158D4DE5087E",
             input: "Refer",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9D796D8A-2EBB-45E7-9EED-AF739F1BCA84",
             input: "Pop",
             expected: "true", orderMatters: true),
            TestCaseData(id: "AF7AAA81-2718-4392-86F7-8A8BC80D9B58",
             input: "Noon",
             expected: "true", orderMatters: true),
            TestCaseData(id: "18B8CA00-0EBC-456E-9AF6-53B6238117EB",
             input: "kayak",
             expected: "true", orderMatters: true),
            TestCaseData(id: "B6EFAB5C-3069-4B0B-8677-E4E1BD632F3F",
             input: "reviver",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5204AC16-4344-4605-9160-9BBD3925BC1F",
             input: "deified",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0713CE30-A5F8-4FC0-AD35-B4AD76E215FE",
             input: "Able was I ere I saw Elba",
             expected: "true", orderMatters: true),
            TestCaseData(id: "C3296D74-BF71-48B5-B206-2D08A6373D59",
             input: "A Santa at NASA",
             expected: "true", orderMatters: true),
            TestCaseData(id: "96141465-B357-4E35-8394-C2DC47DF17EA",
             input: "Do geese see God?",
             expected: "true", orderMatters: true),
            TestCaseData(id: "BCD6485E-9484-4920-B76D-C189ED062AE9",
             input: "Mr. Owl ate my metal worm",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "valid-palindrome"
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
            guard p_s.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 2 * 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isPalindrome(p_s)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
