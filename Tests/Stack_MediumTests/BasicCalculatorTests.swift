import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBasicCalculator {
    private class Solution {
        func calculate(_ s: String) -> Int {
            var stack: [Int] = []
            var result = 0, num = 0, sign = 1
            for char in s {
                if char.isNumber {
                    num = num * 10 + Int(String(char)).unsafelyUnwrapped
                } else if char == "+" {
                    result += sign * num; num = 0; sign = 1
                } else if char == "-" {
                    result += sign * num; num = 0; sign = -1
                } else if char == "(" {
                    stack.append(result); stack.append(sign)
                    result = 0; sign = 1
                } else if char == ")" {
                    result += sign * num; num = 0
                    result *= stack.removeLast()
                    result += stack.removeLast()
                }
            }
            return result + sign * num
        }
    }

    @Suite struct BasicCalculatorTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c49f81de-5890-469f-8d4f-827bf7a70cbd",
             input: "s = \"1\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a77be8db-d90a-45b9-a5f6-f2e8ccec638c",
             input: "s = \"-1\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "b65633c3-2b46-4247-abb3-f0ebe1b4e8eb",
             input: "s = \"1+1\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6bb87534-72b8-4ef9-9895-bccde0e47bd9",
             input: "s = \"1-1\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c8bbef93-2bcf-49df-b9d8-9700a5e9a6e3",
             input: "s = \"(1)\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9ce68391-92c1-4fe2-b296-ccbf591de47b",
             input: "s = \"(1+1)\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9cf2f5e4-5678-48ea-a7ed-030c76b34a7d",
             input: "s = \"(1-1)\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "882be292-7229-49cc-b38a-2ceda9b668d8",
             input: "s = \"1+(1)\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a0a75839-d532-41a8-bf15-35fc845fe208",
             input: "s = \"1-(1)\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7d7d6d72-78ea-4cd4-9983-e9fd815ace60",
             input: "s = \"1+1+1\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "db07e5a2-db6b-4950-b390-4b619152037a",
             input: "s = \"1-1-1\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "d8cb77be-b754-4cf9-bcd5-02b4e7f55a80",
             input: "s = \"(1+1)+1\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c8d17b4c-cba8-47c1-83f9-ddd047834d33",
             input: "s = \"(1-1)-1\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "0d1ab90a-1499-4dfc-9026-5974f85f525f",
             input: "s = \"1+(1+1)\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "09128b24-7ea5-455f-855c-0862a40a542a",
             input: "s = \"1-(1+1)\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "bd1c6f56-f82c-4663-8457-2a68134c015a",
             input: "s = \"(1+1)+(1+1)\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e4a62a5b-458e-47c4-9a57-f7697915f02e",
             input: "s = \"(1-1)-(1-1)\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d26fb7f0-bfcd-4757-810e-45260a3d24ff",
             input: "s = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bb11fc0a-700a-4a9d-9dd0-b6f77f1d9e1a",
             input: "s = \"1+2+3+4+5+6+7+8+9+10\"",
             expected: "55", orderMatters: true),
            TestCaseData(id: "7caf586f-7afe-4380-a53e-31a1bcb4fbe1",
             input: "s = \"-1-2-3-4-5-6-7-8-9-10\"",
             expected: "-55", orderMatters: true),
            TestCaseData(id: "c6e2c8a4-cddd-4b8e-90c9-7980143fe773",
             input: "s = \"(1+2+3+4+5+6+7+8+9+10)\"",
             expected: "55", orderMatters: true),
            TestCaseData(id: "d74832b6-6510-4e08-aaba-1df0a53bbbbb",
             input: "s = \"-(1+2+3+4+5+6+7+8+9+10)\"",
             expected: "-55", orderMatters: true),
            TestCaseData(id: "76a245ab-7cd9-4a5a-ac8c-821880c55a56",
             input: "s = \"1+1+1+1+1+1+1+1+1+1\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "9479bc97-a5fd-4250-9aed-f20a37b1a423",
             input: "s = \"1-1+1-1+1-1+1-1+1-1+1\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dcea6fa2-ad90-4c95-9524-c38ba9721ec1",
             input: "s = \"(1+1+1+1+1+1+1+1+1+1)\"",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "basic-calculator"
            let topic = "stack"
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
            guard p_s.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 3 * 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.calculate(p_s)
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
