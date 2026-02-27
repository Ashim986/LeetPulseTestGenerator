import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTwoSumIiInputArrayIsSorted {
    private class Solution {
        func twoSum(numbers: [Int], target: Int) -> [Int] {
            var left = 0
            var right = numbers.count - 1
            while left < right {
                let sum = numbers[left] + numbers[right]
                if sum == target {
                    return [left, right]
                } else if sum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
            return []
        }
    }

    @Suite struct TwoSumIiInputArrayIsSortedTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "E4F6ACA9-9AE3-49E5-89AA-358A1E6EC45A",
             input: "[2,7,11,15]\n9",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "B5CD4EF5-4CCB-4774-BAE0-1882B5422EB1",
             input: "[-1,0]\n-1",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "04A64B0B-F1A9-4C76-98E1-E97E71B1B458",
             input: "[0,0,3,4]\n0",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "B58AADC3-EC28-47BF-A248-A5C51620ED25",
             input: "[0,4,3,0]\n0",
             expected: "[0,3]", orderMatters: true),
            TestCaseData(id: "FBFBADFD-7BAA-4C98-B12D-C646845114D2",
             input: "[-1,-2,-3,-4,-5]\n-8",
             expected: "[2,4]", orderMatters: true),
            TestCaseData(id: "C35F908E-7F01-46FF-AD31-6B42A9EA29FC",
             input: "[2,3,4]\n6",
             expected: "[1,3]", orderMatters: true),
            TestCaseData(id: "44501062-40B2-4A12-B74D-0E5B8DF0146D",
             input: "[10,20,30,40,50]\n90",
             expected: "[3,4]", orderMatters: true),
            TestCaseData(id: "5F451A5C-ECF4-4D9F-89B1-0B98391E86D9",
             input: "[0,1,2,3,4]\n7",
             expected: "[3,4]", orderMatters: true),
            TestCaseData(id: "6FE18ADE-A515-43DF-83ED-75EA2FDF275B",
             input: "[0,-1,-2,-3,-4]\n-7",
             expected: "[3,4]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "two-sum-ii-input-array-is-sorted"
            let topic = "two-pointers"
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

            guard let p_numbers = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_numbers.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: numbers array too large (\(p_numbers.count))"
                )
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_numbers.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= numbers.length <= 3 * 104"
                )
                return
            }
            guard p_numbers.allSatisfy({ $0 >= -1000 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= numbers[i] <= 1000"
                )
                return
            }
            guard p_target >= -1000 && p_target <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= target <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.twoSum(numbers: p_numbers, target: p_target)
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
