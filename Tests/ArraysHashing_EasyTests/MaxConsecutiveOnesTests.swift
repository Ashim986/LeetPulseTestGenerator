import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaxConsecutiveOnes {
    private class Solution {
        func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
            var maxCount = 0
            var currentCount = 0
            for num in nums {
                if num == 1 {
                    currentCount += 1
                    maxCount = max(maxCount, currentCount)
                } else {
                    currentCount = 0
                }
            }
            return maxCount
        }
    }

    @Suite struct MaxConsecutiveOnesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "75043ca8-7b6f-45a3-9a1e-c827a31e884d",
             input: "nums = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4c72ba00-ad41-447e-a058-e9cad001b3d9",
             input: "nums = [1,0,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "48ce1e02-8c4b-49c4-93db-a878eaed7179",
             input: "nums = [0,1,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fb2782b4-c6c0-414b-9249-e05b9e852823",
             input: "nums = [0,0,1,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "591ebda3-d232-4356-bff7-b846d2bc1ffd",
             input: "nums = [0,0,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dad7b0b7-7057-41e4-a215-6145f22a2462",
             input: "nums = [0,0,0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c3c1a48b-f64d-4264-9448-dbc1244093f4",
             input: "nums = [1,1,0,0,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ae3d7ab9-12fd-48d9-9eba-9e0f5b31925a",
             input: "nums = [0,1,1,0,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "197764d4-b033-41f9-8026-2866897908b0",
             input: "nums = [0,0,1,1,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0d769f76-83a6-4a95-84f2-717756759940",
             input: "nums = [0,0,0,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9c2adaac-424d-4208-87ad-60d2da446ca7",
             input: "nums = [1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a98f2463-0ba9-4fe9-a2e2-58b979860a1c",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6d8ab9e1-8435-467b-ac4a-f75679bf3db3",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "00bb4002-3185-4f12-9fa7-497729a04aaf",
             input: "nums = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bd95efa4-7c07-4b45-ad70-3723db42aeaa",
             input: "nums = [1,0,1,1,1000]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "289030c5-986d-4482-b25b-b546cd3480c6",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "37c46279-ed3e-41bc-8ac7-42558a28a533",
             input: "nums = [0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7176d768-d8d8-45ba-9975-b9090a884aa0",
             input: "nums = [1,1,1,0,0,0,0,0,0,0]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6e16c5c5-54df-4651-9fd2-c6e9f9fc9d7a",
             input: "nums = [0,0,0,0,0,0,0,0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a3b03b89-3baa-4220-9c0c-f46d6f52265c",
             input: "nums = [1,1,1,1,1,0,0,0,0,0]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "86a85fbe-187e-4205-9d1c-30b9f0f451b8",
             input: "nums = [0,0,0,0,0,1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f7f64257-eeb4-4ec9-a15a-a6b99ef3e77d",
             input: "nums = [1,1,1,1,1,1,1,1,1,0]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "e081acfe-a61a-461f-9e0b-04d4a9040c6f",
             input: "nums = [1,0,1,0,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "43d3f4c4-5e4f-447e-9141-282b373887d5",
             input: "nums = [0,1,0,1,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4a6972fe-964d-4e1b-9177-f7fe95f431fb",
             input: "nums = [-1,1,0,1,1]",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "max-consecutive-ones"
            let topic = "arrays-hashing"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
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
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 10^5"
                )
                return
            }

            let solution = Solution()
            let result = solution.findMaxConsecutiveOnes(p_nums)
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
