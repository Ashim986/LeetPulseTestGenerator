import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfIslands {
    private class Solution {
        func numIslands(_ grid: [[Character]]) -> Int {
            var grid = grid
            let rows = grid.count
            let cols = grid.first?.count ?? 0
            var count = 0

            func dfs(_ r: Int, _ c: Int) {
                if r < 0 || r >= rows || c < 0 || c >= cols { return }
                if grid[r][c] != "1" { return }
                grid[r][c] = "0"
                dfs(r + 1, c)
                dfs(r - 1, c)
                dfs(r, c + 1)
                dfs(r, c - 1)
            }

            for r in 0..<rows {
                for c in 0..<cols {
                    if grid[r][c] == "1" {
                        count += 1
                        dfs(r, c)
                    }
                }
            }
            return count
        }
    }

    @Suite struct NumberOfIslandsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a0bba084-8788-41ae-aef3-3f0d794665e2",
             input: "grid = [[]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "92cc2ebf-f4a4-4102-9138-414adcd0de6b",
             input: "grid = [[\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a47b05ab-0b78-478e-a071-cbde6ecbba9b",
             input: "grid = [[\"1\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b6910486-918c-4834-9a9a-9a61aa7acce9",
             input: "grid = [[\"1\",\"0\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "892c78bd-ec2d-4770-bdd6-2c37c40092e2",
             input: "grid = [[\"0\",\"1\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "44ae1cff-b51e-460d-ab2f-b8893dede662",
             input: "grid = [[\"1\",\"1\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "06081f47-9fd9-4eac-9c86-98662fcd05f1",
             input: "grid = [[\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bde6500c-1031-4fe0-9f7c-fb491d39585a",
             input: "grid = [[\"1\",\"0\",\"0\"],[\"0\",\"1\",\"0\"],[\"0\",\"0\",\"1\"]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "887d06a1-5c16-4a60-b92c-1fd682cd3db4",
             input: "grid = [[\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0cb53458-349f-40a9-acce-7476d99f73d4",
             input: "grid = [[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cb1b18fc-12da-46dd-aec0-58a41ffab51d",
             input: "grid = [[\"0\",\"1\",\"0\"],[\"1\",\"0\",\"1\"],[\"0\",\"1\",\"0\"]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "6dd77d46-db10-42a2-a319-e5882f5e7ae1",
             input: "grid = [[\"1\",\"1\",\"0\"],[\"1\",\"1\",\"0\"],[\"0\",\"0\",\"1\"]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "480661c1-4c55-4a91-bc09-5fe2e9517900",
             input: "grid = [[\"1\",\"0\",\"0\"],[\"0\",\"1\",\"1\"],[\"0\",\"0\",\"1\"]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "40435042-e0b0-4e94-8da3-27eae362f0eb",
             input: "grid = [[\"1\",\"1\",\"1\"],[\"0\",\"0\",\"0\"],[\"1\",\"1\",\"1\"]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "73b5ee1e-f338-4d24-b42a-5d41c32e769c",
             input: "grid = [[\"0\",\"0\",\"0\"],[\"1\",\"1\",\"1\"],[\"0\",\"0\",\"0\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "73148e68-376a-426c-a63a-775607a29198",
             input: "grid = [[\"1\",\"0\",\"1\"],[\"0\",\"1\",\"0\"],[\"0\",\"0\",\"0\"]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d971054d-e274-4dc9-a70d-0af821456b61",
             input: "grid = [[\"0\",\"0\",\"0\"],[\"0\",\"1\",\"0\"],[\"0\",\"0\",\"0\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d1ff6638-3b46-4320-88ba-e036105f9a9c",
             input: "grid = [[\"1\",\"1\",\"0\"],[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dd5514af-5460-4793-a3a1-1317f627565c",
             input: "grid = [[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"],[\"1\",\"1\",\"0\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9095a08d-3aa2-41a6-b6a0-2d26adb0e161",
             input: "grid = [[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"1\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5b33ac4d-db2c-4789-a577-9db07d3f79f0",
             input: "grid = [[\"1\",\"0\",\"0\"],[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b942810b-17d4-4cc9-bec8-25117d3f9b2f",
             input: "grid = [[\"0\",\"0\",\"0\"],[\"1\",\"0\",\"0\"],[\"0\",\"0\",\"0\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "882f09ed-3544-49a4-8753-1b4337b83521",
             input: "grid = [[\"0\",\"0\",\"0\"],[\"0\",\"1\",\"0\"],[\"1\",\"0\",\"0\"]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a6594f1c-caff-43f1-beba-3f4c316264e5",
             input: "grid = [[\"1\",\"0\",\"0\"],[\"0\",\"1\",\"0\"],[\"1\",\"0\",\"0\"]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "cd648c6b-abfe-433d-8bf1-4baca82d3082",
             input: "grid = [[\"0\",\"1\",\"0\"],[\"0\",\"1\",\"0\"],[\"0\",\"1\",\"0\"]]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-islands"
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

            guard let p_grid = InputParser.parse2DCharacterArray(params[0]) else {
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
            let result = solution.numIslands(p_grid)
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
