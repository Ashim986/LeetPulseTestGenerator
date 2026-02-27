import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBaseballGame {
    private class Solution {
        func calPoints(ops: [String]) -> Int {
            var stack: [Int] = []
            for op in ops {
                if let num = Int(op) {
                    stack.append(num)
                }
                else if op == "C" {
                    stack.removeLast()
                }
                else if op == "D" {
                    stack.append(stack[stack.count - 1] * 2)
                }
            }
            return stack.reduce(0, +)
        }
    }

    @Suite struct BaseballGameTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "115115fd-2afd-43a4-9b01-8aa89777a1b3",
             input: "ops = [\"1\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "795872aa-10c1-4d73-aabb-3bbbe553e443",
             input: "ops = [\"5\",\"2\"]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "12a4e3ed-69eb-4057-85cd-6e2db14c8c82",
             input: "ops = [\"-1\",\"-2\"]",
             expected: "-3", orderMatters: true),
            TestCaseData(id: "f08d72ec-f3f9-418d-b389-1afaa2b22d48",
             input: "ops = [\"1\",\"C\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7794ca22-fd96-4d5e-9a85-ad58ab90e5c3",
             input: "ops = [\"1\",\"2\",\"3\"]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "ea18181f-de6f-4295-835d-2ed51bd28316",
             input: "ops = [\"-1\",\"-2\",\"-3\"]",
             expected: "-6", orderMatters: true),
            TestCaseData(id: "241f5fd8-9f9e-40ba-964a-45bef385b38c",
             input: "ops = [\"1\",\"C\",\"2\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6005c5ac-6a59-4a41-8e7f-823af1479b81",
             input: "ops = [\"1\",\"2\",\"C\",\"3\"]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "f5079bd1-b52a-490a-965e-4fe7f75ced7a",
             input: "ops = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3f179525-404a-4da9-a2f2-8143280d4ab5",
             input: "ops = [\"0\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c048158d-de80-489f-981e-ca5c0febc699",
             input: "ops = [\"0\",\"0\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "eb324956-3081-4725-9ce1-779b5b5ae991",
             input: "ops = [\"1\",\"1\",\"1\",\"1\",\"1\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "d70a36da-cfbe-466a-9aeb-ed6020bd8ac9",
             input: "ops = [\"-1\",\"-1\",\"-1\",\"-1\",\"-1\"]",
             expected: "-5", orderMatters: true),
            TestCaseData(id: "d24d504a-364a-4ae9-8120-b837b56af24d",
             input: "ops = [\"1000\",\"1000\",\"1000\"]",
             expected: "3000", orderMatters: true),
            TestCaseData(id: "be1d8b03-1325-4590-8cd8-3c36dd91a1b8",
             input: "ops = [\"-1000\",\"-1000\",\"-1000\"]",
             expected: "-3000", orderMatters: true),
            TestCaseData(id: "61e6c714-f6cd-45f8-a758-5b657ec9441a",
             input: "ops = [\"5\",\"2\",\"C\",\"D\",\"+\",\"C\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c15f1ebf-d01f-41b4-9e86-b55273f913aa",
             input: "ops = [\"1\",\"C\",\"1\",\"C\",\"1\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "39dc9d7d-be88-4677-b156-a4d81db476d4",
             input: "ops = [\"5\",\"+\",\"C\",\"2\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3ea931a9-27ad-4fe5-bd5c-b233b0424d50",
             input: "ops = [\"5\",\"D\"]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "573adf56-ec26-4699-bb6f-b082b43f12e7",
             input: "ops = [\"5\",\"+\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9217eba5-9b31-4320-86ed-ae2928ed3f0b",
             input: "ops = [\"5\",\"D\",\"2\"]",
             expected: "17", orderMatters: true),
            TestCaseData(id: "65dc3b62-de7a-43cc-a14b-4a55503eeeb3",
             input: "ops = [\"5\",\"+\",\"2\"]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "83119268-ad5a-401f-ab34-79e45becddf5",
             input: "ops = [\"5\",\"2\",\"C\",\"D\"]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "f46d8d58-678f-45ff-9bb2-6db0e1c7cd01",
             input: "ops = [\"5\",\"-2\",\"4\",\"C\",\"D\",\"9\"]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "19282990-45f6-4701-b85d-dc979df0a37b",
             input: "ops = [\"5\",\"-2\",\"4\",\"C\",\"D\",\"9\",\"+\"]",
             expected: "8", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "baseball-game"
            let topic = "stack"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_ops = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_ops.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: ops array too large (\(p_ops.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_ops.count >= 1 && p_ops.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= operations.length <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.calPoints(ops: p_ops)
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
