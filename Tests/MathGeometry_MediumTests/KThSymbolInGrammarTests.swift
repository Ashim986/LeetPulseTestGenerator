import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCKThSymbolInGrammar {
    private class Solution {
        func kthGrammar(_ n: Int, _ k: Int) -> Int { var k = k; var result = 0; for i in (0...n).reversed() { result = (result << 1) | (k & 1); k >>= 1 }; return result}
    }

    @Suite struct KThSymbolInGrammarTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "984d0186-3022-406f-8502-e87dd33ace8d",
             input: "n = 4, k = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b0a16c5c-3336-43b3-93d8-a3887de2b09f",
             input: "n = 3, k = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bc793f2a-69c0-43bc-9503-bcef50509d11",
             input: "n = 5, k = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7bcde3f4-25b6-4315-b311-d105ad00c9c0",
             input: "n = 2, k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d8651f78-afe2-4b1d-9dd4-89878fa85ede",
             input: "n = 7, k = 15",
             expected: "0", orderMatters: true),
            TestCaseData(id: "98238651-ec03-4f69-9eb6-0f4af51b4c36",
             input: "n = 9, k = 45",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6531a33e-6012-4320-a859-0f8fd19dc239",
             input: "n = 10, k = 60",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1619c9d8-0de7-4320-aebe-88ffb3b6c586",
             input: "n = 22, k = 240",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3e27274a-361f-426e-8b3f-a0ea1a0a4d39",
             input: "n = 25, k = 285",
             expected: "0", orderMatters: true),
            TestCaseData(id: "795a90eb-0f2b-4bd8-b1de-f7d75085a855",
             input: "n = 26, k = 300",
             expected: "1", orderMatters: true),
            TestCaseData(id: "aa36af88-c06b-4941-a62e-a1ee97a69727",
             input: "n = 29, k = 345",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9b791e98-ef74-4e90-8de7-c327d6eac92b",
             input: "n = 6, k = 20",
             expected: "0", orderMatters: true),
            TestCaseData(id: "87cfbe7d-05e5-463e-aaea-93512d17fc50",
             input: "n = 8, k = 30",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8ddd77bc-0205-417f-9d02-9559b5c88a1f",
             input: "n = 11, k = 75",
             expected: "1", orderMatters: true),
            TestCaseData(id: "97a561a3-f419-4fc9-9153-7346dbf95b25",
             input: "n = 12, k = 90",
             expected: "0", orderMatters: true),
            TestCaseData(id: "967358e8-9c0a-4ba4-b584-5e5e9f1345d7",
             input: "n = 13, k = 105",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b6b3a967-e3ee-4fdf-a41a-30869a98116c",
             input: "n = 14, k = 120",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c3495e51-8912-44e6-a51f-8b0ed4b87a97",
             input: "n = 15, k = 135",
             expected: "1", orderMatters: true),
            TestCaseData(id: "420d1ce4-9c84-4943-8643-8abbed4391b1",
             input: "n = 16, k = 150",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f43a0ab6-d9b9-46c9-a85c-361638013037",
             input: "n = 17, k = 165",
             expected: "1", orderMatters: true),
            TestCaseData(id: "142def13-9706-4d78-bb41-8904798d5b42",
             input: "n = 18, k = 180",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5463a5b4-95a4-4093-a058-fe04f55ba6fb",
             input: "n = 19, k = 195",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e0b667fc-9bf3-4b8b-9128-60df4efec816",
             input: "n = 20, k = 210",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bfada25e-2ba4-4fda-a9c5-d773d4610241",
             input: "n = 21, k = 225",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5fb06fde-a040-4b9d-bba9-a894ec498ad9",
             input: "n = 1, k = 1",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "k-th-symbol-in-grammar"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 30 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 30"
                )
                return
            }
            guard p_k >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= 2n - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.kthGrammar(p_n, p_k)
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
