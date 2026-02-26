import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestPalindrome {
    private class Solution {
        func longestPalindrome(_ s: String) -> Int {
            let chars = Array(s)
            var count: [Character: Int] = [:]
            for char in chars {
                count[char, default: 0] += 1
            }
            var length = 0
            var odd = false
            for (_, value) in count {
                if value % 2 == 0 {
                    length += value
                }
                else {
                    length += value - 1
                    odd = true
                }
            }
            if odd {
                return length + 1
            }
            else {
                return length
            }
        }
    }

    @Suite struct LongestPalindromeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9f6cc195-db0c-4fd1-82e5-2f5ff8552fa8",
             input: "s = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e479a48f-b775-427e-a969-508373acac53",
             input: "s = \"aa\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a78d1f70-cbc0-49b3-9fc5-b81af1869bb4",
             input: "s = \"ab\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "16b5f0a8-1c2c-479d-b578-e229e2d483d0",
             input: "s = \"aba\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "4132b4a5-c306-47e1-ba2d-7b1a841c7bdc",
             input: "s = \"abc\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "28aab513-0acd-4591-bc3e-7b615dfa99eb",
             input: "s = \"abcd\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "33003749-3077-4a7d-8d2a-b94874836d4c",
             input: "s = \"abcddcba\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "d7171c8d-d662-42d4-94fd-d82a6544db23",
             input: "s = \"aaaaaaa\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "0238f550-c0b6-4f4e-93d9-0f5a251196bc",
             input: "s = \"bbbbbbbb\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "33f9487a-8fd7-42a8-8fde-bf67bc38e16e",
             input: "s = \"abcba\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "56cc707c-af15-4fee-a4fc-e2e8f040d970",
             input: "s = \"abccba\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "bf778a94-106c-498c-86a2-1ec11941b2fb",
             input: "s = \"abba\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "753a2c3e-c636-4ee8-8218-083aab35e570",
             input: "s = \"abababab\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "1905aeda-c74f-46c7-b8ac-5c5cca25b87f",
             input: "s = \"abcc\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "95563f5e-8c0e-4fbc-8327-0070964576b4",
             input: "s = \"abcdd\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "250d0482-f1ab-41f9-9743-5e0d1e7497a7",
             input: "s = \"abccdd\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "dc992cfa-8dc9-4f90-af5d-676955b71bd4",
             input: "s = \"abccccddd\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "25fc7e74-b71f-4ef2-bfa3-a086659b3fba",
             input: "s = \"abccccdddd\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "f7a6e331-6cf0-42c2-8ba3-289c47f337e6",
             input: "s = \"abccccddddd\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "e319a05d-c169-4833-b1c3-99c03d3eb267",
             input: "s = \"abccccdddddd\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "93aa6e9a-15f7-48af-a6cf-7cbed2320df0",
             input: "s = \"abccccddddddd\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "89a98854-2aad-44fc-96cd-d32351f5c118",
             input: "s = \"abccccdddddddd\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "78a078ae-b4a4-49c4-a65d-b97c7cecf816",
             input: "s = \"abccccddddddddd\"",
             expected: "9", orderMatters: true),
            TestCaseData(id: "eed0bea1-143a-4618-b3ab-25b007ff9373",
             input: "s = \"abccccdddddddddd\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "715e46e0-ee21-441d-8509-4be6d5083b95",
             input: "s = \"abccccddddddddddd\"",
             expected: "11", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-palindrome"
            let topic = "greedy"
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
            guard p_s.count >= 1 && p_s.count <= 2000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 2000"
                )
                return
            }

            let solution = Solution()
            let result = solution.longestPalindrome(p_s)
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
