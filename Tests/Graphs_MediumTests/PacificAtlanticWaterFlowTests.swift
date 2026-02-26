import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPacificAtlanticWaterFlow {
    private class Solution {
        func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
            guard !heights.isEmpty else { return [] }
            let m = heights.count, n = heights[0].count
            var pacific = Set<[Int]>()
            var atlantic = Set<[Int]>()

            func bfs(_ starts: [[Int]], _ reachable: inout Set<[Int]>) {
                var queue = starts
                for s in starts { reachable.insert(s) }
                let dirs = [(0,1),(0,-1),(1,0),(-1,0)]

                while !queue.isEmpty {
                    let curr = queue.removeFirst()
                    for (dr, dc) in dirs {
                        let nr = curr[0] + dr, nc = curr[1] + dc
                        if nr >= 0 && nr < m && nc >= 0 && nc < n &&
                           !reachable.contains([nr, nc]) &&
                           heights[nr][nc] >= heights[curr[0]][curr[1]] {
                            reachable.insert([nr, nc])
                            queue.append([nr, nc])
                        }
                    }
                }
            }

            var pacificStarts = [[Int]]()
            var atlanticStarts = [[Int]]()
            for i in 0..<m {
                pacificStarts.append([i, 0])
                atlanticStarts.append([i, n-1])
            }
            for j in 0..<n {
                pacificStarts.append([0, j])
                atlanticStarts.append([m-1, j])
            }

            bfs(pacificStarts, &pacific)
            bfs(atlanticStarts, &atlantic)

            return Array(pacific.intersection(atlantic))
        }
    }

    @Suite struct PacificAtlanticWaterFlowTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "97d2e226-f1a8-419f-af7d-3de364376673",
             input: "heights = [[1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5"
                + ",6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10]]",
             expected: "[[0,9],[1,9],[2,9],[3,9],[4,9],[5,9],[6,9],[7,9],[8,9],[9,0],[9,1],[9,2],[9,3],[9,4],[9,5],[9,6],[9,7],[9,8],[9,9]]", orderMatters: true),
            TestCaseData(id: "7e5efc10-4c1b-45d4-99ed-0f9f81ec9705",
             input: "heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]",
             expected: "[[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]", orderMatters: true),
            TestCaseData(id: "dda1ba1e-828e-49ab-9a00-e0d96f2fbc5b",
             input: "heights = [[1]]",
             expected: "[[0,0]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "pacific-atlantic-water-flow"
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

            guard let p_heights = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_heights.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: heights 2D array too large (\(p_heights.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.pacificAtlantic(p_heights)
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
            }
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
