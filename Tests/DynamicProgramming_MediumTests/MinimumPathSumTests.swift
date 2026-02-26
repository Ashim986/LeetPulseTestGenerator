import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumPathSum {
    private class Solution {
        func minPathSum(_ grid: [[Int]]) -> Int {
            let m = grid.count
            let n = grid[0].count
            var dp = [Int](repeating: 0, count: n)

            // Initialize with first row
            dp[0] = grid[0][0]
            for j in 1..<n {
                dp[j] = dp[j-1] + grid[0][j]
            }

            // Process remaining rows
            for i in 1..<m {
                dp[0] += grid[i][0]  // First column: only from above
                for j in 1..<n {
                    dp[j] = grid[i][j] + min(dp[j], dp[j-1])
                }
            }

            return dp[n-1]
        }
    }

    @Suite struct MinimumPathSumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3353bf97-5bcb-48d9-b47a-33529b9c2527",
             input: "grid = [[1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ddd48afa-0d72-4541-a43e-e03d91530717",
             input: "grid = [[1,2]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ba8de653-7c15-446c-983c-044921b28d18",
             input: "grid = [[1],[2]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9ecbf3ba-b216-4248-8aac-a8ecc245126b",
             input: "grid = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2824786d-84cf-4351-9208-32bec0bb0aaf",
             input: "grid = [[0,0,0],[0,0,0],[0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5e1ce7c1-d3e5-4193-9d13-d37643a158a8",
             input: "grid = [[1],[2],[3],[4],[5]]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "522ff98e-d59e-4fde-b152-ea62ff6c776b",
             input: "grid = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "e7c8c6ad-091f-4e81-9d51-e1c2ed858ab4",
             input: "grid = [[1,2,3],[4,5,6],[7,8,9]]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "7e8c4b5b-68c4-48fe-9546-97831f58f823",
             input: "grid = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]]",
             expected: "55", orderMatters: true),
            TestCaseData(id: "820607ba-50d8-48fb-9815-e36ec32b751b",
             input: "grid = [[10],[20],[30],[40],[50],[60],[70],[80],[90],[100]]",
             expected: "550", orderMatters: true),
            TestCaseData(id: "f6946043-465f-46df-b298-1bc2fa81fa37",
             input: "grid = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20]]",
             expected: "210", orderMatters: true),
            TestCaseData(id: "3ddc7d26-1ddc-4286-8847-42b19169231e",
             input: "grid = [[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "23561d75-6fae-425e-94d6-1fab3157de93",
             input: "grid = [[-1,-2,-3],[-4,-5,-6]]",
             expected: "-16", orderMatters: true),
            TestCaseData(id: "b60618cd-52bc-4d25-84a3-91c49c03905c",
             input: "grid = [[10,20,30],[40,50,60]]",
             expected: "120", orderMatters: true),
            TestCaseData(id: "22540b0b-9691-41b3-813e-372653f28b75",
             input: "grid = [[1,2,3,4,5],[6,7,8,9,10]]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "fa66dfd7-d028-4a40-a885-8fc6dec32c17",
             input: "grid = [[5,4,3,2,1],[1,2,3,4,5]]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "e7c8212f-ba2a-4124-bc4c-3c2c7dbbe98e",
             input: "grid = [[100,200,300],[400,500,600]]",
             expected: "1200", orderMatters: true),
            TestCaseData(id: "1abfdd31-f1ce-4988-8617-2af9edc78f23",
             input: "grid = [[-100,-200,-300],[-400,-500,-600]]",
             expected: "-1600", orderMatters: true),
            TestCaseData(id: "9dcad9b0-adf7-4cc6-986f-ccd119e4fb98",
             input: "grid = [[1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1]]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "3c4c2276-fd84-4f9b-a418-bdbb4aaa1dd5",
             input: "grid = [[1,2,3,4,5,6,7,8,9,10],[10,9,8,7,6,5,4,3,2,1]]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "d3cf39ee-7fc7-4426-b3f8-7514f97cb79d",
             input: "grid = [[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10],[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]]",
             expected: "-56", orderMatters: true),
            TestCaseData(id: "4fb40282-32d2-45d1-a06f-880512ba2cc8",
             input: "grid = [[1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1]]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "1e696626-c8fb-4cdf-9fcd-a7c23b9824b9",
             input: "grid = [[1,2,3,4,5,6,7,8,9,10],[11,12,13,14,15,16,17,18,19,20],[21,22,23,24,25,26,27,28,29,30]]",
             expected: "105", orderMatters: true),
            TestCaseData(id: "9eee2664-9db9-4d51-a722-15b78472b30e",
             input: "grid = [[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1],[1]]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "4152df40-10cf-417a-b3f8-3924275e3e8d",
             input: "grid = [[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10]]",
             expected: "200", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-path-sum"
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
            let result = solution.minPathSum(p_grid)
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
