import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBase7 {
    private class Solution {
        func convertToBase7(_ num: Int) -> String {
            let sign = num < 0 ? "-" : ""
            var num = abs(num)
            var result = ""
            while num > 0 {
                result = String(num % 7) + result
                num /= 7
            }
            return sign + (result.isEmpty ? "0" : result)
        }
    }

    @Suite struct Base7Tests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8cbb999f-1f96-44b0-97b5-b84e0191e107",
             input: "num = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b9332b96-a70b-44db-9c9e-5eec7992e96e",
             input: "num = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ab3d38c1-98b7-44f7-970c-fdd1280d8f3d",
             input: "num = -1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "a6c71e66-3183-4d1f-97b8-979e3932ca90",
             input: "num = 7",
             expected: "10", orderMatters: true),
            TestCaseData(id: "6fd61dd8-83ad-45c4-9249-8abf60b4ee35",
             input: "num = 10",
             expected: "13", orderMatters: true),
            TestCaseData(id: "1020ee78-2497-4a92-ae17-26dca2b551cd",
             input: "num = 1000",
             expected: "2626", orderMatters: true),
            TestCaseData(id: "03f90e02-fbf3-4a01-ba41-fcb737e66bb5",
             input: "num = -1000",
             expected: "-2626", orderMatters: true),
            TestCaseData(id: "974e8684-ffbb-486d-9bfd-c116d9088a5f",
             input: "num = 12345",
             expected: "50604", orderMatters: true),
            TestCaseData(id: "9c08a82f-52ae-46a4-9e40-486716c6284c",
             input: "num = -12345",
             expected: "-50604", orderMatters: true),
            TestCaseData(id: "3aa0ad29-0c1b-4b76-93aa-824d093f874f",
             input: "num = 123456789",
             expected: "3020341635", orderMatters: true),
            TestCaseData(id: "3b1bff81-ffe2-4e50-816a-527484a6cd86",
             input: "num = -123456789",
             expected: "-3020341605", orderMatters: true),
            TestCaseData(id: "153930fb-4f09-4535-8e4c-3482d9985608",
             input: "num = 2147483647",
             expected: "104102605064", orderMatters: true),
            TestCaseData(id: "dcadd334-b1ff-4bb5-a388-233a98f1e013",
             input: "num = -2147483648",
             expected: "-104102605065", orderMatters: true),
            TestCaseData(id: "6c12613d-cb0a-45ad-9525-d6d079527ad2",
             input: "num = 1000000000",
             expected: "33500301064", orderMatters: true),
            TestCaseData(id: "c5cc9aa9-0189-44d3-9188-fd97166b52a3",
             input: "num = -1000000000",
             expected: "-33500301064", orderMatters: true),
            TestCaseData(id: "2697e32e-1e84-4e43-9880-c587c59cac9b",
             input: "num = 123",
             expected: "234", orderMatters: true),
            TestCaseData(id: "8b54fedc-c300-47fe-8de3-6dd2e62271c2",
             input: "num = -123",
             expected: "-234", orderMatters: true),
            TestCaseData(id: "b2b832a6-69bd-481c-980d-10035b853305",
             input: "num = 456",
             expected: "1221", orderMatters: true),
            TestCaseData(id: "e20657e8-eea2-457b-9cfe-6f4f87510af9",
             input: "num = -456",
             expected: "-1221", orderMatters: true),
            TestCaseData(id: "1b164ab1-8955-4f94-8311-29f7bab956ce",
             input: "num = 789",
             expected: "2205", orderMatters: true),
            TestCaseData(id: "0f9680b6-6aa8-447e-8bb1-1011d5afb7f7",
             input: "num = -789",
             expected: "-2205", orderMatters: true),
            TestCaseData(id: "03e84e85-e332-4aa5-b35f-0bf72083355a",
             input: "num = 101",
             expected: "203", orderMatters: true),
            TestCaseData(id: "9519b28a-cec3-471e-aa6f-c58c47830959",
             input: "num = -101",
             expected: "-203", orderMatters: true),
            TestCaseData(id: "4f7e7648-febe-43ef-93be-7c2b65db97d9",
             input: "num = 202",
             expected: "406", orderMatters: true),
            TestCaseData(id: "43acd9d9-beba-4155-89a5-1dc13904c888",
             input: "num = -202",
             expected: "-406", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "base-7"
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
            guard p_num >= -107 && p_num <= 107 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -107 <= num <= 107"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.convertToBase7(p_num)
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
