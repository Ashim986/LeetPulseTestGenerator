import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestRepeatingCharacterReplacement {
    private class Solution {
        func characterReplacement(_ s: String, _ k: Int) -> Int {
            let chars = Array(s)
            var freq: [Character: Int] = [:]
            var maxFreq = 0
            var left = 0

            for right in 0..<chars.count {
                freq[chars[right], default: 0] += 1
                maxFreq = max(maxFreq, freq[chars[right]].unsafelyUnwrapped)

                // If invalid, slide window (don't shrink, just shift)
                if (right - left + 1) - maxFreq > k {
                    freq[chars[left]].unsafelyUnwrapped -= 1
                    left += 1
                }
            }

            // Final window size is our answer
            return chars.count - left
        }
    }

    @Suite struct LongestRepeatingCharacterReplacementTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "C771C538-98A0-4325-835F-2B8E6BC30A88",
             input: "ABAB\n2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "26D4ED74-654B-4F73-9E46-AB1BC5C10659",
             input: "AABABBA\n1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "BBDA1B00-8A57-425C-B1AD-DEEE4837B297",
             input: "0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5858BA82-0713-4E70-A576-4C1F88C23B9B",
             input: "AAAA\n2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "AC2A0393-A4B1-4560-9F9B-79495134D207",
             input: "ABC\n0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "59AE8172-C920-4751-8365-C3AA4E336982",
             input: "A\n0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "D93D485A-BC89-4934-B726-0FD8B21C032F",
             input: "ABABAB\n3",
             expected: "6", orderMatters: true),
            TestCaseData(id: "4D7363F8-EB8C-4814-814C-D292CB19B095",
             input: "AAAAAAAAAA\n5",
             expected: "10", orderMatters: true),
            TestCaseData(id: "4B7EB5BE-8FEA-45A4-B30A-02699C68AFE8",
             input: "AAB\n1",
             expected: "3", orderMatters: true),
            TestCaseData(id: "42180F45-D785-4501-9781-469F778B3C68",
             input: "AA\n1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5CC4BB85-CD9A-40FC-A019-EFFC9271283F",
             input: "AB\n0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7CCD205E-9D47-496C-AECA-543887C0C6A4",
             input: "AAAAB\n2",
             expected: "5", orderMatters: true),
            TestCaseData(id: "F6E9D5B9-3415-4F94-8EAD-4A00736FB5E9",
             input: "AAB\n2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "622AADF4-6C41-4B86-B3CE-D206E3986495",
             input: "ABC\n1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "F63E12A4-C9EB-469E-9E70-4E9F16AFDBD5",
             input: "AAABBBCCC\n3",
             expected: "6", orderMatters: true),
            TestCaseData(id: "B88F1FE7-1FA3-4E5E-9F02-CBADC5A72DBF",
             input: "AAAAAAA\n2",
             expected: "7", orderMatters: true),
            TestCaseData(id: "AE7C6F0C-D65C-4133-9661-E234E9E84CC0",
             input: "A\n2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "AAD74678-8B51-41D0-9901-95126F1EF117",
             input: "ABABAB\n2",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4873FAC7-0C3C-4C2F-9C29-365D2D67D0C4",
             input: "AAAAA\n1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4E5B31A6-3CA2-4EBE-B90C-C3316D5F353A",
             input: "2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "DF4AA644-FB9D-49D9-85A3-A9E898506750",
             input: "AB\n1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "A834167B-56F2-4F1E-8285-E6B8A592CDFC",
             input: "ABBB\n2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "6BE5A1B7-5E4A-489A-8065-3B66E047F62E",
             input: "ABABABAB\n3",
             expected: "7", orderMatters: true),
            TestCaseData(id: "6C9DCC81-66B2-488D-9828-6B546DAE765D",
             input: "ABCABC\n2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "63BFCE2A-14AE-47F4-B701-393ED6B60019",
             input: "AAABBB\n2",
             expected: "5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-repeating-character-replacement"
            let topic = "sliding-window"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
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
            let result = solution.characterReplacement(p_s, p_k)
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
