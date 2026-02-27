import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUniquePaths {
    private class Solution {
        func uniquePaths(_ m: Int, _ n: Int) -> Int {
            var dp = [Int](repeating: 1, count: n)

            for _ in 1..<m {
                for j in 1..<n {
                    dp[j] += dp[j-1]
                }
            }

            return dp[n-1]
        }
    }

    @Suite struct UniquePathsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "72c22831-1943-4575-805f-2cf9ec1a5ca0",
             input: "m = 1, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0b137f87-c24e-472c-80b4-c7519ff16a8b",
             input: "m = 2, n = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b04b4e57-0faf-417a-9040-83e18a140159",
             input: "m = 3, n = 3",
             expected: "6", orderMatters: true),
            TestCaseData(id: "801794c6-8def-4da1-ab30-7549602384e1",
             input: "m = 4, n = 4",
             expected: "20", orderMatters: true),
            TestCaseData(id: "aab02633-1406-4f5b-b81b-c3f80bd6dc09",
             input: "m = 5, n = 5",
             expected: "70", orderMatters: true),
            TestCaseData(id: "9c66d06f-53ff-43b5-8246-7ddf16c9a4ce",
             input: "m = 6, n = 6",
             expected: "252", orderMatters: true),
            TestCaseData(id: "3d24c4e0-a596-4db7-9516-d2e56534a6c8",
             input: "m = 7, n = 7",
             expected: "924", orderMatters: true),
            TestCaseData(id: "20f8095a-b378-4c65-81a2-e92934dc473c",
             input: "m = 8, n = 8",
             expected: "3432", orderMatters: true),
            TestCaseData(id: "34f644b9-e7a6-49e2-b24b-b55098edde53",
             input: "m = 9, n = 9",
             expected: "12870", orderMatters: true),
            TestCaseData(id: "6843f88a-2360-4be1-b257-b251cde1204d",
             input: "m = 10, n = 10",
             expected: "48620", orderMatters: true),
            TestCaseData(id: "cb763445-93aa-4098-bdea-f723e7de20d0",
             input: "m = 1, n = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9c822b8a-d779-427f-b174-4bd0e588f954",
             input: "m = 2, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e3f03724-792c-4238-b4e0-07d6e56a73d4",
             input: "m = 1, n = 3",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6f439032-10e3-4253-be6f-134ed6625637",
             input: "m = 3, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f089a684-6e5a-476e-8232-ac431e4a3caa",
             input: "m = 1, n = 4",
             expected: "1", orderMatters: true),
            TestCaseData(id: "17c4ea97-e75d-40d0-acec-f76bb97accbb",
             input: "m = 4, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9406cd3b-73d7-4d00-8615-268bac34f53d",
             input: "m = 1, n = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2b2b8e93-4bac-46d8-8573-bf2c835addbf",
             input: "m = 5, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cac8bf18-7add-46ec-bdae-d912411262e8",
             input: "m = 1, n = 6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cb22a87f-657f-44c6-9cd8-c9cfab48daef",
             input: "m = 6, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "00f59d9e-8021-4204-a042-112725b77f38",
             input: "m = 1, n = 7",
             expected: "1", orderMatters: true),
            TestCaseData(id: "097669ee-171c-4cb0-80ee-6281b742645f",
             input: "m = 7, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "313ffd78-2fc7-407e-9c26-abcafd428c36",
             input: "m = 1, n = 8",
             expected: "1", orderMatters: true),
            TestCaseData(id: "415ac1bd-699b-478b-984b-5c9cca224fc0",
             input: "m = 8, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c51da7de-03c8-432c-a375-803859ed854c",
             input: "m = 1, n = 9",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "unique-paths"
            let topic = "dynamic-programming"
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

            guard let p_m = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
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
            guard p_m >= 1 && p_m <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 100"
                )
                return
            }
            guard p_n >= 1 && p_n <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.uniquePaths(p_m, p_n)
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
