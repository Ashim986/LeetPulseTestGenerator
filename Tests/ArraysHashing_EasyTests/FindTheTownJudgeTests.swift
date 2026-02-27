import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindTheTownJudge {
    private class Solution {
        func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
            var trustScores: [Int] = Array(repeating: 0, count: n + 1)
            for edge in trust {
                trustScores[edge[0]] -= 1
                trustScores[edge[1]] += 1
            }
            for person in 1...n {
                if trustScores[person] == n - 1 {
                    return person
                }
            }
            return -1
        }
    }

    @Suite struct FindTheTownJudgeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "aaee14c9-815d-40e7-9cd0-944a7f15a4b9",
             input: "n = 1, trust = []",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d352057a-ed52-4b7c-a6ba-60417723c2db",
             input: "n = 4, trust = [[1,3],[2,3],[3,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "eaba6734-3aeb-404c-bfca-01c7d0e958a3",
             input: "n = 5, trust = [[1,3],[2,3],[3,1],[4,3]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "634de2f9-78a4-42e5-ab51-e83c12505516",
             input: "n = 2, trust = [[1,2],[2,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "562c18df-dd67-49fe-be21-ddb31efca233",
             input: "n = 3, trust = [[1,2],[2,1],[3,2]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "df266243-b39b-451c-8283-9c1889af4f75",
             input: "n = 4, trust = [[1,2],[2,3],[3,4]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "7889d8e7-4830-478a-9532-a6667e8e41bb",
             input: "n = 5, trust = [[1,2],[2,3],[3,4],[4,5]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "f7b79c8a-a354-4ad1-b122-4bb6cf6de6ea",
             input: "n = 1, trust = [[1,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "c733a599-b1fe-4dde-9053-b1ffb60e853f",
             input: "n = 2, trust = [[1,1],[2,2]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "c8f339d9-2c08-4ba9-bcb2-30cf0bdf392e",
             input: "n = 3, trust = [[1,2],[1,3]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "37ce69de-3fb2-4682-b538-acd2bea75e0b",
             input: "n = 4, trust = [[1,2],[1,3],[1,4]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "e314b847-2713-4d1f-940b-30e93a83dcb6",
             input: "n = 5, trust = [[1,2],[1,3],[1,4],[1,5]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "482917a4-5306-4ff9-acdf-29bed38a52a8",
             input: "n = 2, trust = [[1,2],[1,2]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d30c53d9-900e-45de-8bfd-03a5a207087a",
             input: "n = 3, trust = [[1,2],[1,3],[2,3]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "aa91d2e9-2e78-4978-a38a-39960831594a",
             input: "n = 4, trust = [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ca8271b7-9b36-4ec1-a838-c2f8334d6cad",
             input: "n = 5, trust = [[1,2],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5],[3,4],[3,5],[4,5]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4467fb74-c173-4a09-aeaf-e534212ca4ed",
             input: "n = 10, trust = [[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[1,9],[1,10],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[2,9],[2,10],[3,4],[3,5],[3,"
                + "6],[3,7],[3,8],[3,9],[3,10],[4,5],[4,6],[4,7],[4,8],[4,9],[4,10],[5,6],[5,7],[5,8],[5,9],[5,10],[6,7],[6,8],[6,9],[6,10],[7,8],[7,9],[7,"
                + "10],[8,9],[8,10],[9,10]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "2c39eca6-82f8-4437-b1e4-af31a10093ea",
             input: "n = 1000, trust = [[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[1,9],[1,10],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[2,9],[2,10],[3,4],[3,5],["
                + "3,6],[3,7],[3,8],[3,9],[3,10],[4,5],[4,6],[4,7],[4,8],[4,9],[4,10],[5,6],[5,7],[5,8],[5,9],[5,10],[6,7],[6,8],[6,9],[6,10],[7,8],[7,9],["
                + "7,10],[8,9],[8,10],[9,10]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "beca030c-8a8f-48e3-a5f4-ac28802136f3",
             input: "n = 0, trust = []",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "4092c23f-12f6-482d-b659-bceee1e2add8",
             input: "n = -1, trust = []",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "57aea0b4-9420-4aa3-8635-23d64cf933b4",
             input: "n = 2, trust = [[1,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "d6621c0a-779e-45b2-8e9d-32c741baf0f1",
             input: "n = 3, trust = [[1,1],[2,2],[3,3]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "ee7d5a87-f48e-43aa-858d-e1208188e2a2",
             input: "n = 4, trust = [[1,1],[2,2],[3,3],[4,4]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "654559a0-8d3b-4134-ba85-198d344fa970",
             input: "n = 5, trust = [[1,1],[2,2],[3,3],[4,4],[5,5]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "0c059a68-d212-42fd-87c0-805888df3e54",
             input: "n = 2, trust = [[1,2],[2,1],[1,2]]",
             expected: "-1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-the-town-judge"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_trust = InputParser.parse2DIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [[Int]]"
                )
                return
            }
            guard p_trust.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: trust 2D array too large (\(p_trust.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 1000"
                )
                return
            }
            guard p_trust.count >= 0 && p_trust.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= trust.length <= 10^4"
                )
                return
            }
            guard p_trust.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: trust[i].length == 2"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findJudge(p_n, p_trust)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
