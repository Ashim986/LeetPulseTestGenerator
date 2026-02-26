import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRottingOranges {
    private class Solution {
        func orangesRotting(_ grid: [[Int]]) -> Int {
            var grid = grid
            let rows = grid.count
            let cols = grid.first?.count ?? 0
            var queue: [(Int, Int)] = []
            var fresh = 0

            for r in 0..<rows {
                for c in 0..<cols {
                    if grid[r][c] == 2 { queue.append((r, c)) }
                    else if grid[r][c] == 1 { fresh += 1 }
                }
            }

            let directions = [(1,0),(-1,0),(0,1),(0,-1)]
            var minutes = 0
            var head = 0

            while head < queue.count && fresh > 0 {
                let levelCount = queue.count - head
                for _ in 0..<levelCount {
                    let (r, c) = queue[head]
                    head += 1
                    for (dr, dc) in directions {
                        let nr = r + dr
                        let nc = c + dc
                        if nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 1 {
                            grid[nr][nc] = 2
                            fresh -= 1
                            queue.append((nr, nc))
                        }
                    }
                }
                minutes += 1
            }

            return fresh == 0 ? minutes : -1
        }
    }

    @Suite struct RottingOrangesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d9e55e01-7030-4d77-af0b-261a3f662a38",
             input: "grid = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "a5851fc4-cb36-4186-9391-98700e36a1db",
             input: "grid = [[2,1,1],[1,1,1],[1,1,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "20197f81-1658-466a-8607-206ccba317f8",
             input: "grid = [[0,0,0],[0,0,0],[0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d08dd3f6-ccff-486d-b140-928f300ed542",
             input: "grid = [[1,0,1],[0,1,0],[1,0,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "73360bb3-00d8-4257-b8de-3f2431a06f0f",
             input: "grid = [[1,1,1],[1,2,1],[1,1,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "24758f08-3976-4b49-8cf8-d2f554c2c9f5",
             input: "grid = [[2,2,2],[2,2,2],[2,2,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e058f55f-3c21-4cc7-8d4a-b8bbf0b81000",
             input: "grid = [[0,0,0,0],[0,1,1,0],[0,1,1,0],[0,0,0,0]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "463de285-28c0-4081-bc64-674fc4dd4a96",
             input: "grid = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "04b68a8e-7614-4565-a2e9-7b68b60661d1",
             input: "grid = [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "ea861c6b-0773-4772-b276-6f5aa2da3620",
             input: "grid = [[0,0,0,0,0],[0,2,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7d99b3d0-5d55-44d5-ba58-71fd4cf9eefe",
             input: "grid = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "a210fad3-a940-4683-91cc-ae813e8af01d",
             input: "grid = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "61414d93-2822-4a10-913a-3a893615ded3",
             input: "grid = [[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1],[0,0,0,0,0]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "39e2001a-e1aa-4591-9c52-36da31261bd7",
             input: "grid = [[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fc601e6f-832a-4545-98d3-75c40165739e",
             input: "grid = [[0,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "c07f0852-9e1f-4503-88f9-deff636ced60",
             input: "grid = [[1,2,1],[1,1,1],[0,1,2]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c6a49f1b-588b-493f-97bb-3d70bf1948a9",
             input: "grid = [[2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8f7fffab-08d4-45e9-944a-818d8b584dc8",
             input: "grid = [[1,1,0],[0,1,0],[0,0,2]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "22cb8f91-5d50-48a0-9c98-884b1783512f",
             input: "grid = [[2,1,0],[0,1,1],[1,0,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1e26aa10-93de-41d6-9845-357f25599e11",
             input: "grid = [[1,2,1],[0,1,1],[1,0,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3651cf65-d46a-469f-8a80-5f583b3ce8e6",
             input: "grid = [[0,0,0,0,0,0],[0,2,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e5b582f5-04a4-44d8-92c5-c21a52298dcb",
             input: "grid = [[1,2,1],[1,1,1],[1,1,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c9d597bb-8cb9-4898-b7cd-122ea9fa24c5",
             input: "grid = [[1,1,1],[1,1,2],[1,1,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "254b171d-a7b3-4fe8-ad33-fd5efaa66719",
             input: "grid = [[2,1,0,2,1],[1,0,1,2,1],[1,0,1,2,1],[2,2,1,1,1],[1,0,0,2,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "fda17003-2f83-4b78-a845-8286b3af3b59",
             input: "grid = [[2,0,0,0,0],[0,2,0,0,0],[0,0,2,0,0],[0,0,0,2,0],[0,0,0,0,2]]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "rotting-oranges"
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
            let result = solution.orangesRotting(p_grid)
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
