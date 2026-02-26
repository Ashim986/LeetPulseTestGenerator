import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRotateImage {
    private class Solution {
        func rotate(_ matrix: inout [[Int]]) {
            let n = matrix.count
            guard n > 1 else { return }

            for i in 0..<n {
                for j in i + 1..<n {
                    let tmp = matrix[i][j]
                    matrix[i][j] = matrix[j][i]
                    matrix[j][i] = tmp
                }
            }

            for i in 0..<n {
                matrix[i].reverse()
            }
        }
    }

    @Suite struct RotateImageTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "500a67f2-c35c-4da2-84a4-6121f8ec348b",
             input: "matrix = [[1]]",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "9cbafeb2-0f5c-4cd6-b6f5-190d6d450bb2",
             input: "matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]",
             expected: "[[13,9,5,1],[14,10,6,2],[15,11,7,3],[16,12,8,4]]", orderMatters: true),
            TestCaseData(id: "c1ce1ba4-2e53-481d-b5b0-802b34188900",
             input: "matrix = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "[[1,1,1],[1,1,1],[1,1,1]]", orderMatters: true),
            TestCaseData(id: "1383bb62-5bef-4941-8f92-3f0dcb3bf052",
             input: "matrix = [[0,0,0],[0,0,0],[0,0,0]]",
             expected: "[[0,0,0],[0,0,0],[0,0,0]]", orderMatters: true),
            TestCaseData(id: "3fa82726-3921-40a7-9aea-facf6e635bf7",
             input: "matrix = [[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]]",
             expected: "[[-7,-4,-1],[-8,-5,-2],[-9,-6,-3]]", orderMatters: true),
            TestCaseData(id: "1593f6f6-0694-4b60-a298-7ce2a6326046",
             input: "matrix = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]",
             expected: "[[21,16,11,6,1],[22,17,12,7,2],[23,18,13,8,3],[24,19,14,9,4],[25,20,15,10,5]]", orderMatters: true),
            TestCaseData(id: "1a4add32-fc4a-4301-b830-3d7777c5ba66",
             input: "matrix = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "[[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "bff95acd-6a47-4828-85a1-50a577c563b0",
             input: "matrix = [[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18],[19,20,21,22,23,24],[25,26,27,28,29,30],[31,32,33,34,35,36]]",
             expected: "[[31,25,19,13,7,1],[32,26,20,14,8,2],[33,27,21,15,9,3],[34,28,22,16,10,4],[35,29,23,17,11,5],[36,30,24,18,12,6]]", orderMatters: true),
            TestCaseData(id: "d798d084-3d27-4f54-bf15-862e6739f900",
             input: "matrix = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "95a054da-c884-4543-bcab-45c8aab0b261",
             input: "matrix = [[]]",
             expected: "[[]]", orderMatters: true),
            TestCaseData(id: "99be52db-1607-4145-bc2b-4d7ea1b8c398",
             input: "matrix = [[1,2,3,4,5,6],[6,5,4,3,2,1]]",
             expected: "[[6,5,4,3,6,1],[1,2,3,4,5,2]]", orderMatters: true),
            TestCaseData(id: "e0950735-f5f0-4f7b-81e0-bf8cc9c65463",
             input: "matrix = [[1,2,3,4,5,6,7],[7,6,5,4,3,2,1]]",
             expected: "[[7,6,5,4,3,7,1],[1,2,3,4,5,6,2]]", orderMatters: true),
            TestCaseData(id: "87bb30d4-9e14-4693-8d27-c20a962019b1",
             input: "matrix = [[1,2,3,4,5,6,7,8],[8,7,6,5,4,3,2,1]]",
             expected: "[[8,7,6,5,4,3,8,1],[1,2,3,4,5,6,7,2]]", orderMatters: true),
            TestCaseData(id: "5352f9c7-4cf3-4e0b-8fee-3ef2c4fc3599",
             input: "matrix = [[1,2,3,4,5,6,7,8,9],[9,8,7,6,5,4,3,2,1]]",
             expected: "[[9,8,7,6,5,4,3,9,1],[1,2,3,4,5,6,7,8,2]]", orderMatters: true),
            TestCaseData(id: "c01fead9-6111-4567-9f34-ad9735784805",
             input: "matrix = [[1,2,3,4,5,6,7,8,9,10],[10,9,8,7,6,5,4,3,2,1]]",
             expected: "[[10,9,8,7,6,5,4,3,10,1],[1,2,3,4,5,6,7,8,9,2]]", orderMatters: true),
            TestCaseData(id: "753bedfa-3ea5-4d9b-aea3-889a6a2a9c68",
             input: "matrix = [[1,2,3,4,5,6,7,8,9,10,11],[11,10,9,8,7,6,5,4,3,2,1]]",
             expected: "[[11,10,9,8,7,6,5,4,3,11,1],[1,2,3,4,5,6,7,8,9,10,2]]", orderMatters: true),
            TestCaseData(id: "a2b35bdb-0929-4060-9d77-e9ce0d0f1997",
             input: "matrix = [[1,2,3,4,5,6,7,8,9,10,11,12],[12,11,10,9,8,7,6,5,4,3,2,1]]",
             expected: "[[12,11,10,9,8,7,6,5,4,3,12,1],[1,2,3,4,5,6,7,8,9,10,11,2]]", orderMatters: true),
            TestCaseData(id: "02721873-3b8e-4a04-aebd-c2d38d6f4715",
             input: "matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16],[17,18,19,20]]",
             expected: "[[1,5,9,13],[2,6,7,8],[3,10,11,12],[4,14,15,16],[17,18,19,20]]", orderMatters: true),
            TestCaseData(id: "a5259335-38da-48a5-9e2d-e4ab4d0b210f",
             input: "matrix = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25],[26,27,28,29,30],[31,32,33,34,35]]",
             expected: "[[1,6,11,16,21],[2,7,8,9,10],[3,12,13,14,15],[4,17,18,19,20],[5,22,23,24,25],[26,27,28,29,30],[31,32,33,34,35]]", orderMatters: true),
            TestCaseData(id: "95b55af7-06ed-4f16-b7cb-06042509377b",
             input: "matrix = [[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18],[19,20,21,22,23,24],[25,26,27,28,29,30],[31,32,33,34,35,36],[37,38,39,40,41"
                + ",42]]",
             expected: "[[1,7,13,19,25,31],[2,8,9,10,11,12],[3,14,15,16,17,18],[4,20,21,22,23,24],[5,26,27,28,29,30],[6,32,33,34,35,36],[37,38,39,40,41,42]]", orderMatters: true),
            TestCaseData(id: "3df464c9-fa84-4f7f-bc8d-228ee952eb5c",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]]",
             expected: "[[7,4,1],[8,5,2],[9,6,3]]", orderMatters: true),
            TestCaseData(id: "da8153d0-0872-4b20-bca6-f7b035b676ae",
             input: "matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]",
             expected: "[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "rotate-image"
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

            guard var p_matrix = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as inout [[Int]]"
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
            solution.rotate(&p_matrix)
            let computedOutput = OutputSerializer.serialize(p_matrix)

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
