import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTimeNeededToInformAllEmployees {
    private class Solution {
        func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
            var subordinates = [[Int]](repeating: [], count: n)
            for i in 0..<n {
                if manager[i] != -1 { subordinates[manager[i]].append(i) }
            }
            func dfs(_ node: Int) -> Int {
                var maxTime = 0
                for sub in subordinates[node] {
                    maxTime = max(maxTime, dfs(sub))
                }
                return informTime[node] + maxTime
            }
            return dfs(headID)
        }
    }

    @Suite struct TimeNeededToInformAllEmployeesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "61aeafd1-f553-4f88-9638-269bdca59c10",
             input: "n = 1, headID = 0, manager = [-1], informTime = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b82e2316-bbad-4a4f-b749-2270949cdde2",
             input: "n = 2, headID = 0, manager = [0,0], informTime = [0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8e1838d0-6ff8-4366-8209-bcacc0ae313b",
             input: "n = 3, headID = 0, manager = [0,0,0], informTime = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "38f1b043-a25e-48b7-95cc-500cafa7e134",
             input: "n = 4, headID = 0, manager = [0,0,0,0], informTime = [0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2fa2c9c1-f306-41bc-b8c4-80c36b8420c5",
             input: "n = 5, headID = 0, manager = [0,0,0,0,0], informTime = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fb6cbc7a-0dbc-45e8-aa65-4aa855e70929",
             input: "n = 7, headID = 6, manager = [6,6,6,6,6,6,-1], informTime = [0,0,0,0,0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d94fdde9-fbdd-4faf-8b6c-6d5f0372a416",
             input: "n = 11, headID = 10, manager = [10,10,10,10,10,10,10,10,10,10,-1], informTime = [1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6353764a-441d-4da2-b375-dd291224096f",
             input: "n = 12, headID = 0, manager = [0,0,0,0,0,0,0,0,0,0,0,0], informTime = [1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "500ebac7-4b6a-495c-9508-205528d26ce4",
             input: "n = 13, headID = 0, manager = [0,0,0,0,0,0,0,0,0,0,0,0,0], informTime = [1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8ac10294-8587-4b5d-97b4-7a77bd17aa22",
             input: "n = 14, headID = 0, manager = [0,0,0,0,0,0,0,0,0,0,0,0,0,0], informTime = [1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d6467b00-d856-4188-a721-9499c7fcbd80",
             input: "n = 15, headID = 0, manager = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], informTime = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "53906484-0f1e-4524-a70e-a70c2bf581b4",
             input: "n = 16, headID = 0, manager = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], informTime = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b5463b5a-dc60-4f8f-81b3-479cb2fd8fdb",
             input: "n = 17, headID = 0, manager = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], informTime = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "53a4bc52-d0c8-4a1f-a66e-b5a6d3a82750",
             input: "n = 18, headID = 0, manager = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], informTime = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3821bdd5-f0af-47d5-b2a0-7931cf5138a5",
             input: "n = 19, headID = 0, manager = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], informTime = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9a412ae8-886b-4897-9dba-5f2438a2454e",
             input: "n = 20, headID = 0, manager = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], informTime = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c1a52629-a44d-44d5-8dbd-1f222131fa81",
             input: "n = 2, headID = 0, manager = [0,-1], informTime = [0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e4bfd68b-af8b-4f0b-9dcd-4479f0213d49",
             input: "n = 3, headID = 0, manager = [0,0,-1], informTime = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2552a9b0-a189-497d-8d2b-423afa76e36e",
             input: "n = 4, headID = 0, manager = [0,0,0,-1], informTime = [0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8be59e9e-dd52-4ee9-b567-3ae031c1d0ca",
             input: "n = 5, headID = 0, manager = [0,0,0,0,-1], informTime = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2b5103e2-580d-404b-8620-953262e8215d",
             input: "n = 6, headID = 0, manager = [0,0,0,0,0,-1], informTime = [0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1e709509-7168-40b0-826f-05916b414e47",
             input: "n = 7, headID = 0, manager = [0,0,0,0,0,0,-1], informTime = [0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "85ca491b-0898-4296-ba44-2de5569a52d8",
             input: "n = 8, headID = 0, manager = [0,0,0,0,0,0,0,-1], informTime = [0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c40945b4-1d9a-4f6e-88e9-52b728c232e7",
             input: "n = 9, headID = 0, manager = [0,0,0,0,0,0,0,0,-1], informTime = [0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "12e79cc7-e503-4a5b-a84c-df7510e15371",
             input: "n = 10, headID = 0, manager = [0,0,0,0,0,0,0,0,0,-1], informTime = [0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "time-needed-to-inform-all-employees"
            let topic = "trees"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 4 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 4, got \(params.count)"
                )
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_headID = InputParser.parseInt(params[1]) else {
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
            guard let p_manager = InputParser.parseIntArray(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as [Int]"
                )
                return
            }
            guard p_manager.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: manager array too large (\(p_manager.count))"
                )
                return
            }
            guard let p_informTime = InputParser.parseIntArray(params[3]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 3 as [Int]"
                )
                return
            }
            guard p_informTime.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: informTime array too large (\(p_informTime.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 105"
                )
                return
            }
            guard p_headID >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= headID < n"
                )
                return
            }
            guard p_informTime.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= informTime[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.numOfMinutes(p_n, p_headID, p_manager, p_informTime)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
