import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCIncreasingTripletSubsequence {
    private class Solution {
        func increasingTriplet(nums: [Int]) -> Bool {
         var first = Int.max
         var second = Int.max
         for num in nums {
         if num <= first {
         first = num
         } else if num <= second {
         second = num
         } else {
         return true
         }
         }
         return false
        }
    }

    @Suite struct IncreasingTripletSubsequenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4ab4502b-ae8a-4cf9-800b-eaf08cdbee9e",
             input: "nums = [1,2,3,4]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "076dbec7-9111-44eb-9c18-c1857e53bfc4",
             input: "nums = []",
             expected: "false", orderMatters: true),
            TestCaseData(id: "beaf6626-357c-4c17-b0c3-6752a3f6b983",
             input: "nums = [1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a25f2ad0-fa72-4a35-9790-9a10b37737d7",
             input: "nums = [1,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "be13cbf7-1dc0-42df-a08b-44d57e7d6b95",
             input: "nums = [3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8da235d8-76ad-49f4-b03e-b0f61c62f5b8",
             input: "nums = [1,1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ca21f522-c74d-4634-8034-c876784fbc3c",
             input: "nums = [1,2,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "30418a6e-9359-4ab9-9d8c-ecaac58996d5",
             input: "nums = [-1,0,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4dce61b7-fe96-424e-b716-6e4ac0a727dc",
             input: "nums = [0,0,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d8c1c450-0050-471b-8373-dc4e39111e21",
             input: "nums = [10,20,30]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8cddc544-5c07-4268-9e25-4d9145ea1db4",
             input: "nums = [1000,2000,3000]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "aaad0e7d-a841-4512-8654-0ae93eb98fb2",
             input: "nums = [-1000,-2000,-3000]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "648d8c40-b1ed-4e48-94a5-3ff15c245adc",
             input: "nums = [1,3,5,7,9]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a727bee6-0124-43ff-a9fd-7c80e7731530",
             input: "nums = [9,7,5,3,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "dc73464b-561a-43aa-b1a1-5fd923a86ccf",
             input: "nums = [1,1,2,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "119e2727-a1a0-499d-9b26-8c176d1f87cf",
             input: "nums = [1,2,1,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0c524073-28ec-4b94-bbb6-6c0129e76595",
             input: "nums = [1,2,3,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "aa01508b-af62-4d6d-9da9-b8f821e56e5b",
             input: "nums = [1,1,1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1bb70acd-be55-4ae3-998f-1ad2a548f30d",
             input: "nums = [1,2,2,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ea872198-b886-4892-b198-96eee13074ef",
             input: "nums = [1,2,3,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cae91a8a-a27f-4965-9dfc-876eb1a43a60",
             input: "nums = [1,1,2,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "98ffd12c-0441-4048-bcdd-4bce3f4f2676",
             input: "nums = [2,2,1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "529136b1-7094-45f6-808a-b6ce469f9bad",
             input: "nums = [1,1,1,1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "54fc1ead-9b6d-449e-8df4-945ad2cc931b",
             input: "nums = [1,2,3,4,5,6]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0fb365a9-f8c0-488c-8f74-daca2d1b4e6e",
             input: "nums = [6,5,4,3,2,1]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "increasing-triplet-subsequence"
            let topic = "greedy"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -231 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= nums[i] <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.increasingTriplet(nums: p_nums)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
