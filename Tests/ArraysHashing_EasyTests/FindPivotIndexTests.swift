import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindPivotIndex {
    private class Solution {
        func pivotIndex(_ nums: [Int]) -> Int {
            let totalSum = nums.reduce(0, +)
            var prefixSum = 0
            for (i, num) in nums.enumerated() {
                if prefixSum == totalSum - prefixSum - num {
                    return i
                }
                prefixSum += num
            }
            return -1
        }
    }

    @Suite struct FindPivotIndexTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6bc2559e-cf1c-4a47-babf-97034931e96d",
             input: "nums = []",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "c451b266-9d07-4cde-963c-a39e4f0eb552",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dbbef75e-9942-43b7-9522-4193a4948984",
             input: "nums = [1, 1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "ee55632b-6dc7-488b-8c55-cd63ce925fa5",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "c7b3a662-071f-4170-a8b7-6bddc2b49d27",
             input: "nums = [5, 4, 3, 2, 1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "27ad01d9-d348-42dd-8fad-89fb0265b18f",
             input: "nums = [1, -1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1902b875-19f5-4453-8e40-f91d01381947",
             input: "nums = [10, 20, 30, 40, 50]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "a2b8e67e-bbc1-4d11-8ae5-f442a5526e84",
             input: "nums = [50, 40, 30, 20, 10]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "4bc7365a-706b-47ee-8ed3-a3c11da63b8c",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "272bb590-b1c3-4171-a319-1f9360f6d83d",
             input: "nums = [-10, -20, -30, -40, -50]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "9789075a-7929-4d81-bf5f-4eb0b371999a",
             input: "nums = [100, 200, 300, 400, 500]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "9ac444eb-097a-412e-94f5-9f178ad4dbd1",
             input: "nums = [1000, 2000, 3000, 4000, 5000]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "e96c1622-c53f-4cb5-a3b1-79876a16a11d",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "c6de698f-8775-43b8-89c2-2fc340672902",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "9b28990e-4d4f-452c-866f-39faa5567ccb",
             input: "nums = [1, -2, 3, -4, 5]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "810c528c-bb20-41d9-ad41-66aca3b14603",
             input: "nums = [5, -4, 3, -2, 1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "5d6551a3-be2b-4d7a-83b9-709906fe916a",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "14100760-caf5-4677-9695-0e9ec71364cd",
             input: "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "1ee31974-ce48-47be-9842-e94d0c019f4e",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "041357e8-30a2-498c-b64b-0a7d3a64747a",
             input: "nums = [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "59afd543-73a6-4c7e-b07c-b2f72a61b66a",
             input: "nums = [10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "fa196e6e-601b-4eef-8dab-9cb8a3f99fe5",
             input: "nums = [100000, 90000, 80000, 70000, 60000, 50000, 40000, 30000, 20000, 10000]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "e9a58bcb-5254-4c50-828a-0ae6f497c0ab",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "39dffc1c-0173-47af-8b46-6a4b1278f589",
             input: "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "07c62f14-0bf8-4841-85ec-d3cf51fa43f5",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]",
             expected: "-1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-pivot-index"
            let topic = "arrays-hashing"
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
            guard p_nums.count >= 1 && p_nums.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 10^4"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -1000 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= nums[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.pivotIndex(p_nums)
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
