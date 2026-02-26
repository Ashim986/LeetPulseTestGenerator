import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCValidPalindromeIi {
    private class Solution {
        func validPalindrome(_ s: String) -> Bool {
            let str = Array(s)
            var left = 0
            var right = str.count - 1
            while left < right {
                if str[left] != str[right] {
                    return isPalindrome(str, left + 1, right) || isPalindrome(str, left, right - 1)
                }
                left += 1
                right -= 1
            }
            return true
            func isPalindrome(_ str: [Character], _ left: Int, _ right: Int) -> Bool {
                var left = left
                var right = right
                while left < right {
                    if str[left] != str[right] {
                        return false
                    }
                    left += 1
                    right -= 1
                }
                return true
            }
        }
    }

    @Suite struct ValidPalindromeIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "af8b3318-c53f-4e08-ad3e-7c7c3b412d29",
             input: "s = \"\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cadd4b65-4351-4d62-ae66-d5a6da2c16fa",
             input: "s = \"a\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7f7a722f-4139-4cd9-b10b-2e898f3eeec1",
             input: "s = \"aa\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "071b570e-231e-455c-952a-d494837b67a3",
             input: "s = \"abba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "105e846d-1882-4459-a208-1a3a49bce8ba",
             input: "s = \"abcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7230f71e-9f30-4d11-8d16-78385312170e",
             input: "s = \"abccba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ffe797da-3213-428e-959c-4c28961c2f92",
             input: "s = \"abcdcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6a08bb3f-0336-495f-9444-557ae3907e4f",
             input: "s = \"abcddcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4905538f-060b-4ff7-8271-8ee0f7d12f0e",
             input: "s = \"abcdefgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ece21a4d-3931-44d7-a9cd-3b3591f7fa3d",
             input: "s = \"abcdefghihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9d383954-4324-4b4b-a7ff-196acefec2ab",
             input: "s = \"abcdefghijihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "590ecb02-7325-49fe-a25f-76d58cbd350f",
             input: "s = \"abcdefghijkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "29d5d560-8bf7-40f5-b8a5-e5f78ed554be",
             input: "s = \"abcdefghijlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "99dd12f2-1d03-435c-951f-9c4dad33ae65",
             input: "s = \"abcdefghijlmnmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1cb811a6-97c0-47fc-94ef-effeffc72f18",
             input: "s = \"abcdefghijlmnoponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "994cbfa7-c54d-4d45-bfde-de246a5fd480",
             input: "s = \"abcdefghijlmnopqponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d86bea7b-260f-465e-9f33-af4e451cbce5",
             input: "s = \"abcdefghijlmnopqrqponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "64faeb4a-88c9-44cc-8c7f-6400aa36c065",
             input: "s = \"abcdefghijlmnopqrstsrqponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "da061e9b-8efa-4d74-b795-e5cc08c783ae",
             input: "s = \"abcdefghijlmnopqrstuvwvutsrqponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1639c8de-e321-42f1-930c-ca3807d4b0ed",
             input: "s = \"abcdefghijlmnopqrstuvwxyzzyxwvutsrqponmlkjihgfedcba\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "50bb937b-a0ef-4718-8d11-188531d59041",
             input: "s = \"abababababababababababababab\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "55ce0393-6be7-4213-96db-90b6e02528f9",
             input: "s = \"ababababababababababababababa\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b6af81f0-91cc-4822-bdf6-1cc7467d6666",
             input: "s = \"ababababababababababababababab\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d54038cd-5ea2-42d4-99f7-858280ba48d0",
             input: "s = \"ababababababababababababababac\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6ef71269-cde9-4bb2-9197-e2740a68d7bd",
             input: "s = \"abababababababababababababababab\"",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "valid-palindrome-ii"
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
            guard p_s.count >= 1 && p_s.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.validPalindrome(p_s)
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
