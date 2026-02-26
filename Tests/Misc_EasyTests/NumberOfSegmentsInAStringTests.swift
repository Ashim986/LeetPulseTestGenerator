import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfSegmentsInAString {
    private class Solution {
        func countSegments(_ s: String) -> Int { let str = s.trimmingCharacters(in: .whitespaces); return str.components(separatedBy: " ").filter { !$0.isEmpty }.count }
    }

    @Suite struct NumberOfSegmentsInAStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7a7027ed-7604-47bd-b8dd-c20ffaa05e12",
             input: "s = \"Hello world\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "23856df3-f455-436c-8e4f-48c617cd66cc",
             input: "s = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "548ad64f-1441-4c77-9ada-ff5fac6ab8a9",
             input: "s = \" \"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ca0a5982-71cf-42e6-88c4-76ad7f0f7806",
             input: "s = \"abc\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "41790fb9-f9d1-4dd8-8924-fb2a6d5605f2",
             input: "s = \"a b c\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "8faa3445-a9e2-4eb7-989a-503a08dfd931",
             input: "s = \"   a   b   c   \"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "aecd3f6b-8a98-449d-805e-874a69db76a5",
             input: "s = \"123\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9ede2ec6-74e7-440a-87b0-08dedee7ec2b",
             input: "s = \"123 456\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ca4e2b8d-3b0e-483b-999d-dbcfcbb68631",
             input: "s = \"123  456  \"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2fe648e7-c38d-44f6-86c6-1b9d3deb0f1d",
             input: "s = \"-1\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c6b14f4c-685b-4577-b1cb-a55018d2866e",
             input: "s = \"-1 -2\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "68a70207-cce1-44c2-b050-7d98ab1db4ff",
             input: "s = \"-1  -2  \"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ac3eabaa-f02d-42fc-8b64-3476d548d36d",
             input: "s = \"abc def ghi\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "7df8a1a4-d746-4103-b0b5-cc3f3fe16b00",
             input: "s = \"   abc   def   ghi   \"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "8535ab84-543e-47c2-becb-3835b970c3e2",
             input: "s = \"a a a a a\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f19223be-b846-47e4-8a01-e9f54d21f49c",
             input: "s = \"   a   a   a   a   a   \"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "be434df6-472d-469a-a2af-2cbb3843cda1",
             input: "s = \"123 456 789\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "196ad71b-9317-4fe6-a427-b77ae7393209",
             input: "s = \"123  456  789  \"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1eb3fc49-1741-44d7-9bf0-d03f8bfccc67",
             input: "s = \"   123   456   789   \"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e779bec9-0784-4831-b336-a9c237d9986b",
             input: "s = \"-1 -2 -3\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ce35bc54-5816-4f7d-9eb1-c99d32a06dc8",
             input: "s = \"-1  -2  -3  \"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d9a8eae0-4d9b-4cf6-8eb7-9397b20db5f6",
             input: "s = \"   -1   -2   -3   \"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "4e2da7eb-abb4-4dd7-8b83-5cd4bd585c53",
             input: "s = \"abc def ghi jkl\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ec7d8fc2-f742-49b6-a1cf-141f1f39dc5f",
             input: "s = \"   abc   def   ghi   jkl   \"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e502ba80-7879-4fb7-ab83-eea6040854f1",
             input: "s = \"a a a a a a a a a a\"",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-segments-in-a-string"
            let topic = "misc"
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
            guard p_s.count >= 0 && p_s.count <= 300 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= s.length <= 300"
                )
                return
            }

            let solution = Solution()
            let result = solution.countSegments(p_s)
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
