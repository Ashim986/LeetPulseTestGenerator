import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTriangle {
    private class Solution {
        func minimumTotal(_ triangle: [[Int]]) -> Int {
            let n = triangle.count
            var dp = triangle[triangle.count - 1]
            for i in stride(from: n - 2, to: -1, by: -1) {
                for j in 0..<triangle[i].count {
                    dp[j] = triangle[i][j] + min(dp[j], dp[j + 1])
                }
            }
            return dp[0]
        }
    }

    @Suite struct TriangleTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d8082cf8-8fdc-4cc1-be36-0b5a9c11fa80",
             input: "triangle = [[1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c56db6c6-2ff6-4d2f-834b-cd9021b6dcb9",
             input: "triangle = [[1],[2,3]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "61c56c8b-3e9e-47d5-956f-3dfef26b3e09",
             input: "triangle = [[1],[2,3],[4,5,6]]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "12373184-2b3c-4ba5-98d2-842acfb018ea",
             input: "triangle = [[-1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "d56d60d7-0a0d-4006-9e10-1a0b53b83b73",
             input: "triangle = [[0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "41fc15c5-9463-497a-a277-14f5a9b7ecaa",
             input: "triangle = [[1],[1,1],[1,1,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c64362db-fef0-4430-af46-7c22fbeb9f9b",
             input: "triangle = [[1],[2,2],[3,3,3]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "ced5e97b-b3d6-43d8-83f3-1d0ce472e964",
             input: "triangle = [[-1],[0,0],[1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "35264c08-1245-4791-b061-09ce4e4c4b16",
             input: "triangle = [[1],[1,1],[1,1,1],[1,1,1,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "04503fd5-4f57-44dc-bdd7-568169193866",
             input: "triangle = [[1],[1,1],[1,1,1],[1,1,1,1],[1,1,1,1,1]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "8fcb2d97-9e68-43d1-9f6b-f67de42cf302",
             input: "triangle = [[1],[2,1],[1,2,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a9805a6a-1041-46c3-83fd-2b8763395910",
             input: "triangle = [[1],[1,2],[2,1,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "7fff5584-0dbf-4bab-b10b-2c989f24a8cf",
             input: "triangle = [[1],[1,1],[1,1,1],[1,1,1,1],[1,1,1,1,1],[1,1,1,1,1,1]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "db20d203-4fb1-40e5-b821-42ddae90baad",
             input: "triangle = [[1],[1,1],[1,1,1],[1,1,1,1],[1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1,1]]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "fc39fdaa-466b-469e-9a03-eef6354afeac",
             input: "triangle = [[1],[2,1],[1,2,1],[1,1,1,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "79624ead-91bb-4728-a5c6-484e9ab07ec6",
             input: "triangle = [[1],[1,2],[2,1,1],[1,1,1,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "37181e27-20cb-404f-a5f0-0c3976989de5",
             input: "triangle = [[1],[1,1],[1,1,1],[1,1,1,1],[1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "e701743d-74c2-4d74-9bf4-15f2b5446516",
             input: "triangle = [[1],[2,1],[1,2,1],[1,1,1,1],[1,1,1,1,1]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e22d63f7-c670-4790-b8d4-0a3d3d9d2513",
             input: "triangle = [[1],[1,2],[2,1,1],[1,1,1,1],[1,1,1,1,1]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "731c3909-2ae1-42e4-a21a-8ad8656ad5f6",
             input: "triangle = [[1],[2,3],[4,5,6],[7,8,9,10]]",
             expected: "14", orderMatters: true),
            TestCaseData(id: "e86248cd-831c-45eb-aac0-2fce2dac10d4",
             input: "triangle = [[-10],[20,30],[40,50,60]]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "86d2cace-0b2d-460b-99ce-fe6c3d8e2228",
             input: "triangle = [[-1],[1,1],[1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6f764d32-29c9-42b2-8fac-de2a45fe1d93",
             input: "triangle = [[1000],[2000,3000],[4000,5000,6000]]",
             expected: "7000", orderMatters: true),
            TestCaseData(id: "629ea870-3d0e-4477-a8ab-dfe4d854c69c",
             input: "triangle = [[-1000],[2000,3000],[4000,5000,6000]]",
             expected: "5000", orderMatters: true),
            TestCaseData(id: "4c410b15-a235-47a0-94e5-dbb97df2b25a",
             input: "triangle = [[1],[2,3],[4,5,6],[7,8,9,10],[11,12,13,14,15]]",
             expected: "25", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "triangle"
            let topic = "dynamic-programming"
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

            guard let p_triangle = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_triangle.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: triangle 2D array too large (\(p_triangle.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_triangle.count >= 1 && p_triangle.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= triangle.length <= 200"
                )
                return
            }
            guard p_triangle.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: triangle[0].length == 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.minimumTotal(p_triangle)
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
