import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPerfectSquares {
    private class Solution {
        func numSquares(_ n: Int) -> Int {
            var dp = [Int](repeating: Int.max, count: n + 1)
            dp[0] = 0
            for i in 1...n {
                var j = 1
                while j * j <= i {
                    dp[i] = min(dp[i], dp[i - j*j] + 1)
                    j += 1
                }
            }
            return dp[n]
        }
    }

    @Suite struct PerfectSquaresTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "24e6b23e-a7a0-4e72-aec8-93f2a9441d08",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "de74ca5a-56f4-4e78-953a-61aca1ae56a9",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e07817f1-b17a-4a04-9942-8e85e9a35f17",
             input: "n = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "007454d3-b7dc-439b-92a0-ccee8813652a",
             input: "n = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "affe6a06-1002-4b8b-a3c9-5db8aeebfd95",
             input: "n = 4",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c6604a2e-fea5-4c90-b0fd-f82897b370a2",
             input: "n = 5",
             expected: "2", orderMatters: true),
            TestCaseData(id: "faf0effc-7b4f-4e86-8cb0-3118f1bc7d3c",
             input: "n = 6",
             expected: "3", orderMatters: true),
            TestCaseData(id: "16382efa-6a5e-4760-b9b9-bce352bc8e5b",
             input: "n = 7",
             expected: "4", orderMatters: true),
            TestCaseData(id: "3e13d85d-2065-4de7-800d-afbcb5c234f1",
             input: "n = 8",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4125a3c2-6649-4b96-8b39-47358dbf996a",
             input: "n = 9",
             expected: "1", orderMatters: true),
            TestCaseData(id: "23107fbd-3e2d-4caa-9e8f-cf761529ac6b",
             input: "n = 10",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4df50825-f22e-42ce-a9ad-4e58e47495c0",
             input: "n = 11",
             expected: "3", orderMatters: true),
            TestCaseData(id: "bb0ff66c-0200-428c-9143-6e04d7ec797e",
             input: "n = 13",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5eef73dc-d3ff-4de1-bc00-05af36d77d4e",
             input: "n = 14",
             expected: "3", orderMatters: true),
            TestCaseData(id: "7adcfbdb-28ce-4a7a-8d0c-b24a6f9fbef0",
             input: "n = 15",
             expected: "4", orderMatters: true),
            TestCaseData(id: "bd0fb1db-325a-4868-9f5c-57cb74a3d50a",
             input: "n = 16",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f060e38b-0a93-4b4c-af6b-e6fe83334eeb",
             input: "n = 17",
             expected: "2", orderMatters: true),
            TestCaseData(id: "826731f9-1b1a-4a1a-b78b-808a292613fd",
             input: "n = 18",
             expected: "2", orderMatters: true),
            TestCaseData(id: "226c9316-9bcb-4fa8-9543-d38c77112a88",
             input: "n = 19",
             expected: "3", orderMatters: true),
            TestCaseData(id: "716ad783-4b49-4d2e-9a01-0555d09b54aa",
             input: "n = 20",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f5f62305-b7d9-40b2-94c3-7b06d8ef200f",
             input: "n = 25",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8c23f8e5-9655-4c2c-a9fd-b05f63c559c1",
             input: "n = 26",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1087606b-127c-4eb3-82a0-927d4ca18b96",
             input: "n = 27",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ed5544e8-9895-4312-937b-f7667cb74cfd",
             input: "n = 28",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2c18084e-b1ab-43b7-a0e2-3f226c113381",
             input: "n = 32",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "perfect-squares"
            let topic = "dynamic-programming"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.numSquares(p_n)
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
