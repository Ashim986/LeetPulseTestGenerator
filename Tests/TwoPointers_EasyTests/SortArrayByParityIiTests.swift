import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSortArrayByParityIi {
    private class Solution {
        func sortArrayByParityII(_ nums: [Int]) -> [Int] {
            var nums = nums
            for i in stride(from: 0, to: nums.count, by: 2) {
                if nums[i] % 2 == 1 {
                    for j in stride(from: i + 1, to: nums.count, by: 2) {
                        if nums[j] % 2 == 0 {
                            nums.swapAt(i, j)
                            break
                        }
                    }
                }
            }
            return nums
        }
    }

    @Suite struct SortArrayByParityIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d3b39126-24bc-4884-9d16-812d0dcb8c52",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "4a0a9fa1-ad8b-4921-a38a-72d73670c9e5",
             input: "nums = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "e962b324-5083-492d-a905-afd686a8aaf5",
             input: "nums = [2]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "8b3f8773-de95-48b3-afee-d3585d2497b8",
             input: "nums = [1, 2]",
             expected: "[2, 1]", orderMatters: true),
            TestCaseData(id: "f6695814-371f-469b-89a9-7c71535ea06a",
             input: "nums = [3, 4]",
             expected: "[4, 3]", orderMatters: true),
            TestCaseData(id: "922152f8-6e5a-4602-be9e-a596916a0373",
             input: "nums = [1, 2, 3, 4]",
             expected: "[2, 3, 4, 1]", orderMatters: true),
            TestCaseData(id: "37e95bd7-133f-43ad-9ebf-d532f01985f6",
             input: "nums = [5, 6, 7, 8]",
             expected: "[6, 7, 8, 5]", orderMatters: true),
            TestCaseData(id: "5024f8b1-1c41-44c9-b803-9b2aa4c6f28e",
             input: "nums = [1, 1, 2, 2]",
             expected: "[2, 1, 2, 1]", orderMatters: true),
            TestCaseData(id: "e7cdf885-da23-46a4-b8fd-55d714bbaa3e",
             input: "nums = [0, 0, 1, 1]",
             expected: "[0, 1, 0, 1]", orderMatters: true),
            TestCaseData(id: "25d28dae-5112-4d55-860b-b5a76f56a0f8",
             input: "nums = [-1, -2, -3, -4]",
             expected: "[-2, -3, -4, -1]", orderMatters: true),
            TestCaseData(id: "dc1d5506-3c9e-4ecf-9cdf-460a090d769f",
             input: "nums = [-5, -6, -7, -8]",
             expected: "[-6, -7, -8, -5]", orderMatters: true),
            TestCaseData(id: "12082f21-66ec-4087-83ea-cbac6bff5582",
             input: "nums = [10, 20, 30, 40]",
             expected: "[10, 30, 20, 40]", orderMatters: true),
            TestCaseData(id: "23288009-0c11-469f-9785-3cdee9fc87ef",
             input: "nums = [100, 200, 300, 400]",
             expected: "[100, 300, 200, 400]", orderMatters: true),
            TestCaseData(id: "ea78260e-4676-4bac-955b-614b3a1b2a69",
             input: "nums = [1000, 2000, 3000, 4000]",
             expected: "[1000, 3000, 2000, 4000]", orderMatters: true),
            TestCaseData(id: "6744441b-5569-4706-a1cc-f5f5b7a1fa06",
             input: "nums = [2, 2, 2, 2, 2, 2, 2, 2]",
             expected: "[2, 2, 2, 2, 2, 2, 2, 2]", orderMatters: true),
            TestCaseData(id: "f90880ac-3120-4c99-b51f-bd9cb0326d51",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "[2, 3, 4, 5, 6, 7, 8, 9, 10, 1]", orderMatters: true),
            TestCaseData(id: "efbf5ba1-ee7e-4b0b-bb64-ceb0c6d6fc84",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "[10, 9, 8, 7, 6, 5, 4, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "fda3d418-6a51-4393-b913-2362a469c90e",
             input: "nums = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "[-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]", orderMatters: true),
            TestCaseData(id: "220ebfcc-7f41-4449-9a77-3dd73c04b7e4",
             input: "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "d9d71c0c-4203-4350-a2de-ba0fa30fb405",
             input: "nums = [10000, 20000, 30000, 40000]",
             expected: "[10000, 30000, 20000, 40000]", orderMatters: true),
            TestCaseData(id: "44c3d0c5-623b-4546-9848-f4c265451fd0",
             input: "nums = [-10000, -20000, -30000, -40000]",
             expected: "[-20000, -30000, -40000, -10000]", orderMatters: true),
            TestCaseData(id: "6e5a2c70-973f-44d6-98a3-60d0113682b9",
             input: "nums = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]",
             expected: "[0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]", orderMatters: true),
            TestCaseData(id: "e1afe94c-1e22-4d21-b1f1-dbe0e5231250",
             input: "nums = [100000, 200000, 300000, 400000, 500000, 600000, 700000, 800000, 900000, 1000000]",
             expected: "[100000, 300000, 200000, 500000, 400000, 700000, 600000, 900000, 800000, 1000000]", orderMatters: true),
            TestCaseData(id: "9b0c07f7-9024-473f-8bd3-c85d9c08ad07",
             input: "nums = [-100000, -200000, -300000, -400000, -500000, -600000, -700000, -800000, -900000, -1000000]",
             expected: "[-200000, -300000, -400000, -500000, -600000, -700000, -800000, -900000, -1000000, -100000]", orderMatters: true),
            TestCaseData(id: "7951125b-6795-4863-86d6-6cd75c17b7fc",
             input: "nums = [1,3,5,7,9,2,4,6,8]",
             expected: "[2,3,4,5,6,1,7,8,9]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sort-array-by-parity-ii"
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
            guard p_nums.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= nums.length <= 2 * 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.sortArrayByParityII(p_nums)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
