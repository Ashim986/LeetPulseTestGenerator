import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMonotonicArray {
    private class Solution {
        func isMonotonic(_ nums: [Int]) -> Bool {
            var increasing = false
            var decreasing = false

            for i in 1..<nums.count {
                if nums[i] > nums[i-1] {
                    increasing = true
                }
                if nums[i] < nums[i-1] {
                    decreasing = true
                }
                if increasing && decreasing {
                    return false
                }
            }

            return true
        }
    }

    @Suite struct MonotonicArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b62a88cf-d61e-44ac-9f43-2e40fe6d84a4",
             input: "nums = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4868d6c8-07bb-473e-931f-41de01f97a2f",
             input: "nums = [1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0a7bfda4-f986-443e-ab20-4c57ff08d79e",
             input: "nums = [1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "77182d87-8be1-4d3c-8ae2-98c89ff9a9a1",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "19b3fa9e-b16c-40da-a8d2-b83d629d356f",
             input: "nums = [5, 4, 3, 2, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ba1e53db-52c9-4ae3-a89a-42e6710d5b18",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "de7b9613-bff0-4c5d-9b3b-c74dccba26dc",
             input: "nums = [-1, -2, -3, -4, -5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "46e15e79-abc5-4f2d-aec5-a319ccfd5526",
             input: "nums = [-5, -4, -3, -2, -1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ac280349-5155-4c90-a505-9f8ad18a7606",
             input: "nums = [0, 0, 0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f3ed26a4-c128-4a73-8d57-bab6df6db472",
             input: "nums = [1, 3, 5, 7, 9]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cd631360-63c9-44dc-bd41-fd0acebf885a",
             input: "nums = [9, 7, 5, 3, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d5e38105-f3c3-4352-bec3-323b2cdd8af6",
             input: "nums = [1, -2, 3, -4, 5]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "579b39a2-1ecf-404b-875d-751d3c0b7863",
             input: "nums = [1, 2, 3, 2, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7e658687-b81e-4de1-ac30-ca6c029ad314",
             input: "nums = [5, 4, 3, 2, 3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3771378a-a30e-4c69-bb5e-066b2e6aa267",
             input: "nums = [1, 1, 2, 2, 3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fd9054a1-5c2b-463b-b3e0-d375f8646eae",
             input: "nums = [3, 2, 2, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4042d054-aca5-463e-886d-28a3bf588ab9",
             input: "nums = [1000, 1000, 1000, 1000, 1000]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9eeac7d7-738b-40f3-9386-bf18fefb75e0",
             input: "nums = [-1000, -1000, -1000, -1000, -1000]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4e31044a-de6c-4197-b21c-707ab6f0cbbe",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "78ce3080-8fa6-4948-ada7-1ee27d7a7ae7",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "179bd940-05ca-47a4-bbe0-06729cec7f67",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b085765c-e59f-49c0-af19-df8b431d84cc",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "90f0e59a-135f-483f-a026-a6b8c1293d27",
             input: "nums = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1e880315-7376-42ea-b695-e393427f70a2",
             input: "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "08390dc0-34e8-49e3-8cb5-7c7844694a6a",
             input: "nums = [19, 17, 15, 13, 11, 9, 7, 5, 3, 1]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "monotonic-array"
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
            guard p_nums.allSatisfy({ $0 >= -100000 && $0 <= 100000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10^5 <= nums[i] <= 10^5"
                )
                return
            }

            let solution = Solution()
            let result = solution.isMonotonic(p_nums)
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
