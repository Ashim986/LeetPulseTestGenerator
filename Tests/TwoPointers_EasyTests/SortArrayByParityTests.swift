import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSortArrayByParity {
    private class Solution {
        func sortArrayByParity(_ A: [Int]) -> [Int] {
            var arr = A
            var evenIndex = 0
            for (index, value) in arr.enumerated() {
                if value % 2 == 0 {
                    let temp = arr[evenIndex]
                    arr[evenIndex] = arr[index]
                    arr[index] = temp
                    evenIndex += 1
                }
            }
            return arr
        }
    }

    @Suite struct SortArrayByParityTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ba376b8f-c7e9-40b5-a3e4-4138b833c887",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "65b8df53-1072-4831-80ef-5adc704a69c8",
             input: "nums = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "e9413ac1-3545-405a-88d5-ed584594cd42",
             input: "nums = [2]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "d6ed8a94-9e18-44dd-acb4-3f0b5a3b2e75",
             input: "nums = [-1]",
             expected: "[-1]", orderMatters: true),
            TestCaseData(id: "94e51821-e9c3-4e1a-8a7f-a17fa183d0b0",
             input: "nums = [-2]",
             expected: "[-2]", orderMatters: true),
            TestCaseData(id: "593038cd-3e5b-4517-8d65-9a10c21da68b",
             input: "nums = [1, 2]",
             expected: "[2, 1]", orderMatters: true),
            TestCaseData(id: "28606e2f-dd60-4071-8102-da923054f53c",
             input: "nums = [2, 1]",
             expected: "[2, 1]", orderMatters: true),
            TestCaseData(id: "146250a3-841b-442c-9a4a-fe6a41d528e9",
             input: "nums = [1, 1]",
             expected: "[1, 1]", orderMatters: true),
            TestCaseData(id: "64a568d9-e6a3-43cb-970f-e3813c0bbd23",
             input: "nums = [2, 2]",
             expected: "[2, 2]", orderMatters: true),
            TestCaseData(id: "2ee4066d-4ace-4e33-a53e-282b574d10bc",
             input: "nums = [-1, -2]",
             expected: "[-2, -1]", orderMatters: true),
            TestCaseData(id: "c1f25899-c715-4194-8991-3a943afdfc2d",
             input: "nums = [-2, -1]",
             expected: "[-2, -1]", orderMatters: true),
            TestCaseData(id: "0538131f-2907-44a8-829e-c225ecbd0109",
             input: "nums = [1, 2, 3]",
             expected: "[2, 1, 3]", orderMatters: true),
            TestCaseData(id: "21462792-0d4d-462e-9a4d-5bc3f08c246a",
             input: "nums = [3, 2, 1]",
             expected: "[2, 3, 1]", orderMatters: true),
            TestCaseData(id: "9364c15a-9e85-4b4d-9712-079b23bfa676",
             input: "nums = [1, 1, 2]",
             expected: "[2, 1, 1]", orderMatters: true),
            TestCaseData(id: "9d82f319-9826-4cf9-b0dc-9231ad97a931",
             input: "nums = [2, 1, 1]",
             expected: "[2, 1, 1]", orderMatters: true),
            TestCaseData(id: "e211769f-0f37-4070-92fd-ad6f3ac25fbd",
             input: "nums = [-1, -2, -3]",
             expected: "[-2, -1, -3]", orderMatters: true),
            TestCaseData(id: "99c55e95-6c1f-4edb-b53d-78c36fb07fc9",
             input: "nums = [-3, -2, -1]",
             expected: "[-2, -3, -1]", orderMatters: true),
            TestCaseData(id: "9f34ade5-1c9d-4531-9e3f-b6b65141e3c3",
             input: "nums = [1, 2, 3, 4]",
             expected: "[2, 4, 1, 3]", orderMatters: true),
            TestCaseData(id: "59c0747a-0d5b-44dc-a5cb-3373438b9a2e",
             input: "nums = [4, 3, 2, 1]",
             expected: "[2, 4, 3, 1]", orderMatters: true),
            TestCaseData(id: "efb72988-32c0-4a64-9109-2ac2dc99b554",
             input: "nums = [1, 1, 2, 2]",
             expected: "[2, 2, 1, 1]", orderMatters: true),
            TestCaseData(id: "cad0e6e2-d747-4bde-9928-ae80a7181393",
             input: "nums = [2, 2, 1, 1]",
             expected: "[2, 2, 1, 1]", orderMatters: true),
            TestCaseData(id: "60a63342-6cc3-46fd-8329-c7249023524f",
             input: "nums = [-1, -2, -3, -4]",
             expected: "[-2, -4, -1, -3]", orderMatters: true),
            TestCaseData(id: "8c07de58-f260-4123-825b-aaa5a23229b6",
             input: "nums = [-4, -3, -2, -1]",
             expected: "[-2, -4, -3, -1]", orderMatters: true),
            TestCaseData(id: "6ff82536-431f-4528-90f7-2441a1531c84",
             input: "nums = [100, 200, 300, 400]",
             expected: "[200, 400, 100, 300]", orderMatters: true),
            TestCaseData(id: "f10eb737-74c7-4254-b520-644bb0059fd2",
             input: "nums = [400, 300, 200, 100]",
             expected: "[200, 400, 100, 300]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sort-array-by-parity"
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

            guard let p_A = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.count >= 1 && p_A.count <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 5000"
                )
                return
            }
            guard p_A.allSatisfy({ $0 >= 0 && $0 <= 5000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 5000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.sortArrayByParity(p_A)
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
