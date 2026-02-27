import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCWiggleSubsequence {
    private class Solution {
        func wiggleMaxLength(_ nums: [Int]) -> Int {
            if nums.count < 2 {
                return nums.count
            }
            var up = Array(repeating: 1, count: nums.count)
            var down = Array(repeating: 1, count: nums.count)
            for i in 1..<nums.count {
                for j in 0..<i {
                    if nums[i] > nums[j] {
                        up[i] = max(up[i], down[j] + 1)
                    } else if nums[i] < nums[j] {
                        down[i] = max(down[i], up[j] + 1)
                    }
                }
            }
            return max(up.max() ?? 0, down.max() ?? 0)
        }
    }

    @Suite struct WiggleSubsequenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6e6b09e8-5c82-4b2d-b29c-cb5d1f69bc8c",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7a230d21-6938-4e69-ac0e-6663dc39ceab",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fe8496f3-6f36-465e-94e0-402c40c12ffc",
             input: "nums = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ff3ac2dd-e8c6-42fd-9d0a-187cf5a55195",
             input: "nums = [2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "30dacb4a-b388-448d-9331-e1b7f46dff2a",
             input: "nums = [1,-2,3,-4,5,-6]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "76c05cb9-89d1-442a-b347-757bf6531665",
             input: "nums = [-1,2,-3,4,-5,6,-7]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "fd3f1d4f-ac4f-4d71-9e9b-cb046048caa1",
             input: "nums = [1,-1,1,-1,1,-1,1,-1,1,-1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "4c29c2de-3ebf-4502-8158-65bdb02a2907",
             input: "nums = [1,-3,5,-7,9,-11,13,-15,17,-19,21,-23,25,-27,29,-31,33,-35,37,-39]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "7d93d9e0-182d-4604-af29-0dd08e056932",
             input: "nums = [-39,37,-35,33,-31,29,-27,25,-23,21,-19,17,-15,13,-11,9,-7,5,-3,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "59a21264-ede1-431f-94e1-39bff1a9d389",
             input: "nums = [1,-2,3,-4,5,-6,7,-8,9,-10,11,-12,13,-14,15,-16,17,-18,19,-20]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "f87e267e-6457-4b60-9e13-0c2b70b2ed2b",
             input: "nums = [-20,19,-18,17,-16,15,-14,13,-12,11,-10,9,-8,7,-6,5,-4,3,-2,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "6d564108-642a-4c57-a43f-abf7cc78b0cb",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "e5bf82a6-5d32-433e-afe4-a588cdddcd1a",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "47b0fb02-ed3c-4b1a-b284-d5ed2ad25bf3",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "75676682-9657-4e44-844c-4183aee2611d",
             input: "nums = [1,1,2,2,3,3,4,4,5,5]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "75618dc0-9aaa-4279-980d-99d379bbcc1e",
             input: "nums = [5,4,3,2,1,1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "d5df61c5-a408-4e1a-8556-35aeaabd505c",
             input: "nums = [1,1,1,1,1,1,1,1,1,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "0ccf5963-951c-4e04-bf20-6802bf07167e",
             input: "nums = [1,3,5,7,9,11,13,15,17,19]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "9fa0a76b-f01b-4c57-83ba-5cd1057f11ca",
             input: "nums = [19,17,15,13,11,9,7,5,3,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "6e638486-2a8c-4609-9d9c-31453008d618",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f7e55a5a-3ca1-464e-826a-a2e6bfee4332",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "cd52e732-6ea1-48a1-b271-32a5aedd9472",
             input: "nums = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "d8f21755-81b5-4e96-8fcd-654c0e789191",
             input: "nums = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "eb7225f9-443b-4d6d-a4c2-7d2cadbb2f82",
             input: "nums = [39,37,35,33,31,29,27,25,23,21,19,17,15,13,11,9,7,5,3,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "2def0f8d-0e43-4653-9ca4-fa642031133c",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "wiggle-subsequence"
            let topic = "dynamic-programming"
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
            guard p_nums.count >= 1 && p_nums.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 1000"
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
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.wiggleMaxLength(p_nums)
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
