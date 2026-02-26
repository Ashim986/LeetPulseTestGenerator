import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumSizeSubarraySum {
    private class Solution {
        func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
           let n = nums.count
           var minLen = Int.max
           var left = 0
           var sum = 0
           for right in 0...n-1 {
              sum += nums[right]
              while sum >= target {
                 minLen = min(minLen, right - left + 1)
                 sum -= nums[left]
                 left += 1
              }
           }
           return minLen == Int.max ? 0 : minLen
        }
    }

    @Suite struct MinimumSizeSubarraySumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "77e608d6-e18b-4e83-ac2f-ef426b4fc42e",
             input: "nums = [1], target = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "80343cdb-17f2-4fc1-bc8b-7caddd7db23d",
             input: "nums = [1,1], target = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "83d085be-52a5-4434-800f-25bcefd405a3",
             input: "nums = [0,0,0], target = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "11086295-954e-4872-a3e6-933cb6349cd1",
             input: "nums = [], target = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "783f52b6-98b2-47a9-94f3-df1903ec6bf5",
             input: "nums = [1,2,3,4,5], target = 15",
             expected: "5", orderMatters: true),
            TestCaseData(id: "724e5e0b-80a9-4b35-93f2-5ba9ba125e31",
             input: "nums = [5,4,3,2,1], target = 15",
             expected: "5", orderMatters: true),
            TestCaseData(id: "abb835c1-f048-4221-a69b-4c3865ac4c1b",
             input: "nums = [1,1,1,1,1], target = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "6d7e9aff-94ee-419d-b83c-ad66035e5fbd",
             input: "nums = [10,20,30,40,50], target = 100",
             expected: "3", orderMatters: true),
            TestCaseData(id: "14a49b99-b561-4297-a7ca-e2bba15205d3",
             input: "nums = [50,40,30,20,10], target = 100",
             expected: "3", orderMatters: true),
            TestCaseData(id: "80858e02-3fb0-4ac4-90d5-c3c7962933ed",
             input: "nums = [1,2,3,4,5], target = 100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ab9afd27-c763-4df6-9ea5-32429d6ecc6d",
             input: "nums = [100,200,300,400,500], target = 100",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c953b5d0-485b-4551-a61a-31b024648a0c",
             input: "nums = [1000,2000,3000,4000,5000], target = 10000",
             expected: "3", orderMatters: true),
            TestCaseData(id: "665c0acd-91de-4aea-8d41-7d5be9af94a9",
             input: "nums = [5000,4000,3000,2000,1000], target = 10000",
             expected: "3", orderMatters: true),
            TestCaseData(id: "26cba858-7f41-45c1-a894-ab0b103484f9",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], target = 10",
             expected: "10", orderMatters: true),
            TestCaseData(id: "91c90151-be4a-46be-8098-567535db0a46",
             input: "nums = [10,10,10,10,10,10,10,10,10,10], target = 100",
             expected: "10", orderMatters: true),
            TestCaseData(id: "474a3c76-e5e5-44b1-9f52-4ea0ec35483a",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 55",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d4daa620-f055-4f79-a150-7886866e27a0",
             input: "nums = [10,9,8,7,6,5,4,3,2,1], target = 55",
             expected: "10", orderMatters: true),
            TestCaseData(id: "e9fe66a3-abe1-43d7-a301-0e2e2b59b520",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], target = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7e39a5b1-7bc4-4cae-97fc-2195afec506f",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b139bd4a-55ec-40bf-ac5a-a7ae6eb70a46",
             input: "nums = [10,9,8,7,6,5,4,3,2,1], target = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "df81dbe4-8c88-40a4-b11a-c381d7baa5cd",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], target = 100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f0bc5a76-707d-4baa-bcb7-4a66bc1d1f68",
             input: "nums = [10,10,10,10,10,10,10,10,10,10], target = 1000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "608a92f7-2e33-43c7-90ca-2aa0d9a7f9de",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 1000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "73b9f85d-f259-4a13-ae58-69e19f17b609",
             input: "nums = [10,9,8,7,6,5,4,3,2,1], target = 1000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c48e3c44-0482-4d41-aa60-8dd4267c6f90",
             input: "nums = [-1,-2,-3,-4,-5], target = -15",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-size-subarray-sum"
            let topic = "binary-search"
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

            guard let p_target = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_nums = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
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
            guard p_target >= 1 && p_target <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= target <= 109"
                )
                return
            }
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
            guard p_nums.allSatisfy({ $0 >= 1 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.minSubArrayLen(p_target, p_nums)
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
