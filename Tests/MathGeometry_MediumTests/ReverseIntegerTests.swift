import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseInteger {
    private class Solution {
        func reverse(_ x: Int) -> Int {
            var x = x, result = 0
            while x != 0 {
                let digit = x % 10
                x /= 10
                if result > Int32.max / 10 || result < Int32.min / 10 { return 0 }
                result = result * 10 + digit
            }
            return result
        }
    }

    @Suite struct ReverseIntegerTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5041920F-E7B9-4B2D-86B0-C9CC323BB313",
             input: "123",
             expected: "321", orderMatters: true),
            TestCaseData(id: "26A734CD-922C-4689-B5F3-9498233DFAC0",
             input: "-123",
             expected: "-321", orderMatters: true),
            TestCaseData(id: "322DF235-2F62-4739-A456-6E980043EA78",
             input: "120",
             expected: "21", orderMatters: true),
            TestCaseData(id: "C889B637-6FEC-422D-BE00-A06D10364AFC",
             input: "0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2D2E6375-A3D3-45E5-B1EB-6DFFF46C1BD3",
             input: "1534236469",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3F5767B0-262C-4C52-ADBE-2CB71DBD8B90",
             input: "-2147483648",
             expected: "0", orderMatters: true),
            TestCaseData(id: "03D5C0E1-DBE8-4831-98D0-AE8893AED830",
             input: "1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3F41A107-DB60-4687-AB27-0A5585682745",
             input: "-1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "8c34a5b9-a7c3-4a90-b22d-c026182bf05f",
             input: "x = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5471bab7-7b60-4edd-881d-c91307e9df0c",
             input: "x = -1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "7f3bfe6f-7866-46dd-91e5-305422039bfa",
             input: "x = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a7d6a435-7852-4029-bcbd-f7e2e3bfd62f",
             input: "x = 100",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d40e92f8-5025-45eb-8d5a-a171ceb430cb",
             input: "x = 12345",
             expected: "54321", orderMatters: true),
            TestCaseData(id: "0c7304f7-d88b-41d5-bace-3a3be1259954",
             input: "x = -123",
             expected: "-321", orderMatters: true),
            TestCaseData(id: "ee2d9572-03b9-4858-bcfd-42e949a0517c",
             input: "x = 120",
             expected: "21", orderMatters: true),
            TestCaseData(id: "03024307-99e3-484e-8fff-f863dccb5f75",
             input: "x = 1534236469",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8daf4a5c-60bb-4032-9859-2a4902a01466",
             input: "x = -2147483648",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f2175d4d-8b63-49d2-abf8-797248641507",
             input: "x = 2147483647",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6dc3c82f-ca54-4417-b5fe-3b645deb1685",
             input: "x = 11111",
             expected: "11111", orderMatters: true),
            TestCaseData(id: "b70c8935-1b30-4d3b-8de2-2e71000eca58",
             input: "x = 22222",
             expected: "22222", orderMatters: true),
            TestCaseData(id: "77795910-348b-408d-8f35-b4f6dda6b3a1",
             input: "x = 33333",
             expected: "33333", orderMatters: true),
            TestCaseData(id: "5a953d00-0ca8-4d4f-a157-83621c322ed7",
             input: "x = 44444",
             expected: "44444", orderMatters: true),
            TestCaseData(id: "42fee6ba-6ac7-433e-9c8d-2d52596a2923",
             input: "x = 55555",
             expected: "55555", orderMatters: true),
            TestCaseData(id: "9b5d68bf-79f1-49a8-b085-36d67ba65aea",
             input: "x = 66666",
             expected: "66666", orderMatters: true),
            TestCaseData(id: "90451ae0-b00a-4629-95d9-98755af35993",
             input: "x = 77777",
             expected: "77777", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-integer"
            let topic = "math-geometry"
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

            guard let p_x = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_x >= -231 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= x <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.reverse(p_x)
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
