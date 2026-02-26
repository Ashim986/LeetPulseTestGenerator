import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBrickWall {
    private class Solution {
        func leastBricks(_ wall: [[Int]]) -> Int {
            var edges: [Int: Int] = [:]
            var maxWidth = 0
            for row in wall {
                maxWidth += row[0]
            }
            maxWidth -= 1
            for row in wall {
                var curEdge = 0
                for i in 0..<row.count - 1 {
                    curEdge += row[i]
                    edges[curEdge, default: 0] += 1
                }
            }
            var maxCount = 0
            for (_, count) in edges {
                maxCount = max(maxCount, count)
            }
            return wall.count - maxCount
        }
    }

    @Suite struct BrickWallTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ba99abbe-a018-4aaa-ac54-703b1ee4c399",
             input: "wall = [[1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "653e8169-a3f7-4530-bf95-95f41a5da2c5",
             input: "wall = [[1,2],[1,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2e9fa817-afa0-4213-84fa-cd38e905a04e",
             input: "wall = [[1,2],[2,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "38e49227-454c-4ca7-8e5e-cffc305a8b1e",
             input: "wall = [[2,2,2,2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2,2,2,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d581ba1b-06b8-475d-b584-194fc960d04a",
             input: "wall = [[1,1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "82f9f4ae-abe2-44bf-8648-9fe08208bc1c",
             input: "wall = [[2,2,2,2,2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2,2,2,2,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fd86328e-c4cd-476e-a1c0-04f87aef0e93",
             input: "wall = [[1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "08dbb699-09f5-462f-8f32-64c126977503",
             input: "wall = [[1,2,3]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dd68b501-5e62-4872-9ca3-109dd0cfb790",
             input: "wall = [[1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a9cab874-cdb0-415d-8e37-d611af8bd649",
             input: "wall = [[2,2,2,2]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "633d01fc-a52c-4afe-9936-d5c3491bc58d",
             input: "wall = [[1,2,3],[1,2,3]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cccb24fd-361f-4858-a4a5-4e00f3e1845e",
             input: "wall = [[1,1,1],[1,1,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6944c498-5f2a-4483-91f5-d9838388249e",
             input: "wall = [[2,2,2],[2,2,2]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "55b2988b-3441-4768-bae2-b5b4557c7359",
             input: "wall = [[1,2,3,4],[1,2,3,4]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fb870b95-2269-42f0-83ce-260006ee071e",
             input: "wall = [[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "dd19deb7-1106-4d46-977a-08cc92370c0a",
             input: "wall = [[2,2,2,2,2],[2,2,2,2,2]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "107f7620-0e43-4126-bd8b-c54928e596de",
             input: "wall = [[1,2,3,4,5],[1,2,3,4,5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4effc1aa-e7c5-4a79-988d-2d644583e3a3",
             input: "wall = [[1,1,1,1,1,1],[1,1,1,1,1,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "77e454d8-4b18-45a9-a0fc-5cf131ecc75c",
             input: "wall = [[2,2,2,2,2,2],[2,2,2,2,2,2]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "96d21df7-9b3c-4107-ac74-f360e8abfd70",
             input: "wall = [[1,2,3,4,5,6],[1,2,3,4,5,6]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f2a3ed44-d59d-4dcb-9070-0c1255810ee1",
             input: "wall = [[1,1,1,1,1,1,1],[1,1,1,1,1,1,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "29d2fb94-ec02-4f94-872a-4b27b55c8004",
             input: "wall = [[2,2,2,2,2,2,2],[2,2,2,2,2,2,2]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1ce725da-e1bf-4ea9-970e-d0bef8a67951",
             input: "wall = [[1,2,3,4,5,6,7],[1,2,3,4,5,6,7]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "64b98f20-c32b-4078-ba6f-e4ef3c493eba",
             input: "wall = [[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "fb6edb84-1cda-46db-8128-a926af9d8b89",
             input: "wall = [[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2]]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "brick-wall"
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

            guard let p_wall = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_wall.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: wall 2D array too large (\(p_wall.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.leastBricks(p_wall)
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
