import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGasStation {
    private class Solution {
        func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
            let n = gas.count

            for start in 0..<n {
                var tank = 0
                var success = true

                for i in 0..<n {
                    let station = (start + i) % n
                    tank += gas[station] - cost[station]
                    if tank < 0 {
                        success = false
                        break
                    }
                }

                if success { return start }
            }

            return -1
        }
    }

    @Suite struct GasStationTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7a52c663-89f5-42be-8f19-ad42c46afbf0",
             input: "gas = [5,1,2,3,4], cost = [4,4,1,5,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "4055f59a-b9a4-469f-8569-acdb1a9f1e95",
             input: "gas = [3,3,4], cost = [3,4,4]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "56225d2d-a5d5-48eb-92dc-62cec6c76553",
             input: "gas = [1,1,1,1,1], cost = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b7a06b8e-90e2-497c-8fb0-4483efb88c27",
             input: "gas = [2,2,2,2,2], cost = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "86bc4502-e151-4325-a829-529076b5327a",
             input: "gas = [1], cost = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "06908f6c-5f20-460a-86ea-6b54e9dc46a9",
             input: "gas = [1,2], cost = [2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ffa82820-976a-42b6-af0d-faa0ef02bb7c",
             input: "gas = [2,1], cost = [1,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d804a237-e380-4ab2-b184-5a8050caa338",
             input: "gas = [0,0,0,0,0], cost = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7171915c-f43e-4357-bc5e-910d37d974ed",
             input: "gas = [10,10,10,10,10], cost = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9029e943-3c5a-4079-9aed-492cd76cafca",
             input: "gas = [5,4,3,2,1], cost = [1,2,3,4,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5be0e69a-d325-4f93-8a41-da9937739300",
             input: "gas = [1,1,1,1,1], cost = [2,2,2,2,2]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "3fb3145e-5c36-42c9-990e-145671342764",
             input: "gas = [2,2,2,2,2], cost = [2,2,2,2,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a959d0b0-189f-400b-bf89-64a650b6d585",
             input: "gas = [10,20,30,40,50], cost = [5,10,15,20,25]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "452b6494-404f-45ac-9411-2096ea65d6ac",
             input: "gas = [5,10,15,20,25], cost = [10,20,30,40,50]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "553eae36-712c-4c7d-9618-ed0fe8cd555c",
             input: "gas = [1,1,1,1,1], cost = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5b5405d3-b824-41be-a3d2-aea7ab8c2554",
             input: "gas = [0,0,0,0,0], cost = [1,1,1,1,1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "3fe08ab9-f9c7-492d-8a98-233b474ddd8c",
             input: "gas = [10,10,10,10,10], cost = [5,5,5,5,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "96649a23-e36f-4859-b2a3-d9a1bca95681",
             input: "gas = [5,5,5,5,5], cost = [10,10,10,10,10]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "0a60fd00-660f-4295-933f-fe9032133e39",
             input: "gas = [1,2,3,4,5], cost = [1,2,3,4,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "28fc06e3-2aea-46c0-97d3-cf2803fd6bb2",
             input: "gas = [5,4,3,2,1], cost = [5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1ed2dcf2-1125-40aa-8e75-7b08e53d4fb2",
             input: "gas = [50,40,30,20,10], cost = [10,20,30,40,50]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b2515cca-29f9-41d7-af9f-977e8a61286f",
             input: "gas = [1,1,1,1,0], cost = [1,1,1,1,1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "4b96dbd4-66f1-4d68-a373-507f0da82915",
             input: "gas = [10,10,10,10,10], cost = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5a03755f-ecd1-4724-bb40-7221a07b29ee",
             input: "gas = [0,0,0,0,0], cost = [10,10,10,10,10]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "cf5bb23c-1fcb-437c-8df9-193b8e65c458",
             input: "gas = [1,2,3,4,5], cost = [0,0,0,0,0]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "gas-station"
            let topic = "greedy"
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

            guard let p_gas = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_gas.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: gas array too large (\(p_gas.count))"
                )
                return
            }
            guard let p_cost = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_cost.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: cost array too large (\(p_cost.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_gas.count >= 1 && p_gas.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 105"
                )
                return
            }
            guard p_gas.allSatisfy({ $0 >= 0 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= gas[i], cost[i] <= 104"
                )
                return
            }
            guard p_cost.allSatisfy({ $0 >= 0 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= gas[i], cost[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.canCompleteCircuit(p_gas, p_cost)
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
