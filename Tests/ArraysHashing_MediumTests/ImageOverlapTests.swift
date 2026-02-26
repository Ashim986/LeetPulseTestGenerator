import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCImageOverlap {
    private class Solution {
        func largestOverlap(img1: [[Int]], img2: [[Int]]) -> Int {
            let m = img1.count
            let n = img1[0].count
            var maxOverlap = 0
            var count = [String: Int]()
            for x in 0..<m {
                for y in 0..<n {
                    if img1[x][y] == 1 {
                        for dx in -m+1...m-1 {
                            for dy in -n+1...n-1 {
                                let key = "(dx),(dy)"
                                count[key, default: 0] += 1
                            }
                        }
                    }
                }
            }
            for x in 0..<m {
                for y in 0..<n {
                    if img2[x][y] == 1 {
                        for dx in -m+1...m-1 {
                            for dy in -n+1...n-1 {
                                let key = "(dx),(dy)"
                                maxOverlap = max(maxOverlap, count[key, default: 0])
                            }
                        }
                    }
                }
            }
            return maxOverlap
        }
    }

    @Suite struct ImageOverlapTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "913679a1-29f2-49fc-9924-ffddc2548440",
             input: "img1 = [[1,0,0],[0,1,0],[0,0,1]], img2 = [[1,0,0],[0,1,0],[0,0,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "366fda89-e083-487b-8f79-021569c4da77",
             input: "img1 = [[0,0,0],[0,0,0],[0,0,0]], img2 = [[0,0,0],[0,0,0],[0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a5f412c6-9055-4724-8a1e-e36eceedb505",
             input: "img1 = [[1,1,1],[1,1,1],[1,1,1]], img2 = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "41e4ddcc-fec4-42e4-8ce2-8bd22405db43",
             input: "img1 = [[1,0],[0,1]], img2 = [[1,0],[0,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d01b8698-16ab-444c-94b8-10f14c176dbe",
             input: "img1 = [[1,1],[1,1]], img2 = [[0,0],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7607efe1-3ced-4a87-9924-67279e198685",
             input: "img1 = [[0,0],[0,0]], img2 = [[1,1],[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "abd7bf26-67e4-4073-bd97-0aafae4e0cc4",
             input: "img1 = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]], img2 = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "c978eaca-2e16-43d8-87c6-d14288b18864",
             input: "img1 = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]], img2 = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "960c0938-e760-4bf0-a578-e903f38f6e9d",
             input: "img1 = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]], img2 = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e05b3278-cc30-4b4d-811a-35a7624654d7",
             input: "img1 = [[0,1,0,0],[0,0,1,0],[0,0,0,1],[1,0,0,0]], img2 = [[0,1,0,0],[0,0,1,0],[0,0,0,1],[1,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "b921a98b-08f5-4e8e-9dfb-61c46c45b20b",
             input: "img1 = [[1,1,0,0],[0,0,1,1],[0,0,0,0],[0,0,0,0]], img2 = [[1,1,0,0],[0,0,1,1],[0,0,0,0],[0,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "d7d2c03b-c926-4ac8-873f-8964d4d5522d",
             input: "img1 = [[0,0,0,0],[1,1,0,0],[0,0,1,1],[0,0,0,0]], img2 = [[0,0,0,0],[1,1,0,0],[0,0,1,1],[0,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "3119947b-339d-4f3f-a223-efc91cd0be03",
             input: "img1 = [[1,0,1,0],[0,1,0,1],[1,0,1,0],[0,1,0,1]], img2 = [[1,0,1,0],[0,1,0,1],[1,0,1,0],[0,1,0,1]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "4fdfd280-b17b-4bbb-a424-4bb6aa185308",
             input: "img1 = [[0,1,0,1],[1,0,1,0],[0,1,0,1],[1,0,1,0]], img2 = [[0,1,0,1],[1,0,1,0],[0,1,0,1],[1,0,1,0]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "25295c87-099d-4c2d-b417-de8f3b4fddc8",
             input: "img1 = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]], img2 = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3351d973-4f3b-4edc-b891-62f4a2683625",
             input: "img1 = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]], img2 = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "33bd6059-716a-4908-9f38-a2dfad083cd0",
             input: "img1 = [[1,1],[0,0]], img2 = [[1,1],[0,0]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "12b99c1a-1784-4034-b8d8-d3ec975e5d32",
             input: "img1 = [[0,0],[1,1]], img2 = [[0,0],[1,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8cf0a53f-83c0-4ffe-83c0-881cb4339c37",
             input: "img1 = [[0,0,0],[0,1,0],[0,0,0]], img2 = [[0,0,0],[0,1,0],[0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f583250d-e370-4fc7-83f3-e5ea707c02eb",
             input: "img1 = [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]], img2 = [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "3bf48e70-3ca3-47a1-b5f1-c87078461e9d",
             input: "img1 = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]], img2 = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "526f6591-f41b-4444-84b8-c1d4f52d46f3",
             input: "img1 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]], img2 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9e90a456-e0a8-4fe8-af48-12bfb220e9fd",
             input: "img1 = [[1,0,0,0,0,0],[0,1,0,0,0,0],[0,0,1,0,0,0],[0,0,0,1,0,0],[0,0,0,0,1,0],[0,0,0,0,0,1]], img2 = [[1,0,0,0,0,0],[0,1,0,0,0,0],[0,0,1"
                + ",0,0,0],[0,0,0,1,0,0],[0,0,0,0,1,0],[0,0,0,0,0,1]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "a29715fd-134b-4401-84cb-b3d5022ffc2c",
             input: "img1 = [[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1]], img2 = [[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1"
                + ",1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1]]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "9b93408f-7378-4831-a9fe-330d17074cf1",
             input: "img1 = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]], img2 = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0"
                + ",0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "image-overlap"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_img1 = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_img1.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: img1 2D array too large (\(p_img1.count))"
                )
                return
            }
            guard let p_img2 = InputParser.parse2DIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [[Int]]"
                )
                return
            }
            guard p_img2.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: img2 2D array too large (\(p_img2.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.largestOverlap(img1: p_img1, img2: p_img2)
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
