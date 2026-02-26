import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumSumCircularSubarray {
    private class Solution {
        func maxSubarraySumCircular(_ nums: [Int]) -> Int {
            let n = nums.count
            let total = nums.reduce(0, +)
            var maxKadane = kadane(nums)
            var minKadane = kadane(nums.map {
                -$0
            }
            )
            if minKadane == total {
                return maxKadane
            }
            else {
                return max(maxKadane, total - minKadane)
            }
            func kadane(_ nums: [Int]) -> Int {
                var maxSoFar = Int.min
                var maxEndingHere = 0
                for num in nums {
                    maxEndingHere = max(num, maxEndingHere + num)
                    maxSoFar = max(maxSoFar, maxEndingHere)
                }
                return maxSoFar
            }
        }
    }

    @Suite struct MaximumSumCircularSubarrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ebe87592-3070-449c-a9db-93d6ab3b6bb7",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4d11c9bf-8ab8-4a65-9177-c0c66078bbb0",
             input: "nums = [1, 2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "7006c430-a0ae-4338-b04c-21815a4d27a4",
             input: "nums = [1, -1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "63fb279c-4110-4a53-a08d-5f891e1f7941",
             input: "nums = [-1, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b3ea9995-a0d3-46e8-a21e-72585b1db493",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "89c9cc3e-73d5-49cf-81b8-c35dc0516f9b",
             input: "nums = [-1, -2, -3, -4, -5]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "f4a634c8-7015-422f-9986-bc828301051b",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "390ef4c5-690e-4d5d-ac09-d616b457dd6d",
             input: "nums = [-1, -1, -1, -1, -1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "c2656cb4-27dd-42d6-890a-4fb64751ee2a",
             input: "nums = [10, 20, 30, 40, 50]",
             expected: "150", orderMatters: true),
            TestCaseData(id: "085fc5a5-28f5-4236-9803-736746732e81",
             input: "nums = [-10, -20, -30, -40, -50]",
             expected: "-10", orderMatters: true),
            TestCaseData(id: "302371ed-82c0-4b1d-858b-2f5c50bd905b",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "55", orderMatters: true),
            TestCaseData(id: "610ed594-4595-4ce1-8d25-10ee64de99f0",
             input: "nums = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "f0dcdb46-0230-4218-98c8-32daf14fbb9a",
             input: "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "f73d1c5b-6660-42b7-b554-6895c5dbbda4",
             input: "nums = [-10, -10, -10, -10, -10, -10, -10, -10, -10, -10]",
             expected: "-10", orderMatters: true),
            TestCaseData(id: "ec0a0eff-e590-4c99-8583-e830367ad878",
             input: "nums = [1, -1, 1, -1, 1, -1, 1, -1, 1, -1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3505f103-e35b-4807-a4e2-69fcd1c1b97e",
             input: "nums = [-1, 1, -1, 1, -1, 1, -1, 1, -1, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4f6dfe9f-76cf-4afa-9050-1288612851d3",
             input: "nums = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]",
             expected: "5500", orderMatters: true),
            TestCaseData(id: "6a1c1eae-905b-4adc-ac6d-fe19d6fc6c5f",
             input: "nums = [-100, -200, -300, -400, -500, -600, -700, -800, -900, -1000]",
             expected: "-100", orderMatters: true),
            TestCaseData(id: "a1012544-91f3-44af-973f-d5ad65914694",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "00186ef9-8ea7-4b03-8baf-2091d8bac8bf",
             input: "nums = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "254fd345-d106-4d49-9613-6560fe716633",
             input: "nums = [-10, -20, -30, -40, -50, -60, -70, -80, -90, -100, -110, -120, -130, -140, -150]",
             expected: "-10", orderMatters: true),
            TestCaseData(id: "dfcc7ba0-1f39-4c5f-b8fa-55c10df11cb6",
             input: "nums = [1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000]",
             expected: "15000", orderMatters: true),
            TestCaseData(id: "42e716fc-f05c-484b-ba3f-4420592f814c",
             input: "nums = [-1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000]",
             expected: "-1000", orderMatters: true),
            TestCaseData(id: "e2f8865b-11f2-4a53-abbe-0c814f672b11",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]",
             expected: "210", orderMatters: true),
            TestCaseData(id: "c2fd6887-7bc7-4d8e-a781-8fe0072189fe",
             input: "nums = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16, -17, -18, -19, -20]",
             expected: "-1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-sum-circular-subarray"
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

            let solution = Solution()
            let result = solution.maxSubarraySumCircular(p_nums)
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
