import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRangeSumQuery2dImmutable {
    private class Solution {
        class NumMatrix {
            var prefix: [[Int]]

            init(_ matrix: [[Int]]) {
                let m = matrix.count, n = matrix[0].count
                prefix = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
                for i in 0..<m {
                    for j in 0..<n {
                        prefix[i+1][j+1] = matrix[i][j] + prefix[i][j+1] + prefix[i+1][j] - prefix[i][j]
                    }
                }
            }

            func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
                return prefix[row2+1][col2+1] - prefix[row1][col2+1] - prefix[row2+1][col1] + prefix[row1][col1]
            }
        }
    }

    @Suite struct RangeSumQuery2dImmutableTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "dda74d0d-6181-4a2e-a11d-458db9d5002f",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 0, col1 = 0, row2 = 1, col2 = 2",
             expected: "21", orderMatters: true),
            TestCaseData(id: "8f46ef86-c62c-4321-9406-37a63bdb55c4",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 1, col1 = 0, row2 = 1, col2 = 2",
             expected: "15", orderMatters: true),
            TestCaseData(id: "50b794a8-c7de-495d-8e76-0fb7e3e34baf",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 0, col1 = 0, row2 = 0, col2 = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1154b171-968b-44d4-8a84-1812ac310945",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 0, col1 = 1, row2 = 0, col2 = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "06a68e3f-008a-49c0-a836-9aeeba8c6af9",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 0, col1 = 2, row2 = 0, col2 = 2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f15ad473-226a-4e88-8a4c-ae5cff45b12b",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 1, col1 = 0, row2 = 1, col2 = 0",
             expected: "4", orderMatters: true),
            TestCaseData(id: "637726ec-d462-419c-927c-3b6a14bb8f57",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 1, col1 = 1, row2 = 1, col2 = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9e421748-9c5e-4df1-8c33-a3f47b45fccf",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 1, col1 = 2, row2 = 1, col2 = 2",
             expected: "6", orderMatters: true),
            TestCaseData(id: "ac9e5a09-188d-498a-bb28-3aabb99b76fd",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 0, col1 = 0, row2 = 1, col2 = 1",
             expected: "12", orderMatters: true),
            TestCaseData(id: "d1ed4fc5-9888-47d9-9ebc-3de5b8bac0f7",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 0, col1 = 0, row2 = 0, col2 = 2",
             expected: "6", orderMatters: true),
            TestCaseData(id: "5385ad24-604c-4e15-a46b-5ad2c32fb80d",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 0, col1 = 0, row2 = 1, col2 = 0",
             expected: "5", orderMatters: true),
            TestCaseData(id: "87b469a8-8997-4804-b8e1-1e8afde55801",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 0, col1 = 1, row2 = 1, col2 = 1",
             expected: "7", orderMatters: true),
            TestCaseData(id: "ecc705a1-f5ba-4706-8e73-0f83b461417e",
             input: "nums = [[1,2,3],[4,5,6]], row1 = 0, col1 = 2, row2 = 1, col2 = 2",
             expected: "9", orderMatters: true),
            TestCaseData(id: "e18f5e9b-9733-459d-b691-accbe3827988",
             input: "nums = [[-1,-2,-3],[-4,-5,-6]], row1 = 0, col1 = 0, row2 = 1, col2 = 2",
             expected: "-21", orderMatters: true),
            TestCaseData(id: "1c00ae60-0e22-45b1-ba90-f62a50308bab",
             input: "nums = [[-1,-2,-3],[-4,-5,-6]], row1 = 1, col1 = 0, row2 = 1, col2 = 2",
             expected: "-15", orderMatters: true),
            TestCaseData(id: "42d9939b-014e-4a95-9625-3b367bd43db2",
             input: "nums = [[-1,-2,-3],[-4,-5,-6]], row1 = 0, col1 = 0, row2 = 0, col2 = 0",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "702aeba8-bec6-44b3-9f1e-766bf6530edd",
             input: "nums = [[-1,-2,-3],[-4,-5,-6]], row1 = 0, col1 = 1, row2 = 0, col2 = 1",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "5dfebe35-eba2-4e14-920f-eefc947d4671",
             input: "nums = [[-1,-2,-3],[-4,-5,-6]], row1 = 0, col1 = 2, row2 = 0, col2 = 2",
             expected: "-3", orderMatters: true),
            TestCaseData(id: "469526d1-6e85-448f-a387-14f27fdf7c5c",
             input: "nums = [[-1,-2,-3],[-4,-5,-6]], row1 = 1, col1 = 0, row2 = 1, col2 = 0",
             expected: "-4", orderMatters: true),
            TestCaseData(id: "c4e9ce35-59e8-42f7-9374-2461b2931b45",
             input: "nums = [[-1,-2,-3],[-4,-5,-6]], row1 = 1, col1 = 1, row2 = 1, col2 = 1",
             expected: "-5", orderMatters: true),
            TestCaseData(id: "da2fd0b4-39aa-46e2-90c1-37034dc7c682",
             input: "nums = [[-1,-2,-3],[-4,-5,-6]], row1 = 1, col1 = 2, row2 = 1, col2 = 2",
             expected: "-6", orderMatters: true),
            TestCaseData(id: "cea682cd-97ce-4519-9b70-c0073f7e51d7",
             input: "nums = [[1,1,1],[1,1,1]], row1 = 0, col1 = 0, row2 = 0, col2 = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cf49a976-bc61-4550-a1d3-6d226f393d6d",
             input: "nums = [[1,1,1],[1,1,1]], row1 = 1, col1 = 1, row2 = 1, col2 = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5aa90c26-ebe5-4786-bfe5-f13d9df8e021",
             input: "nums = [[1,1,1],[1,1,1]], row1 = 0, col1 = 0, row2 = 0, col2 = 2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ea7227f8-a9c8-4b57-9766-46f5fe2cc50f",
             input: "nums = [[1,1,1],[1,1,1]], row1 = 1, col1 = 0, row2 = 1, col2 = 2",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "range-sum-query-2d-immutable"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            guard initArgs.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Init args count too small"
                )
                return
            }
            guard let initP_0 = InputParser.parse2DIntArray(initArgs[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 0 as [[Int]]"
                )
                return
            }
            var obj = Solution.NumMatrix(initP_0)

            var results: [String] = []
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "sumRegion":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    guard let mArg_1 = InputParser.parseInt(args[1]) else { results.append("null"); continue }
                    guard let mArg_2 = InputParser.parseInt(args[2]) else { results.append("null"); continue }
                    guard let mArg_3 = InputParser.parseInt(args[3]) else { results.append("null"); continue }
                    let rv = obj.sumRegion(mArg_0, mArg_1, mArg_2, mArg_3)
                    results.append("\(rv)")
                default:
                    results.append("null")
                }
            }

            let computedOutput = "[" + results.joined(separator: ",") + "]"
            // Class-design comparison: normalize null representations and whitespace
            func normalizeClassOutput(_ s: String) -> String {
                var result = s.replacingOccurrences(of: " ", with: "")
                result = result.replacingOccurrences(of: "nil", with: "null")
                result = result.replacingOccurrences(of: "None", with: "null")
                result = result.replacingOccurrences(of: "NULL", with: "null")
                return result
            }
            let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
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
