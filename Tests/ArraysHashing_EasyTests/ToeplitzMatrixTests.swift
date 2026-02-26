import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCToeplitzMatrix {
    private class Solution {
        func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
          let rows = matrix.count
          let cols = matrix[0].count
          for row in 1..<rows {
            for col in 1..<cols {
              if matrix[row][col] != matrix[row-1][col-1] {
                return false
              }
            }
          }
          return true
        }
    }

    @Suite struct ToeplitzMatrixTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "20222d4f-b550-488e-aace-05db39bd34ac",
             input: "matrix = [[1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c4661d51-9c6e-4c8a-8bd7-90e5175dc36b",
             input: "matrix = [[1,2],[3,4]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e6dbce41-a3bb-48c2-9881-b361fd75f5fc",
             input: "matrix = [[1,1],[1,1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2d2e4d34-0e1e-481d-9a81-4cbc55d43af1",
             input: "matrix = [[-1,-2],[-3,-4]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "fa9201a1-4270-4766-acab-50a5f94cd043",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8e451c1a-6a5b-4974-8bf5-2ab86b4fb5c3",
             input: "matrix = [[1,2,3],[4,1,2],[7,4,1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "163cf83e-bf34-4582-ace2-55b590dab6e6",
             input: "matrix = [[1,2,3,4],[5,1,2,3],[9,5,1,2],[13,9,5,1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6e0b7dad-1c49-40ec-8ce7-de5b66549a10",
             input: "matrix = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0dffd2cd-c87b-436a-ae71-4380dfdad4c0",
             input: "matrix = [[1,2,3,4,5],[6,1,2,3,4],[11,6,1,2,3],[16,11,6,1,2],[21,16,11,6,1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b01b323b-ec32-46c2-aa70-57ca2b1bd2d0",
             input: "matrix = [[1,2],[2,3],[3,4]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "80e9da59-2929-4466-a793-8d5ef9aae7c4",
             input: "matrix = [[1,2,3],[2,3,4],[3,4,5]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "114aebc4-3a88-464a-bf4a-08f90c01d822",
             input: "matrix = [[1,1,1],[1,1,1],[1,1,1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0029488d-7ac1-4596-b51c-8e10370b57fa",
             input: "matrix = [[1,2,3,4,5,6],[7,1,2,3,4,5],[13,7,1,2,3,4],[19,13,7,1,2,3],[25,19,13,7,1,2]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "727bc3e1-565f-4b6b-ad98-fcfcc69b8222",
             input: "matrix = [[1,2,3,4,5,6,7],[8,1,2,3,4,5,6],[15,8,1,2,3,4,5],[22,15,8,1,2,3,4],[29,22,15,8,1,2,3]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e8130f82-579c-450f-9fda-6df681f4a312",
             input: "matrix = [[1,2,3,4,5,6,7,8],[9,1,2,3,4,5,6,7],[17,9,1,2,3,4,5,6],[25,17,9,1,2,3,4,5],[33,25,17,9,1,2,3,4]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0f7e11b9-15ab-4ac1-a561-728312387c18",
             input: "matrix = [[1,2,3,4,5,6,7,8,9],[10,1,2,3,4,5,6,7,8],[19,10,1,2,3,4,5,6,7],[28,19,10,1,2,3,4,5,6],[37,28,19,10,1,2,3,4,5]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3fa1ca22-f9d6-4087-a9fa-baea555f347e",
             input: "matrix = [[1,2,3,4,5,6,7,8,9,10],[11,1,2,3,4,5,6,7,8,9],[21,11,1,2,3,4,5,6,7,8],[31,21,11,1,2,3,4,5,6,7],[41,31,21,11,1,2,3,4,5,6]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8a05ace9-7401-403a-b79e-c3673286de8f",
             input: "matrix = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "97c38dfc-bd5a-486b-9bcd-8995b55df327",
             input: "matrix = [[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7282cc6c-a09b-4b5e-87b2-d7b95ed07a34",
             input: "matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6a87163e-b5fb-4110-8682-b015d57e0a9f",
             input: "matrix = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7fce89db-47da-42d1-8a96-faa02676baa6",
             input: "matrix = [[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18],[19,20,21,22,23,24],[25,26,27,28,29,30]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "fee4fd85-7ae5-4aed-ab0f-51b0f99da047",
             input: "matrix = [[1,2,3,4,5,6,7],[8,9,10,11,12,13,14],[15,16,17,18,19,20,21],[22,23,24,25,26,27,28],[29,30,31,32,33,34,35]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "22c88261-0e42-44fd-b07a-402f97cf75f0",
             input: "matrix = [[1,2,3,4,5,6,7,8],[9,10,11,12,13,14,15,16],[17,18,19,20,21,22,23,24],[25,26,27,28,29,30,31,32],[33,34,35,36,37,38,39,40]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "61c4a264-6dff-458e-94f8-c498ad303d88",
             input: "matrix = [[1,2,3,4,5,6,7,8,9],[10,11,12,13,14,15,16,17,18],[19,20,21,22,23,24,25,26,27],[28,29,30,31,32,33,34,35,36],[37,38,39,40,41,42,"
                + "43,44,45]]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "toeplitz-matrix"
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
            let result = solution.isToeplitzMatrix(p_matrix)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
