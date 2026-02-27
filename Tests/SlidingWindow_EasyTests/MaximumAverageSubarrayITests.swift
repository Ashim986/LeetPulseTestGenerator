import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumAverageSubarrayI {
    private class Solution {
        func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
            var windowSum = 0
            for i in 0..<k {
                windowSum += nums[i]
            }
            var maxAverage = Double(windowSum) / Double(k)
            for i in k..<nums.count {
                windowSum = windowSum - nums[i - k] + nums[i]
                maxAverage = max(maxAverage, Double(windowSum) / Double(k))
            }
            return maxAverage
        }
    }

    @Suite struct MaximumAverageSubarrayITests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a283e203-7657-4ca4-acd2-05fb4f6cd111",
             input: "nums = [1], k = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "100a6cc6-c41e-4461-9646-6f4e48f55245",
             input: "nums = [1, 2], k = 1",
             expected: "2.0", orderMatters: true),
            TestCaseData(id: "059ed2d5-bc9a-4d2a-bec9-1b70fd583a51",
             input: "nums = [1, 2], k = 2",
             expected: "1.5", orderMatters: true),
            TestCaseData(id: "f8b435b2-da38-4dce-94c8-a39abf618263",
             input: "nums = [1, 2, 3], k = 1",
             expected: "3.0", orderMatters: true),
            TestCaseData(id: "3a371c62-9698-42fd-bea6-415171cc7afd",
             input: "nums = [1, 2, 3], k = 2",
             expected: "2.5", orderMatters: true),
            TestCaseData(id: "0b931c85-dc70-4e53-8dc5-1b69e347fc82",
             input: "nums = [1, 2, 3], k = 3",
             expected: "2.0", orderMatters: true),
            TestCaseData(id: "fa01e204-5f8c-4cb6-9a38-373d501ea595",
             input: "nums = [1, 1, 1], k = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "70befc84-75d1-4522-8194-9f8bb0de40e4",
             input: "nums = [1, 1, 1], k = 2",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "b451ae93-e8a5-4003-9805-e99960adac23",
             input: "nums = [1, 1, 1], k = 3",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "125383c6-c44c-40e4-a52f-a93cabbdba3a",
             input: "nums = [-1, -2, -3], k = 1",
             expected: "-1.0", orderMatters: true),
            TestCaseData(id: "25978e08-df33-437d-b4b5-d873e902847e",
             input: "nums = [-1, -2, -3], k = 2",
             expected: "-1.5", orderMatters: true),
            TestCaseData(id: "09d8e8e7-13b9-49eb-8c51-d1c3b1e2c75d",
             input: "nums = [-1, -2, -3], k = 3",
             expected: "-2.0", orderMatters: true),
            TestCaseData(id: "621c8799-df22-415f-b889-b8c9b37cf0b0",
             input: "nums = [10, 20, 30], k = 1",
             expected: "30.0", orderMatters: true),
            TestCaseData(id: "4724ca27-477b-474f-945b-8c8b7f725418",
             input: "nums = [10, 20, 30], k = 2",
             expected: "25.0", orderMatters: true),
            TestCaseData(id: "1f1c9377-0c9d-4d86-928c-7c340303a64e",
             input: "nums = [10, 20, 30], k = 3",
             expected: "20.0", orderMatters: true),
            TestCaseData(id: "6d678ac9-13e1-4cc5-90e5-3eb97b903269",
             input: "nums = [1000, 2000, 3000], k = 1",
             expected: "3000.0", orderMatters: true),
            TestCaseData(id: "1fe3a2dd-f68b-4506-af75-1d7e83ff67c2",
             input: "nums = [1000, 2000, 3000], k = 2",
             expected: "2500.0", orderMatters: true),
            TestCaseData(id: "d263efba-0db8-4c77-b363-5219f230b4cd",
             input: "nums = [1000, 2000, 3000], k = 3",
             expected: "2000.0", orderMatters: true),
            TestCaseData(id: "328e2505-f92a-40ac-bc0a-34c93ff54fb3",
             input: "nums = [1, 2, 3, 4, 5], k = 1",
             expected: "5.0", orderMatters: true),
            TestCaseData(id: "7b29a38d-a7dd-4244-8de7-6aad31538622",
             input: "nums = [1, 2, 3, 4, 5], k = 2",
             expected: "4.5", orderMatters: true),
            TestCaseData(id: "17271c49-c425-4640-b240-9c407f4e0512",
             input: "nums = [1, 2, 3, 4, 5], k = 5",
             expected: "3.0", orderMatters: true),
            TestCaseData(id: "78fd1463-c672-435d-bf5a-06aa9b8e10b7",
             input: "nums = [5, 4, 3, 2, 1], k = 1",
             expected: "5.0", orderMatters: true),
            TestCaseData(id: "ef644cae-e6d6-4879-947b-6152d2ff1d79",
             input: "nums = [5, 4, 3, 2, 1], k = 2",
             expected: "4.5", orderMatters: true),
            TestCaseData(id: "77538d0a-12a3-4057-859d-e935883b24a4",
             input: "nums = [5, 4, 3, 2, 1], k = 3",
             expected: "4.0", orderMatters: true),
            TestCaseData(id: "f8647524-0786-4c87-8370-9a33843d922a",
             input: "nums = [5, 4, 3, 2, 1], k = 4",
             expected: "3.5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-average-subarray-i"
            let topic = "sliding-window"
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
            guard p_k >= 1 && p_k <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= n <= 105"
                )
                return
            }
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= n <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Double?
            let didCrash = withCrashGuard {
                resultHolder = solution.findMaxAverage(p_nums, p_k)
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

            // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
            // Treats -0 and 0 as equal; handles trailing zero normalization
            let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
            let matches = abs(result - expectedVal) < 1e-5
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
