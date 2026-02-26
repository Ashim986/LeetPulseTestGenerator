import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSortCharactersByFrequency {
    private class Solution {
        struct Element: Comparable {
            let char: Character
            let frequency: Int

            static func < (lhs: Element, rhs: Element) -> Bool {
                return lhs.frequency > rhs.frequency
            }
        }

        func frequencySort(_ s: String) -> String {
            var charFrequency: [Character: Int] = [:]
            for char in s {
                if charFrequency[char] != nil {
                    charFrequency[char].unsafelyUnwrapped += 1
                } else {
                    charFrequency[char] = 1
                }
            }

            var priorityQueue: [Element] = []
            for (char, frequency) in charFrequency {
                let element = Element(char: char, frequency: frequency)
                priorityQueue.append(element)
            }

            priorityQueue.sort()

            var result = ""

            for element in priorityQueue {
                result += String(repeating: element.char, count: element.frequency)
            }

            return result
        }
    }

    @Suite struct SortCharactersByFrequencyTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e671f924-3676-48f9-8136-91aa523c5b7b",
             input: "s = \"abc\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "53c64032-5b4a-41ca-a9f9-b268848c2837",
             input: "s = \"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "66c4c765-de84-4924-bf1a-ace1c6d193d8",
             input: "s = \"aaaa\"",
             expected: "aaaa", orderMatters: true),
            TestCaseData(id: "7ba2a917-6336-4da4-b352-d659096c1e42",
             input: "s = \"aaaaaa\"",
             expected: "aaaaaa", orderMatters: true),
            TestCaseData(id: "2bd777cb-d758-4068-943f-543531bbd622",
             input: "s = \"ab\"",
             expected: "ab", orderMatters: true),
            TestCaseData(id: "4b18632e-19b0-4858-837d-ed99588651fb",
             input: "s = \"aba\"",
             expected: "aab", orderMatters: true),
            TestCaseData(id: "d4f835a7-1716-4c01-b3d4-4b7597c61266",
             input: "s = \"ababab\"",
             expected: "aaabbb", orderMatters: true),
            TestCaseData(id: "f8de6a0a-a0ab-45be-8e5e-cdffcba905be",
             input: "s = \"abcde\"",
             expected: "abcde", orderMatters: true),
            TestCaseData(id: "d7f0f447-81a8-4b49-9c56-e145a283782c",
             input: "s = \"aabbcc\"",
             expected: "aabbcc", orderMatters: true),
            TestCaseData(id: "2f5d195b-cdca-4087-b409-8958a91d1c33",
             input: "s = \"aaaabbb\"",
             expected: "aaaabbb", orderMatters: true),
            TestCaseData(id: "692623e5-3d05-44e1-902b-145abcb6e6c8",
             input: "s = \"abababab\"",
             expected: "aaaabbbb", orderMatters: true),
            TestCaseData(id: "8bef2709-eae4-4e01-bd3b-86c01f971a5d",
             input: "s = \"abcdefgh\"",
             expected: "abcdefgh", orderMatters: true),
            TestCaseData(id: "659ab076-6447-4a7e-bc0b-24266230f287",
             input: "s = \"aabbccdd\"",
             expected: "aabbccdd", orderMatters: true),
            TestCaseData(id: "52637708-0e89-4b8d-90a3-71a6f72a14b0",
             input: "s = \"aaaaaaa\"",
             expected: "aaaaaaa", orderMatters: true),
            TestCaseData(id: "93601463-3f2d-4ae8-8dd6-63810eb2a2a2",
             input: "s = \"abcdefghi\"",
             expected: "abcdefghi", orderMatters: true),
            TestCaseData(id: "9c1860cb-cef8-4831-a09f-509affc2f0be",
             input: "s = \"aabbccddeeff\"",
             expected: "aabbccddeeff", orderMatters: true),
            TestCaseData(id: "557eb2d7-dff5-4376-96cf-cdb7963927cb",
             input: "s = \"aaaaaaaa\"",
             expected: "aaaaaaaa", orderMatters: true),
            TestCaseData(id: "03fb1db3-45c7-4e17-a53a-5897fca50df5",
             input: "s = \"aaaaaaaaa\"",
             expected: "aaaaaaaaa", orderMatters: true),
            TestCaseData(id: "3d2327af-9e73-498b-be40-e92098b5e2a1",
             input: "s = \"aaaaaaaaaa\"",
             expected: "aaaaaaaaaa", orderMatters: true),
            TestCaseData(id: "6d2fa94a-6154-4765-ac2d-255d6a42add1",
             input: "s = \"aabbccddeeffgghhi\"",
             expected: "aabbccddeeffgghhi", orderMatters: true),
            TestCaseData(id: "25269a45-e28c-40b4-b139-07a19d6ed2b7",
             input: "s = \"aaaaaaaaaaa\"",
             expected: "aaaaaaaaaaa", orderMatters: true),
            TestCaseData(id: "69b609c3-9103-4e06-a531-5f734420d118",
             input: "s = \"abcdefghijklm\"",
             expected: "abcdefghijklm", orderMatters: true),
            TestCaseData(id: "527ba349-028e-4756-b5ed-afe54daa6e2f",
             input: "s = \"aabbccddeeffgghhii\"",
             expected: "aabbccddeeffgghhii", orderMatters: true),
            TestCaseData(id: "1e2cc401-b68d-4e63-a921-ae1248440a6d",
             input: "s = \"abab\"",
             expected: "aabb", orderMatters: true),
            TestCaseData(id: "b4862385-b4a5-439c-8182-5e18ccb22b3f",
             input: "s = \"abcabc\"",
             expected: "aabbcc", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sort-characters-by-frequency"
            let topic = "heap-priority-queue"
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
            guard p_s.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 5 * 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.frequencySort(p_s)
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
