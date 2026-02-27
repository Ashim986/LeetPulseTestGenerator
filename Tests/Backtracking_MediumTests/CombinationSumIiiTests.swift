import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCombinationSumIii {
    private class Solution {
        func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
            var result = [[Int]]()
            var currentCombination = [Int]()
            combinationSum3Helper(&result, &currentCombination, k, n, 1, 0)
            return result
        }

        func combinationSum3Helper(_ result: inout [[Int]], _ currentCombination: inout [Int], _ k: Int, _ n: Int, _ start: Int, _ currentSum: Int) {
            if currentCombination.count == k {
                if currentSum == n {
                    result.append(currentCombination)
                }
                return
            }

            for i in start...9 {
                if currentSum + i <= n {
                    currentCombination.append(i)
                    combinationSum3Helper(&result, &currentCombination, k, n, i + 1, currentSum + i)
                    currentCombination.removeLast()
                } else {
                    break
                }
            }
        }
    }

    @Suite struct CombinationSumIiiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c513ecaa-64c8-4e9f-a442-7d5920cbf011",
             input: "k = 1, n = 1",
             expected: "[[1]]", orderMatters: false),
            TestCaseData(id: "263467fd-bda3-4735-8c2a-b6bd8a9fa61e",
             input: "k = 1, n = 2",
             expected: "[[2]]", orderMatters: false),
            TestCaseData(id: "fba28b78-d0d2-4c67-a0df-4e8c9d221328",
             input: "k = 2, n = 3",
             expected: "[[1,2]]", orderMatters: false),
            TestCaseData(id: "337752a6-8fc9-4355-9683-9a35517aeccb",
             input: "k = 3, n = 6",
             expected: "[[1,2,3]]", orderMatters: false),
            TestCaseData(id: "c89e31e7-2ce5-49b9-90e8-d973e3dee581",
             input: "k = 3, n = 7",
             expected: "[[1,2,4]]", orderMatters: false),
            TestCaseData(id: "a6d778f3-f119-4a83-a54f-c05918a85d8f",
             input: "k = 4, n = 10",
             expected: "[[1,2,3,4]]", orderMatters: false),
            TestCaseData(id: "3ce521be-3a3b-4021-90d0-28a9e419171e",
             input: "k = 4, n = 11",
             expected: "[[1,2,3,5]]", orderMatters: false),
            TestCaseData(id: "23a2fdee-a018-4155-a456-0bed6cba7d9d",
             input: "k = 5, n = 15",
             expected: "[[1,2,3,4,5]]", orderMatters: false),
            TestCaseData(id: "5e692f1f-a717-4438-86ea-0b89a2e60411",
             input: "k = 5, n = 16",
             expected: "[[1,2,3,4,6]]", orderMatters: false),
            TestCaseData(id: "12e7e518-e74a-4d6f-8a4f-e48d75247400",
             input: "k = 6, n = 21",
             expected: "[[1,2,3,4,5,6]]", orderMatters: false),
            TestCaseData(id: "9760c779-5c6d-4f91-aff6-02376d9c2c66",
             input: "k = 6, n = 22",
             expected: "[[1,2,3,4,5,7]]", orderMatters: false),
            TestCaseData(id: "90a916f4-5ff3-45ad-bec8-71e3df487e2f",
             input: "k = 7, n = 28",
             expected: "[[1,2,3,4,5,6,7]]", orderMatters: false),
            TestCaseData(id: "3674313d-6a4a-4fa0-89ea-f9947585e858",
             input: "k = 7, n = 29",
             expected: "[[1,2,3,4,5,6,8]]", orderMatters: false),
            TestCaseData(id: "734f2239-06aa-4ec5-92bb-6c49fd75b91d",
             input: "k = 8, n = 36",
             expected: "[[1,2,3,4,5,6,7,8]]", orderMatters: false),
            TestCaseData(id: "d4c5440c-1604-4425-8980-9441eb26f153",
             input: "k = 8, n = 37",
             expected: "[[1,2,3,4,5,6,7,9]]", orderMatters: false),
            TestCaseData(id: "5d30ffad-0f8e-4f72-902e-c9a25faca626",
             input: "k = 9, n = 45",
             expected: "[[1,2,3,4,5,6,7,8,9]]", orderMatters: false),
            TestCaseData(id: "d0b6abb9-a13d-408e-b97e-4ebcbbf4bdb3",
             input: "k = 100, n = 100",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "31fbb53a-214c-4d45-b777-3fd56c869669",
             input: "k = 0, n = 10",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "3cb460fe-5787-40ba-b5f3-619e57c9dfe3",
             input: "k = 10, n = 0",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "7f72bc8a-3ffa-47d6-838a-c0c14516ce33",
             input: "k = -1, n = 10",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "6c9c3655-f5e5-466b-b0f2-1196428f2b4f",
             input: "k = 10, n = -1",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "ee57d597-6c6f-4407-976b-733bcc7a9bcf",
             input: "k = 1000, n = 1",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "086e1514-28b8-48a4-9b3e-b739559134c4",
             input: "k = 2, n = 2",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "2702097d-c40f-4a76-a5b5-19810eb9fdbe",
             input: "k = 9, n = 46",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "76ebcdec-f67b-463e-bfbe-4dcd94352eb3",
             input: "k = 10, n = 55",
             expected: "[]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "combination-sum-iii"
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

            guard let p_k = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_n = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_k >= 2 && p_k <= 9 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= k <= 9"
                )
                return
            }
            guard p_n >= 1 && p_n <= 60 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 60"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.combinationSum3(p_k, p_n)
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
