import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCScoreAfterFlippingMatrix {
    private class Solution {
        func matrixScore(_ A: [[Int]]) -> Int {
            var A = A
            let rows = A.count
            let cols = A[0].count
            var res = 0
            for i in 0..<rows {
                if A[i][0] == 0 {
                    A[i] = A[i].map { 1 - $0 }
                }
            }
            for j in 1..<cols {
                var ones = 0
                for i in 0..<rows {
                    if A[i][j] == 1 {
                        ones += 1
                    }
                }
                if ones < rows - ones {
                    for i in 0..<rows {
                        A[i][j] = 1 - A[i][j]
                    }
                }
            }
            for i in 0..<rows {
                for j in 0..<cols {
                    res += A[i][j]
                }
            }
            return res
        }
    }

    @Suite struct ScoreAfterFlippingMatrixTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "40585fd8-f194-4f0e-8a49-f7076f40b84c",
             input: "A = [[1,1,1,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "114a8a4b-c1f1-41bb-bb73-e052719d067d",
             input: "A = [[1,0,1,0],[0,1,0,1]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "f5970e08-4da5-4e46-a259-b27038c4dcda",
             input: "A = [[1,0],[0,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "1e34fc25-b6cd-4192-8edd-58f7e1a013ab",
             input: "A = [[0,1],[1,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "0ac31b06-640a-45f0-892a-b719f2ddf8e5",
             input: "A = [[0,0,0],[1,1,1],[0,0,0]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "9637d6a1-0a50-4f2c-a600-2003d7dccb52",
             input: "A = [[0,1,0],[0,1,0],[0,1,0]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "997adcf4-1ab1-4c34-972c-d9cd12192d5f",
             input: "A = [[0,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "b7f3deee-34f9-49d9-aa41-be033d95f2cc",
             input: "A = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "b3a4591f-77f3-409d-b9c2-d114c66b7a4d",
             input: "A = [[0,0,0],[0,0,0],[0,0,0]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "eeb61620-7719-4b34-9910-ce26c7dc410e",
             input: "A = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "8a939f6a-f648-4d38-8385-30259ea8fc57",
             input: "A = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "0c77984f-0aed-4732-8520-5d20ae298596",
             input: "A = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "a46c4467-ab96-4496-ab92-55f2c9b26d51",
             input: "A = [[1,0,1],[0,1,0],[1,0,1]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "ef54b55c-492d-43e2-9fdf-28c4d9f91db0",
             input: "A = [[0,1,0],[1,0,1],[0,1,0]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "dcd9beab-52be-4ff2-9bc6-1c3cb795b5f9",
             input: "A = [[1,1],[1,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "dfa1a1e7-4291-4500-9d4f-63677cd43c66",
             input: "A = [[0,0],[0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "4829ba38-85e6-4b04-b697-66cde98172a8",
             input: "A = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "583057bd-b1c3-4c79-b8cf-e22715121dad",
             input: "A = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "6fe20406-d520-4890-a26c-d1145a7d2f18",
             input: "A = [[1,0,0,0,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,0,0,0,1]]",
             expected: "17", orderMatters: true),
            TestCaseData(id: "8b306167-aa55-4226-b55e-b3c3d71029cb",
             input: "A = [[1,1,1],[0,0,0],[1,1,1]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "76bd0dad-f9da-4e28-b057-fe9100420c36",
             input: "A = [[1,0,1],[1,0,1],[1,0,1]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "23678aad-4784-4fb3-ab0e-7dc21adf5ab2",
             input: "A = [[1,1,0],[0,1,1],[1,0,1]]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "4d68cb4b-4e76-43b5-9190-805b467031fb",
             input: "A = [[0,0,1],[1,0,1],[1,1,0]]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "b025c192-c606-4d09-802e-578f38c96caf",
             input: "A = [[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1]]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "18acc93f-81f2-47f8-9ec2-baf2d254bfd6",
             input: "A = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]",
             expected: "36", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "score-after-flipping-matrix"
            let topic = "greedy"
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

            guard let p_A = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_A.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A 2D array too large (\(p_A.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.matrixScore(p_A)
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
