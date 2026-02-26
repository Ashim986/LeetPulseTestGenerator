import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCValidParentheses {
    private class Solution {
        func isValid(_ s: String) -> Bool {
            var stack: [Character] = []
            for ch in s {
                switch ch {
                case "(", "{", "[":
                    stack.append(ch)
                case ")":
                    if stack.popLast() != "(" { return false }
                case "}":
                    if stack.popLast() != "{" { return false }
                case "]":
                    if stack.popLast() != "[" { return false }
                default:
                    break
                }
            }
            return stack.isEmpty
        }
    }

    @Suite struct ValidParenthesesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "83153A89-9743-4FEC-812B-2976A3657F46",
             input: "()",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0CFEA044-4653-4C9B-B8C0-FA1B39273543",
             input: "()[]{}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "910A8794-B12A-4B4F-8EF3-D80BFA2111CA",
             input: "(]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "16C402CC-D1E8-47EB-A808-206727CBE798",
             input: "{[]}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5D6C3443-A66D-470C-AD1B-FC2EE789F49A",
             input: "){",
             expected: "false", orderMatters: true),
            TestCaseData(id: "41CAD4F5-A4F4-4EFE-B6D2-2D14785A7E83",
             input: "((()))",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2232DE1A-8AB9-47CD-A8B5-A2E32B3F36AB",
             input: "([{}])",
             expected: "true", orderMatters: true),
            TestCaseData(id: "FC56AAF3-10CF-48F0-B0AB-108DD8BB10D7",
             input: "[(])",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ACF56E8F-40F3-40D6-9DC4-5569EE7DF061",
             input: "([]){}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "E55DEC56-BEB7-4B10-899A-A7ABCABB5745",
             input: "([]){[()]}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4339c04a-78d7-42c4-ad00-2b2ac5e0305a",
             input: "s = \"\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "673c3b2f-7c98-4221-a51a-0b8b87c830bb",
             input: "s = \"({[]})\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5fb58fe9-84f6-476f-805a-59e6ef6d0762",
             input: "s = \"([)]\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3700ba9e-f5ae-4fe7-9dd1-7194f8ff7f90",
             input: "s = \"([{}])\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a8415cb2-e696-436a-a7f7-0453bd79de4b",
             input: "s = \"(())\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "50e2ae3d-6559-448c-9cd5-178c5d28410c",
             input: "s = \"(())[]{}\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "41caf0e4-f8ae-4c31-9fe1-8e246e6e3bb5",
             input: "s = \"([)]{}\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "417b747c-9b8a-4bfe-9c84-af257ba923d9",
             input: "s = \"({})\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "38af31cb-72a0-4096-ac61-c75f8cc8946d",
             input: "s = \"({})[]\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "65777d09-8fdb-4496-a37f-1fba915224f2",
             input: "s = \"({[}])\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b27a3bf3-93e6-47b6-9c0e-49b1adbc1656",
             input: "s = \"({})[]{}\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d8c03d41-ce42-4ae5-bd88-df4646e7c476",
             input: "s = \"({})[]{}()\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bcd71682-33c3-4c8a-a5cb-5a8527ebeb08",
             input: "s = \"({})[]{}()[]\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "16ac5d52-a8c2-4086-bfe4-96fca969aa39",
             input: "s = \"({})[]{}()[]{}\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6bba8207-31bb-4456-bf2a-ef074ea238a3",
             input: "s = \"({})[]{}()[]{}()\"",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "valid-parentheses"
            let topic = "stack"
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
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.isValid(p_s)
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
