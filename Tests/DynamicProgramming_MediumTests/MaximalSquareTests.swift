import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximalSquare {
    private class Solution {
       func maximalSquare(_ matrix: [[Character]]) -> Int {
          if matrix.isEmpty || matrix[0].isEmpty {
             return 0
          }
          let rows = matrix.count
          let cols = matrix[0].count
          var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
          var maxSide = 0
          for i in 0..<rows {
             for j in 0..<cols {
                if i == 0 || j == 0 {
                   dp[i][j] = matrix[i][j] == "1" ? 1 : 0
                } else if matrix[i][j] == "1" {
                   dp[i][j] = min(min(dp[i-1][j], dp[i][j-1]), dp[i-1][j-1]) + 1
                }
                maxSide = max(maxSide, dp[i][j])
             }
          }
          return maxSide * maxSide
       }
    }

    @Suite struct MaximalSquareTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ad77e874-1b10-433f-b125-790c156c6ae1",
             input: "matrix = [[\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "89df4da2-0f78-4e94-b476-dc52973bc46b",
             input: "matrix = [[\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "06e474a8-d4ba-4769-9ee0-021e5581a289",
             input: "matrix = [[\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2a5e4c8d-6a4a-4a81-a1a7-b87cab41762a",
             input: "matrix = [[\"0\"],[\"0\"],[\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a1d2417d-b7bf-40fe-bf8a-2d7eb2405e89",
             input: "matrix = [[\"0\",\"0\"],[\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0f279370-a736-4443-8386-1aa2c838bbc5",
             input: "matrix = [[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5a096362-65f8-4f06-967c-abfc26a4d2d3",
             input: "matrix = [[\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5db218bf-6110-48db-b375-a50db50dd12e",
             input: "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\""
                + "],[\"0\",\"0\",\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9fb3f778-8d7f-470d-b70f-8c141a1cda5c",
             input: "matrix = [[\"1\"]]",
             expected: "Crash: Index out of bounds", orderMatters: true),
            TestCaseData(id: "2b3c2c98-df43-4411-a4b5-f17d7cbaecd0",
             input: "matrix = [[\"1\",\"1\"]]",
             expected: "Crash: Index out of bounds", orderMatters: true),
            TestCaseData(id: "b974283b-4500-43cf-aa42-d2594a1040de",
             input: "matrix = [[\"1\",\"1\",\"1\"]]",
             expected: "Crash: Index out of bounds", orderMatters: true),
            TestCaseData(id: "ec13ddd5-f361-476d-88ee-5832be66353b",
             input: "matrix = [[\"1\",\"0\",\"1\",\"0\",\"1\"]]",
             expected: "Crash: Index out of bounds", orderMatters: true),
            TestCaseData(id: "b1182eb6-ee76-46a3-a46f-3c178a179a4d",
             input: "matrix = [[\"1\"],[\"1\"],[\"1\"]]",
             expected: "Crash: Index out of bounds", orderMatters: true),
            TestCaseData(id: "32d4cbc4-f2ce-403f-aa7f-45219d18de1f",
             input: "matrix = [[\"1\",\"1\"],[\"1\",\"1\"]]",
             expected: "Crash: Index out of bounds", orderMatters: true),
            TestCaseData(id: "4f57453c-a0bc-4f3b-b2ad-3da5e6484c6d",
             input: "matrix = [[\"1\",\"0\",\"1\",\"0\",\"0\"],[\"1\",\"0\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"0\",\"0\",\"1\",\"0\"]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "36921cbf-63b2-48f2-bf2b-82989bc8d809",
             input: "matrix = [[\"0\",\"1\"],[\"1\",\"0\"]]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximal-square"
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

            guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Character]]"
                )
                return
            }
            guard p_matrix.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.maximalSquare(p_matrix)
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
