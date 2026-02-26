import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCIntegerReplacement {
    private class Solution {
        func integerReplacement(n: Int) -> Int {
          var number = Int64(n)
          var count = 0
          while number != 1 {
            if number % 2 == 0 {
              number /= 2
            } else if number % 4 == 1 || number == 3 {
              number += 1
            } else {
              number -= 1
            }
            count += 1
          }
          return count
        }
    }

    @Suite struct IntegerReplacementTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "23a6428b-d265-4dbb-abfa-f70f9200c9a0",
             input: "n = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "01080fd1-cfe0-4b17-991a-e09da751af02",
             input: "n = 4",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d1510758-b7fe-4203-9293-54ee8c2728d8",
             input: "n = 64",
             expected: "6", orderMatters: true),
            TestCaseData(id: "196e5316-087d-4171-9c39-78a4795274e2",
             input: "n = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9909e0d6-bead-4c33-aba5-a071010c051c",
             input: "n = 10",
             expected: "6", orderMatters: true),
            TestCaseData(id: "f8327a6d-1840-4286-8269-d7d7427eabf0",
             input: "n = 15",
             expected: "7", orderMatters: true),
            TestCaseData(id: "1be531f8-5f4f-4233-a132-c3a1a75bcd57",
             input: "n = 20",
             expected: "7", orderMatters: true),
            TestCaseData(id: "b8c45cd8-f352-4798-9b82-536a503db0f7",
             input: "n = 25",
             expected: "9", orderMatters: true),
            TestCaseData(id: "42e330fc-4740-4757-b290-3fb640ee2553",
             input: "n = 30",
             expected: "8", orderMatters: true),
            TestCaseData(id: "2e7d6bf0-e926-4dbb-b66a-735630df0045",
             input: "n = 31",
             expected: "9", orderMatters: true),
            TestCaseData(id: "b2558761-394d-4f6e-a214-39381227a06f",
             input: "n = 32",
             expected: "5", orderMatters: true),
            TestCaseData(id: "8000fe17-a7ef-4de6-9abe-f517e7b29372",
             input: "n = 33",
             expected: "11", orderMatters: true),
            TestCaseData(id: "77ef41f7-4482-4a36-8b2a-7e0aa6d53f81",
             input: "n = 34",
             expected: "10", orderMatters: true),
            TestCaseData(id: "fe0ea4fd-af42-4e77-b315-27852d7f57cd",
             input: "n = 35",
             expected: "11", orderMatters: true),
            TestCaseData(id: "26f0330b-aa3b-4bf6-8d07-2bbcc6809708",
             input: "n = 36",
             expected: "9", orderMatters: true),
            TestCaseData(id: "7f3bf677-03ab-45ad-b288-bee4c59f7c27",
             input: "n = 37",
             expected: "11", orderMatters: true),
            TestCaseData(id: "550ece98-3af4-4e6a-9754-73fe3d90c314",
             input: "n = 38",
             expected: "10", orderMatters: true),
            TestCaseData(id: "341fd4d2-88c6-4933-95c8-a743a475cd8f",
             input: "n = 39",
             expected: "11", orderMatters: true),
            TestCaseData(id: "50f018c2-f22a-43c8-ac75-26110ba08a89",
             input: "n = 40",
             expected: "8", orderMatters: true),
            TestCaseData(id: "b8766279-2702-4cf4-9061-121f1d1a8057",
             input: "n = 41",
             expected: "11", orderMatters: true),
            TestCaseData(id: "ce66aee5-91c4-4a3e-bfdf-29375f2a8e08",
             input: "n = 42",
             expected: "10", orderMatters: true),
            TestCaseData(id: "341559cd-7851-4107-a6c9-f0e11fd4355a",
             input: "n = 43",
             expected: "11", orderMatters: true),
            TestCaseData(id: "884120bf-47c8-49c0-b4cb-68a08cd4f919",
             input: "n = 44",
             expected: "9", orderMatters: true),
            TestCaseData(id: "89e9b6ec-ab86-4fec-b286-d6bc5a2b5c49",
             input: "n = 45",
             expected: "11", orderMatters: true),
            TestCaseData(id: "ad76f57e-8b45-4d80-9b77-b72a31fcd5a0",
             input: "n = 46",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "integer-replacement"
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

            // Constraint precondition checks
            guard p_n >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.integerReplacement(n: p_n)
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
