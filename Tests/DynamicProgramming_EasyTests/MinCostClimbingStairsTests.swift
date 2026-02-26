import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinCostClimbingStairs {
    private class Solution {
        func minCostClimbingStairs(_ cost: [Int]) -> Int {
            var prev2 = cost[0], prev1 = cost[1]
            for i in 2..<cost.count {
                let curr = cost[i] + min(prev1, prev2)
                prev2 = prev1
                prev1 = curr
            }
            return min(prev1, prev2)
        }
    }

    @Suite struct MinCostClimbingStairsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d9325571-6556-49ba-ac9c-aa4b7a90e156",
             input: "cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "1107f5bd-12e9-44f4-ba2d-776eb4042947",
             input: "cost = [1, 2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "80c23955-0096-401d-9787-48bfe04a8178",
             input: "cost = [0, 0, 0, 0, 0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "653b8858-ba35-487a-ac4f-98f05cfa1615",
             input: "cost = [1, 1, 1, 1, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "fd2fa813-893c-42ce-92a1-f0be0c8683d2",
             input: "cost = [10, 10, 10, 10, 10]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "439f5c08-ac50-4e11-854d-05b04ac73750",
             input: "cost = [-1, -2, -3, -4, -5]",
             expected: "-14", orderMatters: true),
            TestCaseData(id: "4d6e4a98-f54c-4e7b-adcc-c1e566f7233c",
             input: "cost = [100, 100, 100, 100, 100]",
             expected: "200", orderMatters: true),
            TestCaseData(id: "a43dae96-c6bd-45c0-b139-d5d933e043b2",
             input: "cost = [1, 2, 3, 4, 5]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "5f7f9aac-d28b-497d-9ecc-5276cc52cd12",
             input: "cost = [5, 4, 3, 2, 1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "ab16d3a0-1072-4c8a-a9f8-0b804a8f2ca1",
             input: "cost = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2d09587d-8cd4-4c51-8bc3-ae4864ba594c",
             input: "cost = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]",
             expected: "250", orderMatters: true),
            TestCaseData(id: "4de452b6-2f98-4a2c-b47e-29999f9441af",
             input: "cost = [100, 90, 80, 70, 60, 50, 40, 30, 20, 10]",
             expected: "250", orderMatters: true),
            TestCaseData(id: "05418587-e406-4fd2-b4d2-dc23c0c7b65d",
             input: "cost = [1, 100, 1, 100, 1, 100, 1, 100, 1, 100]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "bde15feb-6f4b-4320-ae94-745d24296aea",
             input: "cost = [100, 1, 100, 1, 100, 1, 100, 1, 100, 1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f21ed9e3-a764-40ce-8a83-e47ba7c8cd38",
             input: "cost = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "02d22bf6-d957-4f5b-a3bf-23078004688c",
             input: "cost = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "c6c45e14-fd89-4ce8-9347-b327b74a084c",
             input: "cost = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "19d67e2a-6d4e-4631-ba89-002ba9d03261",
             input: "cost = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]",
             expected: "360", orderMatters: true),
            TestCaseData(id: "46644cbe-9fdd-4d88-9dfc-821d04a98458",
             input: "cost = [120, 110, 100, 90, 80, 70, 60, 50, 40, 30, 20, 10]",
             expected: "360", orderMatters: true),
            TestCaseData(id: "79f2e0fd-0b17-4aa6-8f1b-283a31decbd0",
             input: "cost = [1, 100, 1, 100, 1, 100, 1, 100, 1, 100, 1, 100]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "138784cd-aebc-4958-8b34-f56d878e1b5d",
             input: "cost = [100, 1, 100, 1, 100, 1, 100, 1, 100, 1, 100, 1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "6fc969a9-d804-4219-bb71-7f486fcc4c45",
             input: "cost = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "d005742b-5a79-4eb0-a4e3-e3c21235acec",
             input: "cost = [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "db975354-9812-4fdc-9caa-acfb36beed53",
             input: "cost = [10,15,20]",
             expected: "15", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "min-cost-climbing-stairs"
            let topic = "dynamic-programming"
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

            guard let p_cost = InputParser.parseIntArray(params[0]) else {
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
            guard p_cost.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: cost array too large (\(p_cost.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_cost.count >= 2 && p_cost.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= cost.length <= 1000"
                )
                return
            }
            guard p_cost.allSatisfy({ $0 >= 0 && $0 <= 999 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= cost[i] <= 999"
                )
                return
            }

            let solution = Solution()
            let result = solution.minCostClimbingStairs(p_cost)
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
