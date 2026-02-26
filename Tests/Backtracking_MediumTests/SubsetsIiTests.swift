import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSubsetsIi {
    private class Solution {
        func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
            var result: [[Int]] = []
            var current: [Int] = []
            let sorted = nums.sorted()

            func backtrack(_ start: Int) {
                result.append(current)
                for i in start..<sorted.count {
                    // Skip duplicates at same level
                    if i > start && sorted[i] == sorted[i-1] { continue }
                    current.append(sorted[i])
                    backtrack(i + 1)
                    current.removeLast()
                }
            }

            backtrack(0)
            return result
        }
    }

    @Suite struct SubsetsIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "DBE683CF-BB23-467D-A262-9AA6F3B29CD5",
             input: "[1,2,2]",
             expected: "[[],[1],[1,2],[1,2,2],[2],[2,2]]", orderMatters: false),
            TestCaseData(id: "B6916297-537B-4455-A8AB-2D76E30F31C5",
             input: "[0]",
             expected: "[[],[0]]", orderMatters: false),
            TestCaseData(id: "D263EF8E-2371-46A3-8827-E56F04F20098",
             input: "[1]",
             expected: "[[],[1]]", orderMatters: false),
            TestCaseData(id: "EABF141D-474B-4607-834A-BB3F9A6F4E99",
             input: "[]",
             expected: "[[]]", orderMatters: false),
            TestCaseData(id: "3F9F6CDF-D5E0-4680-87BA-ED92EF298BEF",
             input: "[4,4,4,1,4]",
             expected: "[[],[1],[1,4],[1,4,4],[1,4,4,4],[1,4,4,4,4],[4],[4,4],[4,4,4],[4,4,4,4]]", orderMatters: false),
            TestCaseData(id: "71312314-DE0C-4DAC-8605-BA1BEB134A08",
             input: "[5,5,5,5]",
             expected: "[[],[5],[5,5],[5,5,5],[5,5,5,5]]", orderMatters: false),
            TestCaseData(id: "B0F6D2EC-01F7-4D3D-9009-07CF6FB7DE32",
             input: "[1,1,2,2]",
             expected: "[[],[1],[1,1],[1,1,2],[1,1,2,2],[1,2],[1,2,2],[2],[2,2]]", orderMatters: false),
            TestCaseData(id: "B9720E7E-FF10-4A91-A202-A047257A8994",
             input: "[5]",
             expected: "[[],[5]]", orderMatters: false),
            TestCaseData(id: "476E70B8-8DDA-4229-8D4E-BE8D8684E7E1",
             input: "[1,1,2]",
             expected: "[[],[1],[1,1],[1,1,2],[1,2],[2]]", orderMatters: false),
            TestCaseData(id: "19F47FC6-F05B-4227-8FF0-0DD7DF0F6DA9",
             input: "[2,1,1]",
             expected: "[[],[1],[1,1],[1,1,2],[1,2],[2]]", orderMatters: false),
            TestCaseData(id: "2A9C4E6E-CD74-4DDC-BD0E-45FEABA62294",
             input: "[1,2,3]",
             expected: "[[],[1],[1,2],[1,2,3],[1,3],[2],[2,3],[3]]", orderMatters: false),
            TestCaseData(id: "BAA6F2CE-658D-46D7-8821-33F3803D5C54",
             input: "[2,2,2]",
             expected: "[[],[2],[2,2],[2,2,2]]", orderMatters: false),
            TestCaseData(id: "52457367-259C-4A7A-8D8A-3A4E33C6C5DC",
             input: "[-1,-1,0]",
             expected: "[[],[-1],[-1,-1],[-1,-1,0],[-1,0],[0]]", orderMatters: false),
            TestCaseData(id: "6BBC54BE-C4E0-4A7B-A327-29BF36B80F14",
             input: "[1,-1]",
             expected: "[[],[-1],[-1,1],[1]]", orderMatters: false),
            TestCaseData(id: "6533AB50-EC42-425E-A8AE-E4901FE1F56B",
             input: "[1,2,-3]",
             expected: "[[],[-3],[-3,1],[-3,1,2],[-3,2],[1],[1,2],[2]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "subsets-ii"
            let topic = "backtracking"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 10 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 10"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -10 && $0 <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10 <= nums[i] <= 10"
                )
                return
            }

            let solution = Solution()
            let result = solution.subsetsWithDup(p_nums)
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
