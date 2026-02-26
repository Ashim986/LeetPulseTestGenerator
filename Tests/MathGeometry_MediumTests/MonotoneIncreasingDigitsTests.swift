import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMonotoneIncreasingDigits {
    private class Solution {
        func monotoneIncreasingDigits(_ N: Int) -> Int {
            var digits = [Int]()
            var n = N
            while n > 0 {
                digits.append(n%10)
                n /= 10
            }
            for i in (1..<digits.count).reversed() {
                if digits[i] < digits[i-1] {
                    digits[i-1] -= 1
                    for j in (i..<digits.count) {
                        digits[j] = 9
                    }
                }
            }
            var res = 0
            for digit in digits.reversed() {
                res = res*10 + digit
            }
            return res
        }
    }

    @Suite struct MonotoneIncreasingDigitsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3843e1a8-8e53-487b-bb7d-cac02f331c48",
             input: "N = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8ab80d47-c105-483d-9c29-07b9613f7975",
             input: "N = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e9b79e7e-f187-4554-8f0e-a5c1810860d3",
             input: "N = 9",
             expected: "9", orderMatters: true),
            TestCaseData(id: "31e35540-3def-4e0c-b9bd-0b2f35e495f9",
             input: "N = 100",
             expected: "99", orderMatters: true),
            TestCaseData(id: "98416fb3-246d-4c7f-9a5f-d65f60084a43",
             input: "N = 101",
             expected: "99", orderMatters: true),
            TestCaseData(id: "3e799b96-7edf-40c9-925b-f923a05da50a",
             input: "N = 1000",
             expected: "999", orderMatters: true),
            TestCaseData(id: "f9913751-1cc5-4a5c-b29e-b50062cd7fa6",
             input: "N = 10000",
             expected: "9999", orderMatters: true),
            TestCaseData(id: "b8700bae-bf21-49c8-be3a-863873e9cb68",
             input: "N = 11",
             expected: "11", orderMatters: true),
            TestCaseData(id: "7faf3f23-a5d4-4293-93e3-1cca38fc9612",
             input: "N = 12",
             expected: "12", orderMatters: true),
            TestCaseData(id: "0022fe15-d5c9-404a-a2f4-20e5ad3a73c4",
             input: "N = 21",
             expected: "19", orderMatters: true),
            TestCaseData(id: "4887e0a7-b6b7-4658-a72f-775c725e8ec1",
             input: "N = 111",
             expected: "111", orderMatters: true),
            TestCaseData(id: "47b0c19f-4f47-4d02-afd5-f32810123065",
             input: "N = 12345",
             expected: "12345", orderMatters: true),
            TestCaseData(id: "6594e4b9-df2b-42f6-941c-59ea949c6383",
             input: "N = 54321",
             expected: "49999", orderMatters: true),
            TestCaseData(id: "fa3119d0-6da6-4d39-a9fa-405f19ef784b",
             input: "N = 98765",
             expected: "89999", orderMatters: true),
            TestCaseData(id: "98908afc-d7b5-46ff-b3cf-80e29214bc6a",
             input: "N = 11111",
             expected: "11111", orderMatters: true),
            TestCaseData(id: "a46bee68-ad44-4770-8c51-6d0ccca923e8",
             input: "N = 22222",
             expected: "22222", orderMatters: true),
            TestCaseData(id: "22c419a9-f013-40e7-abdf-cf6287585054",
             input: "N = 33333",
             expected: "33333", orderMatters: true),
            TestCaseData(id: "c12a8b3e-ba57-400f-9d69-46f2edc2571a",
             input: "N = 44444",
             expected: "44444", orderMatters: true),
            TestCaseData(id: "c40b8095-9f9f-4b79-974c-a6f08da100ac",
             input: "N = 55555",
             expected: "55555", orderMatters: true),
            TestCaseData(id: "ff5fa56e-904e-4244-8d27-e8810c5144d6",
             input: "N = 66666",
             expected: "66666", orderMatters: true),
            TestCaseData(id: "bbe89615-2779-4a63-ac14-ef79be4a9fc4",
             input: "N = 77777",
             expected: "77777", orderMatters: true),
            TestCaseData(id: "e17a009b-d357-47b2-aaac-85ec108652cd",
             input: "N = 88888",
             expected: "88888", orderMatters: true),
            TestCaseData(id: "14de54a0-58ac-4379-a33e-4af0ae7809c3",
             input: "N = 99999",
             expected: "99999", orderMatters: true),
            TestCaseData(id: "c1820a89-26cd-42eb-8660-ddce805adae9",
             input: "N = 123456",
             expected: "123456", orderMatters: true),
            TestCaseData(id: "6146325a-8ef1-4fa6-9e19-c622c41477e8",
             input: "N = 654321",
             expected: "599999", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "monotone-increasing-digits"
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

            guard let p_N = InputParser.parseInt(params[0]) else {
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
            guard p_N >= 0 && p_N <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= n <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.monotoneIncreasingDigits(p_N)
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
