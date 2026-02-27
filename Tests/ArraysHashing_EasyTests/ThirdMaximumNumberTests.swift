import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCThirdMaximumNumber {
    private class Solution {
        func thirdMax(_ nums: [Int]) -> Int {
            var max1 = Int.min
            var max2 = Int.min
            var max3 = Int.min
            for num in nums {
                if num > max1 {
                    max3 = max2
                    max2 = max1
                    max1 = num
                } else if num > max2 && num != max1 {
                    max3 = max2
                    max2 = num
                } else if num > max3 && num != max1 && num != max2 {
                    max3 = num
                }
            }
            if max3 == Int.min {
                return max1
            }
            return max3
        }
    }

    @Suite struct ThirdMaximumNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "65d82b1e-bd55-4445-bfbb-d638784a9ed3",
             input: "nums = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e883cb93-118d-4850-b066-ccdf79abb2b1",
             input: "nums = [1,2,3,4,5]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a488969d-7eb3-4104-8e5a-367542e3181a",
             input: "nums = [10,20,30,40,50]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "9cf91a6e-03ef-41e6-9a38-70ce03542b78",
             input: "nums = [5,5,5,5,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "82ddc168-b9a9-4c5e-a2d9-2fb3a9ec4a85",
             input: "nums = [10,10,10,10,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "655a526e-7d3c-4781-bc2d-ad92b3676e7b",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "614e0786-0c61-4738-909e-958b0d0228f8",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "52e022ca-3198-4ff8-a1eb-e3046b3dbcf2",
             input: "nums = [-10,-20,-30,-40,-50]",
             expected: "-30", orderMatters: true),
            TestCaseData(id: "e004b0b8-b743-449b-9a51-421f42f2eb3a",
             input: "nums = [100,200,300,400,500]",
             expected: "300", orderMatters: true),
            TestCaseData(id: "192a1feb-9ae1-44a4-87b8-33be39e28098",
             input: "nums = [5,4,3,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "3bbb78ef-e864-4c5c-bacc-37201f65858c",
             input: "nums = [1,1,1,1,1,2,2,2,2,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1d5da664-0dbc-4a83-abc6-213a96f5ba90",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "8a957f83-1551-42e9-ba5d-591cceb21644",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "3000", orderMatters: true),
            TestCaseData(id: "485252f4-5985-47e5-b5b3-70424f001e45",
             input: "nums = [-1000,-2000,-3000,-4000,-5000]",
             expected: "-3000", orderMatters: true),
            TestCaseData(id: "b8f6e63b-8100-40d3-a466-8110e47c03a5",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "13", orderMatters: true),
            TestCaseData(id: "378dee97-a8f2-42f5-a7c6-987d3bc5432b",
             input: "nums = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "13", orderMatters: true),
            TestCaseData(id: "0932fc8b-d01d-47cf-bf11-8b154824e795",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b1dc99d5-3e47-4a9a-8c50-71bab1635128",
             input: "nums = [10,20,30,40,50,60,70,80,90,100]",
             expected: "80", orderMatters: true),
            TestCaseData(id: "f1cdb9e5-a410-4c78-b787-9d118534db33",
             input: "nums = [10000,20000,30000,40000,50000]",
             expected: "30000", orderMatters: true),
            TestCaseData(id: "69ca584d-d733-4380-b214-72586db09aa8",
             input: "nums = [-10000,-20000,-30000,-40000,-50000]",
             expected: "-30000", orderMatters: true),
            TestCaseData(id: "a170024c-0980-4b98-92d9-1350beca6181",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "ebfec948-1a51-45bb-a630-9b827994f656",
             input: "nums = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "d350e8bc-af38-44ac-a3eb-b89c78c12d8f",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "02e4eef0-4233-4785-a22c-ade62d672d26",
             input: "nums = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "37c3cd5e-a415-4830-8bcc-2ad42e04014f",
             input: "nums = [100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100]",
             expected: "100", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "third-maximum-number"
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
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.thirdMax(p_nums)
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
