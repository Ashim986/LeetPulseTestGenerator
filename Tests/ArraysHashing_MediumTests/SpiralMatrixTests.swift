import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSpiralMatrix {
    private class Solution {
        func spiralOrder(_ matrix: [[Int]]) -> [Int] {
            guard !matrix.isEmpty else { return [] }
            var top = 0
            var bottom = matrix.count - 1
            var left = 0
            var right = matrix[0].count - 1
            var result: [Int] = []

            while top <= bottom && left <= right {
                for col in left...right { result.append(matrix[top][col]) }
                top += 1
                if top > bottom { break }

                for row in top...bottom { result.append(matrix[row][right]) }
                right -= 1
                if left > right { break }

                for col in stride(from: right, through: left, by: -1) { result.append(matrix[bottom][col]) }
                bottom -= 1
                if top > bottom { break }

                for row in stride(from: bottom, through: top, by: -1) { result.append(matrix[row][left]) }
                left += 1
            }

            return result
        }
    }

    @Suite struct SpiralMatrixTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "E8DFEA0E-EF1C-4CB8-BC6C-94F218F5A26D",
             input: "[[1,2,3],[4,5,6],[7,8,9]]",
             expected: "[1,2,3,6,9,8,7,4,5]", orderMatters: true),
            TestCaseData(id: "A1C6791F-AF6B-4D63-B7BD-07514E60DE6E",
             input: "[[1,2,3,4],[5,6,7,8],[9,10,11,12]]",
             expected: "[1,2,3,4,8,12,11,10,9,5,6,7]", orderMatters: true),
            TestCaseData(id: "2684F1C7-4166-496D-A98E-FA4FBF1A4132",
             input: "[[1]]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "77F8728E-1D18-425C-B1DD-3757843AFF6A",
             input: "[[1,2],[3,4]]",
             expected: "[1,2,4,3]", orderMatters: true),
            TestCaseData(id: "211CE6A1-BAB2-4DA7-B7A3-2AAEBC0E8A54",
             input: "[[1,2,3],[4,5,6]]",
             expected: "[1,2,3,6,5,4]", orderMatters: true),
            TestCaseData(id: "4757EFDF-14DA-40AF-9E05-3050C23266ED",
             input: "[]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "C5DAEE31-587C-44F1-99FC-DCA5D30DCD93",
             input: "[[1,1,1],[1,1,1],[1,1,1]]",
             expected: "[1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "0E26607A-2D55-462E-95BD-EE6F20AE1253",
             input: "[[1,2,3],[4,5,6],[7,8,9],[10,11,12]]",
             expected: "[1,2,3,6,9,12,11,10,7,4,5,8]", orderMatters: true),
            TestCaseData(id: "C302AF3D-C2B9-4020-84C2-6800DD5339B4",
             input: "[[1,-2,3],[4,-5,6],[7,-8,9]]",
             expected: "[1,-2,3,6,9,-8,7,4,-5]", orderMatters: true),
            TestCaseData(id: "0653E746-8F25-4385-83DF-A5B8A4C7F13C",
             input: "[[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]]",
             expected: "[-1,-2,-3,-6,-9,-8,-7,-4,-5]", orderMatters: true),
            TestCaseData(id: "7FD25250-6607-4347-BC84-DCB90F91296B",
             input: "[[0,0,0],[0,0,0],[0,0,0]]",
             expected: "[0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "6540532F-FD2A-4339-87EE-EBEC760A1FBA",
             input: "[[1,1,1,1],[2,2,2,2],[3,3,3,3]]",
             expected: "[1,1,1,1,2,2,2,2,3,3,3,3]", orderMatters: true),
            TestCaseData(id: "630144DB-3B18-4907-B61B-3A8472666736",
             input: "[[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]]",
             expected: "[1,2,3,4,5,10,15,14,13,12,11,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "865BA928-58DB-45B2-9DB5-5E0172C388AA",
             input: "[[1],[2],[3],[4],[5]]",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "36B5D462-7B4C-41C6-8709-9DB83825EC03",
             input: "[[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15]]",
             expected: "[1,2,3,6,9,12,15,14,13,10,7,4,5,8,11]", orderMatters: true),
            TestCaseData(id: "18E65946-C8DB-4D9F-9284-8AA7A9A2A6CF",
             input: "[[1,1,1,1,1],[2,2,2,2,2],[3,3,3,3,3],[4,4,4,4,4]]",
             expected: "[1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4]", orderMatters: true),
            TestCaseData(id: "BD9A6AB5-C077-4D52-AFD1-ADB43A92A38D",
             input: "[[1,2,3,4,5,6],[7,8,9,10,11,12]]",
             expected: "[1,2,3,4,5,6,12,11,10,9,8,7]", orderMatters: true),
            TestCaseData(id: "70EB753C-1F12-44EC-93E7-94F4578C2E74",
             input: "[[1],[2],[3],[4],[5],[6]]",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "14C7A756-C67D-46A4-9541-E29D1AE0C01D",
             input: "[[1,2],[3,4],[5,6],[7,8]]",
             expected: "[1,2,4,8,7,5,3,6]", orderMatters: true),
            TestCaseData(id: "6823DEC4-15FA-44A8-A80C-B353D69F20A3",
             input: "[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]",
             expected: "[1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10]", orderMatters: true),
            TestCaseData(id: "B185D730-3F90-4E81-BDDC-EC260DBD5169",
             input: "[[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18]]",
             expected: "[1,2,3,4,5,6,12,18,17,16,15,14,13,7,8,9,10,11]", orderMatters: true),
            TestCaseData(id: "6DA21814-A9F7-4C03-9BF2-B4738CA9E315",
             input: "[[1],[2],[3],[4],[5],[6],[7]]",
             expected: "[1,2,3,4,5,6,7]", orderMatters: true),
            TestCaseData(id: "58FE9596-AC5A-4AAC-83B4-1FFAE171EB7C",
             input: "[[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18]]",
             expected: "[1,2,3,6,9,12,15,18,17,16,13,10,7,4,5,8,11,14]", orderMatters: true),
            TestCaseData(id: "F6C19866-CE4A-4139-A867-C2DC62C413B8",
             input: "[[1,2],[3,4],[5,6],[7,8],[9,10]]",
             expected: "[1,2,4,8,10,9,7,5,3,6]", orderMatters: true),
            TestCaseData(id: "4F446854-3955-4E30-815B-E38DD3F97D2C",
             input: "[[1,2,3,4,5,6,7],[8,9,10,11,12,13,14]]",
             expected: "[1,2,3,4,5,6,7,14,13,12,11,10,9,8]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "spiral-matrix"
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

            guard let p_matrix = InputParser.parse2DIntArray(params[0]) else {
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
            let result = solution.spiralOrder(p_matrix)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
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
