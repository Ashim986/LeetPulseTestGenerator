import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCombinationSumIi {
    private class Solution {
        func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
            var result: [[Int]] = []
            var current: [Int] = []
            let sorted = candidates.sorted()

            func backtrack(_ start: Int, _ remaining: Int) {
                if remaining == 0 {
                    result.append(current)
                    return
                }
                for i in start..<sorted.count {
                    if sorted[i] > remaining { break }
                    if i > start && sorted[i] == sorted[i-1] { continue }
                    current.append(sorted[i])
                    backtrack(i + 1, remaining - sorted[i])
                    current.removeLast()
                }
            }

            backtrack(0, target)
            return result
        }
    }

    @Suite struct CombinationSumIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "55AD33D4-BD45-495A-B9F7-44C922C88534",
             input: "{\"candidates\": [10,1,2,7,6,1,5], \"target\": 8}",
             expected: "[[1,1,6],[1,2,5],[1,7],[2,6]]", orderMatters: true),
            TestCaseData(id: "0976026C-88C6-4873-98B2-154BBB72AE60",
             input: "{\"candidates\": [2,3,6,7], \"target\": 1}",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "36D86EEA-63E5-4462-960D-7FAE83B717CC",
             input: "{\"candidates\": [5], \"target\": 5}",
             expected: "[[5]]", orderMatters: true),
            TestCaseData(id: "9F4C2978-A8D6-4D9D-BB3A-694806AE53EF",
             input: "{\"candidates\": [5], \"target\": 3}",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "BCECE5DF-FDE4-42DE-8C9B-5867E2B783C1",
             input: "{\"candidates\": [5,6,7], \"target\": 4}",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "1B92F161-6921-4851-ACB7-6C62168E405F",
             input: "{\"candidates\": [1,1,1,1,1], \"target\": 3}",
             expected: "[[1,1,1]]", orderMatters: true),
            TestCaseData(id: "21081B18-C96A-4A8D-BFA8-9D13D21F2B1F",
             input: "{\"candidates\": [2,2,2,2,2], \"target\": 4}",
             expected: "[[2,2]]", orderMatters: true),
            TestCaseData(id: "CF5F73D4-3791-40C7-99E7-5D872F9F43D8",
             input: "candidates = [5,6,7], target = 3",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "D546E188-59AF-4034-8047-4898F1F07E14",
             input: "candidates = [2,3,4], target = 9",
             expected: "[[2,3,4]]", orderMatters: true),
            TestCaseData(id: "30C5ECA2-04D9-4F14-BA9C-DDA13E10AFA6",
             input: "candidates = [1,2,3,4,5], target = 5",
             expected: "[[1,4],[2,3],[5]]", orderMatters: true),
            TestCaseData(id: "E9947183-6C97-4FF3-87C7-A1B9A77DFC06",
             input: "candidates = [1,1,1,2,2], target = 3",
             expected: "[[1,1,1],[1,2]]", orderMatters: true),
            TestCaseData(id: "F4947E61-5C5E-47E7-B63B-8F0F40989930",
             input: "candidates = [], target = 5",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "9F2A4422-92D4-4EC5-AC98-9A568F8FAF76",
             input: "candidates = [3,3,3,3], target = 3",
             expected: "[[3]]", orderMatters: true),
            TestCaseData(id: "7A6DFCA6-5F05-4C77-A202-985C3DAF0D10",
             input: "[2,5,8], 1",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "48F9516D-667E-4423-8C1C-BB1DDC40E431",
             input: "[5,6,7], 3",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "1A6576B7-3B8F-4240-AE52-2ED3437C7BA2",
             input: "{\"candidates\": [4,4,2,1,4,2,2,1,3,5], \"target\": 9}",
             expected: "[[1,1,2,2,3],[1,1,2,5],[1,1,3,4],[1,2,2,4],[1,3,5],[1,4,4],[2,2,5],[2,3,4],[4,5]]", orderMatters: true),
            TestCaseData(id: "9C84EF9F-7FDC-4DC8-B8D2-A49712F6F9F5",
             input: "{\"candidates\": [1,2,3], \"target\": 6}",
             expected: "[[1,2,3]]", orderMatters: true),
            TestCaseData(id: "8A8A3C65-9A95-4A18-896C-2CAAE9356771",
             input: "{\"candidates\": [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,3,3,3,3,3], \"target\": 5}",
             expected: "[[1,1,1,1,1],[1,1,1,2],[1,1,3],[1,2,2],[2,3]]", orderMatters: true),
            TestCaseData(id: "6809F635-62AE-46C9-9FCC-213C02054A29",
             input: "candidates = [15,8,2,4,1,1,1,2], target = 10",
             expected: "[[1,1,2,2,4],[1,1,2,6],[1,1,8],[1,2,2,5],[1,2,7],[1,4,5],[1,9],[2,2,6],[2,8],[4,6],[10]]", orderMatters: true),
            TestCaseData(id: "174BD5CF-4581-472A-981D-62F0F4482DEC",
             input: "candidates = [1,2,6,7], target = 5",
             expected: "[[1,2,2],[1,4],[2,3]]", orderMatters: true),
            TestCaseData(id: "FA3A6067-DD4F-48F1-9821-59FCD2CDD847",
             input: "candidates = [20,10,5,25,10], target = 50",
             expected: "[[5,10,15,20],[5,10,10,25],[5,20,25],[10,15,25],[10,20,20],[25,25]]", orderMatters: true),
            TestCaseData(id: "D20B6BC1-AB0C-45A0-8E73-8A119EEBD8DE",
             input: "[10,1,2,7,6,1,5], 8",
             expected: "[ [1,1,6], [1,2,5], [1,7], [2,6] ]", orderMatters: true),
            TestCaseData(id: "A410F487-37FD-4051-A5DA-230580EF2878",
             input: "[1,2,3], 0",
             expected: "[[]]", orderMatters: true),
            TestCaseData(id: "9EBAE27F-A8E9-405B-8757-FA6CE4C34944",
             input: "[3,1,4,2], 4",
             expected: "[[1,3],[4]]", orderMatters: true),
            TestCaseData(id: "5145dbb1-41f2-4b13-bc62-0677588bfe92",
             input: "candidates = [2,5,2,1,2], target = 5",
             expected: "[ [1,2,2], [5] ]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "combination-sum-ii"
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
            guard p_candidates.count >= 1 && p_candidates.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= candidates.length <= 100"
                )
                return
            }
            guard p_candidates.allSatisfy({ $0 >= 1 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= candidates[i] <= 50"
                )
                return
            }
            guard p_target >= 1 && p_target <= 30 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= target <= 30"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.combinationSum2(p_candidates, p_target)
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
