import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumCostForTickets {
    private class Solution {
        func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
            var n = days.count
            var set = Set(days)
            var dp = [Int: Int]()
            dp[0] = 0
            for i in 1...n {
                let iDay = days[i - 1]
                let oneDay = (dp[i - 1] ?? 0) + costs[0]
                let sevenDays = (set.filter { $0 <= iDay - 7 }.last?.distance(to: iDay) ?? 0) + 1 < i ? dp[(set.filter { $0 <= iDay - 7 }.last?.distance(to: iDay) ?? 0) + 1] ?? 0 : 0
                let thirtyDays = (set.filter { $0 <= iDay - 30 }.last?.distance(to: iDay) ?? 0) + 1 < i ? dp[(set.filter { $0 <= iDay - 30 }.last?.distance(to: iDay) ?? 0) + 1] ?? 0 : 0
                dp[i] = min(oneDay, min(sevenDays, thirtyDays))
            }
            return dp[n] ?? 0
        }
    }

    @Suite struct MinimumCostForTicketsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "90573577-ba73-4469-9a45-d68cab2aa743",
             input: "days = [1], costs = [1,2,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9a4fe1d2-54d8-4721-9fab-859d6cc8a1ec",
             input: "days = [1,2], costs = [1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "37358ef9-77a6-4ea4-9fe2-ea5377814e78",
             input: "days = [1], costs = [10,20,30]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "f1a383ed-33e6-42a8-897f-201e2497c7a7",
             input: "days = [], costs = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "08c28a21-e046-4b42-bdba-efe85bffee4a",
             input: "days = [1,2,3], costs = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c89ebac8-d257-479e-9a0c-9f5e0a6c4e96",
             input: "days = [1,100], costs = [1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e1aa93c3-ab89-4514-a511-f47ad0399412",
             input: "days = [1,1000], costs = [1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e08b1e23-62d2-4568-8bab-b3730f700fb4",
             input: "days = [1,2,3,4,5], costs = [5,5,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "d1eab46c-c5b5-404a-af9f-572886f0566e",
             input: "days = [1,2,3,4,5], costs = [1,5,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b7b51241-388c-4453-a794-28aaa2fd1ec5",
             input: "days = [1,2,3,4,5], costs = [1,100,1000]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "fdba5d6b-863e-4425-ba16-565de4e6d89f",
             input: "days = [1,2,3,4,5], costs = [100,100,100]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "3c020737-7fe2-4e30-b9fd-7d25739e2aee",
             input: "days = [1,2,3,4,5], costs = [1000,1000,1000]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "e450bcc8-4965-4192-8ffc-e863d345bc71",
             input: "days = [1,2,3], costs = [1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "94a1a139-5380-4ff1-a6d8-828679947a0b",
             input: "days = [1,1,1], costs = [1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2d95b38e-8952-4c57-94c7-143b452c673d",
             input: "days = [1,2,3,4,5], costs = [1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "57236445-f0c5-4618-9bb9-1c04c3d5816b",
             input: "days = [5,4,3,2,1], costs = [1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ea3010c3-fb82-454a-870e-81a7b52f239d",
             input: "days = [1,2,3,4,5], costs = [10,20,30]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "97ed65d9-4074-40e9-baae-925fdec31f1c",
             input: "days = [1,2,3], costs = [-1,-2,-3]",
             expected: "-5", orderMatters: true),
            TestCaseData(id: "0d58e29d-26c6-4025-91ea-a7b49778c56f",
             input: "days = [1,2,3,4,5,6,7,8,9,10], costs = [1,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "83bc81ca-c7b0-4839-ad50-fa66a1110da0",
             input: "days = [1,2,3,4,5,6,7,8,9,10], costs = [10,20,30]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "0045af2d-c7c0-493f-8106-b3bdbb02f6fd",
             input: "days = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31], costs = [1,2,3]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e86a8daf-070b-48d1-89ba-c47c93f6d59e",
             input: "days = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31], costs = [10,20,30]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "9bd117c8-6e40-42dd-bf66-1ade086db6a5",
             input: "days = [1,2,3,4,5], costs = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "55d2e4a6-53ac-439f-b4c8-31b5507f7dcd",
             input: "days = [1,2,3,4,5], costs = [10,5,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "127e7011-b721-4cb4-a9a8-c09465721f9e",
             input: "days = [1,4,6,7,8,20], costs = [2,7,15]",
             expected: "11", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-cost-for-tickets"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_days = InputParser.parseIntArray(params[0]) else {
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
            guard p_days.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: days array too large (\(p_days.count))"
                )
                return
            }
            guard let p_costs = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_costs.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: costs array too large (\(p_costs.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_days.count >= 1 && p_days.count <= 365 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= days.length <= 365"
                )
                return
            }
            guard p_days.allSatisfy({ $0 >= 1 && $0 <= 365 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= days[i] <= 365"
                )
                return
            }
            guard p_costs.allSatisfy({ $0 >= 1 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= costs[i] <= 1000"
                )
                return
            }
            guard p_costs.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: costs.length == 3"
                )
                return
            }

            let solution = Solution()
            let result = solution.mincostTickets(p_days, p_costs)
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
