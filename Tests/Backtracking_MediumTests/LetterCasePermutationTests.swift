import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLetterCasePermutation {
    private class Solution {
        func letterCasePermutation(_ s: String) -> [String] {
            let n = s.count
            let numBits = s.reduce(0) { $0 + ($1.isLetter ? 1 : 0) }
            var result: [String] = []
            for i in 0..<1<<numBits {
                var copy = s
                var index = 0
                for (j, char) in s.enumerated() {
                    if char.isLetter {
                        if (i>>index)&1 == 1 {
                            copy.replaceSubrange(s.index(s.startIndex, offsetBy: j)...s.index(s.startIndex, offsetBy: j), with: String(char).uppercased())
                        } else {
                            copy.replaceSubrange(s.index(s.startIndex, offsetBy: j)...s.index(s.startIndex, offsetBy: j), with: String(char).lowercased())
                        }
                        index += 1
                    }
                }
                result.append(copy)
            }
            return result
        }
    }

    @Suite struct LetterCasePermutationTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c2b05b56-2935-46a9-96c6-377f9269f296",
             input: "s = \"abc\"",
             expected: "[\"abc\", \"abC\", \"aBc\", \"aBC\", \"Abc\", \"AbC\", \"ABc\", \"ABC\"]", orderMatters: false),
            TestCaseData(id: "98aea3b6-4302-4f42-bf94-ef84f74bb190",
             input: "s = \"123\"",
             expected: "[\"123\"]", orderMatters: false),
            TestCaseData(id: "57b504e1-3517-4fe8-8a92-ca3e1a6ad3aa",
             input: "s = \"a\"",
             expected: "[\"a\", \"A\"]", orderMatters: false),
            TestCaseData(id: "df3526f4-9aa2-4573-909f-414ca4cfe11f",
             input: "s = \"A\"",
             expected: "[\"A\", \"a\"]", orderMatters: false),
            TestCaseData(id: "02019581-2522-42bf-804b-39c2e1305876",
             input: "s = \"1\"",
             expected: "[\"1\"]", orderMatters: false),
            TestCaseData(id: "8dffbd2d-46ed-4191-b538-e07c46242ce0",
             input: "s = \"\"",
             expected: "[\"\"]", orderMatters: false),
            TestCaseData(id: "94354031-6a59-442e-83a6-1d145e17d0ba",
             input: "s = \"abc123\"",
             expected: "[\"abc123\", \"abC123\", \"aBc123\", \"aBC123\", \"Abc123\", \"AbC123\", \"ABc123\", \"ABC123\"]", orderMatters: false),
            TestCaseData(id: "c30ccdd8-a32d-4b55-97e3-9ca2615221fd",
             input: "s = \"a1b2c3\"",
             expected: "[\"a1b2c3\", \"a1b2C3\", \"a1B2c3\", \"a1B2C3\", \"A1b2c3\", \"A1b2C3\", \"A1B2c3\", \"A1B2C3\"]", orderMatters: false),
            TestCaseData(id: "b35e91a2-40bb-4c3b-bfd0-78a8b0c5de38",
             input: "s = \"123a\"",
             expected: "[\"123a\", \"123A\"]", orderMatters: false),
            TestCaseData(id: "1d37bc6d-fd71-41d8-8a37-56bdeaf255c3",
             input: "s = \"a123\"",
             expected: "[\"a123\", \"A123\"]", orderMatters: false),
            TestCaseData(id: "bda32172-e985-415c-bd89-a2874d1770de",
             input: "s = \"a1b\"",
             expected: "[\"a1b\", \"a1B\", \"A1b\", \"A1B\"]", orderMatters: false),
            TestCaseData(id: "65563222-bcc9-44f8-9537-62e1b127bf83",
             input: "s = \"1a\"",
             expected: "[\"1a\", \"1A\"]", orderMatters: false),
            TestCaseData(id: "067e495c-f3ec-49b4-be73-0829988d9f4c",
             input: "s = \"a1\"",
             expected: "[\"a1\", \"A1\"]", orderMatters: false),
            TestCaseData(id: "c587b4c6-4a8f-4318-a8f4-03ca5da99eba",
             input: "s = \"a12\"",
             expected: "[\"a12\", \"A12\"]", orderMatters: false),
            TestCaseData(id: "c3f725ef-5ce4-49a6-9f35-16e2c71a6d01",
             input: "s = \"12a\"",
             expected: "[\"12a\", \"12A\"]", orderMatters: false),
            TestCaseData(id: "2499a22b-d29c-4163-99a0-c631b1e3c444",
             input: "s = \"1a1\"",
             expected: "[\"1a1\", \"1A1\"]", orderMatters: false),
            TestCaseData(id: "081063b5-46dc-477c-8a91-3bfb5ce146b2",
             input: "s = \"aa\"",
             expected: "[\"aa\", \"aA\", \"Aa\", \"AA\"]", orderMatters: false),
            TestCaseData(id: "45acae98-57e7-47ce-bdf0-7e9eaad87feb",
             input: "s = \"11\"",
             expected: "[\"11\"]", orderMatters: false),
            TestCaseData(id: "2ebd1b07-0ca3-43ce-96f3-001a4c2ed003",
             input: "s = \"a11\"",
             expected: "[\"a11\", \"A11\"]", orderMatters: false),
            TestCaseData(id: "ee1a6927-f34e-4865-b6a2-f4516055efbc",
             input: "s = \"11a\"",
             expected: "[\"11a\", \"11A\"]", orderMatters: false),
            TestCaseData(id: "7c9c6df3-1b2d-4551-ae89-3c8f775170b6",
             input: "s = \"1a1a\"",
             expected: "[\"1a1a\", \"1a1A\", \"1A1a\", \"1A1A\"]", orderMatters: false),
            TestCaseData(id: "93688614-ae3d-470f-bb41-b5622706c6ca",
             input: "s = \"111\"",
             expected: "[\"111\"]", orderMatters: false),
            TestCaseData(id: "5a2d688f-637b-462a-9f7b-965da78bb812",
             input: "s = \"1a11\"",
             expected: "[\"1a11\", \"1A11\"]", orderMatters: false),
            TestCaseData(id: "c002923e-63c3-4379-8b09-fec9a6650ca4",
             input: "s = \"111a\"",
             expected: "[\"111a\", \"111A\"]", orderMatters: false),
            TestCaseData(id: "3ea781d2-91d7-48ff-87de-f5468325d2af",
             input: "s = \"1a1a1\"",
             expected: "[\"1a1a1\", \"1a1A1\", \"1A1a1\", \"1A1A1\"]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "letter-case-permutation"
            let topic = "backtracking"
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
            guard p_s.count >= 1 && p_s.count <= 12 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 12"
                )
                return
            }

            let solution = Solution()
            let result = solution.letterCasePermutation(p_s)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [String]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
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
