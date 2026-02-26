import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCarFleet {
    private class Solution {
        func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
            let n = position.count
            if n == 0 { return 0 }

            var cars = zip(position, speed).map { ($0, $1) }
            cars.sort { $0.0 > $1.0 }

            var stack: [Double] = []

            for (pos, spd) in cars {
                let time = Double(target - pos) / Double(spd)

                // If this car is slower (takes longer), it forms new fleet
                // Otherwise it joins the fleet ahead
                if stack.isEmpty || time > stack[stack.count - 1] {
                    stack.append(time)
                }
            }

            return stack.count
        }
    }

    @Suite struct CarFleetTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1cbbfdc8-3f7f-4104-801f-87bbe911d391",
             input: "target = 0, position = [], speed = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f3567c86-54ec-439c-ab76-299ee12f919d",
             input: "target = 1, position = [0], speed = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "16862b90-b6f1-45d9-ad83-a25c31e74239",
             input: "target = 10, position = [5], speed = [2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7ab00207-38ab-495e-b5d2-226f651733b3",
             input: "target = 100, position = [0, 50], speed = [1, 2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "93ceac4f-efea-4b6c-9f96-6aba01edd2c6",
             input: "target = 100, position = [0, 50, 100], speed = [1, 2, 0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b27a8a5d-80b7-4076-a276-3b58308bc906",
             input: "target = 1000, position = [0, 500, 1000], speed = [1, 2, 3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "86680589-69fa-4479-9eb5-dcf0d329e36a",
             input: "target = 10000, position = [0, 5000, 10000], speed = [1, 2, 3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "dcee506f-f8f4-4593-aa6a-99e7a31712d9",
             input: "target = -1, position = [0], speed = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ee3276cc-80ea-43b6-848d-1a98ae69c450",
             input: "target = -10, position = [5], speed = [2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "034a39de-604f-4a20-9186-e0e8deb69bef",
             input: "target = -100, position = [0, 50], speed = [1, 2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ef6fe8c9-2afd-48ac-96a6-a23467b67bce",
             input: "target = -1000, position = [0, 500, 1000], speed = [1, 2, 3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7635c921-fd79-469d-a675-91b036b546d5",
             input: "target = -10000, position = [0, 5000, 10000], speed = [1, 2, 3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3ef5511d-b456-4316-9a1f-519b01a53f77",
             input: "target = 1, position = [1], speed = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "07bfc15c-e7db-43ae-8197-b6e21bd869db",
             input: "target = 10, position = [10], speed = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "432ca24d-1dac-4753-a77b-d75b22d2281d",
             input: "target = 100, position = [100], speed = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1a474cf0-764d-406c-992b-a808fe31f54c",
             input: "target = 1000, position = [1000], speed = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "33664dd0-447e-4e2f-b736-a2b4aea386c8",
             input: "target = 10000, position = [10000], speed = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "712816f9-eaa0-48bc-b8f7-a46087a857d7",
             input: "target = 1, position = [0, 1], speed = [1, 0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d3310403-a9cf-42ba-a94b-204a899eb1b7",
             input: "target = 10, position = [5, 10], speed = [2, 0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a4536f73-2f11-4017-bde5-c5925e9356f1",
             input: "target = 100, position = [0, 100], speed = [1, 0]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "car-fleet"
            let topic = "stack"
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

            guard let p_target = InputParser.parseInt(params[0]) else {
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
            guard let p_position = InputParser.parseIntArray(params[1]) else {
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
            guard p_position.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: position array too large (\(p_position.count))"
                )
                return
            }
            guard let p_speed = InputParser.parseIntArray(params[2]) else {
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
            guard p_speed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: speed array too large (\(p_speed.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_target >= 1 && p_target <= 105 else {
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
            guard p_target >= 0 && p_target <= 106 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 < target <= 106"
                )
                return
            }
            guard p_speed.allSatisfy({ $0 >= 0 && $0 <= 106 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 < speed[i] <= 106"
                )
                return
            }

            let solution = Solution()
            let result = solution.carFleet(p_target, p_position, p_speed)
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
