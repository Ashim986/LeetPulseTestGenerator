import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaxAreaOfIsland {
    private class Solution {
        func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
            var grid = grid
            let m = grid.count, n = grid[0].count
            var maxArea = 0

            func dfs(_ i: Int, _ j: Int) -> Int {
                guard i >= 0 && i < m && j >= 0 && j < n && grid[i][j] == 1 else { return 0 }
                grid[i][j] = 0
                return 1 + dfs(i+1, j) + dfs(i-1, j) + dfs(i, j+1) + dfs(i, j-1)
            }

            for i in 0..<m {
                for j in 0..<n {
                    if grid[i][j] == 1 {
                        maxArea = max(maxArea, dfs(i, j))
                    }
                }
            }

            return maxArea
        }
    }

    @Suite struct MaxAreaOfIslandTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3cb09799-32f5-4067-bd3d-fd52c4c511a2",
             input: "grid = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "83490540-c77a-4d15-88bb-7492549654ad",
             input: "grid = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "4811fc4d-650d-4f8c-8d36-19d08822946f",
             input: "grid = [[0,1,0],[1,1,1],[0,1,0]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "295f387b-c819-482d-8c7d-123ce95bc975",
             input: "grid = [[1,0,0],[0,1,0],[0,0,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a0ca98d3-f433-4463-af50-7487d4ffeff0",
             input: "grid = [[0,0,0],[0,0,0],[0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8f043298-7bf5-4018-8200-66c04e4f30a0",
             input: "grid = [[1,1,0],[1,1,0],[0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "25b09a8d-2b82-467c-bfdf-6c9f0a4f02ab",
             input: "grid = [[0,0,1],[0,0,1],[0,0,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "5c2d9a7b-27f0-49e6-bdf8-47834f679090",
             input: "grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2cfb5289-4e95-4a39-92e0-a14afa874cc2",
             input: "grid = [[1,1,1,1],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "938ad512-9e10-4602-bdf8-4a6ff111303c",
             input: "grid = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[1,1,1,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "4627b408-20a4-4050-8914-63f0b4b831b4",
             input: "grid = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "de3d8d9e-b23d-4d64-9072-9f627b6c2a73",
             input: "grid = [[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "151a188e-df6d-42e9-8505-6558bb391654",
             input: "grid = [[0,0,0,0],[0,1,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "82611426-60b3-4fca-93fb-bb633727083e",
             input: "grid = [[0,1,0,0],[0,1,0,0],[0,1,0,0],[0,1,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "7bd19dc0-c0ea-4434-bf08-fdbbdd5d19e6",
             input: "grid = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[1,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3d7a04f1-ab62-487f-ac13-6cd062c49ade",
             input: "grid = [[0,0,0,0],[1,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "be82a92f-0c00-4977-a1e0-701a6858bb2e",
             input: "grid = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b51c840f-e95b-42fc-b2fd-beb489283950",
             input: "grid = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,0]]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "86e1c68b-481d-4130-a05b-3e602c270b7e",
             input: "grid = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1cdfe174-9f0b-4882-bb16-fc475c501cc3",
             input: "grid = [[1,1,0,0],[1,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a55af41d-1455-4a9a-8c0f-9c68016f5824",
             input: "grid = [[0,0,0,0],[0,1,1,0],[0,1,1,0],[0,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "865ebb8b-edf3-4e07-900f-55cf8f03897b",
             input: "grid = [[0,0,0,0],[0,0,0,0],[1,1,1,1],[0,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "5e2ad48e-4904-4e54-9548-a3f737bb502f",
             input: "grid = [[1,1,1,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "53d37d99-9dd5-4f74-965b-ecae72eb21c2",
             input: "grid = [[1,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "447fbde7-6b04-4fa7-97a5-dd6a7662959a",
             input: "grid = [[0,0,0],[0,1,0],[0,0,0]]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "max-area-of-island"
            let topic = "graphs"
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

            guard let p_grid = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_grid.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.maxAreaOfIsland(p_grid)
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
