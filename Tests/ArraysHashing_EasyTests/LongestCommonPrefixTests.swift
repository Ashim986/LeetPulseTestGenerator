import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestCommonPrefix {
    private class Solution {
        func longestCommonPrefix(_ strs: [String]) -> String {
            guard !strs.isEmpty else { return "" }

            var prefix = strs[0]

            for i in 1..<strs.count {
                while !strs[i].hasPrefix(prefix) {
                    prefix = String(prefix.dropLast())
                    if prefix.isEmpty { return "" }
                }
            }

            return prefix
        }
    }

    @Suite struct LongestCommonPrefixTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3E655E43-C428-43B2-AAAB-D1213325790E",
             input: "[\"flower\",\"flow\",\"flight\"]",
             expected: "fl", orderMatters: true),
            TestCaseData(id: "B974F533-5202-4642-A079-9970C4075C9E",
             input: "[\"apple\"]",
             expected: "apple", orderMatters: true),
            TestCaseData(id: "75EC2D51-2FDD-46E4-9E57-C064E105921D",
             input: "[\"abc\", \"abc\", \"abc\"]",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "FF4C332F-35F6-4FCA-B240-21A3FBCE53EE",
             input: "[\"abab\",\"aba\",\"ab\"]",
             expected: "ab", orderMatters: true),
            TestCaseData(id: "CD8B16C9-A576-4FF2-BE5F-1A72E75C75DA",
             input: "[\"interspecies\",\"interstellar\",\"interstate\",\"internet\",\"inter\"]",
             expected: "inter", orderMatters: true),
            TestCaseData(id: "E2EB0D4F-A2A1-4680-BD84-899308BF131E",
             input: "[\"abab\",\"aba\",\"abc\"]",
             expected: "ab", orderMatters: true),
            TestCaseData(id: "95206026-BC82-4B18-9BD8-BC9757C01F8D",
             input: "[\"flower\",\"flower\",\"flower\",\"flower\"]",
             expected: "flower", orderMatters: true),
            TestCaseData(id: "94ABDF13-786E-461E-B908-35EBEE2C2EF4",
             input: "[\"cir\",\"car\"]",
             expected: "c", orderMatters: true),
            TestCaseData(id: "2C3C2333-94AE-4474-AE6D-E924FD8DD477",
             input: "[\"abcdefg\",\"abc\",\"ab\"]",
             expected: "ab", orderMatters: true),
            TestCaseData(id: "D570F94C-AB5A-4282-B1FE-84DBC8F5B112",
             input: "[\"ab\", \"a\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "6D7F1F1A-92B5-47FC-B4CE-F424AFA01031",
             input: "[\"abc\"]",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "AC4609A8-1B4F-456A-BDCC-357993C2BFC6",
             input: "[\"aa\",\"a\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "34FADC79-1263-4234-AFA1-6DF7B872B7B9",
             input: "[\"flower\",\"flow\",\"flight\",\"flush\"]",
             expected: "fl", orderMatters: true),
            TestCaseData(id: "29DBA2B5-22DD-493F-AEBD-1000C8554804",
             input: "[\"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\",\""
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\",\"aaa"
                + "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\"]",
             expected: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", orderMatters: true),
            TestCaseData(id: "8E59C6DC-F05F-4E7D-9A24-6313FCDFCE82",
             input: "[\"abc\",\"abcde\",\"abcf\"]",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "3EBB815A-0724-47BF-9649-D3EB35819D83",
             input: "[\"a\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "0AF67C27-E1BC-4513-8E9D-3009803A96C5",
             input: "[\"abcde\",\"abcf\",\"ab\"]",
             expected: "ab", orderMatters: true),
            TestCaseData(id: "c5e3108f-ccad-4a71-88d7-64c87f2bed67",
             input: "strs = [\"abc\",\"abcd\",\"abcde\"]",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "81b65e6e-984c-4c90-bb5b-3abb1a7919da",
             input: "strs = [\"apple\",\"apply\",\"appliance\"]",
             expected: "appl", orderMatters: true),
            TestCaseData(id: "e4b65ba9-69b0-44fd-9e8c-6d177bd0212c",
             input: "strs = [\"hello\",\"hello world\",\"hello universe\"]",
             expected: "hello", orderMatters: true),
            TestCaseData(id: "d01ecc08-3831-4347-aba2-9a14e5b8a396",
             input: "strs = [\"xyz\",\"xy\",\"x\"]",
             expected: "x", orderMatters: true),
            TestCaseData(id: "92a798af-6d2b-414e-a788-418cc43b9aae",
             input: "strs = [\"aaa\",\"aa\",\"a\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "133b3b75-8314-4a09-b2e5-f173d8254d85",
             input: "strs = [\"q\",\"q\",\"q\"]",
             expected: "q", orderMatters: true),
            TestCaseData(id: "5af8fe7f-13a1-4821-89e9-297801ad3a56",
             input: "strs = [\"123\",\"1234\",\"12345\"]",
             expected: "123", orderMatters: true),
            TestCaseData(id: "6024c6b8-d7e7-4074-a4e1-0220c4364a37",
             input: "strs = [\"a\",\"a\",\"a\"]",
             expected: "a", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-common-prefix"
            let topic = "arrays-hashing"
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

            guard let p_strs = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_strs.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: strs array too large (\(p_strs.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_strs.count >= 1 && p_strs.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= strs.length <= 200"
                )
                return
            }
            guard p_strs.allSatisfy({ $0.count >= 0 && $0.count <= 200 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= strs[i].length <= 200"
                )
                return
            }

            let solution = Solution()
            let result = solution.longestCommonPrefix(p_strs)
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
