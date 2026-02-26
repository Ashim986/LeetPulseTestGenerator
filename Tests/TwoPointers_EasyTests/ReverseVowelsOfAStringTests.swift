import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseVowelsOfAString {
    private class Solution {
        func reverseVowels(_ s: String) -> String {
            let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
            var chars = Array(s)
            var left = 0
            var right = chars.count - 1
            while left < right {
                if !vowels.contains(chars[left]) {
                    left += 1
                }
                else if !vowels.contains(chars[right]) {
                    right -= 1
                }
                else {
                    let temp = chars[left]
                    chars[left] = chars[right]
                    chars[right] = temp
                    left += 1
                    right -= 1
                }
            }
            return String(chars)
        }
    }

    @Suite struct ReverseVowelsOfAStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c0437c2a-91e7-4ebf-8ee0-f1c20475e07c",
             input: "s = \"\"",
             expected: "\"\"", orderMatters: true),
            TestCaseData(id: "a6b06e5e-f1dd-4499-bef4-72b355720932",
             input: "s = \"a\"",
             expected: "\"a\"", orderMatters: true),
            TestCaseData(id: "d5f52e9d-80fa-44f7-9e47-9e3d466f087d",
             input: "s = \"aa\"",
             expected: "\"aa\"", orderMatters: true),
            TestCaseData(id: "43c504f2-1ad9-41b6-870b-24628755b473",
             input: "s = \"ab\"",
             expected: "\"ab\"", orderMatters: true),
            TestCaseData(id: "625dbaa8-70f3-425b-b6dc-49f39c15daa2",
             input: "s = \"ae\"",
             expected: "\"ea\"", orderMatters: true),
            TestCaseData(id: "71fdb02e-e7d2-4383-943e-4541fc6f50a4",
             input: "s = \"bcd\"",
             expected: "\"bcd\"", orderMatters: true),
            TestCaseData(id: "4105de8c-a02a-4a75-b16b-aa75a61c4835",
             input: "s = \"aaa\"",
             expected: "\"aaa\"", orderMatters: true),
            TestCaseData(id: "66e9b4ec-961b-4260-89ef-b8372f4a6b81",
             input: "s = \"aeio\"",
             expected: "\"oiea\"", orderMatters: true),
            TestCaseData(id: "61a70f65-6997-421b-8091-81e5d44a5582",
             input: "s = \"uoiea\"",
             expected: "\"aeiou\"", orderMatters: true),
            TestCaseData(id: "8f8ffcfe-fbae-4115-b1e0-acbebed5a369",
             input: "s = \"aaaaaa\"",
             expected: "\"aaaaaa\"", orderMatters: true),
            TestCaseData(id: "3c6b1978-3ceb-41ce-9323-6966fb032ad7",
             input: "s = \"aaaaae\"",
             expected: "\"eaaaaa\"", orderMatters: true),
            TestCaseData(id: "9aa5866f-c920-4c02-8863-ef034b060aae",
             input: "s = \"aabbcc\"",
             expected: "\"aabbcc\"", orderMatters: true),
            TestCaseData(id: "9712ac68-2335-4e5c-b715-26ec0a77bba1",
             input: "s = \"abcabcabc\"",
             expected: "\"abcabcabc\"", orderMatters: true),
            TestCaseData(id: "0ba40ef2-2d66-4848-9b96-30240b331ac9",
             input: "s = \"abcdabcd\"",
             expected: "\"abcdabcd\"", orderMatters: true),
            TestCaseData(id: "93c35f99-e3fb-4f04-bb20-ede92dd59838",
             input: "s = \"abcde\"",
             expected: "ebcda", orderMatters: true),
            TestCaseData(id: "35f9d334-6750-4634-9c39-e1b081be25cf",
             input: "s = \"aeiouy\"",
             expected: "uoieay", orderMatters: true),
            TestCaseData(id: "02cd81e3-12d0-4f8a-9939-a4c92c4989ad",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "ubcdofghijkmlne pqrstavywxyz", orderMatters: true),
            TestCaseData(id: "bd0a74b7-aa08-4d36-905b-b25e662af922",
             input: "s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "ubcdefghijklmnopqrstuvwxyzubcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "39b9fafe-903c-46d3-9508-f4a1028436f9",
             input: "s = \"aaaaaee\"",
             expected: "eeaAAAA", orderMatters: true),
            TestCaseData(id: "1eb7d0ae-bf2f-4416-95ea-86d9431da09f",
             input: "s = \"aaaaaeei\"",
             expected: "ieeaAAAA", orderMatters: true),
            TestCaseData(id: "b454cec3-4027-4970-9382-07ebcd84ee53",
             input: "s = \"aaaaaeeio\"",
             expected: "oieeaAAAa", orderMatters: true),
            TestCaseData(id: "9575715f-5ac1-473b-abd2-bb0ea41de44f",
             input: "s = \"aaaaaeeiou\"",
             expected: "uoieaAAAA", orderMatters: true),
            TestCaseData(id: "73783ec2-1fae-4ab6-aa62-4f7c524abaa0",
             input: "s = \"aaaaaeeiouy\"",
             expected: "uoieaAAAy", orderMatters: true),
            TestCaseData(id: "dcb439cc-09b4-425a-b458-bd418395c12a",
             input: "s = \"abcdeabcde\"",
             expected: "ebcdaebcda", orderMatters: true),
            TestCaseData(id: "94fff89e-5e55-4471-97c0-48db402479fb",
             input: "s = \"abcdefgh\"",
             expected: "ebcdafgh", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-vowels-of-a-string"
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
            guard p_s.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 3 * 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.reverseVowels(p_s)
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
