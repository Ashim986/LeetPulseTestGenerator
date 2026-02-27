import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDecodeString {
    private class Solution {
        func decodeString(_ s: String) -> String {
            var stack: [(String, Int)] = []
            var current = ""
            var num = 0
            for c in s {
                if c.isNumber { num = num * 10 + Int(String(c)).unsafelyUnwrapped }
                else if c == "[" { stack.append((current, num)); current = ""; num = 0 }
                else if c == "]" { let (prev, count) = stack.removeLast(); current = prev + String(repeating: current, count: count) }
                else { current.append(c) }
            }
            return current
        }
    }

    @Suite struct DecodeStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0aadbe47-4d6e-46d5-a42f-d5c342f67fa6",
             input: "s = \"3[a]\"",
             expected: "aaa", orderMatters: true),
            TestCaseData(id: "358dc4b9-e6b8-4561-b70f-9889a7472d46",
             input: "s = \"2[abc]\"",
             expected: "abcabc", orderMatters: true),
            TestCaseData(id: "ffbb79e5-4bba-4286-a317-ccc0e40e7cf5",
             input: "s = \"a2[b]\"",
             expected: "abb", orderMatters: true),
            TestCaseData(id: "011bbd0f-e2db-4b87-afa6-46bf0c90a2a9",
             input: "s = \"10[a]\"",
             expected: "aaaaaaaaaa", orderMatters: true),
            TestCaseData(id: "1f5a9aaa-2c14-4087-a9fb-a6d891f6b304",
             input: "s = \"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "fd42e639-1072-410d-84b7-304d2e44e7ab",
             input: "s = \"4[2[a]2[b]2[c]]2[d]\"",
             expected: "aabbccaabbccaabbccaabbccdd", orderMatters: true),
            TestCaseData(id: "144125fd-e336-4d9d-b406-e0bd6f6c3024",
             input: "s = \"4[2[a]2[b]2[c]]2[d2[e]]\"",
             expected: "aabbccaabbccaabbccaabbccdeedee", orderMatters: true),
            TestCaseData(id: "82b9df5c-9a9c-43c7-9afd-48c2771dbad6",
             input: "s = \"3[a2[b]]\"",
             expected: "abbabbabb", orderMatters: true),
            TestCaseData(id: "26b21c86-e8ac-476a-b5ea-272fd46d69fb",
             input: "s = \"4[2[a]b]\"",
             expected: "aabaabaabaab", orderMatters: true),
            TestCaseData(id: "27381f10-8570-4b8b-b878-e07f5873d9fb",
             input: "s = \"3[a]2[b]\"",
             expected: "aaabb", orderMatters: true),
            TestCaseData(id: "f67f16b7-a43a-4afb-a672-3f0341130fc1",
             input: "s = \"2[a]3[b]\"",
             expected: "aaabbb", orderMatters: true),
            TestCaseData(id: "194302c5-9b1c-46e7-9d7e-b9d25a4fa3ce",
             input: "s = \"3[a2[b]]3[c]\"",
             expected: "abbabbabbccc", orderMatters: true),
            TestCaseData(id: "c049c50e-d17b-45ae-b15b-6c055a8071d5",
             input: "s = \"4[2[a]2[b]]\"",
             expected: "aabbaabbaabbaabb", orderMatters: true),
            TestCaseData(id: "3a08f6de-7aa0-4e81-a5fa-5d77c2d21bdf",
             input: "s = \"3[a2[b]3[c]]\"",
             expected: "abbcccabbcccabbccc", orderMatters: true),
            TestCaseData(id: "212d6fa3-65ca-48cf-93bd-eab15e1e1afa",
             input: "s = \"10[a10[b]]\"",
             expected: "abbbbbbbbbbabbbbbbbbbbabbbbbbbbbbabbbbbbbbbbabbbbbbbbbbabbbbbbbbbbabbbbbbbbbbabbbbbbbbbbabbbbbbbbbbabbbbbbbbbb", orderMatters: true),
            TestCaseData(id: "bdc70dbe-23c8-452c-8bee-5ad303e1cd6e",
             input: "s = \"3[a]10[b]\"",
             expected: "aaabbbbbbbbbbbb", orderMatters: true),
            TestCaseData(id: "156611f0-6bf7-4381-a60b-19f5a0364ce0",
             input: "s = \"2[a2[b]2[c]]\"",
             expected: "abbccabbcc", orderMatters: true),
            TestCaseData(id: "bdf17ed3-1558-4049-ac4e-5f2e09d1800e",
             input: "s = \"3[a2[b]2[c]]\"",
             expected: "abbccabbccabbcc", orderMatters: true),
            TestCaseData(id: "3c4930ae-6fd8-4196-9def-9adbd3eca776",
             input: "s = \"4[2[a]2[b]2[c]]\"",
             expected: "aabbccaabbccaabbccaabbcc", orderMatters: true),
            TestCaseData(id: "79a74daf-f358-498d-9174-f600fcef7c79",
             input: "s = \"10[2[a]2[b]2[c]]\"",
             expected: "aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbcc", orderMatters: true),
            TestCaseData(id: "b2ebf4b7-bcca-44f1-ac63-08ca5973156e",
             input: "s = \"2[a2[b]2[c]]3[d]\"",
             expected: "abbccabbccddd", orderMatters: true),
            TestCaseData(id: "30cc25b7-edc8-422f-a0c3-8ed83e7dbed2",
             input: "s = \"3[a2[b]2[c]]2[d]\"",
             expected: "abbccabbccabbccdd", orderMatters: true),
            TestCaseData(id: "23894155-a96f-4323-95ba-e50801321279",
             input: "s = \"10[2[a]2[b]2[c]]2[d]\"",
             expected: "aabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccaabbccdd", orderMatters: true),
            TestCaseData(id: "62f9a7f9-171b-4d6d-a9e7-654c08e9372f",
             input: "s = \"2[a2[b]2[c]]3[d2[e]]\"",
             expected: "abbccabbccdeedeedee", orderMatters: true),
            TestCaseData(id: "7220eb1a-5848-4354-87ee-695470448383",
             input: "s = \"3[a2[b]2[c]]2[d2[e]]\"",
             expected: "abbccabbccabbccdeedee", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "decode-string"
            let topic = "stack"
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
            guard p_s.count >= 1 && p_s.count <= 30 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 30"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.decodeString(p_s)
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

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
