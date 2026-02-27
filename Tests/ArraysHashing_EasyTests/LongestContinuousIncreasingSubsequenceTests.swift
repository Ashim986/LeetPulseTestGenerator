import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestContinuousIncreasingSubsequence {
    private class Solution {
        func findLengthOfLCIS(nums: [Int]) -> Int { if nums.count == 0 { return 0 }
        var maxLength = 1
        var currentLength = 1
        for i in 1..<nums.count { if nums[i] > nums[i-1] { currentLength += 1 } else { currentLength = 1 } }
        if currentLength > maxLength { maxLength = currentLength }
        return maxLength }
    }

    @Suite struct LongestContinuousIncreasingSubsequenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bfdf287c-4e20-4c3b-9ba3-3a31691fc631",
             input: "nums = [1,2,3,4,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c6e62484-72af-48db-936c-2eb3dd2b6320",
             input: "nums = [5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4e4edb11-3f5f-4c68-ad75-b6a46862d9ee",
             input: "nums = [1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "856c4adc-e502-42e7-a6fd-3a7e3700aa82",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "18333a71-d983-4e7a-a67d-b88b890bebad",
             input: "nums = [10,20,30,40,50]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c48d30c0-7c1b-4eee-9457-626e730e9496",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bb5b8adb-48bc-4778-bdb9-3d6e498c9a3e",
             input: "nums = [1,2,3,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "8edcad6a-ffae-43da-ac91-eb2d553b3304",
             input: "nums = [1,3,5,7,9]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "905579c5-feee-43d0-9368-271ecf31f742",
             input: "nums = [9,7,5,3,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7fae2e35-9f11-49cc-85a8-f51e35d4b6ea",
             input: "nums = [1,1,2,3,4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "97b00beb-a5aa-467c-90b6-c4bd2ca544ec",
             input: "nums = [1,2,1,2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6de61af8-0dcb-4258-8698-d8b7c4ac04f3",
             input: "nums = [10,20,30,20,10]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "af1ca08c-f3b2-4957-8c95-ab6bacb28d28",
             input: "nums = [1,1,1,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9c46e973-897f-4270-981e-74f5479003e1",
             input: "nums = [5,5,5,5,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "aa23bef6-aa2f-4c88-ae6a-5ed9be32a5e7",
             input: "nums = [1,2,3,4,3]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "dc7d15cd-b618-4811-8448-ab2068389bc9",
             input: "nums = [10,9,8,7,6]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ec7544ab-e37f-424a-b173-7e3f7c7e4192",
             input: "nums = [1,3,5,7,9,11]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "2b1262d4-048d-4eae-a320-6c914c48af71",
             input: "nums = [11,9,7,5,3,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "13a74f52-3076-4e0e-8b07-c76697ffff88",
             input: "nums = [1,2,3,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6db4a7d0-a015-4ca3-a78a-ae5b953dc068",
             input: "nums = [10,20,30,40,10]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e6bff879-19dd-4b79-b5a2-e38c96cf25dc",
             input: "nums = [1,2,1,2,3,4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "0556771d-d64d-4fc2-8937-214bd13e7009",
             input: "nums = [1,3,5,7,9,11,13]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "0dd471d4-9e2e-425f-bdee-680b9566c9ce",
             input: "nums = [13,11,9,7,5,3,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0fe3cb8d-5969-4f0d-a621-b71237ccce5b",
             input: "nums = [1,2,3,4,5,6,7]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "82bedafe-7df0-4e65-a7f6-cc25df3f4897",
             input: "nums = [7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-continuous-increasing-subsequence"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
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

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 10^4"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -1000000000 && $0 <= 1000000000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10^9 <= nums[i] <= 10^9"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findLengthOfLCIS(nums: p_nums)
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
