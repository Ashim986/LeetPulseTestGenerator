import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindTheDifference {
    private class Solution {
        func findTheDifference(_ s: String, _ t: String) -> Character {
            var result = 0
            for c in s {
                result = result ^ Int(c.asciiValue ?? 0)
            }
            for c in t {
                result = result ^ Int(c.asciiValue ?? 0)
            }
            return Character(UnicodeScalar(UInt32(result)) ?? UnicodeScalar(0))
        }
    }

    @Suite struct FindTheDifferenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c375220e-1abe-47e5-b4f4-62c84a2fd9de",
             input: "s = \"\", t = \"abc\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "9a339409-78b5-48c3-a516-226b894d8875",
             input: "s = \"abc\", t = \"abcabc\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "57766c8b-27a4-47bd-bde3-160d84114f4f",
             input: "s = \"a\", t = \"ab\"",
             expected: "b", orderMatters: true),
            TestCaseData(id: "2c9f28a3-e78b-4be8-916a-1c83f9b6727c",
             input: "s = \"a\", t = \"b\"",
             expected: "b", orderMatters: true),
            TestCaseData(id: "bf48c4cb-2263-4351-89ec-28512ddd9d81",
             input: "s = \"\", t = \"abcdef\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "4db5d405-b633-4b46-856a-68419e011bcb",
             input: "s = \"a\", t = \"aaaa\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "336d2082-a542-4f45-b874-215404852832",
             input: "s = \"abc\", t = \"abcabcabc\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "c186f866-c0ce-4134-8b53-bb3c364386e8",
             input: "s = \"abcde\", t = \"abcdeabcde\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "bf4279d3-892e-4139-b19f-4a3aca740e3d",
             input: "s = \"abc\", t = \"abcabcabcabc\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "e1b0c832-6bc7-4f56-afb9-00e18f801356",
             input: "s = \"abcde\", t = \"abcdeabcdeabcde\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "781886eb-66c1-4944-baa6-d2c506304736",
             input: "s = \"abc\", t = \"abcd\"",
             expected: "d", orderMatters: true),
            TestCaseData(id: "e08958d4-dfd3-4399-99d5-91ac23c96033",
             input: "s = \"abcde\", t = \"abcdef\"",
             expected: "f", orderMatters: true),
            TestCaseData(id: "a6ebad68-2061-4f89-852d-e98ade7c9163",
             input: "s = \"\", t = \"abcdefg\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "a8c9943a-cc40-4560-a36e-70be146c0469",
             input: "s = \"a\", t = \"aaaaa\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "b1b89adb-3444-4762-82d3-6d3568039db5",
             input: "s = \"abc\", t = \"abcabcabcabcabc\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "c951277a-4ac4-4d24-b5ed-3397481e1972",
             input: "s = \"abcde\", t = \"abcdeabcdeabcdeabcde\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "efc5b56e-6ea0-4ced-9760-7be73915c88b",
             input: "s = \"\", t = \"abcdefgh\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "24913670-7768-459c-bd6a-c9c6bfc99d8d",
             input: "s = \"a\", t = \"aaaaaa\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "9ba664cf-cfb9-43e9-bd85-bef8e370d47f",
             input: "s = \"abc\", t = \"abcabcabcabcabcabc\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "ba2314f2-f8e2-4556-9ce2-3431cb8750f5",
             input: "s = \"abcde\", t = \"abcdeabcdeabcdeabcdeabcde\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "f6fcd3ae-e7df-42f4-a788-cf65a0514b29",
             input: "s = \"\", t = \"abcdefghi\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "0e7efb4b-9183-46a3-9f5d-1c774759e6e7",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", t = \"abcdefghijklmnopqrstuvwxyzA\"",
             expected: "A", orderMatters: true),
            TestCaseData(id: "0aa35bcd-8072-4d2c-898b-c587c5bcdca6",
             input: "s = \"zyxwvutsrqponmlkjihgfedcba\", t = \"zyxwvutsrqponmlkjihgfedcbaz\"",
             expected: "z", orderMatters: true),
            TestCaseData(id: "e49a4351-b656-451c-a266-1c71b32f7b79",
             input: "s = \"aaaaaaaaaaaa\", t = \"aaaaaaaaaaaab\"",
             expected: "b", orderMatters: true),
            TestCaseData(id: "f0e354d9-939d-4b94-a255-f0cbeb2da808",
             input: "s = \"ab\", t = \"ba\"",
             expected: "null", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-the-difference"
            let topic = "bit-manipulation"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            let p_t = InputParser.parseString(params[1])
            guard p_t.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: t string too long (\(p_t.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 0 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= s.length <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Character?
            let didCrash = withCrashGuard {
                resultHolder = solution.findTheDifference(p_s, p_t)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
