import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSumOfEvenNumbersAfterQueries {
    private class Solution {
        func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
            var res: [Int] = [], sum = 0, a = A
            for i in a {
                if i % 2 == 0 {
                    sum += i
                }
            }
            for query in queries {
                let val = query[0], index = query[1]
                if a[index] % 2 == 0 {
                    sum -= a[index]
                }
                a[index] += val
                if a[index] % 2 == 0 {
                    sum += a[index]
                }
                res.append(sum)
            }
            return res
        }
    }

    @Suite struct SumOfEvenNumbersAfterQueriesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b063fcda-29c3-4193-985b-5922ef52471d",
             input: "A = [1, 2, 3, 4], queries = [[0, 0]]",
             expected: "[6]", orderMatters: true),
            TestCaseData(id: "c74db537-57c0-43e2-b679-8dfc362068ed",
             input: "A = [0], queries = [[1, 0]]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "d98b65a4-8cf5-4e33-bdee-c4f5ae9e1947",
             input: "A = [2, 4, 6, 8], queries = [[-2, 0], [-4, 1], [-6, 2], [-8, 3]]",
             expected: "[18,14,8,0]", orderMatters: true),
            TestCaseData(id: "9dd8002c-8381-4eae-9f29-3fe40cd388a4",
             input: "A = [-1, -2, -3, -4], queries = [[1, 0], [2, 1], [3, 2], [4, 3]]",
             expected: "[-6,-4,-4,0]", orderMatters: true),
            TestCaseData(id: "95a6cf10-63d9-4b8b-ac39-ae4d542cc947",
             input: "A = [10, 20, 30, 40], queries = [[-10, 0], [-20, 1], [-30, 2], [-40, 3]]",
             expected: "[90,70,40,0]", orderMatters: true),
            TestCaseData(id: "33bb497a-197c-4b2f-921b-f717386d8fda",
             input: "A = [1000, 2000, 3000, 4000], queries = [[-1000, 0], [-2000, 1], [-3000, 2], [-4000, 3]]",
             expected: "[9000,7000,4000,0]", orderMatters: true),
            TestCaseData(id: "eeb807f1-edd2-4728-9880-ea474b74ebae",
             input: "A = [1, 3, 5, 7], queries = [[2, 0], [4, 1], [6, 2], [8, 3]]",
             expected: "[0,0,0,0]", orderMatters: true),
            TestCaseData(id: "c034fba1-744e-4bd1-9e7f-e0e41d8d9d09",
             input: "A = [2, 4, 6, 8], queries = [[2, 0], [4, 1], [6, 2], [8, 3]]",
             expected: "[22,26,32,40]", orderMatters: true),
            TestCaseData(id: "ea7197cf-027a-4f2e-901d-1f78a8a81a93",
             input: "A = [10, 10, 10, 10], queries = [[-10, 0], [-10, 1], [-10, 2], [-10, 3]]",
             expected: "[30,20,10,0]", orderMatters: true),
            TestCaseData(id: "73e64f1b-f740-48c4-8d29-e4e74c8a5764",
             input: "A = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], queries = [[-1, 0], [-2, 1], [-3, 2], [-4, 3], [-5, 4], [-6, 5], [-7, 6], [-8, 7], [-9, 8], [-10, 9]]",
             expected: "[30,28,28,24,24,18,18,10,10,0]", orderMatters: true),
            TestCaseData(id: "31e8d1fe-7532-403b-a450-0a9080fcc872",
             input: "A = [1, 1, 1, 1], queries = [[1, 0], [1, 1], [1, 2], [1, 3]]",
             expected: "[2,4,6,8]", orderMatters: true),
            TestCaseData(id: "1dda2d3c-0532-4a7e-adf8-6f3a0972c21c",
             input: "A = [2, 2, 2, 2], queries = [[-2, 0], [-2, 1], [-2, 2], [-2, 3]]",
             expected: "[6,4,2,0]", orderMatters: true),
            TestCaseData(id: "9c932519-2de4-485b-bb12-4b71121df581",
             input: "A = [0, 0, 0, 0], queries = [[1, 0], [1, 1], [1, 2], [1, 3]]",
             expected: "[0,0,0,0]", orderMatters: true),
            TestCaseData(id: "292fd27a-3032-4ebf-94fa-94316054935c",
             input: "A = [100, 200, 300, 400], queries = [[-100, 0], [-200, 1], [-300, 2], [-400, 3]]",
             expected: "[900,700,400,0]", orderMatters: true),
            TestCaseData(id: "7a16ec0b-17cb-4ffb-9120-e27509d53708",
             input: "A = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], queries = [[1, 0], [2, 1], [3, 2], [4, 3], [5, 4], [6, 5], [7, 6], [8, 7], [9, 8], [10, 9]]",
             expected: "[32,34,40,44,54,60,74,82,100,110]", orderMatters: true),
            TestCaseData(id: "afc62605-fe29-4705-8b1e-445d01031a02",
             input: "A = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100], queries = [[-10, 0], [-20, 1], [-30, 2], [-40, 3], [-50, 4], [-60, 5], [-70, 6], [-80, 7]"
                + ", [-90, 8], [-100, 9]]",
             expected: "[540,520,490,450,400,340,270,190,100,0]", orderMatters: true),
            TestCaseData(id: "a899ff48-87a5-4e54-a7a8-c9e7b092a9f1",
             input: "A = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1], queries = [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [1, 9]]",
             expected: "[2,4,6,8,10,12,14,16,18,20]", orderMatters: true),
            TestCaseData(id: "3432c711-929e-4dd4-9819-fc697111ea6b",
             input: "A = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2], queries = [[-2, 0], [-2, 1], [-2, 2], [-2, 3], [-2, 4], [-2, 5], [-2, 6], [-2, 7], [-2, 8], [-2, 9]]",
             expected: "[6,4,2,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "2cf6da3e-db43-4897-87d0-9203d64ced64",
             input: "A = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], queries = [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [1, 9]]",
             expected: "[0,0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "241d9253-d091-484f-a0cf-ca76e7bbd6aa",
             input: "A = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20], queries = [[2, 0], [4, 1], [6, 2], [8, 3], [10, 4], [12, 5], [14, 6], [16, 7], [18, 8], [20, 9]]",
             expected: "[112,116,122,130,140,152,166,182,200,220]", orderMatters: true),
            TestCaseData(id: "5679dd56-a7f3-443a-a555-4200acd96424",
             input: "A = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000], queries = [[1000, 0], [2000, 1], [3000, 2], [4000, 3], [5000, 4], [60"
                + "00, 5], [7000, 6], [8000, 7], [9000, 8], [10000, 9]]",
             expected: "[56000,58000,61000,65000,70000,76000,83000,91000,100000,110000]", orderMatters: true),
            TestCaseData(id: "228ff17c-6a9d-4c03-a5de-85dbe6383b44",
             input: "A = [100000, 100000, 100000], queries = [[-100000, 0], [100000, 1], [100000, 2]]",
             expected: "[200000,300000,400000]", orderMatters: true),
            TestCaseData(id: "04319057-abb9-4033-8cc0-23f38d25eceb",
             input: "A = [-2, -4, -6, -8], queries = [[2, 0], [4, 1], [6, 2], [8, 3]]",
             expected: "[-18,-14,-8,0]", orderMatters: true),
            TestCaseData(id: "65d45f45-1c18-4c13-a80d-e2c7b5044c7c",
             input: "nums = [1,2,3,4], queries = [[1,0],[-3,1],[-4,0],[2,3]]",
             expected: "[8,6,2,4]", orderMatters: true),
            TestCaseData(id: "4f531902-7ccb-4eb8-ab2c-4aefa5d1bd64",
             input: "nums = [1], queries = [[4,0]]",
             expected: "[0]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sum-of-even-numbers-after-queries"
            let topic = "arrays-hashing"
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

            guard let p_A = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }
            guard let p_queries = InputParser.parse2DIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [[Int]]"
                )
                return
            }
            guard p_queries.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: queries 2D array too large (\(p_queries.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.count >= 1 && p_A.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 10^4"
                )
                return
            }
            guard p_A.allSatisfy({ $0 >= -10000 && $0 <= 10000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10^4 <= nums[i] <= 10^4"
                )
                return
            }
            guard p_queries.count >= 1 && p_queries.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= queries.length <= 10^4"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.sumEvenAfterQueries(p_A, p_queries)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
