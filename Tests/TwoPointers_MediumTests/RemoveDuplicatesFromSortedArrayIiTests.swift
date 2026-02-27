import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRemoveDuplicatesFromSortedArrayIi {
    private class Solution {
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            if nums.count < 3 {
                return nums.count
            }
            var j = 2
            for i in 2...nums.count - 1 {
                if nums[i] != nums[j - 2] {
                    nums[j] = nums[i]
                    j += 1
                }
            }
            return j
        }
    }

    @Suite struct RemoveDuplicatesFromSortedArrayIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4c7f49f6-3ab5-4e95-9b1f-d7846153658c",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "13f86716-e017-4cc2-b47f-11b7b0277239",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "428bbe23-d793-406f-8d89-f2703c30483e",
             input: "nums = [1, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4e722caf-7a46-481d-bf43-d5d649dd8502",
             input: "nums = [1, 2, 3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "cf41c4da-55ed-40c4-bd20-4c872728e41f",
             input: "nums = [-1, -1, 0, 0, 1, 1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "a0cb0674-617c-45b1-a603-5315f3be1821",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "4bae9b8d-79c7-4cdb-84bd-c54780d41e23",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "2cd8f3e7-9650-4032-ba2c-a5091f63b7c1",
             input: "nums = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "42725eb3-15d7-4b16-8fa8-8c8c38be35b6",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "f5241fa9-8179-41b5-92b0-fd635da420fe",
             input: "nums = [20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "e2a165d5-0d82-4784-8c2a-c6c600d57f0d",
             input: "nums = [-20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "f5b5d3b2-91b7-4aef-921d-5954da2c358f",
             input: "nums = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "bd180b43-1267-489b-b3ef-6734605e90bd",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "3c13a204-fdbe-44a3-a83f-8a7481ca4221",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "02c5d838-8594-4c1b-8df1-85d0d3378d74",
             input: "nums = [25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "e282d29f-634a-4d4c-9fa5-7eeedb6c800b",
             input: "nums = [-25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "40a65f14-1a21-43d1-80dc-e27e1931efd9",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "1610a8a3-c2f0-4473-95e5-9f683a35d1ab",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "7a44512d-5d12-4383-b08a-9747723b6bf9",
             input: "nums = [30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "315c83d0-701b-4e9d-b5e4-e1f5d1256b93",
             input: "nums = [-30, -29, -28, -27, -26, -25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4,"
                + " -3, -2, -1]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "fcf86095-b69f-4611-8358-940d4e043462",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "eb518259-a0d5-4095-a394-94c066a910ce",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2f56113f-3c0f-4bf1-bb22-1148881a2842",
             input: "nums = [0, 0, 0, 0, 0, 0]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "3c21553d-42f6-487c-9993-569ea8d0d336",
             input: "nums = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "e12a3e19-c471-4013-a64d-c9829e16f377",
             input: "nums = [1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3]",
             expected: "9", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "remove-duplicates-from-sorted-array-ii"
            let topic = "two-pointers"
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

            guard var p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as inout [Int]"
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
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 3 * 104"
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
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.removeDuplicates(&p_nums)
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
