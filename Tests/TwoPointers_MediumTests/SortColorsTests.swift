import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSortColors {
    private class Solution {
        func sortColors(_ nums: inout [Int]) {
            var count = [0, 0, 0]

            for num in nums {
                count[num] += 1
            }

            var index = 0
            for color in 0..<3 {
                for _ in 0..<count[color] {
                    nums[index] = color
                    index += 1
                }
            }
        }
    }

    @Suite struct SortColorsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2ed00956-f878-4011-90a7-a5e5ffb4376e",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "7d7b3256-fd1e-405d-bcfd-c8e2c24da599",
             input: "nums = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "16ccea58-c0fd-4517-a257-0eabeb4b6597",
             input: "nums = [2]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "ecbf018f-473e-42a3-8d9a-57a570e4b81b",
             input: "nums = [0, 0]",
             expected: "[0, 0]", orderMatters: true),
            TestCaseData(id: "32575d05-e8e7-4a67-818c-4d919d86995f",
             input: "nums = [1, 1]",
             expected: "[1, 1]", orderMatters: true),
            TestCaseData(id: "bdc893f5-a06f-4097-b813-afa27a95f281",
             input: "nums = [2, 2]",
             expected: "[2, 2]", orderMatters: true),
            TestCaseData(id: "44a8aa87-16e6-49f5-a4df-2d53d1ec5653",
             input: "nums = [0, 1]",
             expected: "[0, 1]", orderMatters: true),
            TestCaseData(id: "a9a55484-b4ff-442c-ab3e-5eb3f3aa4930",
             input: "nums = [1, 0]",
             expected: "[0, 1]", orderMatters: true),
            TestCaseData(id: "cfb6e647-495d-444d-b40d-52dbab02e72d",
             input: "nums = [0, 2]",
             expected: "[0, 2]", orderMatters: true),
            TestCaseData(id: "b8b84ef2-f127-442f-81e6-20c859de873f",
             input: "nums = [2, 0]",
             expected: "[0, 2]", orderMatters: true),
            TestCaseData(id: "ecb465f6-d883-4e81-9283-119a71902568",
             input: "nums = [1, 2]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "9233ebdb-69ea-44f4-a76a-68f85067d8ff",
             input: "nums = [2, 1]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "17ad694a-c81f-439e-ae2b-705b5cb25a35",
             input: "nums = [0, 1, 2]",
             expected: "[0, 1, 2]", orderMatters: true),
            TestCaseData(id: "a2d42fe5-629f-4c78-8329-252c1c76b1e4",
             input: "nums = [2, 1, 0]",
             expected: "[0, 1, 2]", orderMatters: true),
            TestCaseData(id: "95de1e13-fa89-44cd-b813-363127fcb16c",
             input: "nums = [0, 0, 1, 1, 2, 2]",
             expected: "[0, 0, 1, 1, 2, 2]", orderMatters: true),
            TestCaseData(id: "1316b712-d8af-460a-b49a-4db9305eeb4c",
             input: "nums = [2, 2, 1, 1, 0, 0]",
             expected: "[0, 0, 1, 1, 2, 2]", orderMatters: true),
            TestCaseData(id: "9e5d615b-97f7-40b0-a4b1-16576d809339",
             input: "nums = [0, 1, 2, 0, 1, 2]",
             expected: "[0, 0, 1, 1, 2, 2]", orderMatters: true),
            TestCaseData(id: "c29e5ae6-285c-4b3a-a258-1f7821d05f34",
             input: "nums = [0, 0, 0, 1, 1, 1, 2, 2, 2]",
             expected: "[0, 0, 0, 1, 1, 1, 2, 2, 2]", orderMatters: true),
            TestCaseData(id: "8dd21287-0e72-4dc3-ba80-8ab742bb3d12",
             input: "nums = [2, 2, 2, 1, 1, 1, 0, 0, 0]",
             expected: "[0, 0, 0, 1, 1, 1, 2, 2, 2]", orderMatters: true),
            TestCaseData(id: "3012046d-951c-4cac-9795-c614668ece7e",
             input: "nums = [0, 1, 2, 0, 1, 2, 0, 1, 2]",
             expected: "[0, 0, 0, 1, 1, 1, 2, 2, 2]", orderMatters: true),
            TestCaseData(id: "da00a967-5432-41ce-ab55-9a8b0db27963",
             input: "nums = [0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2]",
             expected: "[0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2]", orderMatters: true),
            TestCaseData(id: "3a5ebf8e-5bc5-419a-992a-827340637acb",
             input: "nums = [2, 2, 2, 2, 1, 1, 1, 1, 0, 0, 0, 0]",
             expected: "[0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2]", orderMatters: true),
            TestCaseData(id: "be5a5d62-7fcc-4a4c-aec3-245715f135c3",
             input: "nums = [0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2]",
             expected: "[0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2]", orderMatters: true),
            TestCaseData(id: "f6737808-8a52-4f13-9b48-5bb076afa193",
             input: "nums = [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2]",
             expected: "[0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2]", orderMatters: true),
            TestCaseData(id: "062b570c-cbd1-4306-a6ee-dfc0a04c57c6",
             input: "nums = [2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0]",
             expected: "[0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sort-colors"
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
            guard p_nums.count >= 1 && p_nums.count <= 300 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 300"
                )
                return
            }

            let solution = Solution()
            let didCrash = withCrashGuard {
                solution.sortColors(&p_nums)
            }
            guard !didCrash else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serialize(p_nums)

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
