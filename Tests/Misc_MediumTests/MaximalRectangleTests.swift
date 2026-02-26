import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximalRectangle {
    private class Solution {
        func maximalRectangle(_ matrix: [[Character]]) -> Int {
            if matrix.isEmpty { return 0 }
            let m = matrix.count, n = matrix[0].count
            var heights = [Int](repeating: 0, count: n)
            var maxArea = 0

            func largestRect(_ h: [Int]) -> Int {
                var stack: [Int] = []
                var h = h + [0]
                var area = 0
                for i in 0..<h.count {
                    while !stack.isEmpty && h[i] < h[stack[stack.count - 1]] {
                        let height = h[stack.removeLast()]
                        let width = stack.isEmpty ? i : i - stack[stack.count - 1] - 1
                        area = max(area, height * width)
                    }
                    stack.append(i)
                }
                return area
            }

            for i in 0..<m {
                for j in 0..<n {
                    heights[j] = matrix[i][j] == "1" ? heights[j] + 1 : 0
                }
                maxArea = max(maxArea, largestRect(heights))
            }
            return maxArea
        }
    }

    @Suite struct MaximalRectangleTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "76fcdc62-84ea-4c8e-9c80-4185d90fa688",
             input: "matrix = [[\"1\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0a7b67c9-23df-4292-9dff-3261ed3d323c",
             input: "matrix = [[\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0bf40eb5-70f4-4787-bb1e-0da4445117ad",
             input: "matrix = [[\"1\",\"0\"],[\"1\",\"0\"]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "211ac7b9-8d18-415f-939f-5716eebe2f1d",
             input: "matrix = [[\"0\",\"0\"],[\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7d095fa4-d4e9-4848-89e6-ceeaa183ac16",
             input: "matrix = [[\"1\",\"1\"],[\"1\",\"1\"]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "4605c1b9-3a82-4daa-b190-e753e1360c28",
             input: "matrix = [[\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\"]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "44c30390-e4e9-4bcb-bbb3-85172ec965d6",
             input: "matrix = [[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1cecab09-a9f3-4931-9d18-cc06389f61ec",
             input: "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "ca7db707-0833-42f1-b152-3c45f61ada75",
             input: "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e7a26634-5e0b-4cf5-a1e1-563e2f1a8f62",
             input: "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "f3a9a716-3e75-4ee1-af08-4d5765b8032e",
             input: "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "46a0b190-cab0-433b-b8ec-f067b8cbd359",
             input: "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\""
                + "],[\"1\",\"1\",\"1\",\"1\",\"1\"]]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "7922ab2b-cbe2-4e82-8fc0-dde4cf44c6e0",
             input: "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\""
                + "],[\"0\",\"0\",\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "27126987-251a-4105-8fdb-9300a1cc2602",
             input: "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\""
                + "],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "62353c0a-56ce-46b3-80c6-c1abea680abc",
             input: "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\""
                + "],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9fe924e7-1024-4999-9538-95b3deb5b91c",
             input: "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\""
                + "],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]",
             expected: "35", orderMatters: true),
            TestCaseData(id: "b024db01-b8e1-4eb5-adae-a1cac48a3016",
             input: "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\""
                + "],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "96f685ad-4864-4adc-8eb8-5fd142cfbf05",
             input: "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\""
                + "],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"]]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "5ad99def-a74e-474a-9661-dd49d0381952",
             input: "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\""
                + "],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1c28b538-86a9-4a2a-a8f4-0a3369e06867",
             input: "matrix = [[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\""
                + "],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\""
                + ",\"1\",\"1\",\"1\",\"1\"]]",
             expected: "45", orderMatters: true),
            TestCaseData(id: "b2e33326-c378-4575-bc14-092a0d0d6536",
             input: "matrix = [[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\""
                + "],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\",\"0\",\"0\",\"0\",\"0\"],[\"0\""
                + ",\"0\",\"0\",\"0\",\"0\"]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c69f8ad7-e2f4-4ff3-bb6b-770d393d78cb",
             input: "matrix = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d4b207f1-7344-49fd-8bdf-a091ee80b936",
             input: "matrix = [[\"1\",\"0\",\"1\"],[\"0\",\"1\",\"0\"],[\"1\",\"0\",\"1\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5f773f33-a964-4086-b5de-38f6478fff6b",
             input: "matrix = [[\"1\",\"0\",\"1\",\"0\",\"1\"],[\"0\",\"1\",\"0\",\"1\",\"0\"],[\"1\",\"0\",\"1\",\"0\",\"1\"]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0f0f33d3-58e2-4723-95b2-468df4919415",
             input: "matrix = [[\"1\",\"0\",\"1\",\"0\",\"1\"],[\"0\",\"1\",\"0\",\"1\",\"0\"],[\"1\",\"0\",\"1\",\"0\",\"1\"],[\"0\",\"1\",\"0\",\"1\",\"0\"]]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximal-rectangle"
            let topic = "misc"
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

            guard let p_matrix = InputParser.parse2DCharacterArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Character]]"
                )
                return
            }
            guard p_matrix.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.maximalRectangle(p_matrix)
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
