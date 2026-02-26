import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCValidPerfectSquare {
    private class Solution {
        func isPerfectSquare(_ num: Int) -> Bool { var low = 0
        var high = num
        while low <= high { let mid = (low + high) / 2
        if mid * mid == num { return true } else if mid * mid < num { low = mid + 1 } else { high = mid - 1 } }
        return false }
    }

    @Suite struct ValidPerfectSquareTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a4db793f-c553-4eb2-ac6f-fd1078895335",
             input: "num = 0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5e2663da-7f13-40de-ae12-d8063d040994",
             input: "num = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6d729034-78f1-4795-a98d-8e8f89e10a46",
             input: "num = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e8c1587f-9dbe-4c3a-913d-c5c6016dc9a2",
             input: "num = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "23baa29d-48bd-4aaa-9e94-4745f28c445a",
             input: "num = 4",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7a61bd41-5fd1-48a3-a219-705f8ac1d5c1",
             input: "num = 5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ea529e71-e84d-4cae-b892-4e02610ad596",
             input: "num = 6",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d9199413-8da3-4db4-816d-0d7302170963",
             input: "num = 7",
             expected: "false", orderMatters: true),
            TestCaseData(id: "69652f12-4856-4e3e-a2f6-cda960939d81",
             input: "num = 8",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bdae325e-725a-47a5-931b-62b07a2eac1a",
             input: "num = 9",
             expected: "true", orderMatters: true),
            TestCaseData(id: "305bb691-3da7-4ce6-a90a-1498bae5fed2",
             input: "num = 10",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0f109cc9-d362-4a93-ba32-470ea66028c9",
             input: "num = 15",
             expected: "false", orderMatters: true),
            TestCaseData(id: "322b14c7-1c71-44ce-b89a-4268aec4d95d",
             input: "num = 20",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a5ecb57d-831b-4c8f-b4ad-9e51094f0ee8",
             input: "num = 26",
             expected: "false", orderMatters: true),
            TestCaseData(id: "55e3d054-ccb6-4387-9205-b6875050c41b",
             input: "num = 36",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e4134ee8-a839-479c-a40c-2b5f7b8a9c92",
             input: "num = 49",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6ea5aefd-092c-44ba-85ef-75591d121c93",
             input: "num = 50",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4a271235-4a22-467e-acb9-9e215d4c0aa7",
             input: "num = 64",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3852da9f-cd3e-4da0-af6b-534a2378123d",
             input: "num = 81",
             expected: "true", orderMatters: true),
            TestCaseData(id: "25982b50-de7b-4f9b-ac62-37f2c525d1e8",
             input: "num = 100",
             expected: "true", orderMatters: true),
            TestCaseData(id: "15bb148b-ae46-4fec-a5f2-8d1f88475ffc",
             input: "num = 121",
             expected: "true", orderMatters: true),
            TestCaseData(id: "bfa7303f-6361-441a-a104-10d484744cb4",
             input: "num = 144",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a458bfc3-d3d4-4c92-8621-e53681799da8",
             input: "num = 169",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9731bd12-0ff6-469c-99e2-9064c2cb1ef8",
             input: "num = 196",
             expected: "true", orderMatters: true),
            TestCaseData(id: "bad7ad04-c01b-436f-9174-0ad72f233ff0",
             input: "num = 225",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "valid-perfect-square"
            let topic = "math-geometry"
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

            guard let p_num = InputParser.parseInt(params[0]) else {
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

            // Constraint precondition checks
            guard p_num >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= num <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.isPerfectSquare(p_num)
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
