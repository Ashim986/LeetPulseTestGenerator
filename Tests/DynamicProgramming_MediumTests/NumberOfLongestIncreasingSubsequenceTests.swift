import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfLongestIncreasingSubsequence {
    private class Solution {
        func findNumberOfLIS(_ nums: [Int]) -> Int {
           let n = nums.count
           if n == 0 {
              return 0
           }
           var lengths: [Int] = Array(repeating: 1, count: n)
           var counts: [Int] = Array(repeating: 1, count: n)

           for i in 1..<n {
              for j in 0..<i {
                 if nums[i] > nums[j] {
                    if lengths[i] == lengths[j] {
                       lengths[i] = lengths[j] + 1
                       counts[i] = counts[j]
                    } else if lengths[i] == lengths[j] + 1 {
                       counts[i] += counts[j]
                    } else if lengths[i] < lengths[j] + 1 {
                       lengths[i] = lengths[j] + 1
                       counts[i] = counts[j]
                    }
                 }
              }
           }

           let maxLength = lengths.max() ?? 0
           return lengths.enumerated().filter { $0.element == maxLength }.map { $0.offset }.map { counts[$0] }.reduce(0, +)
        }
    }

    @Suite struct NumberOfLongestIncreasingSubsequenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2d6d4a2b-7d1f-4bf0-8ded-0c2653c40f10",
             input: "nums = [1,2,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1d2ae068-7276-4ab6-9a08-0cdcafe5ded1",
             input: "nums = [1,1,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "17a29741-535f-4063-a92f-b9fa4e45531b",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0999d493-2005-4c02-99cd-4953e5ec4161",
             input: "nums = [5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "eeb465f7-4507-4178-a833-5323c6834553",
             input: "nums = [1,2,3,4,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d684ff8f-1ddf-443c-89fa-11d5fab25964",
             input: "nums = [1,-2,3,-4,5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a822a96f-4a57-47cd-98d0-6723b355a631",
             input: "nums = [10,20,30,40,50]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3fbe9982-d0de-4cab-9a40-ac6a02308ddb",
             input: "nums = [1,1,1,1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "bbf2b625-9ef7-48e3-a71d-20045ab83716",
             input: "nums = [1,3,5,7,9]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7aac6a58-6aba-451a-8972-ddf3453bd8c6",
             input: "nums = [1,1,1,2,2,2]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "32be5229-91ae-421e-acd2-cc56f5afd148",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c4374bb3-82a6-487b-b4ec-0d3d676f3e6a",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "440a16d0-aedf-4ebb-8e42-24b4ace36712",
             input: "nums = [10,20,30,40,50,60,70,80,90,100]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5ae932c3-f19f-4009-b3f0-11c08b5dcf78",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "096465af-d557-400c-99f5-be4948430cc8",
             input: "nums = [1,3,5,7,9,11,13,15,17,19]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e3bd13e6-8860-417a-8b81-a12969de49c3",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "2879d301-2239-4b07-b691-1ebf2056a824",
             input: "nums = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "86065c13-f744-479f-98fc-9a05431813bb",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2dc2c362-7c12-422f-b916-4a87e794e9c9",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "17dc40f8-a0d6-4bb5-abe2-53fd78ccd762",
             input: "nums = [3,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "211b1e08-2505-4d75-8baa-e5a74f16bcb2",
             input: "nums = [5,4,3,2,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9e05cd34-b7f8-4d4a-ae6f-1e8db6864493",
             input: "nums = [50,40,30,20,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "54104a9c-e67f-44ee-847a-e3e1aae571da",
             input: "nums = [1,1,2,2,3,3]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "40db5d54-7403-4b04-ab0d-68efeb90fd1e",
             input: "nums = [1,2,2,3,3,3]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "a9496993-71c5-414a-b13c-3111e1785005",
             input: "nums = [9,7,5,3,1]",
             expected: "5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-longest-increasing-subsequence"
            let topic = "dynamic-programming"
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
            guard p_nums.count >= 1 && p_nums.count <= 2000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 2000"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -106 && $0 <= 106 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -106 <= nums[i] <= 106"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findNumberOfLIS(p_nums)
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
