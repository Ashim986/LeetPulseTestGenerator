import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCOutOfBoundaryPaths {
    private class Solution {
        func findPaths(_ m: Int, _ n: Int, _ N: Int, _ i: Int, _ j: Int) -> Int {
            let mod = 1000000007
            let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
            var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: N + 1), count: n), count: m)

            for k in 1...N {
                for x in 0..<m {
                    for y in 0..<n {
                        for direction in directions {
                            let newI = x + direction.0
                            let newJ = y + direction.1
                            if newI < 0 || newI >= m || newJ < 0 || newJ >= n {
                                dp[x][y][k] = (dp[x][y][k] + 1) % mod
                            } else {
                                dp[x][y][k] = (dp[x][y][k] + dp[newI][newJ][k - 1]) % mod
                            }
                        }
                    }
                }
            }

            return dp[i][j][N]
        }
    }

    @Suite struct OutOfBoundaryPathsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c7f47e3f-61bf-4598-bda4-771cbad9b4da",
             input: "m = 1, n = 1, N = 1, i = 0, j = 0",
             expected: "4", orderMatters: true),
            TestCaseData(id: "29e4becb-982d-4c34-89e9-3cf322ac878a",
             input: "m = 1, n = 2, N = 1, i = 0, j = 1",
             expected: "3", orderMatters: true),
            TestCaseData(id: "761eef60-e56c-4bdc-aedb-cbc64ad4b659",
             input: "m = 2, n = 1, N = 1, i = 1, j = 0",
             expected: "3", orderMatters: true),
            TestCaseData(id: "afe063a0-373e-4852-87ce-b843f410e2a8",
             input: "m = 3, n = 3, N = 1, i = 1, j = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "038c9b79-0075-49fd-b240-b4b9bcdcd8e9",
             input: "m = 3, n = 3, N = 2, i = 1, j = 1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "99a4b33e-18ea-416e-85d8-5b9af93fb88d",
             input: "m = 1, n = 1, N = 2, i = 0, j = 0",
             expected: "4", orderMatters: true),
            TestCaseData(id: "f9754cd6-8048-4df4-b680-6416555b3065",
             input: "m = 1, n = 1, N = 3, i = 0, j = 0",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e7b739d5-3c67-419e-87ea-a4432854ffa9",
             input: "m = 1, n = 2, N = 1, i = 0, j = 0",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f60ef3d5-6b52-4869-b7e9-bf436a676bba",
             input: "m = 2, n = 1, N = 1, i = 0, j = 0",
             expected: "3", orderMatters: true),
            TestCaseData(id: "8e9875b4-6675-483e-87a9-afce34cee8e5",
             input: "m = 2, n = 2, N = 3, i = 0, j = 0",
             expected: "14", orderMatters: true),
            TestCaseData(id: "550ceefd-ddfe-48a4-b62a-e6773df94cb7",
             input: "m = 2, n = 2, N = 3, i = 1, j = 1",
             expected: "14", orderMatters: true),
            TestCaseData(id: "60083322-0a43-43ac-a3cc-6bdf713429d4",
             input: "m = 3, n = 3, N = 1, i = 0, j = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c1b70ccc-cc0f-4d51-b056-21605098350f",
             input: "m = 3, n = 3, N = 2, i = 0, j = 0",
             expected: "4", orderMatters: true),
            TestCaseData(id: "7164a3c0-9b49-43ec-87eb-087eff65907b",
             input: "m = 4, n = 4, N = 1, i = 0, j = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "64f4368d-3840-4417-bdf3-cf1da85e37f5",
             input: "m = 4, n = 4, N = 1, i = 2, j = 2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "55682538-0e24-40c3-8de8-63852328d63a",
             input: "m = 5, n = 5, N = 1, i = 0, j = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "57cd4c94-a608-4eae-8d89-7cc5e35bbdf7",
             input: "m = 5, n = 5, N = 1, i = 2, j = 2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "610cb3dc-d414-498f-ac59-8ef7fd1d88a9",
             input: "m = 6, n = 6, N = 1, i = 0, j = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9ffd559a-0f96-4455-83c3-cdcfa638cf4e",
             input: "m = 6, n = 6, N = 1, i = 3, j = 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "06beddf8-2eff-43e7-937e-a3e88df2fb4c",
             input: "m = 7, n = 7, N = 1, i = 0, j = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6645cdf7-f90b-45d5-8629-89c49784ef6f",
             input: "m = 7, n = 7, N = 1, i = 3, j = 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8ad29560-5580-4db7-abca-6b9ff5040702",
             input: "m = 8, n = 8, N = 1, i = 0, j = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6746e42f-a1aa-4aae-baf7-0fab4ef4269f",
             input: "m = 8, n = 8, N = 1, i = 4, j = 4",
             expected: "0", orderMatters: true),
            TestCaseData(id: "66ed2a08-4593-40e4-aa90-629c677d7cf3",
             input: "m = 9, n = 9, N = 1, i = 0, j = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "823cae4e-1238-4e1a-b216-80af4d12b213",
             input: "m = 9, n = 9, N = 1, i = 4, j = 4",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "out-of-boundary-paths"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 5 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 5, got \(params.count)"
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
            guard let p_N = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }
            guard let p_i = InputParser.parseInt(params[3]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 3 as Int"
                )
                return
            }
            guard let p_j = InputParser.parseInt(params[4]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 4 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_m >= 1 && p_m <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 50"
                )
                return
            }
            guard p_n >= 1 && p_n <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 50"
                )
                return
            }
            guard p_N >= 0 && p_N <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= maxMove <= 50"
                )
                return
            }
            guard p_i >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= startRow < m"
                )
                return
            }
            guard p_j >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= startColumn < n"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findPaths(p_m, p_n, p_N, p_i, p_j)
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
