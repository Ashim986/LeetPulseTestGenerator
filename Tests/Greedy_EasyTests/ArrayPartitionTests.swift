import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCArrayPartition {
    private class Solution {
        func arrayPairSum(_ nums: [Int]) -> Int {
            var numsCopy = nums
            numsCopy.sort()
            var sum = 0
            for i in stride(from: 0, to: numsCopy.count, by: 2) {
                sum += min(numsCopy[i], numsCopy[i+1])
            }
            return sum
        }
    }

    @Suite struct ArrayPartitionTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "fa323c4e-1127-46cf-a6fd-57592554ed0b",
             input: "nums = [1000,2000,3000,4000]",
             expected: "3000", orderMatters: true),
            TestCaseData(id: "552c80c3-143a-4054-84b3-b6a97005a845",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a14ba877-e52c-4645-9ebc-530c5b03f887",
             input: "nums = [1,3,5,7,9,11,13,15,17,19,21,23]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "43a74379-a6fd-475e-b137-90486207768d",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "37774bf1-c0fb-4cfd-80df-af68398215b4",
             input: "nums = [1,2,3,4,5,6]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "77f33190-7d2b-49bf-a838-695916b644f8",
             input: "nums = []",
             expected: "9223372036854775807", orderMatters: true),
            TestCaseData(id: "e41816bd-4c6b-488e-bb82-bc07711fcf07",
             input: "nums = [1,1,1,1]",
             expected: "9223372036854775807", orderMatters: true),
            TestCaseData(id: "ebb5635d-e1bd-46fd-bcfb-e495f403aec5",
             input: "nums = [1,2,3,4,5,6,7,8]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "6c49a56b-a4b7-4a22-970f-4520ce5d382e",
             input: "nums = [-1,-2,-3,-4]",
             expected: "-7", orderMatters: true),
            TestCaseData(id: "60d19050-6b6c-497f-81ad-a4d1e18a5bd3",
             input: "nums = [10,20,30,40,50,60]",
             expected: "60", orderMatters: true),
            TestCaseData(id: "7af96e81-5ec6-4bd8-8cbe-680a7dc2d79e",
             input: "nums = [1,3,5,7,9,11]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "4ccebd46-2815-403e-af3c-002e7d6702ad",
             input: "nums = [2,4,6,8,10,12]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "0635c975-df9c-4a00-8f84-e240ababcb21",
             input: "nums = [1,1,1,1,1,1]",
             expected: "9223372036854775807", orderMatters: true),
            TestCaseData(id: "90b2b1f9-4209-4998-bf21-944fcb1f1929",
             input: "nums = [10,10,10,10,10,10]",
             expected: "9223372036854775807", orderMatters: true),
            TestCaseData(id: "cbf96be6-3342-4dda-909f-223ae35e90dc",
             input: "nums = [-10,-10,-10,-10,-10,-10]",
             expected: "9223372036854775807", orderMatters: true),
            TestCaseData(id: "6b719e94-6553-4b03-a403-e0e5e173fd2b",
             input: "nums = [100,200,300,400,500,600]",
             expected: "600", orderMatters: true),
            TestCaseData(id: "96a4a3c8-8512-44e8-8351-cbdbe315551e",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "30053caa-543e-4498-b287-802efc55ead6",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "1a51a6b0-79e5-4eb5-8c18-527aab1ad5b0",
             input: "nums = [1,3,5,7,9,11,13,15]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "ecdfa37d-11b9-4db7-96ae-8895a9952341",
             input: "nums = [2,4,6,8,10,12,14,16]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "de2eb6d0-460a-43cd-a37f-ed709f76cbf4",
             input: "nums = [1,1,1,1,1,1,1,1]",
             expected: "9223372036854775807", orderMatters: true),
            TestCaseData(id: "948a4ccb-2039-4bf9-a611-1cefd4756934",
             input: "nums = [10,10,10,10,10,10,10,10]",
             expected: "9223372036854775807", orderMatters: true),
            TestCaseData(id: "33378b1c-61f9-45d5-bdee-69d9b3ade660",
             input: "nums = [-10,-10,-10,-10,-10,-10,-10,-10]",
             expected: "-40", orderMatters: true),
            TestCaseData(id: "3879b3b8-96c8-4f25-9d97-c988346fec96",
             input: "nums = [100,100,100,100,100,100,100,100]",
             expected: "400", orderMatters: true),
            TestCaseData(id: "493f110c-3bea-4dbf-a53c-32e9e39ea1d8",
             input: "nums = [1,4,3,2]",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "array-partition"
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
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.arrayPairSum(p_nums)
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
