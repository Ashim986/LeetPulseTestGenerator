import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCIslandPerimeter {
    private class Solution {
        func islandPerimeter(_ grid: [[Int]]) -> Int {
            let m = grid.count
            let n = grid[0].count
            var perimeter = 0
            for i in 0..<m {
                for j in 0..<n {
                    if grid[i][j] == 1 {
                        let neighbors = [(i-1,j), (i+1,j), (i,j-1), (i,j+1)]
                        for (x, y) in neighbors {
                            if x < 0 || y < 0 || x >= m || y >= n || grid[x][y] == 0 {
                                perimeter += 1
                            }
                        }
                    }
                }
            }
            return perimeter
        }
    }

    @Suite struct IslandPerimeterTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1c28e90e-9031-47cb-9264-f717731ab08d",
             input: "grid = [[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2d0c00ff-fbd6-45b5-bd05-796e78485a7a",
             input: "grid = [[1,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "c9a4e0c3-7cbd-4d2b-93d6-26b32eefcbff",
             input: "grid = [[0,0,0,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "c798c76f-26b6-4a0b-bf6a-2bfcba679842",
             input: "grid = [[1,1,0,0]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "72e3d289-0041-42e4-9e3b-e90b863e5930",
             input: "grid = [[0,0,0,0],[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "be31e2fc-4208-4754-a009-98f4ebe73291",
             input: "grid = [[0,1,1,0],[0,1,1,0]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "8cb8c2e6-a477-4c9c-91bf-ad904d6b7100",
             input: "grid = [[1,0,1,0],[1,0,1,0]]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "39f7b742-ae8c-4908-bbd1-60611fb770b2",
             input: "grid = [[0,0,0,0],[0,1,1,0],[0,1,1,0],[0,0,0,0]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "57453b39-6971-4a4e-8cdf-bf35337e7a12",
             input: "grid = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6a0e3f77-1ddb-41b7-b488-4fcc5a68dcd5",
             input: "grid = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "a440c1c8-11c3-4562-a96a-a37cde040c4b",
             input: "grid = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "8ca253e6-54c8-4757-a35f-0c5e5eebb39c",
             input: "grid = [[1,1,0,0],[1,1,0,0],[1,1,0,0],[1,1,0,0]]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "fcdd9b73-a47b-4e5e-881b-84677e1c0c27",
             input: "grid = [[0,0,1,1],[0,0,1,1],[0,0,1,1],[0,0,1,1]]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "3960d398-7bf8-4c8c-910f-441e2f17f03e",
             input: "grid = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,0,0,0]]",
             expected: "14", orderMatters: true),
            TestCaseData(id: "a16d991e-0834-4abf-bd1b-8a927da0ffbc",
             input: "grid = [[0,0,0,0],[0,1,0,0],[0,1,0,0],[0,1,0,0]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "4c641886-69c4-4abe-b30f-33cd874beb24",
             input: "grid = [[1,0],[0,1]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "099b67c3-7612-4759-a4bd-a28a04f5d74f",
             input: "grid = [[1,1],[1,1]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "3dd48ca8-ee40-44b0-8872-38161bc8d81f",
             input: "grid = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "271a74d1-2b3e-422b-9bc4-59ef0b670e41",
             input: "grid = [[1,1,1,1],[1,1,1,1]]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "200533b5-a423-4400-b658-4dd73e6d29f1",
             input: "grid = [[1,1,1,1],[1,0,0,1],[1,0,0,1],[1,1,1,1]]",
             expected: "24", orderMatters: true),
            TestCaseData(id: "3149ce27-5ebe-42fc-9f36-5bfb68727eb8",
             input: "grid = [[0,1,0,0],[0,1,0,0],[0,1,0,0],[0,1,0,0]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d2156d93-e1a1-4064-886f-89c31521616e",
             input: "grid = [[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "8a579b3d-3188-46ba-97e6-329aa4e43386",
             input: "grid = [[1,1,1,1],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "b4fa576b-9b1f-493c-9f4d-2264771b5e2f",
             input: "grid = [[0,0,0,0],[0,0,0,0],[1,1,1,1],[0,0,0,0]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "19097a75-304c-4b8c-87fd-863de343386d",
             input: "grid = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[1,1,1,1]]",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "island-perimeter"
            let topic = "arrays-hashing"
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

            guard let p_grid = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_grid.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_grid.count >= 1 && p_grid.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= row, col <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.islandPerimeter(p_grid)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
