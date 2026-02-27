import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumNumberOfArrowsToBurstBalloons {
    private class Solution {
        func findMinArrowShots(_ points: [[Int]]) -> Int {
            if points.count == 0 {
                return 0
            }

            let sortedPoints = points.sorted { $0[1] < $1[1] }
            var arrowPos = sortedPoints[0][1]
            var arrowCount = 1

            for point in sortedPoints {
                if point[0] > arrowPos {
                    arrowPos = point[1]
                    arrowCount += 1
                }
            }

            return arrowCount
        }
    }

    @Suite struct MinimumNumberOfArrowsToBurstBalloonsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3d585de0-68e2-4da0-9300-61cd312a7dae",
             input: "points = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "802827a6-f48a-4147-94ab-fed1ecee0df8",
             input: "points = [[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fe9c7974-5a41-444e-a7aa-e5e0a452ea9c",
             input: "points = [[1,2],[2,3],[3,4]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8169f5d7-ea9f-42d9-8a3a-a9cbff232a64",
             input: "points = [[1,2],[1,2],[1,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d6b9cc92-1e81-4bb4-ae23-d688e8cd1e7b",
             input: "points = [[-1,1],[-2,2],[-3,3]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "15682fe1-ca2b-4222-84ce-6b23b54e2f03",
             input: "points = [[1,1000],[2,1000],[3,1000]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5a70de2c-1979-48a0-a414-a3fdd9b24989",
             input: "points = [[-1000,-1],[-1000,-2],[-1000,-3]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "802bd734-a3ab-4006-af41-3f00a9d39a39",
             input: "points = [[1,1],[2,2],[3,3],[4,4],[5,5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ba12a62c-eeb2-4548-8ea8-db58e53f3f0c",
             input: "points = [[1,10],[2,9],[3,8],[4,7],[5,6]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e9f8a20c-e26a-4b30-b42d-3d7db6da265e",
             input: "points = [[10,1],[9,2],[8,3],[7,4],[6,5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "02aab7fc-2621-4f9c-a8bf-c206d5e9e649",
             input: "points = [[1,1],[1,1],[1,1],[1,1],[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "214db880-94b7-43b7-8390-0bdd6e6a40ad",
             input: "points = [[1,10],[1,10],[1,10],[1,10],[1,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7bfcd38f-3687-4f86-a550-f67b2d71fb80",
             input: "points = [[1,2],[3,4],[5,6],[7,8],[9,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "113ce3b9-7920-45c8-b503-14c56b610536",
             input: "points = [[10,1],[8,2],[6,3],[4,4],[2,5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "345b4076-c336-4005-9dea-4719c7e8cba4",
             input: "points = [[1,2],[2,3],[3,4],[4,5],[5,6]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "04d973eb-0d59-4f33-b8f2-c108d0a8b1a3",
             input: "points = [[1,10],[2,9],[3,8],[4,7],[5,6],[6,5],[7,4],[8,3],[9,2],[10,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "34bb9eec-1011-4d0b-91be-5a33bc72c050",
             input: "points = [[1,1],[1,2],[1,3],[1,4],[1,5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9b34ad8d-74b1-4cc9-b751-026789b53cf8",
             input: "points = [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8],[9,9],[10,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c1ef666c-5340-4b57-86db-b75f5ec86615",
             input: "points = [[1,10],[2,9],[3,8],[4,7],[5,6],[6,5],[7,4],[8,3],[9,2],[10,1],[11,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9ad5d6a2-e12b-4bf5-9176-bb3551059ba5",
             input: "points = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "da8051e7-e771-44ce-8b55-00470d123d1e",
             input: "points = [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8],[9,9],[10,10],[11,11],[12,12]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ce984aa6-bbcd-4f96-8136-30c45da87a93",
             input: "points = [[1,100],[2,99],[3,98],[4,97],[5,96]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "70f63c60-7519-4096-be95-7dc1ef18eab3",
             input: "points = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "95ed87bf-a7b7-4e5f-9815-c47194decc9e",
             input: "points = [[1,10],[2,9],[3,8],[4,7],[5,6],[6,5],[7,4],[8,3],[9,2],[10,1],[11,11]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "060f9c4b-53ae-4755-ad87-ba592777cab3",
             input: "points = [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-number-of-arrows-to-burst-balloons"
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

            guard let p_points = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_points.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: points 2D array too large (\(p_points.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_points.count >= 1 && p_points.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= points.length <= 105"
                )
                return
            }
            guard p_points.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: points[i].length == 2"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findMinArrowShots(p_points)
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
