import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReshapeTheMatrix {
    private class Solution {
        func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
            let numRows = mat.count
            let numCols = mat[0].count
            guard numRows * numCols == r * c else { return mat }
            var flat: [Int] = []
            for i in 0..<numRows {
                for j in 0..<numCols {
                    flat.append(mat[i][j])
                }
            }
            var result: [[Int]] = []
            for i in 0..<r {
                result.append(Array(flat[(i*c)..<(i*c+c)]))
            }
            return result
        }
    }

    @Suite struct ReshapeTheMatrixTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2757cf4b-b174-4951-98ec-3b2696d02c0d",
             input: "nums = [[1,2],[3,4]], r = 2, c = 2",
             expected: "[[1,2],[3,4]]", orderMatters: true),
            TestCaseData(id: "d8854c4c-f797-4ca6-9e9a-5ee062b7ed11",
             input: "nums = [[1,2],[3,4]], r = 4, c = 1",
             expected: "[[1],[2],[3],[4]]", orderMatters: true),
            TestCaseData(id: "4cc55613-4425-4139-a990-27605da06fb5",
             input: "nums = [[1]], r = 1, c = 1",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "b82590fa-bb61-44ba-9474-b0c5dd37d09a",
             input: "nums = [[1,2,3],[4,5,6]], r = 1, c = 6",
             expected: "[[1,2,3,4,5,6]]", orderMatters: true),
            TestCaseData(id: "0be5b502-3fde-4f84-beaf-27ba156578b3",
             input: "nums = [[1,2,3],[4,5,6]], r = 6, c = 1",
             expected: "[[1],[2],[3],[4],[5],[6]]", orderMatters: true),
            TestCaseData(id: "b34c1836-c5f0-4fe0-9c53-d7dabcd45305",
             input: "nums = [[1,2,3],[4,5,6],[7,8,9]], r = 1, c = 9",
             expected: "[[1,2,3,4,5,6,7,8,9]]", orderMatters: true),
            TestCaseData(id: "3c101a2e-5066-4112-bd41-e63664730f3d",
             input: "nums = [[1,2,3],[4,5,6],[7,8,9]], r = 9, c = 1",
             expected: "[[1],[2],[3],[4],[5],[6],[7],[8],[9]]", orderMatters: true),
            TestCaseData(id: "04d5d30b-f220-4ea9-aafd-506d870f58b1",
             input: "nums = [[1,2],[3,4]], r = 2, c = 3",
             expected: "[[1,2],[3,4]]", orderMatters: true),
            TestCaseData(id: "58fa2600-06f2-4000-a3a0-24176a2240c6",
             input: "nums = [[1,2],[3,4]], r = 3, c = 2",
             expected: "[[1,2],[3,4]]", orderMatters: true),
            TestCaseData(id: "748b02cb-d45f-4c90-8096-864b2d97158f",
             input: "nums = [[1,2,3],[4,5,6],[7,8,9]], r = 3, c = 3",
             expected: "[[1,2,3],[4,5,6],[7,8,9]]", orderMatters: true),
            TestCaseData(id: "171a8f85-8e74-4c88-9738-0ef0d40383e6",
             input: "nums = [[1,2],[3,4]], r = 4, c = 2",
             expected: "[[1,2],[3,4]]", orderMatters: true),
            TestCaseData(id: "c56d5e25-1440-460b-ad9f-e492daebbaa8",
             input: "nums = [[1,2,3],[4,5,6]], r = 3, c = 2",
             expected: "[[1,2],[3,4],[5,6]]", orderMatters: true),
            TestCaseData(id: "b0acd17b-23b7-4794-8523-a353d893eba1",
             input: "nums = [[1,2],[3,4],[5,6]], r = 1, c = 6",
             expected: "[[1,2,3,4,5,6]]", orderMatters: true),
            TestCaseData(id: "0a5281e1-7543-4056-b467-bbb3eebef7c7",
             input: "nums = [[-1,-2,-3],[-4,-5,-6]], r = 2, c = 3",
             expected: "[[-1,-2,-3],[-4,-5,-6]]", orderMatters: true),
            TestCaseData(id: "f27176cd-b3c2-48c3-a3b7-117877845195",
             input: "nums = [[1,1,1],[1,1,1]], r = 1, c = 6",
             expected: "[[1,1,1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "d0eafc3d-2961-4853-96d0-78d2c563ac49",
             input: "nums = [[1,2,3],[4,5,6],[7,8,9],[10,11,12]], r = 2, c = 6",
             expected: "[[1,2,3,4,5,6],[7,8,9,10,11,12]]", orderMatters: true),
            TestCaseData(id: "ce53c8bf-d72c-488c-8989-8dd53db98281",
             input: "nums = [[1,2],[3,4],[5,6],[7,8]], r = 4, c = 2",
             expected: "[[1,2],[3,4],[5,6],[7,8]]", orderMatters: true),
            TestCaseData(id: "3ac7b1e9-ce50-43ad-bbd3-9329150762f4",
             input: "nums = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15]], r = 3, c = 5",
             expected: "[[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]]", orderMatters: true),
            TestCaseData(id: "26d65055-ea0f-4c96-a75c-200c7d170c41",
             input: "nums = [[1,2],[3,4],[5,6],[7,8],[9,10]], r = 5, c = 2",
             expected: "[[1,2],[3,4],[5,6],[7,8],[9,10]]", orderMatters: true),
            TestCaseData(id: "22de4c88-beb1-4857-b888-5b8e7b5b7a14",
             input: "nums = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18]], r = 3, c = 6",
             expected: "[[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18]]", orderMatters: true),
            TestCaseData(id: "3a3f7051-1f50-4231-be40-45125934ecb4",
             input: "nums = [], r = 0, c = 0",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "b8478a66-10db-455b-93a1-b9af59dd8b78",
             input: "mat = [[1,2,3],[4,5,6]], r = 3, c = 2",
             expected: "[[1,2],[3,4],[5,6]]", orderMatters: true),
            TestCaseData(id: "f069abd8-6359-4253-a624-26076f5b1b5a",
             input: "mat = [[1,2,3],[4,5,6]], r = 1, c = 6",
             expected: "[[1,2,3,4,5,6]]", orderMatters: true),
            TestCaseData(id: "d3b07a54-c4af-484d-af67-ecb784535140",
             input: "mat = [], r = 0, c = 0",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "76c99db3-b737-41fd-8791-190e02c43a57",
             input: "mat = [[-1,-2,-3],[-4,-5,-6]], r = 2, c = 3",
             expected: "[[-1,-2,-3],[-4,-5,-6]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reshape-the-matrix"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            guard let p_mat = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_mat.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: mat 2D array too large (\(p_mat.count))"
                )
                return
            }
            guard let p_r = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_c = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_r >= 1 && p_r <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 100"
                )
                return
            }
            guard p_r >= 1 && p_r <= 300 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= r, c <= 300"
                )
                return
            }
            guard p_c >= 1 && p_c <= 300 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= r, c <= 300"
                )
                return
            }

            let solution = Solution()
            let result = solution.matrixReshape(p_mat, p_r, p_c)
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
