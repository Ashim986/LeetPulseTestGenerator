import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMajorityElement {
    private class Solution {
        func majorityElement(_ nums: [Int]) -> Int {
            var candidate = nums[0]
            var count = 1
            for i in 1..<nums.count {
                if count == 0 {
                    candidate = nums[i]
                    count = 1
                } else if nums[i] == candidate {
                    count += 1
                } else {
                    count -= 1
                }
            }
            return candidate
        }
    }

    @Suite struct MajorityElementTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b0ccc366-c81f-4dc5-a860-2113de797c91",
             input: "nums = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b92f0e97-1b43-43a0-99d1-d8e1cd8a1c43",
             input: "nums = [2,2,1,1,1,2,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9a11c133-cb6f-4c1d-854e-4212babf6f7a",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2ad25f76-a651-4f51-b35b-2d4d363c7c32",
             input: "nums = [1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "83e4abbc-35ea-4135-a67f-40acd3e08401",
             input: "nums = [1,1,2,2,3,3,3,3,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "43049fa2-1200-4a5f-90f9-f6c149f9ae75",
             input: "nums = [-1,-1,-1,-2,-2,-2,-2]",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "2a4d1c6d-5ff5-4312-9892-4992ababc784",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c557950c-954c-439d-9393-0c0b252b43ab",
             input: "nums = [100,100,100,100,100,100,100,100,100,100]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "0f28dee7-ee09-480c-8088-03b784abfb6e",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "017bf73d-9b00-4eee-a3c4-1ea09603c3af",
             input: "nums = [1,1,1,1,1,2,2,2,2,2,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "01d943d9-6289-41b0-b5ec-48376567039d",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7efd2ff6-d7c0-4625-9cbb-c9b7a14f705c",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9dbaf30e-1f7b-4cb7-a728-a8530d1f92d0",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f0ac0182-475a-4e58-950e-cd351a5638e5",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "85e5756d-05a7-46d6-a47d-0775dba823fd",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4eb4a8ed-72a0-45c2-a2de-c171f72faf96",
             input: "nums = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7ee71d59-d96a-43f1-a517-bbb92f23a0ac",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "93fc1ef3-3d08-4006-b7fb-4557f78e80ab",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9ad74529-677a-45d8-b750-2dfe1e59ea93",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,"
                + "1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a8c8d5c8-f716-4b32-80ea-05cf8aaaac97",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,"
                + "1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bbd0401b-aa9c-4aec-8767-f5f998426520",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,"
                + "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2045cd18-ac80-40c9-82a0-42c8dfcaf5df",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,"
                + "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b09e4a72-7ef0-4410-bb7e-0782100b2bb2",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,"
                + "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7a06614e-4ef9-487b-b7a9-18e9cf12287a",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,"
                + "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5811ac70-8ee4-4076-91ba-52d9d5807eeb",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,"
                + "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "majority-element"
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
            guard p_nums.count >= 1 && p_nums.count <= 50000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 5 * 10^4"
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
                resultHolder = solution.majorityElement(p_nums)
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
