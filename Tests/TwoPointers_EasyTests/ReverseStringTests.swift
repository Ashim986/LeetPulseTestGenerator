import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseString {
    private class Solution {
        func reverseString(_ s: String) -> String {
            var charArray = Array(s)
            var left = 0
            var right = charArray.count - 1
            while left < right {
                let temp = charArray[left]
                charArray[left] = charArray[right]
                charArray[right] = temp
                left += 1
                right -= 1
            }
            return String(charArray)
        }
    }

    @Suite struct ReverseStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "382c72b5-3f31-4db9-8f33-4b990b117562",
             input: "s = \"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "07715e4c-5191-4e56-8e0a-0effe2c77734",
             input: "s = \"ab\"",
             expected: "ba", orderMatters: true),
            TestCaseData(id: "448df8ce-c045-4c6c-92c0-160f3fff808f",
             input: "s = \"abc\"",
             expected: "cba", orderMatters: true),
            TestCaseData(id: "03b05cac-b1ae-41f0-8711-6847a6651c8d",
             input: "s = \"abcd\"",
             expected: "dcba", orderMatters: true),
            TestCaseData(id: "0a94705c-9ce2-4ead-990c-c26f0a858667",
             input: "s = \"abcde\"",
             expected: "edcba", orderMatters: true),
            TestCaseData(id: "e49f3313-87fc-474f-928c-71127af44b6a",
             input: "s = \"abcdef\"",
             expected: "fedcba", orderMatters: true),
            TestCaseData(id: "69a48d48-5f36-4692-9934-131fd62da3db",
             input: "s = \"abcdefgh\"",
             expected: "hgfedcba", orderMatters: true),
            TestCaseData(id: "314a0c50-78ef-4673-bb02-d1c38bae0707",
             input: "s = \"abcdefghi\"",
             expected: "ihgfedcba", orderMatters: true),
            TestCaseData(id: "ed3a94a2-a7b6-48be-ac15-6e800629170f",
             input: "s = \"abcdefghij\"",
             expected: "jihgfedcba", orderMatters: true),
            TestCaseData(id: "9e99c607-087a-49c9-af07-c519a9c5eb6a",
             input: "s = \"aaa\"",
             expected: "aaa", orderMatters: true),
            TestCaseData(id: "9913d1f7-8087-442e-837a-8ae6564047ce",
             input: "s = \"12345\"",
             expected: "54321", orderMatters: true),
            TestCaseData(id: "84c7aee8-d179-4829-bf84-0d5e61758989",
             input: "s = \"-12345\"",
             expected: "54321-", orderMatters: true),
            TestCaseData(id: "e71daa44-6407-4d5f-b566-513332db8f93",
             input: "s = \"123abc\"",
             expected: "cba321", orderMatters: true),
            TestCaseData(id: "1e9325c8-4bb0-4f7e-a1e3-16fce831111c",
             input: "s = \"abc123\"",
             expected: "321cba", orderMatters: true),
            TestCaseData(id: "89a4ca0c-0f1d-4a68-811b-39303263a6eb",
             input: "s = \"!@#$%\"",
             expected: "%$#@!", orderMatters: true),
            TestCaseData(id: "1d9b6c05-8cf4-4d82-87d6-5d2ae3998bb6",
             input: "s = \"ABCDEFGHIJKLMNOPQRSTUVWXYZ\"",
             expected: "ZYXWVUTSRQPONMLKJIHGFEDCBA", orderMatters: true),
            TestCaseData(id: "ff19feb8-59e9-4675-b2c1-9b44ae76354e",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "zyxwvutsrqponmlkjihgfedcba", orderMatters: true),
            TestCaseData(id: "1c295116-b1ba-47f7-8d52-8edb7af318eb",
             input: "s = \"1234567890\"",
             expected: "0987654321", orderMatters: true),
            TestCaseData(id: "151f132c-7cce-4cb7-8040-e457f9e04688",
             input: "s = \"abcdefghijk\"",
             expected: "kjihgfedcba", orderMatters: true),
            TestCaseData(id: "a4c8b985-2c68-4539-b83d-1cc9f8a5e077",
             input: "s = \"abcdefghijkl\"",
             expected: "lkjihgfedcba", orderMatters: true),
            TestCaseData(id: "87a2caab-5a80-4c71-bce3-0dce06a5904d",
             input: "s = \"abcdefghijklm\"",
             expected: "mlkjihgfedcba", orderMatters: true),
            TestCaseData(id: "93fc25c2-24fe-418c-b1f5-4f77360096c1",
             input: "s = \"abcdefghijklmn\"",
             expected: "nmlkjihgfedcba", orderMatters: true),
            TestCaseData(id: "178e622d-abfc-41cc-9b99-f231e879e992",
             input: "s = \"abcdefghijklmno\"",
             expected: "onmlkjihgfedcba", orderMatters: true),
            TestCaseData(id: "2e22a265-46c4-4288-a944-89ec9bc9b47b",
             input: "s = \"abcdefghijklmnop\"",
             expected: "ponmlkjihgfedcba", orderMatters: true),
            TestCaseData(id: "1f297945-ebc1-4365-9449-25bee9902066",
             input: "s = \"abcdefghijklmnopq\"",
             expected: "qponmlkjihgfedcba", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-string"
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
            let result = solution.reverseString(p_s)
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
