import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumSubarray {
    private class Solution {
        func maxSubArray(_ nums: [Int]) -> Int {
            var currentSum = nums[0]
            var maxSum = nums[0]

            for i in 1..<nums.count {
                currentSum = max(nums[i], currentSum + nums[i])
                maxSum = max(maxSum, currentSum)
            }

            return maxSum
        }
    }

    @Suite struct MaximumSubarrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bfbd830a-f2ee-46fa-a406-c1ff873cb8ab",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0e313e9f-999b-4771-b8a8-450792de9642",
             input: "nums = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5708d311-ef2d-4e6c-8ebe-ebd7b95d912d",
             input: "nums = [-1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "9c03847c-4cf7-4c1c-b637-5b35c7a6ce7a",
             input: "nums = [1, 2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "7ad8d0ea-cafb-4fa4-b1e3-990a5ed2c864",
             input: "nums = [-1, -2]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "d4201d0f-8aac-41c3-b4ff-f557b6d62db0",
             input: "nums = [1, -2, 3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1e35a8ba-3af6-4a6d-aa6a-a0d865a0fd05",
             input: "nums = [-1, 2, -3, 4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "5b4b1011-ba19-4dbe-9df0-13bcfc861525",
             input: "nums = [1, 1, 1, 1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "eb6dfb30-43a4-4930-a542-d60a2a7ad642",
             input: "nums = [-1, -1, -1, -1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "bee20d38-9efe-430b-83d6-71d5cf6b970c",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "62afbf95-d9e8-44f5-9d1b-c8ee458872db",
             input: "nums = [-5, -4, -3, -2, -1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "96495a09-55a5-41b7-80b1-d2d22f10210f",
             input: "nums = [1000, -1000, 1000, -1000]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "7dfac6a8-db5b-40b2-bdaf-cab402e12f6f",
             input: "nums = [-1000, 1000, -1000, 1000]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "f2d2570d-bb08-4eb6-943e-05d87a623750",
             input: "nums = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]",
             expected: "550", orderMatters: true),
            TestCaseData(id: "e67cc4c2-0161-4b47-bab9-6173862f61cc",
             input: "nums = [-10, -20, -30, -40, -50, -60, -70, -80, -90, -100]",
             expected: "-10", orderMatters: true),
            TestCaseData(id: "d3183f1d-fcb6-4093-834b-bee44150acef",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "107ed9ad-d6be-41ee-b4de-53d79c553e3b",
             input: "nums = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "bacc321d-989d-491b-a35e-700e2ab03631",
             input: "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f5618b01-dbff-4e5a-8b28-5ebf2879515f",
             input: "nums = [5, 4, 3, 2, 1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "bf3f8f66-0fdc-49ab-8c3a-f56d0f4800e8",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]",
             expected: "120", orderMatters: true),
            TestCaseData(id: "5e7d608b-f3ba-4099-9868-ff828f9f2024",
             input: "nums = [-15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "ddd66820-a7df-4035-9467-4077e41eacae",
             input: "nums = [-1500, -1400, -1300, -1200, -1100, -1000, -900, -800, -700, -600, -500, -400, -300, -200, -100]",
             expected: "-100", orderMatters: true),
            TestCaseData(id: "e5307c71-1e18-4dab-8e61-599d9c030fa7",
             input: "nums = [1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c0de66e2-c654-4e81-aa4d-8ee6330b137b",
             input: "nums = [-1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4f48ddf1-6697-4c6a-bff9-8652207ffb9f",
             input: "nums = [10, -10, 10, -10, 10, -10, 10, -10, 10, -10, 10, -10, 10, -10, 10]",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-subarray"
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
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.maxSubArray(p_nums)
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
