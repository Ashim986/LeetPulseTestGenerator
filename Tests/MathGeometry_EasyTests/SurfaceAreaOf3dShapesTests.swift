import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSurfaceAreaOf3dShapes {
    private class Solution {
        func surfaceArea(grid: [[Int]]) -> Int {
          var area = 0
          let rows = grid.count
          let cols = grid[0].count

          for i in 0..<rows {
            for j in 0..<cols {
              if grid[i][j] > 0 {
                area += 4 * grid[i][j] + 2
                if i > 0 {
                  area -= 2 * min(grid[i][j], grid[i - 1][j])
                }
                if j > 0 {
                  area -= 2 * min(grid[i][j], grid[i][j - 1])
                }
              }
            }
          }
          return area
        }
    }

    @Suite struct SurfaceAreaOf3dShapesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "584de7d6-f11e-48d6-b276-c071d86813fc",
             input: "grid = [[0,0,0],[0,0,0],[0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e0c10674-32f3-4697-93f6-26ccd4188058",
             input: "grid = [[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "35dad399-c4cb-4f97-bdc4-070b8adf71dd",
             input: "grid = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1aa89617-0227-489d-8879-c03ed6fb0ba4",
             input: "grid = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "405123bb-e60f-444f-aaa5-cdd433807cbb",
             input: "grid = [[1,0,0],[0,1,0],[0,0,1]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "35797100-2812-467b-ab0f-f6e95165b72d",
             input: "grid = [[1,1,0],[1,1,0],[0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ae75fad7-db82-40c6-bf3b-ad46db4b6a3b",
             input: "grid = [[0,1,1],[1,1,0],[0,0,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "fad01eff-9314-424d-a4d3-67a3718ffe0f",
             input: "grid = [[2,2,2],[2,2,2],[2,2,2]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "8d835559-f6c4-42a2-bc48-6bca1612f7c1",
             input: "grid = [[1,2,3],[4,5,6],[7,8,9]]",
             expected: "66", orderMatters: true),
            TestCaseData(id: "58e1df01-9839-4e41-bc3b-5409baf1b8d6",
             input: "grid = [[10,10,10],[10,10,10],[10,10,10]]",
             expected: "102", orderMatters: true),
            TestCaseData(id: "db380dce-21b9-40e1-8f60-0db5b7a009c8",
             input: "grid = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "8d6838fd-eb0d-410e-8f18-0ea1e0e024b9",
             input: "grid = [[1,0,1,0],[0,1,0,1],[1,0,1,0],[0,1,0,1]]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "c7c91c8e-8001-4791-848b-d48faaac1bb1",
             input: "grid = [[1,1,1],[1,0,1],[1,1,1]]",
             expected: "32", orderMatters: true),
            TestCaseData(id: "3e0214a8-3851-4d79-869c-ea040bd02004",
             input: "grid = [[0,1,0],[1,0,1],[0,1,0]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "21ec2b1c-22f3-4c09-acc8-30cde6be3dd3",
             input: "grid = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "596cf541-c606-494c-abea-30dbe2a4692c",
             input: "grid = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "97e5b590-2754-451e-9694-6ac7a2c067d1",
             input: "grid = [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "ceaa55c3-3221-4119-b810-1cee505ec69a",
             input: "grid = [[1,1,1,1,1],[0,0,0,0,0],[1,1,1,1,1],[0,0,0,0,0],[1,1,1,1,1]]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "63cef3d3-5362-4086-8fe2-bcd98e4b116d",
             input: "grid = [[1,0,1,0,1],[0,1,0,1,0],[1,0,1,0,1],[0,1,0,1,0],[1,0,1,0,1]]",
             expected: "26", orderMatters: true),
            TestCaseData(id: "bbc03da3-28b3-43ea-a413-c9be705fbcf5",
             input: "grid = [[0,0,0],[0,5,0],[0,0,0]]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "b9e10049-a996-4713-9e49-c4f2a4305904",
             input: "grid = [[0,0,0],[0,10,0],[0,0,0]]",
             expected: "38", orderMatters: true),
            TestCaseData(id: "32b62222-022c-40c6-98e8-89350d41f98b",
             input: "grid = [[0,0,0,0,0],[0,10,10,10,0],[0,10,10,10,0],[0,10,10,10,0],[0,0,0,0,0]]",
             expected: "102", orderMatters: true),
            TestCaseData(id: "60c4998c-447e-44c1-97b7-aa4b32b9a45e",
             input: "grid = [[0,0,0,0,0],[0,1,1,1,0],[0,1,0,1,0],[0,1,1,1,0],[0,0,0,0,0]]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "4c144a36-83fb-4eb8-888a-dc178362667d",
             input: "grid = [[0,0,0,0,0],[0,1,1,1,0],[0,1,10,1,0],[0,1,1,1,0],[0,0,0,0,0]]",
             expected: "46", orderMatters: true),
            TestCaseData(id: "ae222676-faf8-44f8-be79-e3c606aa0d24",
             input: "grid = [[1,1,1],[1,10,1],[1,1,1]]",
             expected: "46", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "surface-area-of-3d-shapes"
            let topic = "math-geometry"
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
            let result = solution.surfaceArea(grid: p_grid)
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
