import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAddStrings {
    private class Solution {
        func addStrings(_ num1: String, _ num2: String) -> String {
            var i = num1.count - 1, j = num2.count - 1
            var carry = 0, result = ""
            let n1 = Array(num1), n2 = Array(num2)
            while i >= 0 || j >= 0 || carry > 0 {
                let d1 = i >= 0 ? Int(String(n1[i])).unsafelyUnwrapped : 0
                let d2 = j >= 0 ? Int(String(n2[j])).unsafelyUnwrapped : 0
                let sum = d1 + d2 + carry
                result = String(sum % 10) + result
                carry = sum / 10
                i -= 1; j -= 1
            }
            return result
        }
    }

    @Suite struct AddStringsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3e7f2323-b420-4619-903f-d943783f6d91",
             input: "num1 = \"0\", num2 = \"0\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8e0716a5-ff0b-4c20-884c-5081f6546143",
             input: "num1 = \"1\", num2 = \"1\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c5f8b31e-e7fa-43df-a096-3e84132b9e77",
             input: "num1 = \"9\", num2 = \"9\"",
             expected: "18", orderMatters: true),
            TestCaseData(id: "c16af8b1-7f7d-4962-89be-45e135808069",
             input: "num1 = \"10\", num2 = \"10\"",
             expected: "20", orderMatters: true),
            TestCaseData(id: "4a0bfd3d-2d68-42c7-89e1-aa6f19a89adc",
             input: "num1 = \"100\", num2 = \"100\"",
             expected: "200", orderMatters: true),
            TestCaseData(id: "479c3899-18a8-4449-a4de-9a73bc042669",
             input: "num1 = \"999\", num2 = \"1\"",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "0a2d5b53-2ef0-466c-a2f6-7221a40fa9c8",
             input: "num1 = \"1234\", num2 = \"5678\"",
             expected: "6912", orderMatters: true),
            TestCaseData(id: "808f348a-5b7d-4c50-8d41-764d658ceda8",
             input: "num1 = \"12345\", num2 = \"67890\"",
             expected: "80235", orderMatters: true),
            TestCaseData(id: "3b019434-d647-4e9d-9719-63c42f873637",
             input: "num1 = \"11111\", num2 = \"11111\"",
             expected: "22222", orderMatters: true),
            TestCaseData(id: "bb8cd265-430d-47f1-a4f7-96ddcb83438a",
             input: "num1 = \"99999\", num2 = \"1\"",
             expected: "100000", orderMatters: true),
            TestCaseData(id: "8901899e-a03b-47f7-a562-cc0ac5ab274e",
             input: "num1 = \"10000\", num2 = \"10000\"",
             expected: "20000", orderMatters: true),
            TestCaseData(id: "8d2301c0-b46a-4a23-9a26-cd10afb1975c",
             input: "num1 = \"123\", num2 = \"456\"",
             expected: "579", orderMatters: true),
            TestCaseData(id: "6f6a74a2-4b9e-42e3-a6fc-cb6f64fb0ec0",
             input: "num1 = \"789\", num2 = \"123\"",
             expected: "912", orderMatters: true),
            TestCaseData(id: "0e52f029-c8f5-4715-b2de-c6d00c796019",
             input: "num1 = \"54321\", num2 = \"98765\"",
             expected: "153086", orderMatters: true),
            TestCaseData(id: "8a8b4e06-c192-4a7d-8f33-1021a8bb9f97",
             input: "num1 = \"98765\", num2 = \"54321\"",
             expected: "153086", orderMatters: true),
            TestCaseData(id: "5da9f7eb-6153-4cfa-b93d-2b798b028911",
             input: "num1 = \"1000000\", num2 = \"1000000\"",
             expected: "2000000", orderMatters: true),
            TestCaseData(id: "cf3e2eee-1939-40d7-b4a5-e517fa382ee5",
             input: "num1 = \"999999\", num2 = \"1\"",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "6d1fb8ba-a3fd-4697-bacc-19f44ea2d65f",
             input: "num1 = \"1234567\", num2 = \"7654321\"",
             expected: "8888888", orderMatters: true),
            TestCaseData(id: "08e43cd9-5c95-4a21-8239-58f2c151906d",
             input: "num1 = \"7654321\", num2 = \"1234567\"",
             expected: "8888888", orderMatters: true),
            TestCaseData(id: "d3ccf511-1ff0-4dd2-9ed6-bf5b8742d958",
             input: "num1 = \"10000000\", num2 = \"10000000\"",
             expected: "20000000", orderMatters: true),
            TestCaseData(id: "b1cbc00b-8cf4-49e2-8342-6e05cc6c70e2",
             input: "num1 = \"9999999\", num2 = \"1\"",
             expected: "10000000", orderMatters: true),
            TestCaseData(id: "87aea1ca-7554-48b4-ad0f-54e03086ec10",
             input: "num1 = \"12345678\", num2 = \"87654321\"",
             expected: "99999999", orderMatters: true),
            TestCaseData(id: "8ee24722-415e-4de1-ad02-e4ee7ee5b692",
             input: "num1 = \"87654321\", num2 = \"12345678\"",
             expected: "99999999", orderMatters: true),
            TestCaseData(id: "f6902902-e6c6-48ec-8734-e6eff5f4c061",
             input: "num1 = \"100000000\", num2 = \"100000000\"",
             expected: "200000000", orderMatters: true),
            TestCaseData(id: "76489f0b-dd73-4012-88bc-0cbf63c3c64c",
             input: "num1 = \"99999999\", num2 = \"1\"",
             expected: "100000000", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "add-strings"
            let topic = "math-geometry"
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

            let p_num1 = InputParser.parseString(params[0])
            guard p_num1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: num1 string too long (\(p_num1.count))"
                )
                return
            }
            let p_num2 = InputParser.parseString(params[1])
            guard p_num2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: num2 string too long (\(p_num2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_num1.count >= 1 && p_num1.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= num1.length, num2.length <= 104"
                )
                return
            }
            guard p_num2.count >= 1 && p_num2.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= num1.length, num2.length <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.addStrings(p_num1, p_num2)
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
