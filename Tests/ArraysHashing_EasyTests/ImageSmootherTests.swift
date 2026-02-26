import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCImageSmoother {
    private class Solution {
        func imageSmoother(_ M: [[Int]]) -> [[Int]] {
            let rows = M.count
            let cols = M[0].count
            var result = Array(repeating: Array(repeating: 0, count: cols), count: rows)
            for i in 0..<rows {
                for j in 0..<cols {
                    var sum = M[i][j]
                    var count = 1
                    for direction in [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)] {
                        let row = i + direction.0
                        let col = j + direction.1
                        if row >= 0 && row < rows && col >= 0 && col < cols {
                            sum += M[row][col]
                            count += 1
                        }
                    }
                    result[i][j] = sum / count
                }
            }
            return result
        }
    }

    @Suite struct ImageSmootherTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "324ae759-cc02-4e89-bd6e-ed3176ff9c0c",
             input: "M = [[1]]",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "2fc2a33f-9f31-4a24-9e95-abea31f9c86e",
             input: "M = [[0,0,0],[0,0,0],[0,0,0]]",
             expected: "[[0,0,0],[0,0,0],[0,0,0]]", orderMatters: true),
            TestCaseData(id: "0804f91d-384f-42c7-b79f-9ae3a6f3afc0",
             input: "M = [[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]]",
             expected: "[[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]]", orderMatters: true),
            TestCaseData(id: "32c0b79f-a079-4ddb-980b-36e89e8ea196",
             input: "M = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "[[1,1,1],[1,1,1],[1,1,1]]", orderMatters: true),
            TestCaseData(id: "d3043aa4-75e7-4bd1-86bb-268afb3e9bb4",
             input: "M = [[100,100,100],[100,100,100],[100,100,100]]",
             expected: "[[100,100,100],[100,100,100],[100,100,100]]", orderMatters: true),
            TestCaseData(id: "6f7cb785-93a1-4b8d-93e4-5da1cf5b0c47",
             input: "M = [[-100,-100,-100],[-100,-100,-100],[-100,-100,-100]]",
             expected: "[[-100,-100,-100],[-100,-100,-100],[-100,-100,-100]]", orderMatters: true),
            TestCaseData(id: "9b92a563-2172-45a7-acc4-a75ca7d4b7db",
             input: "M = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "bd2b7721-4f9c-44f8-abb1-2b7418c2e0bb",
             input: "M = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]", orderMatters: true),
            TestCaseData(id: "b777c9d7-ef72-499a-9f87-ffc8c50fbb84",
             input: "M = [[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]",
             expected: "[[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]", orderMatters: true),
            TestCaseData(id: "a0d2c03b-c00d-4b69-ba6c-58aab83c5e18",
             input: "M = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]",
             expected: "[[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]", orderMatters: true),
            TestCaseData(id: "8f14c517-ce85-4254-afc0-4c2975a15e1e",
             input: "M = [[-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1]]",
             expected: "[[-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1]]", orderMatters: true),
            TestCaseData(id: "342166f2-0f4b-4a71-8dad-e20a31b79788",
             input: "M = [[1,2,3]]",
             expected: "[[1,2,2]]", orderMatters: true),
            TestCaseData(id: "5c1c55c7-636e-466f-88cc-b93f235b1a1a",
             input: "M = [[1],[2],[3]]",
             expected: "[[1],[2],[2]]", orderMatters: true),
            TestCaseData(id: "1ce968b4-5f32-44f0-b01b-61a2ffee475b",
             input: "M = [[2,4,6],[8,10,12],[14,16,18]]",
             expected: "[[6,7,8],[9,10,11],[12,13,14]]", orderMatters: true),
            TestCaseData(id: "b3b1ff9e-44db-41b4-8e63-21afc74769ff",
             input: "M = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]",
             expected: "[[3,4,5,5],[5,6,7,7],[9,10,11,11],[11,12,13,13]]", orderMatters: true),
            TestCaseData(id: "7349153d-5e8d-4881-877a-71dd7bcf9083",
             input: "img = [[1,1,1],[1,0,1],[1,1,1]]",
             expected: "[[0,0,0],[0,0,0],[0,0,0]]", orderMatters: true),
            TestCaseData(id: "af5afd52-563d-465d-a34e-18d9f579fb6d",
             input: "img = [[100,200,100],[200,50,200],[100,200,100]]",
             expected: "[[137,141,137],[141,138,141],[137,141,137]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "image-smoother"
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

            guard let p_M = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_M.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: M 2D array too large (\(p_M.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.imageSmoother(p_M)
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
            }
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
