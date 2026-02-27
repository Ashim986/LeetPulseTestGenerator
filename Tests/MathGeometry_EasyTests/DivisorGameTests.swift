import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDivisorGame {
    private class Solution {
        func divisorGame(_ N: Int) -> Bool {
            var dp = [Bool](repeating: false, count: N + 1)
            dp[0] = false
            dp[1] = false
            for i in 2...N {
                for j in 1...i {
                    if i % j == 0 && !dp[i - j] {
                        dp[i] = true
                        break
                    }
                }
            }
            return dp[N]
        }
    }

    @Suite struct DivisorGameTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1fd0ef12-d992-44a9-a51c-bf4ab3607070",
             input: "N = 24",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fbf69baa-bda0-49d1-80df-06f1463015e5",
             input: "N = 26",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b71d39d6-6958-4298-b7e6-26d4aaa34b50",
             input: "N = 28",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8b14c9e5-8ca5-4c30-9055-2aa08d18bb00",
             input: "N = 30",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0ac63fd6-ac8c-4ad9-af61-f72969ddb5c7",
             input: "N = 32",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b20f30f6-9df6-471d-baa8-371ece457d2a",
             input: "N = 34",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5b54e03e-f717-4908-a548-aa3d40bdced9",
             input: "N = 100",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7f50664a-4793-425b-85c8-5480bb7a455d",
             input: "N = 1000",
             expected: "true", orderMatters: true),
            TestCaseData(id: "98924188-9c0b-4311-8ffc-352470137d06",
             input: "N = 10000",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e5ae70be-e1b6-43c3-aa1a-4cccc7527eba",
             input: "N = 23",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0d873205-a0a8-4ede-ba2b-238ad117abf4",
             input: "N = 25",
             expected: "true", orderMatters: true),
            TestCaseData(id: "745e8b40-0191-42d5-9559-917d795e3d46",
             input: "N = 27",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e5d0a13e-c282-4009-85b1-ea9b0fa8bca3",
             input: "N = 29",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2cc6d74d-8a88-40c7-ac32-b7294c955ab1",
             input: "N = 31",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e9eff8e8-9b73-412b-9314-ed5f317212cd",
             input: "N = 33",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ef902fe2-f773-4083-9935-2e00645f61bf",
             input: "n = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "317ea4fa-315c-466d-919f-094911e7e29e",
             input: "n = 3",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "divisor-game"
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

            guard let p_N = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_N >= 1 && p_N <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.divisorGame(p_N)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
