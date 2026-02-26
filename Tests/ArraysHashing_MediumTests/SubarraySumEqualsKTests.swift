import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSubarraySumEqualsK {
    private class Solution {
        func subarraySum(_ nums: [Int], _ k: Int) -> Int {
            var count = 0
            var sum = 0
            var freq: [Int: Int] = [0: 1]
            for num in nums {
                sum += num
                if let c = freq[sum - k] { count += c }
                freq[sum, default: 0] += 1
            }
            return count
        }
    }

    @Suite struct SubarraySumEqualsKTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3c5232d5-c7de-45ac-902a-9ee11dfbcf15",
             input: "nums = [], k = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4f3757de-2219-4789-83a1-f9bebf3744a0",
             input: "nums = [1], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a8b5075d-2a91-45f2-b25f-4e42b2ecd68e",
             input: "nums = [1, 1], k = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fe45b2ef-2eb2-4abc-95b7-65ea67530a7b",
             input: "nums = [1, 2, 3], k = 6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "89d195c0-4f6c-4916-97e5-1b7bba16efdc",
             input: "nums = [1, 2, 3], k = 7",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a0dd6ac0-aab2-400e-9f5a-343df15393b6",
             input: "nums = [0, 0, 0], k = 0",
             expected: "6", orderMatters: true),
            TestCaseData(id: "e0ae2c4a-1bec-4221-bbda-bde866194bf8",
             input: "nums = [0, 0, 0], k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b0229279-b5bd-4f71-b610-d4ffa3f0b5bf",
             input: "nums = [-1, -1, -1], k = -3",
             expected: "1", orderMatters: true),
            TestCaseData(id: "536e0e44-4d0c-4e19-9360-4c2ad161a8d1",
             input: "nums = [-1, 0, 1], k = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "be4b0921-9a28-4a76-b002-ec150321f44e",
             input: "nums = [10, 20, 30], k = 60",
             expected: "1", orderMatters: true),
            TestCaseData(id: "898f4f15-1579-4c32-8680-09b6210e3e52",
             input: "nums = [1, 2, 3, 4, 5], k = 9",
             expected: "2", orderMatters: true),
            TestCaseData(id: "529ec8cb-55e7-422d-a0dd-814482dbb893",
             input: "nums = [1, 2, 3, 4, 5], k = 15",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5630e0d0-7c6b-4a29-8efc-f2dcf418e191",
             input: "nums = [5, 4, 3, 2, 1], k = 9",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3e190217-d339-4f11-8902-029881920d77",
             input: "nums = [5, 4, 3, 2, 1], k = 15",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ce5fed26-6065-4dfa-8793-af9bf29b98f5",
             input: "nums = [1, 1, 1, 1, 1], k = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e7072ded-8570-4b4c-a822-1352f1a82d58",
             input: "nums = [1, 1, 1, 1, 1], k = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "52e34a0c-9743-4415-9c1d-ade23d69b2ad",
             input: "nums = [-5, -4, -3, -2, -1], k = -9",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ae30b13f-08c8-413d-b862-a119d7442f54",
             input: "nums = [-5, -4, -3, -2, -1], k = -15",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8b9b4701-f809-469b-9947-ca1a76dba0ff",
             input: "nums = [100, 200, 300], k = 600",
             expected: "1", orderMatters: true),
            TestCaseData(id: "287d360a-b58e-4c9a-8552-41ee29d8be6b",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1], k = 5",
             expected: "6", orderMatters: true),
            TestCaseData(id: "b03174f2-35f7-4106-a1b4-089189093302",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1], k = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c847073c-2227-4160-8825-53526ad27643",
             input: "nums = [10, 20, 30, 40, 50], k = 100",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7ad6c834-43a2-4cf8-a7fc-26320214cb09",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], k = 55",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9171f451-0790-485b-9567-41946ee755cf",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1], k = 55",
             expected: "1", orderMatters: true),
            TestCaseData(id: "46c07be6-7307-464e-a557-753236d15582",
             input: "nums = [1000, 2000, 3000], k = 6000",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "subarray-sum-equals-k"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 20000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 2 * 10^4"
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
            guard p_k >= -10000000 && p_k <= 10000000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10^7 <= k <= 10^7"
                )
                return
            }

            let solution = Solution()
            let result = solution.subarraySum(p_nums, p_k)
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
