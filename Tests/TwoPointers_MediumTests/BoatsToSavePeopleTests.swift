import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBoatsToSavePeople {
    private class Solution {
        func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
          var people = people.sorted()
          var light = 0
          var heavy = people.count - 1
          var boats = 0
          while light <= heavy {
            if people[light] + people[heavy] <= limit {
              light += 1
            }
            heavy -= 1
            boats += 1
          }
          return boats
        }
    }

    @Suite struct BoatsToSavePeopleTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bd932d6f-6dde-47dd-b96d-2dd41e8cba5b",
             input: "people = [1], limit = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "612033b5-245b-4606-a6f8-399c03998666",
             input: "people = [1,1], limit = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fe22a428-dac6-4b4c-8482-96f01a929ed8",
             input: "people = [2,2], limit = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "637b2bff-4e13-4fe2-9e8a-1eecbcb6d69f",
             input: "people = [1,2,3], limit = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "28d227ff-5ad6-4026-b625-3055442f5b37",
             input: "people = [1,2,3], limit = 4",
             expected: "2", orderMatters: true),
            TestCaseData(id: "97f0e217-e16b-40aa-9be1-3e9f70c12df2",
             input: "people = [1,2,3], limit = 5",
             expected: "2", orderMatters: true),
            TestCaseData(id: "18834927-93ae-4a78-b75b-9b2014e80899",
             input: "people = [1,1,1,1], limit = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "faee8187-42d1-4a2d-8b28-004983278a59",
             input: "people = [2,2,2,2], limit = 2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "921f2a1e-49a0-4698-a6ed-ef3f488f8a8f",
             input: "people = [1,2,3,4,5], limit = 6",
             expected: "3", orderMatters: true),
            TestCaseData(id: "034e5557-c11d-4198-ab92-a55d59e9d2e4",
             input: "people = [5,4,3,2,1], limit = 6",
             expected: "3", orderMatters: true),
            TestCaseData(id: "5022baba-99d1-4631-892f-a92cbeb16e60",
             input: "people = [1,1,1,1,1], limit = 2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d6e85d13-9a36-4f22-b0d0-dce78ba0ffd5",
             input: "people = [2,2,2,2,2], limit = 2",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b50f2d60-6fd9-442b-9bf1-f12e2c560357",
             input: "people = [], limit = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2cc83383-5cee-4c1a-9279-69558f605730",
             input: "people = [1], limit = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "434555be-2ebf-4d1e-a160-d5807f116aca",
             input: "people = [1,1,1,1,1,1,1,1,1,1], limit = 2",
             expected: "5", orderMatters: true),
            TestCaseData(id: "58762833-2f49-4058-ab1c-630deb79255d",
             input: "people = [2,2,2,2,2,2,2,2,2,2], limit = 2",
             expected: "10", orderMatters: true),
            TestCaseData(id: "126f6578-6f3d-4f62-823d-f59a87d8de4d",
             input: "people = [1,3,5,7,9], limit = 10",
             expected: "3", orderMatters: true),
            TestCaseData(id: "0ff23cb5-d360-43c8-aa8f-9eee036075cd",
             input: "people = [9,7,5,3,1], limit = 10",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c01b6b58-fc7a-4b7f-81b2-b6df8016386f",
             input: "people = [2,2,2,2,2,2,2,2,2,2], limit = 10",
             expected: "5", orderMatters: true),
            TestCaseData(id: "75647e95-5ee9-48b8-a4cf-54f5fcf01c12",
             input: "people = [1,2,3,4,5,6,7,8,9,10], limit = 100",
             expected: "5", orderMatters: true),
            TestCaseData(id: "359b872b-5876-4155-88fa-fc2cd81e94c8",
             input: "people = [10,9,8,7,6,5,4,3,2,1], limit = 100",
             expected: "5", orderMatters: true),
            TestCaseData(id: "69e9fbd1-e678-4228-82d2-911b45c5735a",
             input: "people = [1,3,5,7,9], limit = 100",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f4099870-6e5d-467c-a0f8-705fce8803de",
             input: "people = [9,7,5,3,1], limit = 100",
             expected: "3", orderMatters: true),
            TestCaseData(id: "4e46be7b-9a19-408b-8aac-5c7b535990ae",
             input: "people = [1,1,1,1,1,1,1,1,1,1], limit = 1",
             expected: "10", orderMatters: true),
            TestCaseData(id: "4877368b-3cfd-40aa-90b9-30fc1daf69b0",
             input: "people = [2,2,2,2,2,2,2,2,2,2], limit = 1",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "boats-to-save-people"
            let topic = "two-pointers"
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

            guard let p_people = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_people.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: people array too large (\(p_people.count))"
                )
                return
            }
            guard let p_limit = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_people.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= people.length <= 5 * 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.numRescueBoats(p_people, p_limit)
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
