import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCIntegerToRoman {
    private class Solution {
        func intToRoman(_ num: Int) -> String {
            let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
            let romanNumerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
            var result = ""
            var number = num
            for i in 0..<values.count {
                while number >= values[i] {
                    result += romanNumerals[i]
                    number -= values[i]
                }
            }
            return result
        }
    }

    @Suite struct IntegerToRomanTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "216E1C2A-FB29-45F1-9BCD-DF3B3EFCE34A",
             input: "3",
             expected: "III", orderMatters: true),
            TestCaseData(id: "054A3F05-507A-4868-81B1-86D9FB8F9CFF",
             input: "4",
             expected: "IV", orderMatters: true),
            TestCaseData(id: "F6D3FB5F-D68D-4890-A86B-BF0A8485307B",
             input: "9",
             expected: "IX", orderMatters: true),
            TestCaseData(id: "DBC283F4-0058-40FE-B1A2-B5E0A0180737",
             input: "58",
             expected: "LVIII", orderMatters: true),
            TestCaseData(id: "DDE89090-C93F-4425-A146-D717F24A4190",
             input: "1994",
             expected: "MCMXCIV", orderMatters: true),
            TestCaseData(id: "8FF2EEBB-8EB0-41F5-A270-BFEFD8256CA0",
             input: "1",
             expected: "I", orderMatters: true),
            TestCaseData(id: "89FFE6A6-F742-4B79-9412-A4FB5F5E6797",
             input: "50",
             expected: "L", orderMatters: true),
            TestCaseData(id: "6B16E900-C6AD-429D-B208-977F616ED72B",
             input: "100",
             expected: "C", orderMatters: true),
            TestCaseData(id: "C0F65547-4D03-41E2-B2A0-1E8E1C4007A8",
             input: "3999",
             expected: "MMMCMXCIX", orderMatters: true),
            TestCaseData(id: "16A303D6-BE4C-4743-8453-5C1E16F3AFE5",
             input: "10",
             expected: "X", orderMatters: true),
            TestCaseData(id: "9A861538-1DDD-45C4-8A26-675953C87E2C",
             input: "40",
             expected: "XL", orderMatters: true),
            TestCaseData(id: "0ead8ee0-be5c-41ce-96bf-68daa5005891",
             input: "num = 1",
             expected: "I", orderMatters: true),
            TestCaseData(id: "a5fcd479-2df9-4c8b-907d-f0d75796b359",
             input: "num = 5",
             expected: "V", orderMatters: true),
            TestCaseData(id: "19831d2e-c379-4fd5-a663-0d4a69285833",
             input: "num = 10",
             expected: "X", orderMatters: true),
            TestCaseData(id: "97eae044-0421-44dc-9b42-ad1cb5491726",
             input: "num = 50",
             expected: "L", orderMatters: true),
            TestCaseData(id: "96d292e7-e041-493f-b514-738f0201b446",
             input: "num = 100",
             expected: "C", orderMatters: true),
            TestCaseData(id: "1e886d6d-a686-4ad8-8ac5-f5f8f56f57fe",
             input: "num = 500",
             expected: "D", orderMatters: true),
            TestCaseData(id: "752b9aa1-b54b-40c4-9efb-9983de79e981",
             input: "num = 1000",
             expected: "M", orderMatters: true),
            TestCaseData(id: "10eb98f0-6f7c-4561-bbda-442af55cdfae",
             input: "num = 6",
             expected: "VI", orderMatters: true),
            TestCaseData(id: "074c7b1c-fcb2-411c-a1a5-664c6aaa770b",
             input: "num = 11",
             expected: "XI", orderMatters: true),
            TestCaseData(id: "ed8859b8-7b67-4cb8-904a-65c077882d06",
             input: "num = 12",
             expected: "XII", orderMatters: true),
            TestCaseData(id: "6d9adcd8-3a4c-4ea3-9dab-3b506fcb5b2d",
             input: "num = 15",
             expected: "XV", orderMatters: true),
            TestCaseData(id: "fa5bf122-e510-4493-997a-d625973c589f",
             input: "num = 20",
             expected: "XX", orderMatters: true),
            TestCaseData(id: "27aa1579-c0a6-4342-84fd-87684981ed32",
             input: "num = 30",
             expected: "XXX", orderMatters: true),
            TestCaseData(id: "d5c50b22-3aae-483b-9ea1-6c4aa12f3c6d",
             input: "num = 40",
             expected: "XL", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "integer-to-roman"
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

            guard let p_num = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_num >= 1 && p_num <= 3999 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= num <= 3999"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.intToRoman(p_num)
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
