import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaxIncreaseToKeepCitySkyline {
    private class Solution {
        func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
          let m = grid.count
          let n = grid[0].count
          var rowMax = [Int](repeating: 0, count: m)
          var colMax = [Int](repeating: 0, count: n)
          for i in 0..<m {
            for j in 0..<n {
              rowMax[i] = max(rowMax[i], grid[i][j])
              colMax[j] = max(colMax[j], grid[i][j])
            }
          }
          var res = 0
          for i in 0..<m {
            for j in 0..<n {
              res += min(rowMax[i], colMax[j]) - grid[i][j]
            }
          }
          return res
        }
    }

    @Suite struct MaxIncreaseToKeepCitySkylineTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c3279eb9-9f19-440e-b8ab-994b9aac4cc3",
             input: "grid = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "97ef516d-37e1-4be4-aa4f-01a5f72b88dc",
             input: "grid = [[5,5,5],[5,5,5],[5,5,5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2bc6c366-a993-49ae-8332-3c5c1186248e",
             input: "grid = [[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "02d48cf4-13aa-47bd-80e6-be3d6216ee1e",
             input: "grid = [[10,10,10],[10,10,10],[10,10,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "232d771a-838f-4c84-b0cb-b064f16d1f63",
             input: "grid = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "72f6acdb-b626-42d8-b6d0-b8a81a718b4a",
             input: "grid = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "504adb0f-4015-4110-b358-8de55ca2e0c0",
             input: "grid = [[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1ee3a7e9-f7e3-40c0-b791-d696100a0871",
             input: "grid = [[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "372e6a07-52a8-4c76-8305-ba74a9095026",
             input: "grid = [[10,10,10,10,10,10],[10,10,10,10,10,10],[10,10,10,10,10,10],[10,10,10,10,10,10],[10,10,10,10,10,10],[10,10,10,10,10,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8d21e6ef-4e54-4234-a585-a6b4f0223975",
             input: "grid = [[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4b221fbe-2a2d-4045-9840-d3ddf2ad40ee",
             input: "grid = [[10,10,10,10,10,10,10],[10,10,10,10,10,10,10],[10,10,10,10,10,10,10],[10,10,10,10,10,10,10],[10,10,10,10,10,10,10],[10,10,10,10,"
                + "10,10,10],[10,10,10,10,10,10,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "de272586-955c-4bad-917d-2bc7878d6687",
             input: "grid = [[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1"
                + ",1,1,1,1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4f84a2d3-f6ac-4242-b37f-b0cb15059062",
             input: "grid = [[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10"
                + "],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10],[10,10,10,10,10,10,10,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "09a368b2-88fa-475c-9cfc-d90500b7fc84",
             input: "grid = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]",
             expected: "-24", orderMatters: true),
            TestCaseData(id: "64c52a10-e821-4c0e-b64e-5f78fa4efed2",
             input: "grid = [[16,15,14,13],[12,11,10,9],[8,7,6,5],[4,3,2,1]]",
             expected: "-24", orderMatters: true),
            TestCaseData(id: "b36c1672-7d5e-4245-a012-172178978ea2",
             input: "grid = [[10,20,30,40,50],[50,40,30,20,10],[10,20,30,40,50],[50,40,30,20,10],[10,20,30,40,50]]",
             expected: "-500", orderMatters: true),
            TestCaseData(id: "e128721f-ac74-41f8-9f73-7abc8aca6ad8",
             input: "grid = [[1,2,3],[4,5,6],[7,8,9]]",
             expected: "-9", orderMatters: true),
            TestCaseData(id: "cc922346-2487-4d14-a89a-755b86561441",
             input: "grid = [[9,8,7],[6,5,4],[3,2,1]]",
             expected: "-9", orderMatters: true),
            TestCaseData(id: "ad083198-1714-4ae9-860b-c689e315af14",
             input: "grid = [[1,1,1],[1,10,1],[1,1,1]]",
             expected: "-9", orderMatters: true),
            TestCaseData(id: "ef0ac282-3680-4dcd-97ac-557a43ce186d",
             input: "grid = [[10,1,1],[1,10,1],[1,1,10]]",
             expected: "-27", orderMatters: true),
            TestCaseData(id: "b7b87ca0-16a7-412a-b3de-a57be78a8fcd",
             input: "grid = [[1,10,1],[1,1,1],[1,1,10]]",
             expected: "-18", orderMatters: true),
            TestCaseData(id: "35d0237e-3dbd-4bbe-af42-bcdd1eb1f6d9",
             input: "grid = [[1,1,10],[1,1,1],[10,1,1]]",
             expected: "-18", orderMatters: true),
            TestCaseData(id: "7db8f58a-5927-4cc0-a8b2-6087f1ac054b",
             input: "grid = [[1,1,1],[1,10,1],[10,1,10]]",
             expected: "-18", orderMatters: true),
            TestCaseData(id: "ca2e5fe4-7234-419f-aea9-4f74968caaac",
             input: "grid = [[10,10,10],[1,1,1],[10,10,10]]",
             expected: "-18", orderMatters: true),
            TestCaseData(id: "8e98d31b-c731-4a40-8ad3-45e3d868f036",
             input: "grid = [[1,1,1],[10,10,10],[1,1,1]]",
             expected: "-18", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "max-increase-to-keep-city-skyline"
            let topic = "greedy"
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
            guard p_grid.count >= 2 && p_grid.count <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= n <= 50"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxIncreaseKeepingSkyline(p_grid)
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
