import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCStringToIntegerAtoi {
    private class Solution {
        func myAtoi(_ s: String) -> Int {
            let chars = Array(s)
            var i = 0, sign = 1, result = 0
            while i < chars.count && chars[i] == " " { i += 1 }
            if i < chars.count && (chars[i] == "+" || chars[i] == "-") {
                sign = chars[i] == "-" ? -1 : 1
                i += 1
            }
            while i < chars.count && chars[i].isNumber {
                let digit = Int(String(chars[i])).unsafelyUnwrapped
                if result > (Int(Int32.max) - digit) / 10 {
                    return sign == 1 ? Int(Int32.max) : Int(Int32.min)
                }
                result = result * 10 + digit
                i += 1
            }
            return sign * result
        }
    }

    @Suite struct StringToIntegerAtoiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "57CE373C-0F2C-4BB5-AFE4-E9ACFB6D4880",
             input: "42",
             expected: "42", orderMatters: true),
            TestCaseData(id: "700E632F-316C-42CE-94CF-0502DB6F9D61",
             input: "   -42",
             expected: "-42", orderMatters: true),
            TestCaseData(id: "D95D85CF-1520-4F7A-BCF1-71A7918D60B5",
             input: "-91283472332",
             expected: "-2147483648", orderMatters: true),
            TestCaseData(id: "21000475-7A1A-43CE-ADA1-65301CB6BAED",
             input: "3.14159",
             expected: "3", orderMatters: true),
            TestCaseData(id: "DC9895DC-B934-4F76-B974-1B50C789B014",
             input: "+1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0241E71C-FEBF-48E6-B910-FF51E07DB362",
             input: "  0000000000012345678",
             expected: "12345678", orderMatters: true),
            TestCaseData(id: "3ddbb974-f3f5-4317-9a9c-9034805aa4bd",
             input: "s = \"42\"",
             expected: "42", orderMatters: true),
            TestCaseData(id: "ddf899ac-7bfb-414a-884e-681690cb8ef3",
             input: "s = \"   42\"",
             expected: "42", orderMatters: true),
            TestCaseData(id: "93d89bd5-64f8-4f41-bbcc-1a76c30379ba",
             input: "s = \"-42\"",
             expected: "-42", orderMatters: true),
            TestCaseData(id: "e0c6dd3d-8637-40f2-afd5-52b2c3e26e60",
             input: "s = \"4193 with words\"",
             expected: "4193", orderMatters: true),
            TestCaseData(id: "54a0818a-4691-494e-8473-04e8b5c11b58",
             input: "s = \"words and 987\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7044a849-d3bb-4235-834c-fd1ba947bf00",
             input: "s = \"-91283472332\"",
             expected: "-2147483648", orderMatters: true),
            TestCaseData(id: "18974538-2de4-434b-a6ad-25d60c9c9796",
             input: "s = \"3.14159\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "8cc9df6f-3656-4ac9-b7ae-05861c32cd2f",
             input: "s = \"  3.14159\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "60ab4407-aaae-4d4a-9d2d-8e3058bdfa8c",
             input: "s = \"-3.14159\"",
             expected: "-3", orderMatters: true),
            TestCaseData(id: "17048a3a-0614-428a-af73-f24629b7c10c",
             input: "s = \"  -3.14159\"",
             expected: "-3", orderMatters: true),
            TestCaseData(id: "3fceba7f-b645-44d7-87b0-2d883eedc8c6",
             input: "s = \"0\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "522353b7-5220-4a15-a990-c053a660a875",
             input: "s = \" 0\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c86ee0fd-dae1-4c43-8d61-d9be7b70a8bd",
             input: "s = \"-0\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "46e92891-1119-4e27-954d-6af988557403",
             input: "s = \"  -0\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8d41c762-3d18-42ba-81d9-04d4d62f0d8a",
             input: "s = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b88d9a8f-5772-462a-a7a7-c38b911fb19a",
             input: "s = \" \"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "780c014f-1945-4356-9210-4535c6c3e55a",
             input: "s = \"2147483647\"",
             expected: "2147483647", orderMatters: true),
            TestCaseData(id: "d4c773f8-ce31-4a36-af80-69532999a272",
             input: "s = \"-2147483648\"",
             expected: "-2147483648", orderMatters: true),
            TestCaseData(id: "454609ee-d562-4a80-813e-d125511ec890",
             input: "s = \"12345678901234567890\"",
             expected: "2147483647", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "string-to-integer-atoi"
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
            guard p_s.count >= 0 && p_s.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= s.length <= 200"
                )
                return
            }

            let solution = Solution()
            let result = solution.myAtoi(p_s)
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
