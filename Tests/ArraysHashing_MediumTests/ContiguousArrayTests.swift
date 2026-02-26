import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCContiguousArray {
    private class Solution {
        func findMaxLength(_ nums: [Int]) -> Int {
            let n = nums.count
            var maxLength = 0
            var count = 0
            var prefixSum: [Int: Int] = [0: -1]
            for i in 0..<n {
                if nums[i] == 0 {
                    count -= 1
                } else {
                    count += 1
                }
                if let j = prefixSum[count] {
                    maxLength = max(maxLength, i - j)
                } else {
                    prefixSum[count] = i
                }
            }
            return maxLength
        }
    }

    @Suite struct ContiguousArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "efab2b09-09d4-4023-9361-10dc8ee796b8",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2fd15c27-cd6f-447c-90fc-ab2cfd236962",
             input: "nums = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d22fb961-6b8e-4418-91c4-199d735000ff",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "95b52d83-3b16-4946-acd2-082d199aa1c8",
             input: "nums = [0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c9d1334f-c108-4529-9d79-5651ed6b7712",
             input: "nums = [1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "85f9c96f-2e10-4bd3-80d6-9c69fd51e3b1",
             input: "nums = [0,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "097d1eb8-5c37-449b-acb1-5138c2e49a64",
             input: "nums = [1,0,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "50e3fc95-5aa3-4f66-81ba-b10c35c2b734",
             input: "nums = [0,0,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d0a820ba-02e6-4e2c-be31-397253c73d21",
             input: "nums = [1,1,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b5c89e60-2181-49a0-95e9-115eda5ed672",
             input: "nums = [0,1,0,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "88b61701-36ca-4059-b40d-6ce7b8576928",
             input: "nums = [1,0,1,0]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ab13deba-7893-4b4c-b9bc-d3a4c03b0893",
             input: "nums = [0,0,0,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d733bd29-94ec-4d23-98a1-729e5a552c8e",
             input: "nums = [1,1,1,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2c29e43e-8390-402b-bd70-e9aaa4413567",
             input: "nums = [0,-1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "75286445-91da-44e6-a96b-b40ed3ba7919",
             input: "nums = [-1,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4f3f92a2-ee2b-4b97-aaf0-1e1411b4b0b7",
             input: "nums = [0,-1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "03dd8248-e9dc-459f-9c6f-6a95bd3a4266",
             input: "nums = [-1,0,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ae64346c-fc5d-4c2e-9d8f-54ca5cc1c198",
             input: "nums = [0,1,-1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e98e49bb-1054-447f-ac56-c88b9b7925af",
             input: "nums = [1,-1,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e9467ebb-c599-4d2f-9477-5e1cf36cd653",
             input: "nums = [1000,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "fe56bb67-798d-475b-ac98-2d49ae9b23dc",
             input: "nums = [0,1000]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d3197458-a86c-40ca-ac87-4099bab347c4",
             input: "nums = [0,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6f0c5e4a-0cb4-4157-8fc7-6452b69acf51",
             input: "nums = [1,0,0,0,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "163e4836-f15d-4676-86ef-7b34dd9ffd75",
             input: "nums = [0,0,0,0,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "deaef5ee-4826-413b-8d5b-fe5fb7ee38f0",
             input: "nums = [1,1,1,1,0]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "contiguous-array"
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
            let result = solution.findMaxLength(p_nums)
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
