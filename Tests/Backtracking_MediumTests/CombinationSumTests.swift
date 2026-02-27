import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCombinationSum {
    private class Solution {
        func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
            var result: [[Int]] = []
            var current: [Int] = []

            func backtrack(_ index: Int, _ remaining: Int) {
                if remaining == 0 {
                    result.append(current)
                    return
                }
                if remaining < 0 { return }

                for i in index..<candidates.count {
                    current.append(candidates[i])
                    backtrack(i, remaining - candidates[i])  // same i for reuse
                    current.removeLast()
                }
            }

            backtrack(0, target)
            return result
        }
    }

    @Suite struct CombinationSumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "C6AB81DA-C9E5-46E1-8C91-4F2461EEF64F",
             input: "candidates = [2,3,6,7], target = 7",
             expected: "[[2,2,3],[7]]", orderMatters: false),
            TestCaseData(id: "CF950005-71A8-4CD8-9AD9-66C50AE50D0B",
             input: "candidates = [7,8], target = 2",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "1136D27D-D8F0-41F9-97FB-564A6CC187DB",
             input: "candidates = [1], target = 5",
             expected: "[[1,1,1,1,1]]", orderMatters: false),
            TestCaseData(id: "763542F0-2986-47CD-AE9F-648BFECEEDD1",
             input: "candidates = [2,3,5], target = 8",
             expected: "[[2,2,2,2],[2,3,3],[3,5]]", orderMatters: false),
            TestCaseData(id: "FA1462EB-6646-4DA2-B851-9473E6E5BCAE",
             input: "candidates = [2,4], target = 5",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "89D05FDD-A51E-4684-ABF4-FBAB883A2ECA",
             input: "candidates = [1,2,3], target = 4",
             expected: "[[1,1,1,1],[1,1,2],[1,3],[2,2]]", orderMatters: false),
            TestCaseData(id: "4C819747-57C8-414A-AC66-35D7DD81DB9E",
             input: "candidates = [10,20,30], target = 10",
             expected: "[[10]]", orderMatters: false),
            TestCaseData(id: "2AC48EB2-8F8B-4005-8CBE-DC2FC9C051D9",
             input: "candidates = [10,1,2], target = 3",
             expected: "[[1,1,1],[1,2]]", orderMatters: false),
            TestCaseData(id: "82AD5604-5AAB-4598-9A19-6F90077E1C8B",
             input: "{\"candidates\": [2, 3, 6, 7], \"target\": 7}",
             expected: "[[2, 2, 3], [7]]", orderMatters: false),
            TestCaseData(id: "EBAE92F6-3CE3-410E-9776-0C9BE937DC24",
             input: "{\"candidates\": [2, 3, 5], \"target\": 8}",
             expected: "[[2, 2, 2, 2], [2, 3, 3], [3, 5]]", orderMatters: false),
            TestCaseData(id: "DE0D7081-5F2F-4ADF-9B18-363DFE5706C6",
             input: "{\"candidates\": [2, 4], \"target\": 3}",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "3B7A8EA8-EFDF-4BE5-B399-2A0F00DCE4C5",
             input: "{\"candidates\": [3], \"target\": 9}",
             expected: "[[3, 3, 3]]", orderMatters: false),
            TestCaseData(id: "72A89EF3-E6FC-4885-B578-EECFA96C8C04",
             input: "{\"candidates\": [5], \"target\": 3}",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "A47D4574-D7D7-44B0-8A62-40F1EDA696F7",
             input: "{\"candidates\": [1, 2], \"target\": 4}",
             expected: "[[1, 1, 1, 1], [1, 1, 2], [2, 2]]", orderMatters: false),
            TestCaseData(id: "6D6BFECB-FAEE-484E-A30B-6B315E3D8822",
             input: "{\"candidates\": [2, 4, 6], \"target\": 6}",
             expected: "[[2, 2, 2], [2, 4], [6]]", orderMatters: false),
            TestCaseData(id: "70B26E04-0D46-46DF-93B4-25264BAEC6A9",
             input: "{\"candidates\": [2, 4, 6, 8], \"target\": 10}",
             expected: "[[2, 2, 2, 2, 2], [2, 2, 2, 4], [2, 2, 6], [2, 4, 4], [2, 8], [4, 6]]", orderMatters: false),
            TestCaseData(id: "1C70B3C1-37B5-4B81-B710-6AF4A1003857",
             input: "{\"candidates\": [4, 5, 6, 7], \"target\": 10}",
             expected: "[[4, 6], [5, 5]]", orderMatters: false),
            TestCaseData(id: "788BD738-59B7-4D7F-9278-EFD5D20CED57",
             input: "candidates = [3], target = 9",
             expected: "[[3, 3, 3]]", orderMatters: false),
            TestCaseData(id: "6030E630-CBFF-4B77-81C6-BE16703076D4",
             input: "candidates = [5], target = 7",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "D5594ED9-DC0D-4854-A881-650E975C1C49",
             input: "candidates = [1, 2], target = 3",
             expected: "[[1, 1, 1], [1, 2]]", orderMatters: false),
            TestCaseData(id: "29B25FA7-5F05-4859-B5A4-6AB238F326BC",
             input: "candidates = [8, 12, 16], target = 32",
             expected: "[[8, 8, 8, 8], [8, 8, 16], [8, 12, 12], [16, 16]]", orderMatters: false),
            TestCaseData(id: "A8E2A647-2483-48D6-915D-A79288270C3B",
             input: "candidates = [10, 20, 30], target = 5",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "4DDB286F-052F-4428-9E2B-9D475630F7E8",
             input: "candidates = [1, 2, 3, 4], target = 5",
             expected: "[[1, 1, 1, 1, 1], [1, 1, 1, 2], [1, 1, 3], [1, 2, 2], [1, 4], [2, 3]]", orderMatters: false),
            TestCaseData(id: "45DC1F31-2BA3-4676-8D4E-2089213D62D8",
             input: "candidates: [2,3,6,7], target: 7",
             expected: "[[2,2,3],[7]]", orderMatters: false),
            TestCaseData(id: "23B377D6-D783-4D17-9D52-E795781BFE4A",
             input: "candidates: [2,3,5], target: 8",
             expected: "[[2,2,2,2],[2,3,3],[3,5]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "combination-sum"
            let topic = "backtracking"
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

            guard let p_candidates = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_candidates.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: candidates array too large (\(p_candidates.count))"
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
            guard p_candidates.count >= 1 && p_candidates.count <= 30 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= candidates.length <= 30"
                )
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 2 && $0 <= 40 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= candidates[i] <= 40"
                )
                return
            }
            guard p_target >= 1 && p_target <= 40 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= target <= 40"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.combinationSum(p_candidates, p_target)
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

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
