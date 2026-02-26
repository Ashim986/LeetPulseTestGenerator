import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSwimInRisingWater {
    private class Solution {
        func swimInWater(_ grid: [[Int]]) -> Int {
            let n = grid.count
            let dirs = [(0,1),(0,-1),(1,0),(-1,0)]

            func canReach(_ t: Int) -> Bool {
                if grid[0][0] > t { return false }
                var visited = Set<[Int]>()
                var queue = [[0, 0]]
                visited.insert([0, 0])

                while !queue.isEmpty {
                    let curr = queue.removeFirst()
                    if curr == [n-1, n-1] { return true }

                    for (dr, dc) in dirs {
                        let nr = curr[0] + dr, nc = curr[1] + dc
                        if nr >= 0 && nr < n && nc >= 0 && nc < n &&
                           !visited.contains([nr, nc]) && grid[nr][nc] <= t {
                            visited.insert([nr, nc])
                            queue.append([nr, nc])
                        }
                    }
                }
                return false
            }

            var lo = grid[0][0], hi = n * n - 1
            while lo < hi {
                let mid = (lo + hi) / 2
                if canReach(mid) {
                    hi = mid
                } else {
                    lo = mid + 1
                }
            }

            return lo
        }
    }

    @Suite struct SwimInRisingWaterTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7f162122-2ee0-4049-9e68-a0d9aa1f8fe6",
             input: "grid = [[0,0],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fe7f4640-b760-4654-87df-f8b05702f232",
             input: "grid = [[5,5],[5,5]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "7c10fcb5-f598-4fca-a50d-f90bf708f6b4",
             input: "grid = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a9a9bd4e-ce57-4c9a-a828-4b3890701278",
             input: "grid = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1af53f2e-e584-4f98-b57a-64c654bcf90d",
             input: "grid = [[10,10,10],[10,10,10],[10,10,10]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "1d1359dd-3a96-43ea-885d-fb5674e55fac",
             input: "grid = [[-1,-1],[-1,-1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "f6cadacc-dff8-4f9f-99f1-62e8ca2bb9f8",
             input: "grid = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6062ecf7-5850-4bc5-8f81-7353abed5772",
             input: "grid = [[5,1,5],[1,5,1],[5,1,5]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "fb261934-4c4e-4ec8-99a8-5666309a98e0",
             input: "grid = [[1,5,1],[5,1,5],[1,5,1]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5f6b8df2-d126-41dd-b8a4-a7bcfd01591f",
             input: "grid = [[16,15,14,13],[12,11,10,9],[8,7,6,5],[4,3,2,1]]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "dab1aa5a-43f2-4c98-9217-f4e8f9b3f128",
             input: "grid = [[17,15,13],[11,9,7],[5,3,1]]",
             expected: "17", orderMatters: true),
            TestCaseData(id: "ded0b8f9-12a4-46b4-b9d0-744c0f5d3bf4",
             input: "grid = [[0,1],[1,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "24a94ade-da79-4740-a2f9-9aa1b5c21676",
             input: "grid = [[1,0],[0,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2ffbea39-34b3-4294-a66b-fb537f46a22d",
             input: "grid = [[10,1],[1,10]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "7fc6f810-a0f8-4cc4-b517-c4a6c6707388",
             input: "grid = [[0,0,0],[0,1,0],[0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2920b75b-046e-46f4-9af9-03ba00bd1e60",
             input: "grid = [[0,0,0],[0,0,0],[0,1,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2898a94f-b639-4ab5-8112-f5037a43bc70",
             input: "grid = [[1,0,0],[0,0,0],[0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f206a66a-f206-41ef-8d1a-c44d1aa82fa3",
             input: "grid = [[0,0,0],[0,0,0],[1,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7b8c4c4d-b30b-49eb-a613-da4a9786c777",
             input: "grid = [[0,0,1],[0,0,0],[0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2a243514-deca-42b0-b824-f8d93fa5a971",
             input: "grid = [[0,0,0],[0,0,0],[0,0,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ba1ed4b7-3d17-4422-9f9b-367875d32f15",
             input: "grid = [[1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "34815be7-28a4-433e-a6ec-1b359fb36d12",
             input: "grid = [[1,1,1],[1,0,1],[1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7571fd8d-8004-4a3c-9ee2-3f31b5436974",
             input: "grid = [[3,2],[0,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a7212bb9-2606-4e7d-9229-9ed14e74c192",
             input: "grid = [[1,2],[3,4]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "3f58c8a4-4f04-4bd9-8297-15caadc4be6f",
             input: "grid = [[0,1,2],[3,4,5],[6,7,8]]",
             expected: "8", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "swim-in-rising-water"
            let topic = "misc"
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
            let result = solution.swimInWater(p_grid)
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
