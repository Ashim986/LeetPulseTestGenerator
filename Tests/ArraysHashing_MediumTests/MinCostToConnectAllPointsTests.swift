import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinCostToConnectAllPoints {
    private class Solution {
        func minCostConnectPoints(_ points: [[Int]]) -> Int {
            let n = points.count
            var visited = [Bool](repeating: false, count: n)
            var minCost = [Int](repeating: Int.max, count: n)
            minCost[0] = 0
            var totalCost = 0

            for _ in 0..<n {
                var minIdx = -1
                var minVal = Int.max
                for j in 0..<n {
                    if !visited[j] && minCost[j] < minVal {
                        minVal = minCost[j]
                        minIdx = j
                    }
                }

                visited[minIdx] = true
                totalCost += minVal

                for j in 0..<n {
                    if !visited[j] {
                        let dist = abs(points[minIdx][0] - points[j][0]) +
                                   abs(points[minIdx][1] - points[j][1])
                        minCost[j] = min(minCost[j], dist)
                    }
                }
            }

            return totalCost
        }
    }

    @Suite struct MinCostToConnectAllPointsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d62616b0-30c4-4c95-baa5-08c3a205dee1",
             input: "points = [[0,0],[0,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d48a9e54-cee4-4f60-8a80-aa42758840f4",
             input: "points = [[0,0],[1,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fa760997-9402-4f27-b847-6b14614e47da",
             input: "points = [[0,0],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4ecc8645-9895-44ea-a0da-03813e314484",
             input: "points = [[1,1],[2,2],[3,3]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "26a5d2d2-7d38-4845-86e5-464ba25fe7fd",
             input: "points = [[-1,-1],[1,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "efb62ace-d548-4724-be68-c906af0fd2c4",
             input: "points = [[0,0],[0,0],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4e7896d0-657e-4d88-8a1e-8c867778b44d",
             input: "points = [[1,1],[1,1],[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "803e4e3a-4624-487e-bd90-c19f7b9d1960",
             input: "points = [[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2699aa84-7410-498e-af88-f7500a485858",
             input: "points = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "94b9c91d-9c6d-4cca-bd6d-dd66a991aaf2",
             input: "points = [[0,0],[0,0],[0,0],[0,0],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a758ce08-e8c5-4a09-a379-bc0462110be9",
             input: "points = [[1,1],[1,1],[1,1],[1,1],[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "645d6802-018d-4ae7-b315-06d03d21a25f",
             input: "points = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "70ecc5dd-9d36-4174-915a-84787415bfe0",
             input: "points = [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f1964304-0d8b-459d-8a49-c4e8674dc4b8",
             input: "points = [[-10,-10],[10,10]]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "cde2959b-567a-4be0-a309-f9801c586631",
             input: "points = [[0,0],[1,1],[2,2],[3,3]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "316e0363-8ea4-4518-9825-68311b410126",
             input: "points = [[-1,-1],[0,0],[1,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "c5c65633-dc96-4e1e-bb87-13cd976e981e",
             input: "points = [[-10,-10],[0,0],[10,10]]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "e72c9c0c-3751-47fc-a416-bfde0169bc8d",
             input: "points = [[1,1],[2,2],[3,3],[4,4],[5,5]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "b7c6389c-f012-44b7-be35-25e50ecc11dc",
             input: "points = [[-1,-1],[0,0],[1,1],[2,2],[3,3]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "a2e8f44f-ca5b-472c-884f-12d9736fbe36",
             input: "points = [[-10,-10],[0,0],[10,10],[20,20],[30,30]]",
             expected: "80", orderMatters: true),
            TestCaseData(id: "7b65b3a8-32a0-43b2-9d46-9fd3f9ccf47c",
             input: "points = [[0,0],[0,1],[0,2],[0,3],[0,4]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2f34db3b-748b-4dda-b601-19c265a30061",
             input: "points = [[0,0],[1,0],[2,0],[3,0],[4,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "758b7a2a-6b32-49c6-b2ba-0f57389f6815",
             input: "points = [[-100,-100],[0,0],[100,100]]",
             expected: "400", orderMatters: true),
            TestCaseData(id: "4139bed7-8943-4205-9a51-3568f3ac3890",
             input: "points = [[-1000,-1000],[0,0],[1000,1000]]",
             expected: "4000", orderMatters: true),
            TestCaseData(id: "5dba6bcd-6b6b-4e82-a486-e01558b1fe2b",
             input: "points = [[-10000,-10000],[0,0],[10000,10000]]",
             expected: "40000", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "min-cost-to-connect-all-points"
            let topic = "arrays-hashing"
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

            guard let p_points = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_points.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: points 2D array too large (\(p_points.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_points.count >= 1 && p_points.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= points.length <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.minCostConnectPoints(p_points)
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
