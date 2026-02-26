import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPartitionEqualSubsetSum {
    private class Solution {
        func canPartition(_ nums: [Int]) -> Bool {
            let total = nums.reduce(0, +)
            if total % 2 != 0 { return false }

            let target = total / 2
            var bits = Set<Int>([0])

            for num in nums {
                var newBits = Set<Int>()
                for b in bits {
                    let newSum = b + num
                    if newSum <= target {
                        newBits.insert(newSum)
                    }
                }
                bits.formUnion(newBits)
                if bits.contains(target) { return true }
            }

            return bits.contains(target)
        }
    }

    @Suite struct PartitionEqualSubsetSumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "93cd3000-9a1e-4bfd-bfcf-19127597228c",
             input: "nums = [1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4fb2320b-b8df-4ec2-8ae9-d20f1ef8a75e",
             input: "nums = [0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8a0e53ab-e8e4-4512-adfc-37ef77c209a3",
             input: "nums = [1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e7b9442a-5232-4c02-a37f-b2565b141934",
             input: "nums = [-1, -2, -3, -4, -5]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8bc64c8c-284e-4b30-a95d-fd2ce8780ecb",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ff9d371e-b3f6-437a-ad23-7e3221dfa966",
             input: "nums = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "515e987c-c4c0-426b-9f59-89f94c82d181",
             input: "nums = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9892c38d-94e9-4d11-b6c6-bef2360f5813",
             input: "nums = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "90506fb4-415b-45cb-b369-6124d1c5c7cc",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "fa23f494-b1ed-47eb-89e8-d9be9d06b496",
             input: "nums = [10, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "52b4410a-35a8-4708-a55f-bc555ee0d891",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1000]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "41f63433-d4cb-4bda-b2f0-237e5b924610",
             input: "nums = [1000, 2, 3, 4, 5, 6, 7, 8, 9, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0e35fe1d-95c3-4e69-bd2b-af3e0f765000",
             input: "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9a836651-fc26-4a40-9cab-f1f57e62971a",
             input: "nums = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "50e923ad-1e51-4cf7-a957-20a591df628e",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9844c876-c57b-4d34-8017-550edbed9313",
             input: "nums = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a76e3a4c-2e7e-4ee3-be3e-ddef5cd41061",
             input: "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1bb4128c-f73c-40de-a1f2-8b4a78c554b5",
             input: "nums = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "113f9d8d-cb07-4eae-9f62-44094f254462",
             input: "nums = [10, 1, 10, 1, 10, 1, 10, 1, 10, 1, 10, 1, 10, 1, 10, 1, 10, 1, 10, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fef4cafd-3428-4187-b2f5-4c8a7bb03fd4",
             input: "nums = [5, 10, 5, 10, 5, 10, 5, 10, 5, 10, 5, 10, 5, 10, 5, 10, 5, 10, 5, 10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1b02b270-38be-478e-abaf-beba861752e0",
             input: "nums = [1, 2, 7, 1, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3e760a8a-e05b-4362-adf2-e7b19faa152c",
             input: "nums = [1, 2, 3, 9]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6cbe1ab3-c7c5-49f5-aa86-8958b0412323",
             input: "nums = [4, 4, 4, 4, 4, 4, 4, 4, 4, 4]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a4c015f6-7468-4f3c-820c-e9167dd45599",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3f7af33b-a2f5-47fc-847d-c88e32d434b2",
             input: "nums = []",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "partition-equal-subset-sum"
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
            guard p_nums.count >= 1 && p_nums.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 200"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 1 && $0 <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums[i] <= 100"
                )
                return
            }

            let solution = Solution()
            let result = solution.canPartition(p_nums)
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
