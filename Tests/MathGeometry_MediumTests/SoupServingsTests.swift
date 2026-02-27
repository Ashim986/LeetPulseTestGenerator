import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSoupServings {
    private class Solution {
        func soupServings(_ n: Int) -> Double {
            if n >= 5500 { return 1.0 }
            var memo: [String: Double] = [:]
            func helper(_ a: Int, _ b: Int) -> Double {
                let key = "(a),(b)"
                if let value = memo[key] { return value }
                if a <= 0 && b > 0 { return 1.0 }
                if a <= 0 && b <= 0 { return 0.5 }
                if b <= 0 { return 0.0 }
                let result = min(1.0, 4 * helper(max(0, a - 4), b) + helper(a - 3, max(0, b - 1)) + helper(max(0, a - 2), max(0, b - 2)) + helper(max(0, a - 1), max(0, b - 3))) / 4
                memo[key] = result
                return result
            }
            return helper(n, n)
        }
    }

    @Suite struct SoupServingsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e5db6426-b5f0-47db-92a0-5ba9ad0f09d0",
             input: "n = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "d8ac694d-34d9-42d4-ba48-98a617eba23b",
             input: "n = 2",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "1857205b-b697-43b4-91ae-10610f003537",
             input: "n = 3",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "b561aba0-6625-4939-b134-75f1b71fd451",
             input: "n = 10",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "8d628f13-9009-4ee6-b5ab-943ad68eeb08",
             input: "n = 100",
             expected: "0.71875", orderMatters: true),
            TestCaseData(id: "84725559-2c75-42cc-b68a-e7ef9575d377",
             input: "n = 1000",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "a746e26c-7ffc-4efa-83fb-0204dd74d9da",
             input: "n = 0",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "07c28dd4-30a6-41f3-a220-6eda6d5e1f88",
             input: "n = -1",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "cd8d2ff3-3f98-4afb-ac2b-c73b93de72dc",
             input: "n = -10",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "ad546ec9-81b9-4631-9a36-af52c66fb5b6",
             input: "n = -100",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "84ed8cf4-1624-4411-af01-cc9a005364dd",
             input: "n = 25",
             expected: "0.9999999999999999", orderMatters: true),
            TestCaseData(id: "a280ccba-862a-4389-aaff-6912e4df11fe",
             input: "n = 49",
             expected: "0.9999999999999999", orderMatters: true),
            TestCaseData(id: "a6ec2da9-e2cf-465f-8708-c0f7ac77178a",
             input: "n = 75",
             expected: "0.9999999999999999", orderMatters: true),
            TestCaseData(id: "415f4a77-68b7-42b0-976e-c49204b18bec",
             input: "n = 101",
             expected: "0.9999999999999999", orderMatters: true),
            TestCaseData(id: "63674abe-8186-427b-8f1e-76186b3cf2e5",
             input: "n = 500",
             expected: "0.9999999999999999", orderMatters: true),
            TestCaseData(id: "b5173ac9-7de2-4c9d-a507-8dda0e6cfafe",
             input: "n = 10000",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "06850557-ef5b-410a-a48c-3bdba4338597",
             input: "n = 6",
             expected: "0.7578125", orderMatters: true),
            TestCaseData(id: "2fa846e5-13d2-4090-94ab-0d4699cf2c6b",
             input: "n = 7",
             expected: "0.74609375", orderMatters: true),
            TestCaseData(id: "b2b358ea-fc76-4b45-a9cd-ae02d48ad515",
             input: "n = 12",
             expected: "0.87890625", orderMatters: true),
            TestCaseData(id: "10945abb-abf3-4074-9d6c-a25d381ffcf6",
             input: "n = 15",
             expected: "0.890625", orderMatters: true),
            TestCaseData(id: "dd71587f-dd79-4452-bd52-0b1c858b5fbd",
             input: "n = 20",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "8b566b18-2b23-4e58-867a-0d2b182f0a3d",
             input: "n = 28",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "2f64421d-b8db-4575-9b15-21bcdcd439a9",
             input: "n = 32",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "e70cbabe-6315-4c65-9f53-483764d8eeb0",
             input: "n = 40",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "e8440250-20c6-4eb5-9b94-ea59727361ff",
             input: "n = 45",
             expected: "1.0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "soup-servings"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= n <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Double?
            let didCrash = withCrashGuard {
                resultHolder = solution.soupServings(p_n)
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
