import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSearchA2dMatrix {
    private class Solution {
        func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
            let rows = matrix.count
            let cols = matrix[0].count

            // Binary search for row
            var top = 0
            var bottom = rows - 1
            var targetRow = 0

            while top <= bottom {
                let mid = top + (bottom - top) / 2
                if matrix[mid][0] <= target && (mid == rows - 1 || matrix[mid + 1][0] > target) {
                    targetRow = mid
                    break
                } else if matrix[mid][0] > target {
                    bottom = mid - 1
                } else {
                    top = mid + 1
                }
            }

            // Binary search within row
            var left = 0
            var right = cols - 1

            while left <= right {
                let mid = left + (right - left) / 2
                if matrix[targetRow][mid] == target {
                    return true
                } else if matrix[targetRow][mid] < target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            return false
        }
    }

    @Suite struct SearchA2dMatrixTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "098892B4-1974-429B-8714-D9876D3CABC0",
             input: "[[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "F1EB9F3C-B6FB-450F-B2B6-242EC53BAC3F",
             input: "[[]], 0",
             expected: "false", orderMatters: true),
            TestCaseData(id: "60254E89-B336-47D6-8B68-E509CEFDBA9F",
             input: "[[1]], 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "19BDAB70-938A-4F4D-B4E3-BAA947BFF58A",
             input: "[[1]], 0",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0724A2AB-36CA-424C-A14B-A8A15CCCA157",
             input: "[[1,3]], 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "A4D95D43-BD3D-484B-9745-CB65CF7334CF",
             input: "[[1,3]], 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0C0AE626-E01A-4B65-B5E8-B038803935C1",
             input: "[[1,3]], 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "CBDE25F7-3D55-4E55-AAB0-3EA434631CCA",
             input: "[[1,3,5,7],[10,11,16,20],[23,30,34,60]], 60",
             expected: "true", orderMatters: true),
            TestCaseData(id: "C7C6F9DA-BABC-4D41-BC5B-ACA2D0B232B1",
             input: "[[1,3,5,7],[10,11,16,20],[23,30,34,60]], 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "118238D1-A25D-4E91-9DA1-BC4F587BC2BE",
             input: "{\"matrix\": [[1,3,5,7],[10,11,16,20],[23,30,34,60]], \"target\": 3}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6BAAC9E4-7D79-4028-9B08-4C0DB1D4F71A",
             input: "{\"matrix\": [[1,3,5,7],[10,11,16,20],[23,30,34,60]], \"target\": 13}",
             expected: "false", orderMatters: true),
            TestCaseData(id: "84BA0F82-3E0F-4642-9ABB-15511A45B824",
             input: "{\"matrix\": [[1]], \"target\": 1}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ED83BAAB-D4FE-4F2B-BD67-2B9B6EB22B5D",
             input: "{\"matrix\": [[1]], \"target\": 0}",
             expected: "false", orderMatters: true),
            TestCaseData(id: "393E82ED-B1CC-4D55-A0D7-2B3BC41D152A",
             input: "{\"matrix\": [], \"target\": 0}",
             expected: "false", orderMatters: true),
            TestCaseData(id: "EFCB366E-4959-412D-BE71-1CCBD16382FA",
             input: "{\"matrix\": [[1,3,5,7],[10,11,16,20],[23,30,34,60]], \"target\": 60}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "F2384560-1FBC-48AB-B4FA-C6FB7FA79C5F",
             input: "{\"matrix\": [[1,3,5,7],[10,11,16,20],[23,30,34,60]], \"target\": 1}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "FD725832-07C2-4C36-8A47-4659BFBD0E78",
             input: "{\"matrix\": [[1,3,5,7],[10,11,16,20],[23,30,34,60]], \"target\": 20}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "D2035523-B747-4474-B052-E1C772AC15A0",
             input: "{\"matrix\": [[-5]], \"target\": -5}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "68466121-DF34-4C0D-B3F6-09A1A05230CA",
             input: "{\"matrix\": [[-9,-7,-5,-3,-1],[1,3,5,7,9]], \"target\": -2}",
             expected: "false", orderMatters: true),
            TestCaseData(id: "AFD5FF3E-A7E9-4670-89B2-8D43C55E9067",
             input: "{\"matrix\": [[1]], \"target\": 2}",
             expected: "false", orderMatters: true),
            TestCaseData(id: "71B4D25B-011B-43F0-94C6-6E53FFBA1674",
             input: "{\"matrix\": [[1,3,5,7],[10,11,16,20],[23,30,34,60]], \"target\": 0}",
             expected: "false", orderMatters: true),
            TestCaseData(id: "A622D5E5-FAA4-473C-8819-A4F11F1382FB",
             input: "{\"matrix\": [[1, 3]], \"target\": 3}",
             expected: "true", orderMatters: true),
            TestCaseData(id: "36C982A9-0A7F-425E-BE49-615ACF39BE36",
             input: "{\"matrix\": [[1,3,5]], \"target\": 0}",
             expected: "false", orderMatters: true),
            TestCaseData(id: "07239d5a-34d1-497f-8fb2-5a6cb1b5ad40",
             input: "matrix = [[1]], target = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "27a35c60-33ef-4bef-a66d-3670439a1327",
             input: "matrix = [[1]], target = 2",
             expected: "false", orderMatters: true)
        ]

//        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "search-a-2d-matrix"
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
            guard p_matrix.count >= 1 && p_matrix.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 100"
                )
                return
            }
            guard p_target >= 1 && p_target <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 100"
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
