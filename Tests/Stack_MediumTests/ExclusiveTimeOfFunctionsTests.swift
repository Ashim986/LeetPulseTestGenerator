import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCExclusiveTimeOfFunctions {
    private class Solution {
        func findExclusiveTimes(_ n: Int, _ logs: [String]) -> [Int] {
            var stack: [Int] = []
            var exclusiveTimes: [Int] = Array(repeating: 0, count: n)
            var prevTime = 0

            for log in logs {
                let components = log.components(separatedBy: ":")
                let functionId = Int(components[0]).unsafelyUnwrapped
                let eventType = components[1]
                let timestamp = Int(components[2]).unsafelyUnwrapped

                if eventType == "start" {
                    if !stack.isEmpty {
                        exclusiveTimes[stack[stack.count - 1]] += timestamp - prevTime
                    }
                    stack.append(functionId)
                } else {
                    exclusiveTimes[stack.removeLast()] += timestamp - prevTime + 1
                }
                prevTime = timestamp
            }

            return exclusiveTimes
        }
    }

    @Suite struct ExclusiveTimeOfFunctionsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "48059621-b5c4-405b-a6ca-b46d9e1aee1d",
             input: "n = 0, logs = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "3ba58cb6-2d2a-41da-b741-a9063495cb93",
             input: "n = 1, logs = []",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "906b98ba-cef5-4130-99e9-75199f85dd91",
             input: "n = 1, logs = [\"0:start:0\",\"0:end:0\"]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "b6a7ad0e-0793-4bac-a664-a0759c2a455f",
             input: "n = 1, logs = [\"0:start:0\",\"0:end:1\",\"0:start:2\",\"0:end:3\"]",
             expected: "[4]", orderMatters: true),
            TestCaseData(id: "4190542c-1024-4a2e-b8d9-ed3fac70abc4",
             input: "n = 2, logs = [\"0:start:0\",\"0:end:1\",\"1:start:2\",\"1:end:3\"]",
             expected: "[2,2]", orderMatters: true),
            TestCaseData(id: "725e843f-8fe0-491a-b0ed-e669c8cfdd88",
             input: "n = 1, logs = [\"0:start:0\",\"0:end:1000000\"]",
             expected: "[1000001]", orderMatters: true),
            TestCaseData(id: "02464e06-051d-4ea0-a6ef-8f8a6ded3658",
             input: "n = 1, logs = [\"0:start:0\",\"0:end:0\",\"0:start:1\",\"0:end:1\"]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "dae5dc61-0803-4fec-b008-48faeb5afd57",
             input: "n = 2, logs = [\"0:start:0\",\"0:end:0\",\"1:start:1\",\"1:end:1\"]",
             expected: "[1,1]", orderMatters: true),
            TestCaseData(id: "11bb655f-30bb-4019-a7ff-2baf94510dd9",
             input: "n = 3, logs = [\"0:start:0\",\"0:end:0\",\"1:start:1\",\"1:end:1\",\"2:start:2\",\"2:end:2\"]",
             expected: "[1,1,1]", orderMatters: true),
            TestCaseData(id: "46b2ee76-0adc-4131-a50d-aa271de2f7b5",
             input: "n = 1, logs = [\"0:start:0\",\"0:end:100000\"]",
             expected: "[100001]", orderMatters: true),
            TestCaseData(id: "b488f608-cc7d-4b7d-b6bc-8edc514b36cc",
             input: "n = 1, logs = [\"0:start:0\",\"0:end:1000000\",\"0:start:1000001\",\"0:end:2000001\"]",
             expected: "[2000002]", orderMatters: true),
            TestCaseData(id: "0456e2b4-e13a-4e22-bd5a-6ca75a0e20f2",
             input: "n = 10, logs = [\"0:start:0\",\"1:start:1\",\"2:start:2\",\"3:start:3\",\"4:start:4\",\"5:start:5\",\"6:start:6\",\"7:start:7\",\"8:star"
                + "t:8\",\"9:start:9\",\"0:end:10\",\"1:end:10\",\"2:end:10\",\"3:end:10\",\"4:end:10\",\"5:end:10\",\"6:end:10\",\"7:end:10\",\"8:end:10\""
                + ",\"9:end:10\"]",
             expected: "[1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "41f95317-dd6d-449b-bebb-bb82a0e3268e",
             input: "n = 3, logs = []",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "a17b9c82-41db-49e9-98f5-aa9a990bb518",
             input: "n = 5, logs = [\"0:start:0\",\"1:start:1\",\"2:start:2\",\"3:start:3\",\"4:start:4\",\"4:end:4\",\"3:end:3\",\"2:end:2\",\"1:end:1\",\"0"
                + ":end:0\"]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "314003e4-4a03-4344-9b8a-f1bd62abe84c",
             input: "n = 2, logs = [\"0:start:0\",\"1:start:1\",\"0:end:2\",\"1:end:3\"]",
             expected: "[3,2]", orderMatters: true),
            TestCaseData(id: "dc0aa434-2213-4053-aef3-bc34491991de",
             input: "n = 3, logs = [\"0:start:0\",\"1:start:1\",\"2:start:2\",\"0:end:3\",\"1:end:4\",\"2:end:5\"]",
             expected: "[3,3,2]", orderMatters: true),
            TestCaseData(id: "75e78efc-ed8d-4801-a058-5776793b96a1",
             input: "n = 2, logs = [\"0:start:0\",\"1:start:1\",\"0:end:2\",\"1:end:3\",\"0:start:4\",\"0:end:5\"]",
             expected: "[5,2]", orderMatters: true),
            TestCaseData(id: "ff398275-c28b-4c17-a2c8-17bf7a081ea1",
             input: "n = 3, logs = [\"0:start:0\",\"1:start:1\",\"2:start:2\",\"0:end:3\",\"1:end:4\",\"2:end:5\",\"0:start:6\",\"0:end:7\"]",
             expected: "[5,3,2]", orderMatters: true),
            TestCaseData(id: "1da834e8-8ced-4091-94a3-47ce50ba4f3c",
             input: "n = 2, logs = [\"0:start:0\",\"1:start:1\",\"0:end:2\",\"1:end:3\",\"0:start:4\",\"1:start:5\",\"0:end:6\",\"1:end:7\"]",
             expected: "[6,4]", orderMatters: true),
            TestCaseData(id: "71830a8c-be62-425e-b3f1-a04847d03caf",
             input: "n = 3, logs = [\"0:start:0\",\"1:start:1\",\"2:start:2\",\"0:end:3\",\"1:end:4\",\"2:end:5\",\"0:start:6\",\"1:start:7\",\"2:start:8\","
                + "\"0:end:9\",\"1:end:10\",\"2:end:11\"]",
             expected: "[6,6,4]", orderMatters: true),
            TestCaseData(id: "1e5ec247-8836-448f-bf1b-82d727a952b9",
             input: "n = 1, logs = [\"0:start:0\",\"0:start:1\",\"0:end:2\",\"0:end:3\"]",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "508588ed-e9ba-488b-8a31-5084dc7e0fdb",
             input: "n = 2, logs = [\"0:start:0\",\"0:start:1\",\"1:end:2\",\"0:end:3\"]",
             expected: "[5,0]", orderMatters: true),
            TestCaseData(id: "2da27ced-ef08-481f-a527-fcfbc6c9d5bf",
             input: "n = 3, logs = [\"0:start:0\",\"0:start:1\",\"1:end:2\",\"0:end:3\",\"2:start:4\",\"2:end:5\"]",
             expected: "[5,0,2]", orderMatters: true),
            TestCaseData(id: "caab8abb-b5eb-4ee5-af4a-d28ab531a9c4",
             input: "n = 1, logs = [\"0:start:0\",\"0:start:1\",\"0:end:2\",\"0:end:3\",\"0:start:4\",\"0:end:5\"]",
             expected: "[7]", orderMatters: true),
            TestCaseData(id: "f84bf832-6056-4500-bcd6-d288333231d5",
             input: "n = 2, logs = [\"0:start:0\",\"0:start:1\",\"1:end:2\",\"0:end:3\",\"1:start:4\",\"1:end:5\"]",
             expected: "[5,2]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "exclusive-time-of-functions"
            let topic = "stack"
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
            guard let p_logs = InputParser.parseStringArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [String]"
                )
                return
            }
            guard p_logs.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: logs array too large (\(p_logs.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 100"
                )
                return
            }
            guard p_logs.count >= 2 && p_logs.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= logs.length <= 500"
                )
                return
            }

            let solution = Solution()
            let result = solution.findExclusiveTimes(p_n, p_logs)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
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
