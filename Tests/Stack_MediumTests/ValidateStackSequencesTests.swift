import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCValidateStackSequences {
    private class Solution {
        func validateStackSequences(pushed: [Int], popped: [Int]) -> Bool {
            var stack: [Int] = []
            var popIndex = 0
            for pushValue in pushed {
                stack.append(pushValue)
                while !stack.isEmpty, stack.last == popped[popIndex] {
                    stack.removeLast()
                    popIndex += 1
                }
            }
            return stack.isEmpty
        }
    }

    @Suite struct ValidateStackSequencesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ccff2958-7174-4c97-86e9-1d62b9064e95",
             input: "pushed = [1], popped = [1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3d89caf0-b168-471c-9046-5e743103ddac",
             input: "pushed = [], popped = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9a1c7d89-69e6-4934-b670-cbf5ef913693",
             input: "pushed = [1,2], popped = [2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cc9db992-bc02-4c4b-98f1-fc195b1baf1b",
             input: "pushed = [1,2,3], popped = [3,2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d553c816-a72e-4d3a-a591-b93da621f760",
             input: "pushed = [1,2,3,4], popped = [4,3,2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "16d88655-2e5c-4562-8b3a-c652bf8dd350",
             input: "pushed = [1,2,3,4], popped = [1,2,3,4]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4a41787d-2b00-4af8-b4bb-65e3f0825073",
             input: "pushed = [1,2,3], popped = [3,1,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e0c4a31b-1389-49fa-b440-07abe695eb00",
             input: "pushed = [1,2,3,4,5], popped = [5,4,3,2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "69048126-eb52-4966-9532-1c237e75ea54",
             input: "pushed = [1,2,3,4,5], popped = [1,2,3,4,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7e30e166-abec-490e-9bde-4e26e028e7a4",
             input: "pushed = [-1,-2,-3], popped = [-3,-2,-1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a23c4d62-3c03-42f4-951f-b08854dff290",
             input: "pushed = [1,2,3,4,5], popped = [5,3,1,2,4]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9c45200f-90da-4202-a3ef-a4199e0ae1eb",
             input: "pushed = [1,2,3,4,5], popped = [1,5,2,4,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f4233a82-c02c-4422-a20e-14e26a61cb99",
             input: "pushed = [1,2,3,4,5], popped = [5,4,1,3,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "51e8471d-250c-469e-ae13-7f6ac3d5907d",
             input: "pushed = [1,2,3,4,5], popped = [1,3,5,2,4]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c35889d1-4b5b-4637-aa80-8177e7402699",
             input: "pushed = [1,2,3,4,5], popped = [5,2,4,1,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8d576230-9e13-4f21-98a0-0ee38f93700e",
             input: "pushed = [1,2,3,4,5], popped = [1,4,2,5,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5bfab480-4442-44d6-bd29-2bc70cc7b266",
             input: "pushed = [1,2,3,4,5], popped = [3,5,1,2,4]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c6c0d8fb-fa70-4808-b987-dc7ec445c4f6",
             input: "pushed = [1,2,3,4,5], popped = [2,4,1,5,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6ccb7a7f-6b0f-40e6-98f1-d6d5bbcd8047",
             input: "pushed = [1,2,3,4,5], popped = [4,2,5,1,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f4e74103-ca5c-4585-a958-3010f7dcea0c",
             input: "pushed = [1,2,3,4,5], popped = [3,1,5,4,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b72d410c-3810-4880-b9c2-929a76aad69c",
             input: "pushed = [1,2,3,4,5], popped = [5,1,4,3,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "311d4127-3917-44ec-a16d-02b9d1e6eca8",
             input: "pushed = [1,2,3,4,5], popped = [1,5,3,2,4]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "cceedc51-6878-43cc-a7bd-19c64d14cdfa",
             input: "pushed = [1,2,3,4,5], popped = [4,1,3,5,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b6f9372e-6067-440a-8802-94b7f0a6fbc2",
             input: "pushed = [1,2,3,4,5], popped = [3,4,5,2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "de71e2f5-6ee4-4165-814c-01529e5b72e0",
             input: "pushed = [1,2,3,4,5], popped = [4,5,3,2,1]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "validate-stack-sequences"
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

            guard let p_pushed = InputParser.parseIntArray(params[0]) else {
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
            guard p_pushed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: pushed array too large (\(p_pushed.count))"
                )
                return
            }
            guard let p_popped = InputParser.parseIntArray(params[1]) else {
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
            guard p_popped.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: popped array too large (\(p_popped.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_pushed.count >= 1 && p_pushed.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= pushed.length <= 1000"
                )
                return
            }
            guard p_pushed.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= pushed[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.validateStackSequences(pushed: p_pushed, popped: p_popped)
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
