import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSplitArrayIntoConsecutiveSubsequences {
    private class Solution {
        func isPossible(_ nums: [Int]) -> Bool {
            var freq: [Int: Int] = [:]
            var tails: [Int: Int] = [:]

            for num in nums {
                freq[num, default: 0] += 1
            }

            for num in nums {
                if freq[num] ?? 0 == 0 {
                    continue
                }
                freq[num]? -= 1
                if tails[num - 1] ?? 0 > 0 {
                    tails[num - 1]? -= 1
                    tails[num, default: 0] += 1
                } else if freq[num + 1] ?? 0 > 0 && freq[num + 2] ?? 0 > 0 {
                    freq[num + 1]? -= 1
                    freq[num + 2]? -= 1
                    tails[num + 2, default: 0] += 1
                } else {
                    return false
                }
            }
            return true
        }
    }

    @Suite struct SplitArrayIntoConsecutiveSubsequencesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "afb97dfc-e95d-42d8-ae71-1fa62a4092e9",
             input: "nums = [1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "aba51add-5333-48e7-8b7d-907d24d1ad30",
             input: "nums = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "72cb162d-cb5a-4f55-bea7-b2a081a90420",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c5d11db9-4f43-4315-999a-98f7028f34cc",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5d25cb02-993c-41f1-af1e-089761372080",
             input: "nums = [1,3,5,7,9]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "961f013b-60d6-495f-9be8-623cc5ceb39b",
             input: "nums = [2,4,6,8,10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0dac7f28-3aed-4987-be52-31676d565e2e",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "32d8f731-bd8a-49a8-8b24-5d3a1dec019c",
             input: "nums = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f45124ab-3a2e-4cdb-9bbc-e9d37fff49f9",
             input: "nums = [1,1,1,2,2,2,3,3,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "27318d6a-30b9-4fbd-b9d1-d8d9eaa608df",
             input: "nums = [3,3,3,2,2,2,1,1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "db17002f-938d-4614-a66d-afc4be04c32e",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7fa2855a-b54f-4842-bd4a-aa2fc6e9b5f2",
             input: "nums = [12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "cd1dfb3d-8eb6-4606-a0e0-93834d6ada42",
             input: "nums = [1,1,2,2,3,3,4,4,5,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9fed946e-d12c-4f6f-aebd-c95a3af2823d",
             input: "nums = [5,5,4,4,3,3,2,2,1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4357c030-e379-4fc9-aae1-bb89f0b7a3a1",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fd95656b-3298-4797-8962-9e12273fc839",
             input: "nums = [14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6358f45d-bcba-4384-8bd9-708a5ef08e20",
             input: "nums = [1,3,5,7,9,11,13,15]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6f377ec9-5ae4-4a06-8dd1-f9e3a494d1d1",
             input: "nums = [2,4,6,8,10,12,14,16]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9c2536d2-8fd2-4a44-b5dc-16f36e55bbd7",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8cd06e94-d4b1-458f-b132-6e3ec7aaf80d",
             input: "nums = [16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ecd9883c-a407-456e-9abe-76e56c32aee8",
             input: "nums = [1,1,1,2,2,2,3,3,3,4,4,4]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7a7ce465-06f0-4e92-809e-0596f83f5376",
             input: "nums = [4,4,4,3,3,3,2,2,2,1,1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d2d14c7f-3830-4a07-bef3-2b424bd01a6a",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e85643f5-cb77-47e7-a53d-ba4e1473c936",
             input: "nums = [17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e5a5bbbc-4c02-4fb8-9526-722ffd68db11",
             input: "nums = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "split-array-into-consecutive-subsequences"
            let topic = "greedy"
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
            guard p_nums.count >= 1 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -1000 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= nums[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.isPossible(p_nums)
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
