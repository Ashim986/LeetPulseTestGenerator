import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCOnesAndZeroes {
    private class Solution {
        func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
            var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
            for str in strs {
                let ones = countOnes(str), zeros = countZeros(str)
                for i in stride(from: m, through: ones, by: -1) {
                    for j in stride(from: n, through: zeros, by: -1) {
                        dp[i][j] = max(dp[i][j], dp[i - ones][j - zeros] + 1)
                    }
                }
            }
            return dp[m][n]
        }

        func countOnes(_ s: String) -> Int {
            var count = 0
            for c in s {
                if c == "1" {
                    count += 1
                }
            }
            return count
        }

        func countZeros(_ s: String) -> Int {
            var count = 0
            for c in s {
                if c == "0" {
                    count += 1
                }
            }
            return count
        }
    }

    @Suite struct OnesAndZeroesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8d811702-034c-4621-b10b-e1a50940a726",
             input: "strs = [\"1\"], m = 1, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "db6945c4-ed17-4c48-be6d-cd7e51e43c0c",
             input: "strs = [\"0\"], m = 1, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1aa85782-3051-4b79-83f1-a4b5871594df",
             input: "strs = [\"10\"], m = 1, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f31edfa3-2487-404b-ad0d-55381e6f1657",
             input: "strs = [\"10\", \"0\", \"1\"], m = 0, n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0a275ecb-c2b1-432e-a0be-5e3b503362c0",
             input: "strs = [\"10\", \"0\", \"1\"], m = 0, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "10509e53-1e81-400b-808d-7bb643e79a42",
             input: "strs = [\"10\", \"0\", \"1\"], m = 1, n = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6023e47d-a348-45ae-adc1-b4b7817e0cf2",
             input: "strs = [\"10\", \"0\", \"1\"], m = -1, n = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "200ad238-b471-417f-9d19-3476214cb99f",
             input: "strs = [\"10\", \"0\", \"1\"], m = 1, n = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7af0154f-ee89-409c-a055-da8ed02a1c02",
             input: "strs = [], m = 1, n = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7911085a-b9af-4b8f-bf35-b953c843c2ba",
             input: "strs = [\"10\", \"0\", \"1\", \"10\", \"0\", \"1\"], m = 0, n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0be32f7c-ecdd-4e3e-b3cb-b14a015875c7",
             input: "strs = [\"1111\", \"0000\", \"1111\", \"0000\"], m = 0, n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bb833441-919c-431a-9de2-1ab8df1d4625",
             input: "strs = [\"1111\", \"0000\", \"1111\", \"0000\"], m = 8, n = 8",
             expected: "4", orderMatters: true),
            TestCaseData(id: "352d9e0c-afe6-4aa6-bbbe-2b9e49fcfd61",
             input: "strs = [\"1\", \"1\", \"1\", \"1\", \"1\"], m = 5, n = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e2b084b3-021a-40ef-a321-80224efa3d2f",
             input: "strs = [\"0\", \"0\", \"0\", \"0\", \"0\"], m = 5, n = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4fe7c86b-7539-48bc-b89f-5ca4783dc06a",
             input: "strs = [\"10\", \"10\", \"10\", \"10\", \"10\"], m = 5, n = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9a29901b-8d7a-48e6-a320-c9c6b3c04898",
             input: "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 0, n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cbe56565-11f3-4680-91dd-aa3fc70f3d49",
             input: "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = -5, n = 5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "165d733e-9709-4729-a998-6a2a61cfb1ad",
             input: "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 5, n = -5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fd7b598f-afab-49c6-bc75-9701e8d05538",
             input: "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 100, n = 100",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b5ccef61-ed1c-420b-8f2a-899b20d6b320",
             input: "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 1000, n = 1000",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e553c0d7-d3ea-4b46-81f7-4679d6b1c5e4",
             input: "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 10000, n = 10000",
             expected: "5", orderMatters: true),
            TestCaseData(id: "8ceab4a7-d528-4c99-9ade-0e2cf9b6703c",
             input: "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\", \"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 100, n = 100",
             expected: "10", orderMatters: true),
            TestCaseData(id: "77ee1908-9f8d-40aa-b58d-f3b19a389639",
             input: "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\", \"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 1000, n = 1000",
             expected: "10", orderMatters: true),
            TestCaseData(id: "bca5398a-4d01-4bba-8c15-696470e6617c",
             input: "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\", \"10000\", \"00001\", \"11111\", \"00000\", \"11111\"], m = 10000, n = 10"
                + "000",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d1e9d270-1e21-4df1-8d14-052cfe2d4521",
             input: "strs = [\"10000\", \"00001\", \"11111\", \"00000\", \"11111\", \"10000\", \"00001\", \"11111\", \"00000\", \"11111\", \"10000\", \"00001"
                + "\", \"11111\", \"00000\", \"11111\"], m = 100, n = 100",
             expected: "15", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "ones-and-zeroes"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            guard let p_strs = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_strs.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: strs array too large (\(p_strs.count))"
                )
                return
            }
            guard let p_m = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_n = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_strs.count >= 1 && p_strs.count <= 600 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= strs.length <= 600"
                )
                return
            }
            guard p_strs.allSatisfy({ $0.count >= 1 && $0.count <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= strs[i].length <= 100"
                )
                return
            }
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
                resultHolder = solution.findMaxForm(p_strs, p_m, p_n)
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
