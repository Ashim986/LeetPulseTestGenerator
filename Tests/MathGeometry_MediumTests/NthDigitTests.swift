import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNthDigit {
    private class Solution {
        func findNthDigit(_ n: Int) -> Int {
            var n = n
            var length = 1
            var count = 9
            var start = 1
            while n > length * count {
                n -= length * count
                length += 1
                count *= 10
                start *= 10
            }
            start += (n - 1) / length
            let str = String(start)
            let index = str.index(str.startIndex, offsetBy: (n - 1) % length)
            return Int(String(str[index])) ?? 0
        }
    }

    @Suite struct NthDigitTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1b95b7c4-e321-43e5-a2b8-852d896151ac",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "848fcbb3-5ebe-4058-9867-e26ea71bef9e",
             input: "n = 9",
             expected: "9", orderMatters: true),
            TestCaseData(id: "66990c98-577a-4719-8faa-9b82e3285891",
             input: "n = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1890aba9-c614-4855-b523-040349068737",
             input: "n = 12",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f6186fd4-f65d-4c52-bf14-bfcbc2ed9c3d",
             input: "n = 13",
             expected: "1", orderMatters: true),
            TestCaseData(id: "def9075a-b4fa-4764-bc6c-716683d3e245",
             input: "n = 100",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2351cc9d-3099-4463-a242-732b4e4f80fd",
             input: "n = 10000",
             expected: "7", orderMatters: true),
            TestCaseData(id: "648a8bbd-64c3-4734-946f-4bcaa2f292f0",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e4a93b3f-f70c-4ab1-95f9-ca03a6d6044b",
             input: "n = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c0488b50-b0c1-490c-b19c-cb1c8ed77167",
             input: "n = -10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2aa11208-8fd3-4647-915d-e87e2f7f3443",
             input: "n = -100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "131d301e-a7ac-499b-8c6f-a1cef7313806",
             input: "n = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7900ad6f-f0b8-4d17-9ec4-10aeb925186b",
             input: "n = 4",
             expected: "4", orderMatters: true),
            TestCaseData(id: "fb9557d9-02e4-4aa6-8087-4a76b8d9e2e3",
             input: "n = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "95d1feba-554a-45eb-97cc-fbfc2a5bc860",
             input: "n = 6",
             expected: "6", orderMatters: true),
            TestCaseData(id: "1976b00b-342c-45a9-a6d4-c106c86a5570",
             input: "n = 7",
             expected: "7", orderMatters: true),
            TestCaseData(id: "fba0ab08-d22d-436c-8521-6415210f51f4",
             input: "n = 8",
             expected: "8", orderMatters: true),
            TestCaseData(id: "c3abe1fe-a8c4-449d-a30e-5441bddfdec9",
             input: "n = 999999999",
             expected: "9", orderMatters: true),
            TestCaseData(id: "839a8d87-a987-4778-b5bd-d7e9dd034e61",
             input: "n = 444444444",
             expected: "4", orderMatters: true),
            TestCaseData(id: "eaf1a456-e35c-413d-9707-39ab622525b6",
             input: "n = 20",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e7eeda4e-05be-4dc2-a402-dfcea0f9dfbd",
             input: "n = 500",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3d4d464a-4cd0-4c00-87e0-1de01eac8b29",
             input: "n = 1000",
             expected: "3", orderMatters: true),
            TestCaseData(id: "dec9dda8-1b92-4c87-be7d-d4c8fc3c9acb",
             input: "n = 1889",
             expected: "6", orderMatters: true),
            TestCaseData(id: "91b32794-2e76-493e-9af6-d3615ed1961c",
             input: "n = 2000",
             expected: "7", orderMatters: true),
            TestCaseData(id: "33a1b46a-240a-44fc-b41e-adb7a112d0bf",
             input: "n = 1000000000",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "nth-digit"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
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
            guard p_n >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.findNthDigit(p_n)
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
