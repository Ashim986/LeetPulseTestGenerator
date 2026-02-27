import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDivideTwoIntegers {
    private class Solution {
        func divide(_ dividend: Int, _ divisor: Int) -> Int {
            var isNegative = (dividend < 0) != (divisor < 0)
            var absDividend = Int64(abs(dividend))
            var absDivisor = Int64(abs(divisor))
            var quotient = 0
            while absDividend >= absDivisor {
                var shift = 0
                while (absDivisor << shift) <= absDividend {
                    shift += 1
                }
                shift -= 1
                absDividend -= absDivisor << shift
                quotient += 1 << shift
            }
            if !isNegative && quotient > Int32.max {
                return Int(Int32.max)
            }
            if isNegative && quotient > Int32.max {
                return Int(Int32.min)
            }
            return isNegative ? -Int(quotient) : Int(quotient)
        }
    }

    @Suite struct DivideTwoIntegersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3C20B4BD-B673-4C4D-840F-AA05F11D2192",
             input: "0\n7",
             expected: "0", orderMatters: true),
            TestCaseData(id: "15AAEACF-EFB4-4B07-8E7D-EE9A7CBE3F95",
             input: "2, 5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "CD35A5FD-4DBB-4489-8EEF-461A345C329D",
             input: "0, -5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8D6ED979-6DC7-4606-A843-A9D7F2A44672",
             input: "0,7",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6ED53EB0-5FD8-447F-9A75-D2B37B93628F",
             input: "7,10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6F31E0BA-431C-4E18-9A7F-6809F76523EA",
             input: "[3,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2A846B71-FA74-4C4B-ADB2-12F95D5CF208",
             input: "10\n3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "BF297B86-A9A3-489A-BADB-6B8327DB2F8A",
             input: "-7\n2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "AF284EE0-B137-4ADF-AC31-D1FDF796B05E",
             input: "15\n-4",
             expected: "3", orderMatters: true),
            TestCaseData(id: "0A44B372-A332-4099-9916-B7A7331C2780",
             input: "-20\n-5",
             expected: "-4", orderMatters: true),
            TestCaseData(id: "856B0699-DBB1-4C32-923E-604F4A7FF73F",
             input: "2147483647\n1",
             expected: "-2147483647", orderMatters: true),
            TestCaseData(id: "A6BCC6BB-FA6C-4EE5-9CCA-5CAA421A1B66",
             input: "-2147483648\n-1",
             expected: "-2147483648", orderMatters: true),
            TestCaseData(id: "700CAA6F-402B-4E27-AE45-95D8DABA686D",
             input: "-2147483648\n2147483647",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9F4A021E-8668-432C-84BA-D7605A4208C4",
             input: "-2147483648\n2",
             expected: "1073741824", orderMatters: true),
            TestCaseData(id: "B64B5588-E8AC-4112-B2C0-105618E38A90",
             input: "2147483646\n-2",
             expected: "1073741823", orderMatters: true),
            TestCaseData(id: "461DE42F-42D1-40E3-A4B5-6AA89F3CC991",
             input: "10, 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "204E82ED-ABD9-4E82-8243-4395C91F714D",
             input: "-7, 2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "BEF06359-D685-4853-976F-94BA9815DCC2",
             input: "-10, -3",
             expected: "-3", orderMatters: true),
            TestCaseData(id: "8B192083-758C-4E15-8AAE-94FDE52509F8",
             input: "100, 1",
             expected: "-100", orderMatters: true),
            TestCaseData(id: "44FD5CFA-B8BE-407C-9B8C-075888CFD3B4",
             input: "50, -1",
             expected: "50", orderMatters: true),
            TestCaseData(id: "04547FDD-CE3A-4DF9-A519-3D48D88B200F",
             input: "100, 10",
             expected: "-10", orderMatters: true),
            TestCaseData(id: "A28F2844-3F7A-4768-94EA-EF6354CA04DE",
             input: "-2147483648, -1",
             expected: "-2147483648", orderMatters: true),
            TestCaseData(id: "147D175D-5211-49A2-A231-864A65483B61",
             input: "2147483647, 3",
             expected: "-715827882", orderMatters: true),
            TestCaseData(id: "B9019946-AAF9-4116-AD2C-68D52B0571E4",
             input: "-10,3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "776312C5-CAFF-4F45-B59C-8B7D26956BF8",
             input: "10,-3",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "divide-two-integers"
            let topic = "math-geometry"
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

            guard let p_dividend = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_divisor = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_dividend >= -231 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= dividend, divisor <= 231 - 1"
                )
                return
            }
            guard p_divisor >= -231 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= dividend, divisor <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.divide(p_dividend, p_divisor)
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
