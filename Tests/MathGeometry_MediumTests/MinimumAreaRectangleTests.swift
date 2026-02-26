import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumAreaRectangle {
    private class Solution {
        func minAreaRect(_ points: [[Int]]) -> Int {
            var pointsSet = Set<[Int]>()
            for point in points {
                pointsSet.insert(point)
            }
            var minArea = Int.max
            for i in 0..<points.count {
                for j in i+1..<points.count {
                    let p1 = points[i]
                    let p2 = points[j]
                    if p1[0] == p2[0] {
                        continue
                    }
                    if pointsSet.contains([p1[0], p2[1]]) && pointsSet.contains([p2[0], p1[1]]) {
                        let area = abs(p1[0]-p2[0]) * abs(p1[1]-p2[1])
                        if area < minArea {
                            minArea = area
                        }
                    }
                }
            }
            return minArea != Int.max ? minArea : 0
        }
    }

    @Suite struct MinimumAreaRectangleTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b613f9e5-9329-4c48-b630-2bd04c470174",
             input: "points = [[1,1],[2,2],[3,3],[4,4]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e91b0583-ae99-48b1-8175-9001e47b939f",
             input: "points = [[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0e51ae66-ff8b-47b6-9832-051ebe6a6d90",
             input: "points = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "81249252-99b8-4eaa-bfa8-9172ac5fce86",
             input: "points = [[1,1],[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6b0bd69f-bdd8-46d5-986b-456af23c5d4a",
             input: "points = [[-10,-10],[10,10],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "da455615-0bdd-4aa4-b02c-bcfe2f780410",
             input: "points = [[-100,-100],[100,100],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b1256d77-58dd-468b-8d84-a2253aad03ca",
             input: "points = [[-1000,-1000],[1000,1000],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c28db8d2-99a5-46d8-a8f3-9b3fb00fb113",
             input: "points = [[-10000,-10000],[10000,10000],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b3bc7820-58c7-43d5-a6d7-0df2ac9191cf",
             input: "points = [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8],[9,9],[10,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bb0a03a7-48aa-4e7d-9086-ecf8ef0be41d",
             input: "points = [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8],[9,9],[10,10],[11,11],[12,12]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6705b8f5-66ac-48a1-a39c-268575e8109e",
             input: "points = [[1,1],[1,2],[2,1],[2,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "42c52435-1ab8-4c58-b5bb-13f532e2da64",
             input: "points = [[0,0],[0,1],[1,0],[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "267f7d37-0852-4371-a400-cd9fe9fee32b",
             input: "points = [[1,1],[1,2],[2,1],[2,2],[3,3]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "92123ce0-a166-4a2d-a51e-dbfb739925ea",
             input: "points = [[1,1],[2,2],[1,2],[2,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "165a89e2-8831-4e38-9521-452bbe7a5f52",
             input: "points = [[-1,-1],[1,1],[1,-1],[-1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "10ddc0f4-02d8-42a9-97f0-e58cf9b0df71",
             input: "points = [[-1,0],[0,0],[1,0],[0,1],[0,-1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "45336650-e76b-453c-b4a6-c544b7bb3359",
             input: "points = [[1,1],[1,2],[1,3],[2,1],[2,2],[2,3]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "854a47ef-254a-49b3-a3a8-06c8a1b18341",
             input: "points = [[1,1],[1,2],[2,1],[2,2],[1,3],[2,3],[3,1],[3,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ee0d5802-615c-48b1-ae90-300c1624e0c2",
             input: "points = [[1,1],[1,2],[2,1],[2,2],[3,3],[3,4],[4,3],[4,4]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e3df9dc2-2d05-4023-b551-38403ffa6a8f",
             input: "points = [[1,1],[1,2],[1,3],[1,4],[2,1],[2,2],[2,3],[2,4]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "934b2f26-c25f-4022-bf50-91873cd58df3",
             input: "points = [[1,1],[2,1],[3,1],[4,1],[1,2],[2,2],[3,2],[4,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6e8e6f86-f60c-4388-ab69-6514e0493068",
             input: "points = [[1,1],[1,2],[1,3],[1,4],[1,5],[2,1],[2,2],[2,3],[2,4],[2,5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ae022705-979c-4154-8053-9f13e900b46a",
             input: "points = [[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3c653a6f-5bc9-48bf-9061-8071016c3169",
             input: "points = [[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ec1e2827-cafb-4518-bd51-f12ef8d5a942",
             input: "points = [[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8]]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-area-rectangle"
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
            guard p_points.count >= 1 && p_points.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= points.length <= 500"
                )
                return
            }
            guard p_points.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: points[i].length == 2"
                )
                return
            }

            let solution = Solution()
            let result = solution.minAreaRect(p_points)
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
