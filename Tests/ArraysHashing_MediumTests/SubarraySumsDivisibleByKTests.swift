import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSubarraySumsDivisibleByK {
    private class Solution {
        func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
            let n = nums.count
            var count = 0
            var prefixSum = 0
            var sumCount: [Int: Int] = [0: 1]
            for num in nums {
                prefixSum = (prefixSum + num) % k
                if prefixSum < 0 {
                    prefixSum += k
                }
                if let val = sumCount[prefixSum] {
                    count += val
                }
                sumCount[prefixSum, default: 0] += 1
            }
            return count
        }
    }

    @Suite struct SubarraySumsDivisibleByKTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d94138a2-b0fc-4e61-8ac3-a737c0850a21",
             input: "nums = [1,2,3], k = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2a82462c-e044-4628-a098-ec78233ee9f4",
             input: "nums = [1,2,3], k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "0e05aa2c-fa36-48f9-878b-26310e913c78",
             input: "nums = [], k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cb5faae8-6750-48dc-b139-0057ec72ca1c",
             input: "nums = [0], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d04ad7a4-3c81-4ef3-963e-f0ecd6657938",
             input: "nums = [0], k = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "68702d31-92a0-4ed6-b0a5-9bd4c00124ae",
             input: "nums = [1,2,3,4,5], k = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "70e02281-ec36-4c8a-bbbf-82b82a59530b",
             input: "nums = [-1,-2,-3], k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "a5ae8e43-8dd2-434f-aadc-d4b37193cbb1",
             input: "nums = [10,20,30], k = 10",
             expected: "6", orderMatters: true),
            TestCaseData(id: "ddf159cc-8227-47a8-9687-04f7698d7b0d",
             input: "nums = [10,20,30], k = 5",
             expected: "6", orderMatters: true),
            TestCaseData(id: "abdfe3ef-02f5-49fa-98d3-399526716bf6",
             input: "nums = [1000,2000,3000], k = 1000",
             expected: "6", orderMatters: true),
            TestCaseData(id: "c1f0e188-f389-49b2-abfc-9b174335bc9b",
             input: "nums = [1000,2000,3000], k = 500",
             expected: "6", orderMatters: true),
            TestCaseData(id: "2ca32ef9-60fe-4894-8289-19f0f0f84425",
             input: "nums = [1,1,1,1,1], k = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c87aedef-8851-4428-985b-0a7d02820aff",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], k = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "80eaeffb-c325-4007-918f-d02e6ee24899",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], k = 1",
             expected: "55", orderMatters: true),
            TestCaseData(id: "ace5ee1e-5c0e-476d-bc3b-fa67e36834c0",
             input: "nums = [5,5,5,5,5,5,5,5,5,5], k = 5",
             expected: "55", orderMatters: true),
            TestCaseData(id: "0a5744da-751d-4786-ba6e-9ea26946101c",
             input: "nums = [5,5,5,5,5,5,5,5,5,5], k = 1",
             expected: "55", orderMatters: true),
            TestCaseData(id: "92d11df6-377d-451d-8e84-1f236cf77205",
             input: "nums = [10,10,10,10,10,10,10,10,10,10], k = 10",
             expected: "55", orderMatters: true),
            TestCaseData(id: "4a51f39c-2261-455f-9108-c80cfe1e4cac",
             input: "nums = [10,10,10,10,10,10,10,10,10,10], k = 5",
             expected: "55", orderMatters: true),
            TestCaseData(id: "312bc7e3-8f66-4797-8fc0-72cb210de8f3",
             input: "nums = [100,100,100,100,100,100,100,100,100,100], k = 100",
             expected: "55", orderMatters: true),
            TestCaseData(id: "b526b352-71cf-45bd-aef2-e03234c2a775",
             input: "nums = [1,2,3], k = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "0cbddc01-44e2-40ca-a622-d44be482d0a0",
             input: "nums = [1,1,1], k = 3",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1619e58a-1361-4e0d-913f-672fef462d82",
             input: "nums = [1,1,1], k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "7af603cb-d692-41a9-b95b-7ed908c8ba45",
             input: "nums = [1,2,3,4,5], k = 5",
             expected: "4", orderMatters: true),
            TestCaseData(id: "6f8ed1f6-5d56-4cc5-bd04-bc8f425e5cc1",
             input: "nums = [-1,-2,-3], k = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "151b00f6-f166-46fc-afc1-d31c468c6a29",
             input: "nums = [1,1,1,1,1], k = 1",
             expected: "15", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "subarray-sums-divisible-by-k"
            let topic = "arrays-hashing"
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
            guard p_nums.count >= 1 && p_nums.count <= 30000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 3 * 10^4"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -10000 && $0 <= 10000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10^4 <= nums[i] <= 10^4"
                )
                return
            }
            guard p_k >= 2 && p_k <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= k <= 10^4"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.subarraysDivByK(p_nums, p_k)
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
