import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfSubarraysWithBoundedMaximum {
    private class Solution {
        func numSubarrayBoundedMax(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
            var res = 0, start = 0, count = 0, last = -1
            for end in 0..<nums.count {
                if nums[end] > right {
                    res += count
                    start = end + 1
                    last = end
                    count = 0
                } else if nums[end] >= left {
                    if last >= start {
                        count = end - last
                    } else {
                        count = end - start + 1
                    }
                }
                if last >= start {
                    res += count
                }
            }
            return res
        }
    }

    @Suite struct NumberOfSubarraysWithBoundedMaximumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a82ddeb8-0336-4fff-9fe8-b463093f1243",
             input: "nums = [1,2,3], left = 1, right = 3",
             expected: "6", orderMatters: true),
            TestCaseData(id: "e16e332b-eca7-4981-a16c-a03357edf97d",
             input: "nums = [1,2,3,4,5], left = 1, right = 5",
             expected: "15", orderMatters: true),
            TestCaseData(id: "45d5debb-6e8f-48db-a554-bef0edb4feb9",
             input: "nums = [1,2,3,4,5], left = 1, right = 2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a516b608-3089-4531-9a6c-532f52545b12",
             input: "nums = [1], left = 1, right = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f0c0d763-f00f-4b32-a45f-f389ed40011b",
             input: "nums = [], left = 1, right = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0a545431-d39f-466c-8fa7-2a44ce8a4ef7",
             input: "nums = [1,2,3,4,5], left = 6, right = 6",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b07c968d-9250-4ba8-b382-997e360048eb",
             input: "nums = [5,4,3,2,1], left = 1, right = 5",
             expected: "15", orderMatters: true),
            TestCaseData(id: "37b766f2-f080-4970-b97d-6bc505bd113b",
             input: "nums = [1,2,3,4,5], left = 0, right = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dbe3142c-2e61-41ab-b270-6d5ad0a050e3",
             input: "nums = [-1,-2,-3,-4,-5], left = -5, right = -1",
             expected: "15", orderMatters: true),
            TestCaseData(id: "421a93a1-f6a8-466f-a58f-f8414b672dd5",
             input: "nums = [10,20,30,40,50], left = 10, right = 50",
             expected: "15", orderMatters: true),
            TestCaseData(id: "4e32f65f-784e-4aeb-a940-dac744ffea69",
             input: "nums = [1,2,3,4,5], left = 1, right = 10",
             expected: "15", orderMatters: true),
            TestCaseData(id: "fb19df36-2272-4109-933d-2f42e400005a",
             input: "nums = [1,2,3,4,5], left = -10, right = 5",
             expected: "15", orderMatters: true),
            TestCaseData(id: "83bff83b-657a-4a8f-bd65-019fc32eb73e",
             input: "nums = [100,200,300,400,500], left = 100, right = 500",
             expected: "15", orderMatters: true),
            TestCaseData(id: "ab14556b-7dad-4d0f-8aad-e1604048e5ee",
             input: "nums = [1,2,3,4,5], left = 100, right = 1000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "edf43fa7-2f8c-4323-90a2-3a603cb21639",
             input: "nums = [1,2,3,4,5], left = -100, right = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3a341bf4-d8ff-4bd6-977d-decefb89d85d",
             input: "nums = [1,2,3,4,5], left = 1, right = 4",
             expected: "10", orderMatters: true),
            TestCaseData(id: "75ca798e-d5e4-42c1-9988-cbcbc0aa344e",
             input: "nums = [1,2,3,4,5], left = 1, right = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f8616755-3f5b-4c69-89fa-b3cced935ac7",
             input: "nums = [1000,2000,3000,4000,5000], left = 1000, right = 5000",
             expected: "15", orderMatters: true),
            TestCaseData(id: "4d524972-f677-4c0d-8ab2-c31e6769f7c7",
             input: "nums = [1,2,3,4,5], left = 6, right = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d91a7114-27f8-4ba2-9596-933197afc737",
             input: "nums = [1,2,3,4,5], left = -10, right = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "733e9792-5d85-492d-aad2-4dfaa1f8d754",
             input: "nums = [1,1,1], left = 1, right = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "9184f011-5783-4519-87ce-0273f0f363cf",
             input: "nums = [5,5,5], left = 5, right = 5",
             expected: "6", orderMatters: true),
            TestCaseData(id: "8ad03d4d-d25c-4c5b-8698-fa0ef553f3ae",
             input: "nums = [1,2,3,4,5], left = 3, right = 5",
             expected: "12", orderMatters: true),
            TestCaseData(id: "0dfef10d-6db4-4fc6-94cf-3a402ccda7c6",
             input: "nums = [1,1,1,1,1], left = 1, right = 1",
             expected: "15", orderMatters: true),
            TestCaseData(id: "99e6aa7c-e2cf-4adc-b920-073f56967f7e",
             input: "nums = [1,-2,3,-4,5], left = -4, right = 5",
             expected: "15", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-subarrays-with-bounded-maximum"
            let topic = "two-pointers"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
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
            guard let p_left = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_right = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 109"
                )
                return
            }
            guard p_left >= 0 && p_left <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= left <= right <= 109"
                )
                return
            }
            guard p_right >= 0 && p_right <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= left <= right <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.numSubarrayBoundedMax(p_nums, p_left, p_right)
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
