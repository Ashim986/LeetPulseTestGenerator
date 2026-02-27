import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPowxN {
    private class Solution {
        func myPow(_ x: Double, _ n: Int) -> Double {
            if n == 0 {
                return 1
            }
            if n < 0 {
                return 1 / myPow(x, -n)
            }
            if n % 2 == 0 {
                return myPow(x * x, n / 2)
            }
            return x * myPow(x * x, (n - 1) / 2)
        }
    }

    @Suite struct PowxNTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "20006156-14bc-4530-8952-b351bb40fec2",
             input: "x = 2.1, n = 3",
             expected: "9.26100", orderMatters: true),
            TestCaseData(id: "0e949a9d-5841-4a83-bbaa-99c9ca731685",
             input: "x = 2.0, n = 0",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "8d774164-6ce4-477c-9a31-6a4529245153",
             input: "x = 2.0, n = 1",
             expected: "2.0", orderMatters: true),
            TestCaseData(id: "e61eb79c-090a-4265-8f23-860cb176fc06",
             input: "x = 1.0, n = 10",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "cfecf3ed-114f-417f-92dd-0891ae0815a7",
             input: "x = 0.5, n = 2",
             expected: "0.25", orderMatters: true),
            TestCaseData(id: "75afe9e2-3453-4c1d-bb1f-362927323aa9",
             input: "x = 0.5, n = -2",
             expected: "4.0", orderMatters: true),
            TestCaseData(id: "941829f9-8a30-4db3-ae8a-006c603297fc",
             input: "x = -2.0, n = 3",
             expected: "-8.0", orderMatters: true),
            TestCaseData(id: "1da9a47c-9aec-421c-af8e-12a88f4a1512",
             input: "x = -2.0, n = -3",
             expected: "-0.125", orderMatters: true),
            TestCaseData(id: "9b4e62de-b86a-448c-9e33-0392221f00f8",
             input: "x = 2.0, n = 10",
             expected: "1024.00000", orderMatters: true),
            TestCaseData(id: "69706274-22ca-41ee-8118-8d64bf361a1b",
             input: "x = 2.0, n = -10",
             expected: "0.0009765625", orderMatters: true),
            TestCaseData(id: "2fba6eeb-d97b-4b33-b62a-657c3d266724",
             input: "x = 0.0, n = 10",
             expected: "0.0", orderMatters: true),
            TestCaseData(id: "0aadd0a6-377a-4552-a016-e07283fa47f5",
             input: "x = 1.0, n = -10",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "33eb755a-013b-4f17-a8bf-fd4a24676a92",
             input: "x = -1.0, n = 10",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "50a332c7-42d3-4716-8a57-cf6be5826ffc",
             input: "x = -1.0, n = -10",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "13c65033-6da3-424a-9258-8d1f04460985",
             input: "x = 2.0, n = 20",
             expected: "1048576.0", orderMatters: true),
            TestCaseData(id: "9ef0da43-c691-4494-b113-b6d534ef9c41",
             input: "x = 0.5, n = 10",
             expected: "0.0009765625", orderMatters: true),
            TestCaseData(id: "1b9d28eb-445d-47e3-aee4-d6efeb59b422",
             input: "x = 0.5, n = -10",
             expected: "1024.0", orderMatters: true),
            TestCaseData(id: "c9736fad-e3e1-437a-ad5e-43b0eaa134fa",
             input: "x = -2.0, n = 10",
             expected: "1024.0", orderMatters: true),
            TestCaseData(id: "db08368e-ad94-4024-b5e3-c28d4d07a729",
             input: "x = -2.0, n = -10",
             expected: "0.0009765625", orderMatters: true),
            TestCaseData(id: "c9173d74-8108-4472-bad0-9fa255cc8245",
             input: "x = 2.5, n = 2",
             expected: "6.25", orderMatters: true),
            TestCaseData(id: "b7930a2c-78d7-4af4-a29e-d238a6ccb51b",
             input: "x = 2.5, n = -2",
             expected: "0.16", orderMatters: true),
            TestCaseData(id: "3dd65745-cbf4-4d37-9f6f-dc63df36b129",
             input: "x = 0.1, n = 2",
             expected: "0.01", orderMatters: true),
            TestCaseData(id: "3ebd04bf-1a07-4d76-9e9e-5f573d7ebe99",
             input: "x = 0.1, n = -2",
             expected: "100.0", orderMatters: true),
            TestCaseData(id: "0ff3d791-70bc-4c67-b7cf-64c528d238e8",
             input: "x = 10.0, n = 2",
             expected: "100.0", orderMatters: true),
            TestCaseData(id: "d1d371e5-1d3b-4ee6-8dfe-61b8aee34ecb",
             input: "x = 10.0, n = -2",
             expected: "0.01", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "powx-n"
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

            guard let p_x = InputParser.parseDouble(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Double"
                )
                return
            }
            guard let p_n = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= -231 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= n <= 231-1"
                )
                return
            }
            guard p_n >= -104 && p_n <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= xn <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Double?
            let didCrash = withCrashGuard {
                resultHolder = solution.myPow(p_x, p_n)
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

            // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
            // Treats -0 and 0 as equal; handles trailing zero normalization
            let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
            let matches = abs(result - expectedVal) < 1e-5
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
