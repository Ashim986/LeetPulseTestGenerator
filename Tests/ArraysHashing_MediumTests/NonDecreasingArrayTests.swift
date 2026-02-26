import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNonDecreasingArray {
    private class Solution {
        func checkPossibility(_ nums: [Int]) -> Bool {
            if nums.count <= 2 { return true }
            var nums = nums
            var changes = 0

            for i in 1..<nums.count {
                if nums[i] >= nums[i - 1] { continue }
                changes += 1
                if changes > 1 { return false }

                if i == 1 || nums[i] >= nums[i - 2] {
                    nums[i - 1] = nums[i]
                } else {
                    nums[i] = nums[i - 1]
                }
            }
            return true
        }
    }

    @Suite struct NonDecreasingArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0405e81f-5ebc-4c42-9e61-f291c2d650da",
             input: "nums = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cbc4b77c-1a3e-4bcb-b0d8-12a69d4c3e7a",
             input: "nums = [1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2ec6d5b6-361f-4db1-a230-615b67f1bde2",
             input: "nums = [1, 2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7807c784-0a16-49a6-97ad-19aa1f9c99bb",
             input: "nums = [2, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0df14e6c-a964-444d-bda4-3fca92583d3d",
             input: "nums = [1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "aafb2ae9-57bd-4b11-9dbe-4c3811a5b31c",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7073be11-b378-42cc-8692-de9114c3dcec",
             input: "nums = [5, 4, 3, 2, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "08753510-5813-4e5b-949c-b6c6729ab093",
             input: "nums = [-1, 0, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "288195b5-28aa-4144-95d8-fe058260c009",
             input: "nums = [10, 20, 30, 40, 50]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fe6cdaf9-fb23-41eb-8d84-efe21f385921",
             input: "nums = [50, 40, 30, 20, 10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0a2bc6c4-be52-47d3-b422-d1ae410e77bf",
             input: "nums = [1, 2, 2, 3, 3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0fa9ba6a-638e-45f2-8ee3-c54b4135317c",
             input: "nums = [3, 3, 2, 2, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f0d0c7a6-3ee4-4e91-bf6e-4c3ea9941338",
             input: "nums = [1000, 2000, 3000, 4000, 5000]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6453b367-857e-4cfe-9012-b96f5c50c986",
             input: "nums = [5000, 4000, 3000, 2000, 1000]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "99a29fdc-2761-4edf-96ea-cfadc24a4a5d",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "81fcfdc5-6bea-453a-be5d-a80c76c50377",
             input: "nums = [5, 4, 3, 2, 1, 0, -1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bae1d450-c7f3-434d-bb78-969f2b5dfd95",
             input: "nums = [0, -1, -2, -3, -4, -5]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c25e3998-0fc8-46a5-bdd6-1bba33301129",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6e3cab27-ba02-473e-b6e5-3885c55f90be",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5a0d5224-522e-4133-a4d8-d8eb0bfd667d",
             input: "nums = [1, 3, 2, 4, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "67c4210e-d013-4b05-acf6-39281766397b",
             input: "nums = [5, 4, 5, 4, 5]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0f612551-c3db-4a4d-88b4-d1f17ecbdd65",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a862f3a8-4958-4ecc-864b-4daf66d42225",
             input: "nums = [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "45928c22-c199-4b69-a5f8-c105dd82ce25",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3f080f07-4da3-4646-997a-c8475f73a181",
             input: "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "non-decreasing-array"
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
            guard p_nums.allSatisfy({ $0 >= -100000 && $0 <= 100000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10^5 <= nums[i] <= 10^5"
                )
                return
            }

            let solution = Solution()
            let result = solution.checkPossibility(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
