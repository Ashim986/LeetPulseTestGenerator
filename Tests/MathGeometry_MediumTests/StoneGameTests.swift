import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCStoneGame {
    private class Solution {
        func stoneGame(_ piles: [Int]) -> Bool {
            let n = piles.count
            var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

            for i in stride(from: n - 1, through: 0, by: -1) {
                dp[i][i] = piles[i]
                for j in stride(from: i + 1, through: n - 1, by: 1) {
                    dp[i][j] = max(piles[i] - dp[i + 1][j], piles[j] - dp[i][j - 1])
                }
            }

            return dp[0][n - 1] > 0
        }
    }

    @Suite struct StoneGameTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ada1a96d-5412-43ce-8a3b-c5308439aa04",
             input: "piles = [1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a414b253-f815-4c41-ba1f-bf13463ae5d8",
             input: "piles = [1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "77723eec-435a-4bf5-b6c6-5ab47dc6b82a",
             input: "piles = [1,2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "510d518f-6715-40bf-933d-8dd4177c0734",
             input: "piles = [2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d7d07238-2674-47e1-9570-aa381f0e3e5c",
             input: "piles = [1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a83ca967-7d33-4e1b-8405-9bc9e421564c",
             input: "piles = [1,2,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6fbc2369-04fe-496a-a760-1a5f47f2962e",
             input: "piles = [3,2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a869cbb8-35e5-406d-aa8b-f4859efe3f9a",
             input: "piles = [1,1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d2df5044-239a-4bd4-a592-6cfaa1c9c933",
             input: "piles = [1,2,3,4]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "046ff939-a2de-4e07-b0a5-e6d65cc70fda",
             input: "piles = [4,3,2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "70bd34dc-483e-4eee-8137-7178909918b7",
             input: "piles = [1,1,1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1a21c6c7-608c-401f-b4b0-bbff815ba256",
             input: "piles = [1,2,3,4,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d90c268d-88df-4823-a882-3f2e55b98170",
             input: "piles = [5,4,3,2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8ae1c6ea-5b00-49a6-bd51-8dd21bef5056",
             input: "piles = [10,20,30]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "bf8764e9-afce-461f-b57e-dbffde19f78f",
             input: "piles = [30,20,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c7012fba-44d5-41c8-a06a-d0e10ac66857",
             input: "piles = [100,200,300]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e5c21bcd-d984-4d33-b496-7332fc78392a",
             input: "piles = [300,200,100]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0c19d82c-8c4e-4e07-b21f-f6ebe436f153",
             input: "piles = [1000,2000,3000]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "261c8bd2-6bda-4076-a728-a90302a31466",
             input: "piles = [3000,2000,1000]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "929899a8-9f21-4d24-8188-f32bb6fbf0d7",
             input: "piles = [1,1,1,1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d58621a3-44d1-47c9-b07f-8b495e27b775",
             input: "piles = [1,2,3,4,5,6]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "73c8ebb5-bdfb-45e5-8122-d730971b18ec",
             input: "piles = [6,5,4,3,2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "bc329d23-9576-4022-969a-fbb218808565",
             input: "piles = [10,10,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ef52a77c-9972-4098-a79a-be86190a997d",
             input: "piles = [100,100,100]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "907eb4b6-e6bc-4a81-96a5-8bfa2aebe9df",
             input: "piles = [1000,1000,1000]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "stone-game"
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

            guard let p_piles = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_piles.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: piles array too large (\(p_piles.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_piles.count >= 2 && p_piles.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= piles.length <= 500"
                )
                return
            }
            guard p_piles.allSatisfy({ $0 >= 1 && $0 <= 500 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= piles[i] <= 500"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.stoneGame(p_piles)
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
