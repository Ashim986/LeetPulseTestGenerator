import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCWaterAndJugProblem {
    private class Solution {
        func canMeasureWaterMath(_ jug1Capacity: Int, _ jug2Capacity: Int, _ targetCapacity: Int) -> Bool {
            if jug1Capacity + jug2Capacity < targetCapacity {
                return false
            }

            func gcd(_ a: Int, _ b: Int) -> Int {
                if b == 0 {
                    return a
                } else {
                    return gcd(b, a % b)
                }
            }

            let g = gcd(jug1Capacity, jug2Capacity)
            return targetCapacity % g == 0
        }
    }

    @Suite struct WaterAndJugProblemTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b92b5e02-c150-44a8-be2d-562a04b7cf48",
             input: "jug1Capacity = 1, jug2Capacity = 1, targetCapacity = 1",
             expected: "True", orderMatters: true),
            TestCaseData(id: "f26f64c5-b6c6-40d2-906c-2273b5d1e0e6",
             input: "jug1Capacity = 0, jug2Capacity = 0, targetCapacity = 0",
             expected: "True", orderMatters: true),
            TestCaseData(id: "9bfbddab-5e91-41c2-a141-a8c3ccaa8872",
             input: "jug1Capacity = 10, jug2Capacity = 10, targetCapacity = 10",
             expected: "True", orderMatters: true),
            TestCaseData(id: "00fb949c-6049-439f-b226-397a3c917647",
             input: "jug1Capacity = 5, jug2Capacity = 5, targetCapacity = 10",
             expected: "True", orderMatters: true),
            TestCaseData(id: "4930e9b9-3510-41b1-a5bc-6d50c90955f2",
             input: "jug1Capacity = 3, jug2Capacity = 4, targetCapacity = 5",
             expected: "True", orderMatters: true),
            TestCaseData(id: "791a6616-dddf-4f37-946e-c400f6f44b8c",
             input: "jug1Capacity = 1, jug2Capacity = 3, targetCapacity = 2",
             expected: "True", orderMatters: true),
            TestCaseData(id: "17a4d2f2-9fef-4ccd-871a-d3a8c4230fe4",
             input: "jug1Capacity = 10, jug2Capacity = 10, targetCapacity = 0",
             expected: "True", orderMatters: true),
            TestCaseData(id: "95bc3d72-1113-41bc-8f9a-0ef24d903116",
             input: "jug1Capacity = 0, jug2Capacity = 10, targetCapacity = 5",
             expected: "False", orderMatters: true),
            TestCaseData(id: "5d775977-23b4-4c5e-9f55-a974441ae2e3",
             input: "jug1Capacity = 10, jug2Capacity = 0, targetCapacity = 5",
             expected: "False", orderMatters: true),
            TestCaseData(id: "e07c5977-9d31-4eec-91fe-55b0e419f368",
             input: "jug1Capacity = -1, jug2Capacity = 5, targetCapacity = 4",
             expected: "False", orderMatters: true),
            TestCaseData(id: "d9d5eb1f-834d-484c-9d80-843bd20444a8",
             input: "jug1Capacity = 5, jug2Capacity = -1, targetCapacity = 4",
             expected: "False", orderMatters: true),
            TestCaseData(id: "19bf20b3-6302-481c-bce2-649870e2f242",
             input: "jug1Capacity = 5, jug2Capacity = 5, targetCapacity = -1",
             expected: "False", orderMatters: true),
            TestCaseData(id: "73171cd4-43ed-46aa-a39b-9ed0117284f3",
             input: "jug1Capacity = 1, jug2Capacity = 1, targetCapacity = 2",
             expected: "True", orderMatters: true),
            TestCaseData(id: "91f71891-3241-4445-839b-e8d2b940fd29",
             input: "jug1Capacity = 2, jug2Capacity = 2, targetCapacity = 3",
             expected: "False", orderMatters: true),
            TestCaseData(id: "43fb40d5-0809-49bc-88a3-17b5f91ba63b",
             input: "jug1Capacity = 10, jug2Capacity = 20, targetCapacity = 15",
             expected: "True", orderMatters: true),
            TestCaseData(id: "91064c70-e0a8-4d66-9213-9644e811a6fd",
             input: "jug1Capacity = 20, jug2Capacity = 10, targetCapacity = 15",
             expected: "True", orderMatters: true),
            TestCaseData(id: "94ba30d0-4140-412e-9478-6d93de78d650",
             input: "jug1Capacity = 15, jug2Capacity = 25, targetCapacity = 20",
             expected: "True", orderMatters: true),
            TestCaseData(id: "817fb1eb-5629-4b78-9a6a-80d68521f06e",
             input: "jug1Capacity = 25, jug2Capacity = 15, targetCapacity = 20",
             expected: "True", orderMatters: true),
            TestCaseData(id: "98107f3a-d9e5-4529-8f3b-68b723076675",
             input: "jug1Capacity = 100, jug2Capacity = 100, targetCapacity = 50",
             expected: "True", orderMatters: true),
            TestCaseData(id: "a8f5ad4f-71ca-446a-9858-0138a27bee09",
             input: "jug1Capacity = 50, jug2Capacity = 50, targetCapacity = 100",
             expected: "True", orderMatters: true),
            TestCaseData(id: "7d9d7d5e-cefe-491d-b7fc-49d9a2d266a6",
             input: "jug1Capacity = 7, jug2Capacity = 5, targetCapacity = 6",
             expected: "True", orderMatters: true),
            TestCaseData(id: "0bc3893b-5ed1-4881-b990-51e33f156ce6",
             input: "jug1Capacity = 11, jug2Capacity = 13, targetCapacity = 7",
             expected: "True", orderMatters: true),
            TestCaseData(id: "171573c6-915b-4eae-b9b1-1c06e2eab93e",
             input: "jug1Capacity = 17, jug2Capacity = 19, targetCapacity = 10",
             expected: "True", orderMatters: true),
            TestCaseData(id: "ec3d329f-f8c5-47ef-aa9e-49e43757eb3e",
             input: "jug1Capacity = 23, jug2Capacity = 29, targetCapacity = 13",
             expected: "True", orderMatters: true),
            TestCaseData(id: "3db9c6aa-e20d-4075-874f-08664308d0d4",
             input: "jug1Capacity = 31, jug2Capacity = 37, targetCapacity = 17",
             expected: "True", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "water-and-jug-problem"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            guard let p_jug1Capacity = InputParser.parseInt(params[0]) else {
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
            guard let p_jug2Capacity = InputParser.parseInt(params[1]) else {
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
            guard let p_targetCapacity = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_jug1Capacity >= 1 && p_jug1Capacity <= 103 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= x, y, target <= 103"
                )
                return
            }
            guard p_jug2Capacity >= 1 && p_jug2Capacity <= 103 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= x, y, target <= 103"
                )
                return
            }
            guard p_targetCapacity >= 1 && p_targetCapacity <= 103 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= x, y, target <= 103"
                )
                return
            }

            let solution = Solution()
            let result = solution.canMeasureWaterMath(p_jug1Capacity, p_jug2Capacity, p_targetCapacity)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
