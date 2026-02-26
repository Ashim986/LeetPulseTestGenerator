import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNew21Game {
    private class Solution {
        func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
          if k == 0 { return 1.0 }
          var dp: [Double] = Array(repeating: 0.0, count: n + 1)
          dp[0] = 1.0
          var sum: Double = 1.0
          for i in 1...n {
            dp[i] = sum / Double(maxPts)
            if i < k { sum += dp[i] }
            if i - k >= 0 { sum -= dp[i - k] }
          }
          return dp[n]
        }
    }

    @Suite struct New21GameTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "99ca9772-9b1c-4f39-a70e-d937b5cc7029",
             input: "n = 0, k = 0, maxPts = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "5d4aba44-6e01-4032-a197-57463f04c43a",
             input: "n = 1, k = 0, maxPts = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "320cc598-3a00-40b7-85ef-c9d52dd3af2a",
             input: "n = 1, k = 1, maxPts = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "4fcf8f60-6eb9-4ba8-bc64-5ccc58d70507",
             input: "n = 5, k = 0, maxPts = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "8781469a-9260-429f-a2ed-7aa352286836",
             input: "n = 5, k = 5, maxPts = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "4ada746b-e0aa-4d7c-aabe-bfe9326ca13d",
             input: "n = 10, k = 5, maxPts = 2",
             expected: "0.6669921875", orderMatters: true),
            TestCaseData(id: "a1d614f9-d958-4298-bd0d-ee42324f8087",
             input: "n = 10, k = 10, maxPts = 2",
             expected: "0.6669921875", orderMatters: true),
            TestCaseData(id: "ed27ec1c-5584-4467-a0c6-8f2e6d2f714d",
             input: "n = 20, k = 10, maxPts = 5",
             expected: "0.49999999999999994", orderMatters: true),
            TestCaseData(id: "771b2857-a882-4c6f-be68-01f5eae92333",
             input: "n = 20, k = 15, maxPts = 5",
             expected: "0.49999999999999994", orderMatters: true),
            TestCaseData(id: "0ed450b8-fcf3-474f-be13-791a884467f4",
             input: "n = 100, k = 50, maxPts = 10",
             expected: "0.09090909090909091", orderMatters: true),
            TestCaseData(id: "38ad4eb5-45ea-4d58-85e3-ee59a6b69624",
             input: "n = 100, k = 100, maxPts = 10",
             expected: "0.00010000000000000001", orderMatters: true),
            TestCaseData(id: "edbbb437-a707-42e9-b094-9e891dc08345",
             input: "n = 1000, k = 500, maxPts = 20",
             expected: "1.0000000000000001e-15", orderMatters: true),
            TestCaseData(id: "3bbc2e03-2bf2-4329-aa92-3cfa18c08116",
             input: "n = 1000, k = 1000, maxPts = 20",
             expected: "1.0000000000000001e-15", orderMatters: true),
            TestCaseData(id: "65ee7434-7f37-4a62-ba1c-7f79a31417ad",
             input: "n = 10000, k = 5000, maxPts = 50",
             expected: "1.0000000000000001e-15", orderMatters: true),
            TestCaseData(id: "49457dae-e9f8-47d7-b776-1386fa5409f1",
             input: "n = 10000, k = 10000, maxPts = 50",
             expected: "1.0000000000000001e-15", orderMatters: true),
            TestCaseData(id: "868ee767-cf67-4a9e-8566-7defc5d91aaa",
             input: "n = 100000, k = 50000, maxPts = 100",
             expected: "1.0000000000000001e-15", orderMatters: true),
            TestCaseData(id: "c541fcd7-89eb-4a00-9508-6a66e3f7ff14",
             input: "n = 100000, k = 100000, maxPts = 100",
             expected: "1.0000000000000001e-15", orderMatters: true),
            TestCaseData(id: "615e1cb5-8128-48a5-b392-a1b8e98ff0d2",
             input: "n = 1000000, k = 500000, maxPts = 200",
             expected: "1.0000000000000001e-15", orderMatters: true),
            TestCaseData(id: "e6469de1-78a3-4932-ae3d-c0922be960e7",
             input: "n = 1000000, k = 1000000, maxPts = 200",
             expected: "1.0000000000000001e-15", orderMatters: true),
            TestCaseData(id: "c580fbf7-8eb7-4c03-884c-35b12a8f7d58",
             input: "n = 10, k = 0, maxPts = 10",
             expected: "0.10000000000000002", orderMatters: true),
            TestCaseData(id: "ff4113c5-da37-4cc3-a700-d49c44ae67ea",
             input: "n = 10, k = 10, maxPts = 10",
             expected: "0.2357947691", orderMatters: true),
            TestCaseData(id: "f99a5fce-8534-4e3e-baf7-0a4268c113b7",
             input: "n = 10, k = 5, maxPts = 10",
             expected: "0.2357947691", orderMatters: true),
            TestCaseData(id: "4a4479a0-3977-4c06-90c1-9250b160c3f1",
             input: "n = 20, k = 10, maxPts = 10",
             expected: "0.1708428376721", orderMatters: true),
            TestCaseData(id: "db8cb784-68d6-407e-8ebf-d6b8cbc07c96",
             input: "n = 20, k = 15, maxPts = 10",
             expected: "0.1708428376721", orderMatters: true),
            TestCaseData(id: "d7588c49-5771-4ec0-b13a-6d88741fb53d",
             input: "n = 100, k = 50, maxPts = 100",
             expected: "0.010000000000000002", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "new-21-game"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_maxPts = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_k >= 0 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= k <= n <= 104"
                )
                return
            }
            guard p_n >= 0 && p_n <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= k <= n <= 104"
                )
                return
            }
            guard p_maxPts >= 1 && p_maxPts <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= maxPts <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.new21Game(p_n, p_k, p_maxPts)
            let computedOutput = OutputSerializer.serialize(result)

            // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
            // Treats -0 and 0 as equal; handles trailing zero normalization
            let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
            let matches = abs(result - expectedVal) < 1e-5
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
