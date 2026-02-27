import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaxConsecutiveOnesIii {
    private class Solution {
        func longestOnes(_ nums: [Int], _ k: Int) -> Int {
            var maxLength = 0
            var left = 0
            var zeros = 0
            for right in 0..<nums.count {
                if nums[right] == 0 {
                    zeros += 1
                }
                while zeros > k {
                    if nums[left] == 0 {
                        zeros -= 1
                    }
                    left += 1
                }
                maxLength = max(maxLength, right - left + 1)
            }
            return maxLength
        }
    }

    @Suite struct MaxConsecutiveOnesIiiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ba396fec-bff7-4e0c-a31b-a8ba0fdc1711",
             input: "nums = [], k = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3e28e8db-771d-41e6-a3d1-288fa5f822cd",
             input: "nums = [1], k = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2c12b6cc-1bc3-4211-9f4a-f124975dcea8",
             input: "nums = [0], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a34ee2a0-5082-4057-9bd9-53c1b285d08b",
             input: "nums = [1, 0], k = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "598d1512-be62-4e70-922c-df153ba3950a",
             input: "nums = [0, 1], k = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d315ab2d-2e9b-4a76-9696-073ab82c82de",
             input: "nums = [1, 1], k = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bc8e4551-e367-485d-91c8-ffb2653447f1",
             input: "nums = [0, 0], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4fc91eec-1e22-49aa-86aa-546dcca73830",
             input: "nums = [0, 0, 0], k = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "64105daa-dca6-4d28-9a71-1f2b07b16356",
             input: "nums = [0, 1, 0], k = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b510a728-8559-4660-a700-586f445340df",
             input: "nums = [1, 1, 0], k = 1",
             expected: "3", orderMatters: true),
            TestCaseData(id: "57f2b494-5588-48d9-89d8-1013c1cdc921",
             input: "nums = [0, 0, 1], k = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a038a993-bcee-4bcb-b44f-b7aea9dfa037",
             input: "nums = [1, 0, 0], k = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "95d11228-6596-408c-9cd9-cdf8c38c7801",
             input: "nums = [0, 1, 1], k = 1",
             expected: "3", orderMatters: true),
            TestCaseData(id: "28adfc25-2b28-4263-a2b4-2595cc23b209",
             input: "nums = [0, 0, 1, 1], k = 1",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d9a9b16b-254f-47d3-99b2-35980260f18e",
             input: "nums = [1, 0, 0, 0], k = 2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c31c8ccf-4728-4aff-8e3d-ab8d820e8fe6",
             input: "nums = [0, 1, 1, 1], k = 1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "11b2e1b6-605e-4d08-a8fd-5496aaf18f2a",
             input: "nums = [1, 1, 1, 0], k = 1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "6ffbeadb-6eab-42dd-95c4-883be203ee65",
             input: "nums = [1, 0, 1, 1, 0], k = 2",
             expected: "5", orderMatters: true),
            TestCaseData(id: "003a31d0-48a3-4ff5-a1e4-78ce66b14263",
             input: "nums = [0, 0, 0, 0, 1], k = 3",
             expected: "4", orderMatters: true),
            TestCaseData(id: "1bb77671-905f-4d18-ba0b-268473919fb4",
             input: "nums = [1, 1, 1, 1, 0], k = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "71de212c-a86a-4f54-8a06-62708b3f44ba",
             input: "nums = [0, 0, 0, 0, 0], k = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "672f7790-e44f-4768-8609-c7dbaf64bf94",
             input: "nums = [1, 1, 1, 1, 1], k = 0",
             expected: "5", orderMatters: true),
            TestCaseData(id: "83bdce64-894a-4cdf-9b51-4f6ff493cacd",
             input: "nums = [1, 1, 1, 1, 1, 1], k = 0",
             expected: "6", orderMatters: true),
            TestCaseData(id: "d1fa41a7-b938-4592-9d28-985a3d29ca05",
             input: "nums = [0, 0, 0, 0, 0, 0], k = 6",
             expected: "6", orderMatters: true),
            TestCaseData(id: "b6d68fe7-7500-44f5-82ff-b271545ccfef",
             input: "nums = [1, 1, 1, 1, 1, 1, 1], k = 0",
             expected: "7", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "max-consecutive-ones-iii"
            let topic = "binary-search"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.longestOnes(p_nums, p_k)
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
