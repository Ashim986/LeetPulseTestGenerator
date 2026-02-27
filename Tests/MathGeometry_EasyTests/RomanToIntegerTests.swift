import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRomanToInteger {
    private class Solution {
        func romanToInt(_ s: String) -> Int {
            let values: [Character: Int] = [
                "I": 1, "V": 5, "X": 10, "L": 50,
                "C": 100, "D": 500, "M": 1000
            ]

            let chars = Array(s)
            var result = 0

            for i in 0..<chars.count {
                let curr = values[chars[i], default: 0]
                let next = i + 1 < chars.count ? values[chars[i + 1], default: 0] : 0

                if curr < next {
                    result -= curr
                } else {
                    result += curr
                }
            }

            return result
        }
    }

    @Suite struct RomanToIntegerTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "BEA3CD40-780A-44C8-A92D-2968D953003D",
             input: "I",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8F92FA86-AF39-49DC-8AB1-AD41CFD104F4",
             input: "III",
             expected: "3", orderMatters: true),
            TestCaseData(id: "F15157FF-D16C-4C46-BC17-5A9C2001D90D",
             input: "IV",
             expected: "4", orderMatters: true),
            TestCaseData(id: "E3DCBDEE-DA2F-4450-92AC-91B0EBAAF1B8",
             input: "LVIII",
             expected: "58", orderMatters: true),
            TestCaseData(id: "2923D1DE-62ED-4E17-946F-8B1DB60C5261",
             input: "MCMXCIV",
             expected: "1994", orderMatters: true),
            TestCaseData(id: "6284636F-EDA1-4738-8C94-CEFA4F8707B2",
             input: "CD",
             expected: "400", orderMatters: true),
            TestCaseData(id: "2FDD5B29-D0DE-44C1-82B9-A13BEBE9F700",
             input: "XL",
             expected: "40", orderMatters: true),
            TestCaseData(id: "35CDAE7C-C1CC-4834-91D3-13C58B47AFB0",
             input: "MMMXLV",
             expected: "3045", orderMatters: true),
            TestCaseData(id: "D7AC6190-ADB6-4430-8A08-D8F5D2CD4E82",
             input: "MMXXIII",
             expected: "2023", orderMatters: true),
            TestCaseData(id: "13792174-E23C-466A-AF95-13DA1733D06A",
             input: "V",
             expected: "5", orderMatters: true),
            TestCaseData(id: "B1458046-9CD9-43BF-A6F0-ACE745BFE30D",
             input: "X",
             expected: "10", orderMatters: true),
            TestCaseData(id: "77A7C360-0C96-485B-BA34-4AC919953573",
             input: "IX",
             expected: "9", orderMatters: true),
            TestCaseData(id: "368C6166-840A-4B10-A30D-2EE21BFA10DD",
             input: "MMXXII",
             expected: "2022", orderMatters: true),
            TestCaseData(id: "E4D86996-EFC6-49F3-8793-8D20E1397173",
             input: "\"III\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "20D44471-2575-4DA0-8F67-05B8BFF10A1B",
             input: "\"LVIII\"",
             expected: "58", orderMatters: true),
            TestCaseData(id: "6A3E8FE5-E9F2-42CC-80CB-CB04B81AE766",
             input: "\"MCMXCIV\"",
             expected: "1994", orderMatters: true),
            TestCaseData(id: "0FAFE58C-A794-4A1B-84F3-A6986B6CED7D",
             input: "\"CD\"",
             expected: "400", orderMatters: true),
            TestCaseData(id: "765d3530-7346-48e8-b4cf-a6b06a07d282",
             input: "s = \"I\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9aed97fc-b287-4f6f-b954-23e10fa7eb35",
             input: "s = \"V\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2eb29f6d-697b-4002-8f1c-3d60be7fc056",
             input: "s = \"X\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "b7e6fb6d-25ba-4726-813b-c3e465f71ba4",
             input: "s = \"L\"",
             expected: "50", orderMatters: true),
            TestCaseData(id: "378259fe-bf32-4a64-9e68-f333564be83e",
             input: "s = \"C\"",
             expected: "100", orderMatters: true),
            TestCaseData(id: "9b7c572d-df7a-4365-8e18-b1081afeb336",
             input: "s = \"D\"",
             expected: "500", orderMatters: true),
            TestCaseData(id: "98043ff8-9678-4338-a776-64dd9f377b2f",
             input: "s = \"M\"",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "4788bffe-7ae1-4147-85b6-028748f8ec63",
             input: "s = \"IV\"",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "roman-to-integer"
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
            guard p_s.count >= 1 && p_s.count <= 15 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 15"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.romanToInt(p_s)
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
