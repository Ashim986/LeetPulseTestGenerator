import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPalindromeNumber {
    private class Solution {
        func isPalindrome(_ x: Int) -> Bool {
            // Negative numbers and numbers ending in 0 (except 0) aren't palindromes
            if x < 0 || (x % 10 == 0 && x != 0) {
                return false
            }

            var num = x
            var reversed = 0

            // Reverse half of the number
            while num > reversed {
                reversed = reversed * 10 + num % 10
                num /= 10
            }

            // For even length: num == reversed
            // For odd length: num == reversed / 10 (skip middle digit)
            return num == reversed || num == reversed / 10
        }
    }

    @Suite struct PalindromeNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "145A1B83-7235-4464-B8E6-ACE0206F1905",
             input: "121",
             expected: "true", orderMatters: true),
            TestCaseData(id: "D5955815-5290-472C-8CB3-8D64A622A356",
             input: "10",
             expected: "false", orderMatters: true),
            TestCaseData(id: "A7275416-B9C3-4D24-AE68-F607E70919EB",
             input: "0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9951EB20-C208-4537-87D1-5D95803CC2C8",
             input: "1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "88180000-0122-438D-A2A1-0F4B3DCA89A4",
             input: "12321",
             expected: "true", orderMatters: true),
            TestCaseData(id: "A957C50E-FAD3-485D-ACD1-75B54F736C10",
             input: "12345",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5EAA7374-7B0D-4E69-AD30-1D2D001895C8",
             input: "11",
             expected: "true", orderMatters: true),
            TestCaseData(id: "07381A21-47A4-4452-BFB9-874E9C9B16C1",
             input: "-121",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5B7C4254-8783-4EB0-BBB0-3D3ED879F05A",
             input: "123",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b888e0e1-4af5-4121-9dea-c3ce4898e65b",
             input: "x = 0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "683b7181-061a-4b7e-a546-14694713fec3",
             input: "x = -1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "051afea7-0269-4f2e-b73f-802c4fdb8561",
             input: "x = 12321",
             expected: "true", orderMatters: true),
            TestCaseData(id: "300be78a-c821-4851-9b74-a4c108d03969",
             input: "x = 123456",
             expected: "false", orderMatters: true),
            TestCaseData(id: "027c45e8-3fba-45e4-8ace-f713d0a7cf2f",
             input: "x = 123454321",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2c9b8354-9ed7-4c80-918b-e3fa9ec1680e",
             input: "x = 10001",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9f4759c7-e278-4b26-8529-0ad0c4e9ccca",
             input: "x = -12321",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7c5a4fd6-e4b4-4aa4-b4fb-e1368180df50",
             input: "x = 1234321",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ddbae6cb-9327-4f28-b751-ee46ef9adda5",
             input: "x = 987654321",
             expected: "false", orderMatters: true),
            TestCaseData(id: "95e543b0-cb84-402b-9061-a1cf6be32360",
             input: "x = 1234554321",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d87f5f7e-f270-448f-83ad-2e242a41d61a",
             input: "x = 123",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ea82db77-c7c1-4a90-99fc-a896ae11154a",
             input: "x = 123456789",
             expected: "false", orderMatters: true),
            TestCaseData(id: "87e5e499-8820-44fa-9fd9-9b0bb868f618",
             input: "x = 9876543210",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1770017d-24a1-4c3f-ae85-67204b767abb",
             input: "x = 12345543210",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8f35b458-1b2b-4906-9181-3dc84ca4ca3e",
             input: "x = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "dc252c46-0a20-4d03-b1d2-fa797659b532",
             input: "x = 11",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "palindrome-number"
            let topic = "math-geometry"
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

            guard let p_x = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_x >= -231 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= x <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.isPalindrome(p_x)
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
