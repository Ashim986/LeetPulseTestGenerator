import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUniquePathsIi {
    private class Solution {
        func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
         let m = obstacleGrid.count
         let n = obstacleGrid[0].count
         var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
         for i in 0..<m {
         for j in 0..<n {
         if obstacleGrid[i][j] == 1 {
         continue
         }
         if i == 0 && j == 0 {
         dp[i][j] = 1
         } else if i == 0 {
         dp[i][j] = dp[i][j-1]
         } else if j == 0 {
         dp[i][j] = dp[i-1][j]
         } else {
         dp[i][j] = dp[i-1][j] + dp[i][j-1]
         }
         }
         }
         return dp[m-1][n-1]
         }
    }

    @Suite struct UniquePathsIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0b26a368-8a90-4c25-9a3f-e0f65e009939",
             input: "obstacleGrid = [[0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0e858fee-6998-476b-8eb0-4527a4759c26",
             input: "obstacleGrid = [[1,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "98c1e856-95aa-400b-9d4d-bb03bc280497",
             input: "obstacleGrid = [[0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "72aefe38-b2a0-466f-be6c-1e8484244f4c",
             input: "obstacleGrid = [[0,1,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "47d25a38-2600-4a72-8c7e-d60bf4b8e19f",
             input: "obstacleGrid = [[0,0],[0,0]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f15d1bdd-9082-4955-b940-0420b9d4aba7",
             input: "obstacleGrid = [[0,0],[1,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9bff57ac-fffa-4342-b123-3cca4edb6a56",
             input: "obstacleGrid = [[0,0,0],[0,0,0]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "cf9d6fc8-5eb5-45f0-ae6b-53042e29c0e7",
             input: "obstacleGrid = [[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e5e6776d-c682-48c9-bded-ec2ac9383ce4",
             input: "obstacleGrid = [[0,0,0,0,0,0,0,0,0,0,0],[1,1,1,1,1,1,1,1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3bf51b31-66da-427a-84f9-a22c4a2af3a7",
             input: "obstacleGrid = [[1,1,1,1,1,1,1,1,1,1,1],[0,0,0,0,0,0,0,0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8912f848-2363-4382-b7a1-be90c429a81d",
             input: "obstacleGrid = [[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "36def1b6-4e43-41d7-a1d0-c462151a75ee",
             input: "obstacleGrid = [[0,0,0],[0,1,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e9d36b69-df3c-4092-9cff-955a0fa75d1e",
             input: "obstacleGrid = [[0,0,0,0],[0,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "49387db3-e2b9-4eeb-82d9-ac948282432f",
             input: "obstacleGrid = [[0,0,0,0],[0,1,0,0]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e59e6958-9d8f-492d-b69a-17e975f05e16",
             input: "obstacleGrid = [[0,0,0,0,0],[0,0,0,0,0]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9c446c3b-75d0-4b4f-a564-2f320076343a",
             input: "obstacleGrid = [[0,0,0,0,0],[0,1,0,0,0]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "60b219cd-e66d-4f16-bb8b-e56634423a74",
             input: "obstacleGrid = [[0,0,0,0,0,0],[0,0,0,0,0,0]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "0804e44d-4af5-4262-bb23-af899354673b",
             input: "obstacleGrid = [[0,0,0,0,0,0],[0,1,0,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "94e51267-829f-4437-94e5-1fa48edb9254",
             input: "obstacleGrid = [[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "cd4c00d0-06a5-45b3-b953-84696b3e5089",
             input: "obstacleGrid = [[0,0,0,0,0,0,0],[0,1,0,0,0,0,0]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b837065e-cbf7-4778-9411-7ee24ab34727",
             input: "obstacleGrid = [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "01d5e934-664a-4dc7-8187-4b6ca2427ec8",
             input: "obstacleGrid = [[0,0,0,0,0,0,0,0],[0,1,0,0,0,0,0,0]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "4ac45cd8-535e-4ef6-a0ad-29d87c2744d1",
             input: "obstacleGrid = [[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "f073bec0-3358-49ea-b631-85e4a02a8e6a",
             input: "obstacleGrid = [[0,0,0,0,0,0,0,0,0],[0,1,0,0,0,0,0,0,0]]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "9f742a0b-a504-4a5b-b745-1def1735b490",
             input: "obstacleGrid = [[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]]",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "unique-paths-ii"
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

            guard let p_obstacleGrid = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_obstacleGrid.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: obstacleGrid 2D array too large (\(p_obstacleGrid.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.uniquePathsWithObstacles(p_obstacleGrid)
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
