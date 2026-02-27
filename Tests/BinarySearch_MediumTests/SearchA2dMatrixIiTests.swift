import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSearchA2dMatrixIi {
    private class Solution {
        func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
            let m = matrix.count, n = matrix[0].count
            var row = 0, col = n - 1

            while row < m && col >= 0 {
                if matrix[row][col] == target { return true }
                if matrix[row][col] > target {
                    col -= 1
                } else {
                    row += 1
                }
            }
            return false
        }
    }

    @Suite struct SearchA2dMatrixIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "194cadc2-fa5d-4637-9c95-30a95cb4bad8",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = 5",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d1ca0974-7999-4002-b208-b4bb11450e86",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = 10",
             expected: "false", orderMatters: true),
            TestCaseData(id: "032c9239-2b8a-4aa4-b6f8-27c573d6be93",
             input: "matrix = [[1,4,7],[10,11,16],[23,30,34]], target = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2951dfda-0c94-4058-82bf-c47798cde152",
             input: "matrix = [[1,4,7],[10,11,16],[23,30,34]], target = 30",
             expected: "true", orderMatters: true),
            TestCaseData(id: "723c5cf3-9745-4130-8042-03977fbd95bf",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f973b241-4e97-4a7a-b9a8-d848339a0fbb",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = 9",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1d58a84e-ce7d-4a5f-8222-010319764f52",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = 0",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a4f843d9-6fca-4c17-8f6d-462f1714195f",
             input: "matrix = [[-1,-2,-3],[-4,-5,-6],[-7,-8,-9]], target = 5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3f896bd4-11b0-43d2-a053-fd180419ee49",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = -1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "767e6278-afb4-4033-826f-825cda37a3a0",
             input: "matrix = [[1,1,1],[1,1,1],[1,1,1]], target = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b480254e-cedd-485e-91c5-b18b1b3aea3b",
             input: "matrix = [[1,1,1],[1,1,1],[1,1,1]], target = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ed78c1cc-3776-4c30-b9fc-cce7c73e9b50",
             input: "matrix = [[1]], target = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b45868b6-f601-4b4a-bdcf-03b91c3593e8",
             input: "matrix = [[1]], target = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "639087c6-b5b8-4032-83b4-1b961fef7072",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = -10",
             expected: "false", orderMatters: true),
            TestCaseData(id: "04a8bed5-51ea-4b64-a492-bf2b6a53bd2f",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = 100",
             expected: "false", orderMatters: true),
            TestCaseData(id: "33acb1f0-bcb5-42db-aa1a-a728fc6aae55",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = -100",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f5fb6efe-69c5-41f9-9653-d9e6260f9114",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = 1000",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6f6be2a8-3ff3-46b1-940a-b83fd24c102f",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = -1000",
             expected: "false", orderMatters: true),
            TestCaseData(id: "368ae3b1-b116-4153-8fac-a08a43753d5f",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = 10000",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a68faecd-3647-42a1-9387-8aaabc00f38a",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9]], target = -10000",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7cf1a08a-a347-4bb7-9a3c-35b5b814c4fe",
             input: "matrix = [[]], target = 5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4277d2c5-9c8e-4ebe-9c42-353bcd569015",
             input: "matrix = [[9,8,7],[6,5,4],[3,2,1]], target = 10",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5315e269-68d2-4d32-875e-6b0aa7953d76",
             input: "matrix = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]], target = 13",
             expected: "true", orderMatters: true),
            TestCaseData(id: "69903d51-388a-4b2f-b68f-1d576880d660",
             input: "matrix = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]], target = 20",
             expected: "false", orderMatters: true),
            TestCaseData(id: "13efe339-a75c-4b77-9782-43176761f1a6",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12]], target = 11",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "search-a-2d-matrix-ii"
            let topic = "binary-search"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_matrix = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_matrix.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: matrix 2D array too large (\(p_matrix.count))"
                )
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_matrix.count >= 1 && p_matrix.count <= 300 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n, m <= 300"
                )
                return
            }
            guard p_target >= -109 && p_target <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= target <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.searchMatrix(p_matrix, p_target)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
