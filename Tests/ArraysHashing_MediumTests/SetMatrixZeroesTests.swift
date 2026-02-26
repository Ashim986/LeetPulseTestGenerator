import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSetMatrixZeroes {
    private class Solution {
        func setZeroes(_ matrix: inout [[Int]]) {
            let rows = matrix.count
            let cols = matrix.first?.count ?? 0
            guard rows > 0, cols > 0 else { return }

            var firstRowZero = false
            var firstColZero = false

            for c in 0..<cols where matrix[0][c] == 0 { firstRowZero = true }
            for r in 0..<rows where matrix[r][0] == 0 { firstColZero = true }

            for r in 1..<rows {
                for c in 1..<cols {
                    if matrix[r][c] == 0 {
                        matrix[r][0] = 0
                        matrix[0][c] = 0
                    }
                }
            }

            for r in 1..<rows {
                for c in 1..<cols {
                    if matrix[r][0] == 0 || matrix[0][c] == 0 {
                        matrix[r][c] = 0
                    }
                }
            }

            if firstRowZero {
                for c in 0..<cols { matrix[0][c] = 0 }
            }
            if firstColZero {
                for r in 0..<rows { matrix[r][0] = 0 }
            }
        }
    }

    @Suite struct SetMatrixZeroesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ba82e374-8f28-4cfa-8ed2-037e9971a396",
             input: "matrix = [[0]]",
             expected: "[[0]]", orderMatters: true),
            TestCaseData(id: "f10428ef-0983-486e-9ecf-0fa5a5460bcd",
             input: "matrix = [[1]]",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "7c4c8a91-14d1-4b6f-a2d0-3f742a3aa862",
             input: "matrix = [[1,0]]",
             expected: "[[0,0]]", orderMatters: true),
            TestCaseData(id: "cfb3b205-f258-4b0a-9263-3f85996ade30",
             input: "matrix = [[0,1]]",
             expected: "[[0,0]]", orderMatters: true),
            TestCaseData(id: "54a9eda0-e6a1-4d6a-856e-e2dc0809e85c",
             input: "matrix = [[1,1,1]]",
             expected: "[[1,1,1]]", orderMatters: true),
            TestCaseData(id: "0caa4ffe-c539-4137-827c-c189c3cb7c0f",
             input: "matrix = [[1,0,1]]",
             expected: "[[0,0,0]]", orderMatters: true),
            TestCaseData(id: "0a47fb57-e3a1-4f92-bc9f-683fe04cffe1",
             input: "matrix = [[1],[0],[1]]",
             expected: "[[0],[0],[0]]", orderMatters: true),
            TestCaseData(id: "f1f74f62-5b9f-4d22-8cb6-2e9d4fbc94af",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]]",
             expected: "[[1,2,3],[4,5,6],[7,8,9]]", orderMatters: true),
            TestCaseData(id: "839c8e23-4f2f-4423-8bcd-962115af69c0",
             input: "matrix = [[1,2,3],[4,0,6],[7,8,9]]",
             expected: "[[1,0,3],[0,0,0],[7,0,9]]", orderMatters: true),
            TestCaseData(id: "4757c681-add0-44cd-9cfc-46a13418ccf1",
             input: "matrix = [[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]]",
             expected: "[[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]]", orderMatters: true),
            TestCaseData(id: "b14cf0de-ca9d-4741-bdff-d2398843ee07",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21],[22,23,24],[25,26,27],[28,29,30]]",
             expected: "[[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21],[22,23,24],[25,26,27],[28,29,30]]", orderMatters: true),
            TestCaseData(id: "b66fe5fe-63d0-4f60-9222-d2ada888d8ea",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21],[22,23,24],[25,26,27],[28,29,0]]",
             expected: "[[1,2,0],[4,5,0],[7,8,0],[10,11,0],[13,14,0],[16,17,0],[19,20,0],[22,23,0],[25,26,0],[0,0,0]]", orderMatters: true),
            TestCaseData(id: "3e6de16c-8462-4c2b-befc-34b3c1d878d0",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21],[22,23,24],[25,26,27],[28,29,30],[31,32,33]]",
             expected: "[[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21],[22,23,24],[25,26,27],[28,29,30],[31,32,33]]", orderMatters: true),
            TestCaseData(id: "54836ee1-a9b6-4ddf-9cd4-923eb3601805",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21],[22,23,24],[25,26,27],[28,29,30],[31,32,0]]",
             expected: "[[1,2,0],[4,5,0],[7,8,0],[10,11,0],[13,14,0],[16,17,0],[19,20,0],[22,23,0],[25,26,0],[28,29,0],[0,0,0]]", orderMatters: true),
            TestCaseData(id: "61697899-fb45-481e-bd75-755dba7022d7",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21],[22,23,24],[25,26,27],[28,29,30],[31,32,33],[34,35,36]]",
             expected: "[[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21],[22,23,24],[25,26,27],[28,29,30],[31,32,33],[34,35,36]]", orderMatters: true),
            TestCaseData(id: "727a43ee-ce80-4d16-be93-5cd3f0347ea1",
             input: "matrix = [[1,1,1],[1,0,1],[1,1,1]]",
             expected: "[[1,0,1],[0,0,0],[1,0,1]]", orderMatters: true),
            TestCaseData(id: "3aba51d8-1d60-434f-9400-7fcf9d675ce4",
             input: "matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]",
             expected: "[[0,0,0,0],[0,4,5,0],[0,3,1,0]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "set-matrix-zeroes"
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
            solution.setZeroes(&p_matrix)
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
