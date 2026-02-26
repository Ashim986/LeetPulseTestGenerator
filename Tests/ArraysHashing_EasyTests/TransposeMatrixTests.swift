import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTransposeMatrix {
    private class Solution {
        func transpose(_ matrix: [[Int]]) -> [[Int]] {
            return matrix[0].indices.map { index in
                matrix.map { $0[index] }
            }
        }
    }

    @Suite struct TransposeMatrixTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c7906029-eaf6-4710-9c19-5c06e1a626ed",
             input: "matrix = [[1]]",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "a505691e-8071-4ff5-9efd-eef87eb58924",
             input: "matrix = [[1,2]]",
             expected: "[[1],[2]]", orderMatters: true),
            TestCaseData(id: "7bd72f22-e21e-4dc4-b302-4299b545dab7",
             input: "matrix = [[1],[2]]",
             expected: "[[1,2]]", orderMatters: true),
            TestCaseData(id: "40675e87-57d8-4eb2-b73a-aac89e47aba2",
             input: "matrix = [[1,2,3,4,5]]",
             expected: "[[1],[2],[3],[4],[5]]", orderMatters: true),
            TestCaseData(id: "ca7e69ce-0ffa-41ff-a9c4-fee23ece7f35",
             input: "matrix = [[1],[2],[3],[4],[5]]",
             expected: "[[1,2,3,4,5]]", orderMatters: true),
            TestCaseData(id: "5c4a507c-c8fb-4427-8a12-89865f588c3b",
             input: "matrix = [[-1,-2,-3],[-4,-5,-6]]",
             expected: "[[-1,-4],[-2,-5],[-3,-6]]", orderMatters: true),
            TestCaseData(id: "91e35e2e-0527-4bc3-b0c4-4dbc815492a9",
             input: "matrix = [[1,1,1],[2,2,2],[3,3,3]]",
             expected: "[[1,2,3],[1,2,3],[1,2,3]]", orderMatters: true),
            TestCaseData(id: "1073b1a8-d38c-4a7a-b340-be0215295bf9",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12]]",
             expected: "[[1,4,7,10],[2,5,8,11],[3,6,9,12]]", orderMatters: true),
            TestCaseData(id: "cd086e04-1666-4b12-9af5-5783ad389bfd",
             input: "matrix = [[10,20,30],[40,50,60],[70,80,90]]",
             expected: "[[10,40,70],[20,50,80],[30,60,90]]", orderMatters: true),
            TestCaseData(id: "a998459c-9016-4fe4-89a1-ba6bf7abae82",
             input: "matrix = [[1,2,3,4,5,6,7,8,9,10]]",
             expected: "[[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]]", orderMatters: true),
            TestCaseData(id: "30fb10d5-5854-439c-bc7b-5d7f1ac42653",
             input: "matrix = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]]",
             expected: "[[1,2,3,4,5,6,7,8,9,10]]", orderMatters: true),
            TestCaseData(id: "31bc9898-48fc-4751-a90e-eeb171986d51",
             input: "matrix = [[1,1],[1,1],[1,1]]",
             expected: "[[1,1,1],[1,1,1]]", orderMatters: true),
            TestCaseData(id: "b632b96c-dffe-4728-8ace-20ca05b5bbc5",
             input: "matrix = [[1,2],[3,4],[5,6],[7,8]]",
             expected: "[[1,3,5,7],[2,4,6,8]]", orderMatters: true),
            TestCaseData(id: "6648df40-dfec-4d5a-a47a-385be076e3eb",
             input: "matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]",
             expected: "[[1,5,9],[2,6,10],[3,7,11],[4,8,12]]", orderMatters: true),
            TestCaseData(id: "2ba412da-051d-4a9e-96e4-edb5e139a77b",
             input: "matrix = [[1,2,3,4,5],[6,7,8,9,10]]",
             expected: "[[1,6],[2,7],[3,8],[4,9],[5,10]]", orderMatters: true),
            TestCaseData(id: "ef20973c-538a-41c9-b1d8-f2580de8b7b2",
             input: "matrix = [[1,2],[3,4],[5,6],[7,8],[9,10]]",
             expected: "[[1,3,5,7,9],[2,4,6,8,10]]", orderMatters: true),
            TestCaseData(id: "3801dda8-b73b-460c-b1e8-89aa3c10afb0",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15]]",
             expected: "[[1,4,7,10,13],[2,5,8,11,14],[3,6,9,12,15]]", orderMatters: true),
            TestCaseData(id: "03ed8b51-552c-48c3-bdb2-f1cd8c2e51ed",
             input: "matrix = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]]",
             expected: "[[1,6,11],[2,7,12],[3,8,13],[4,9,14],[5,10,15]]", orderMatters: true),
            TestCaseData(id: "0219a19e-e661-4c85-9815-2b1fb2ccbd5e",
             input: "matrix = [[1,2,3,4,5,6],[7,8,9,10,11,12]]",
             expected: "[[1,7],[2,8],[3,9],[4,10],[5,11],[6,12]]", orderMatters: true),
            TestCaseData(id: "4995468d-c178-4240-9769-be3d0a11032f",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18]]",
             expected: "[[1,4,7,10,13,16],[2,5,8,11,14,17],[3,6,9,12,15,18]]", orderMatters: true),
            TestCaseData(id: "23b0f261-3abb-4121-a1cf-b6a63f9c8dfb",
             input: "matrix = [[1,1,1,1,1],[2,2,2,2,2],[3,3,3,3,3]]",
             expected: "[[1,2,3],[1,2,3],[1,2,3],[1,2,3],[1,2,3]]", orderMatters: true),
            TestCaseData(id: "95fd221d-a302-4b68-b073-8328a61e5205",
             input: "matrix = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20]]",
             expected: "[[1,6,11,16],[2,7,12,17],[3,8,13,18],[4,9,14,19],[5,10,15,20]]", orderMatters: true),
            TestCaseData(id: "f598f262-4ecf-4128-b15c-be57680f223d",
             input: "matrix = [[1,2,3],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18],[19,20,21]]",
             expected: "[[1,4,7,10,13,16,19],[2,5,8,11,14,17,20],[3,6,9,12,15,18,21]]", orderMatters: true),
            TestCaseData(id: "cba361bb-4583-494d-82c7-cb46c70ef9b6",
             input: "matrix = [[1,2,3,4,5,6,7,8,9,10,11,12]]",
             expected: "[[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]]", orderMatters: true),
            TestCaseData(id: "087c0c84-5c9f-47aa-a0d2-9f7e0c7b660a",
             input: "matrix = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]]",
             expected: "[[1,2,3,4,5,6,7,8,9,10,11,12]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "transpose-matrix"
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
            let result = solution.transpose(p_matrix)
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
