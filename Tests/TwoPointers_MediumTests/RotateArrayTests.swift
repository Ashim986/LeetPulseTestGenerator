import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRotateArray {
    private class Solution {
        func rotate(_ nums: inout [Int], _ k: Int) {
            let k = k % nums.count
            if k == 0 { return }

            func reverse(_ start: Int, _ end: Int) {
                var l = start, r = end
                while l < r {
                    nums.swapAt(l, r)
                    l += 1; r -= 1
                }
            }

            reverse(0, nums.count - 1)
            reverse(0, k - 1)
            reverse(k, nums.count - 1)
        }
    }

    @Suite struct RotateArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a570b0ee-a88f-469e-a140-ff76a98c7cbf",
             input: "nums = [1], k = 1",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "a6a8da74-bd05-40e8-8bd3-0982f42f55d1",
             input: "nums = [1, 2], k = 1",
             expected: "[2, 1]", orderMatters: true),
            TestCaseData(id: "e75f45f7-0c26-4a8d-848b-e588930c7032",
             input: "nums = [1, 2, 3], k = 3",
             expected: "[1, 2, 3]", orderMatters: true),
            TestCaseData(id: "7a96622a-2fb8-40e1-8d14-d8d3e6f188eb",
             input: "nums = [1, 2, 3, 4], k = 2",
             expected: "[3, 4, 1, 2]", orderMatters: true),
            TestCaseData(id: "190f45eb-50eb-4b44-b0b4-22efd5940627",
             input: "nums = [1, 2, 3, 4, 5], k = 5",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "ab2d78e6-73f6-405a-a4d3-a41324bc38e9",
             input: "nums = [], k = 1",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "f2231e3b-b342-4dab-a697-fba3657941e9",
             input: "nums = [1, 1, 1], k = 1",
             expected: "[1, 1, 1]", orderMatters: true),
            TestCaseData(id: "96bfe3e3-98aa-4b3c-a834-e9d01e1cd762",
             input: "nums = [1, 2, 3], k = 0",
             expected: "[1, 2, 3]", orderMatters: true),
            TestCaseData(id: "c1001623-93df-4e0d-b662-b8b81002b252",
             input: "nums = [1, 2, 3, 4, 5], k = 7",
             expected: "[4, 5, 1, 2, 3]", orderMatters: true),
            TestCaseData(id: "79f640d8-e990-49de-b3aa-2908d60b0c48",
             input: "nums = [-1, -2, -3], k = 1",
             expected: "[-3, -1, -2]", orderMatters: true),
            TestCaseData(id: "edc6665b-7be7-459b-9a41-00f45b7d9c93",
             input: "nums = [1, -2, 3], k = 2",
             expected: "[3, 1, -2]", orderMatters: true),
            TestCaseData(id: "f6ce1f34-9aa0-496e-8e2f-9350d5ea8f06",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], k = 3",
             expected: "[8, 9, 10, 1, 2, 3, 4, 5, 6, 7]", orderMatters: true),
            TestCaseData(id: "0bf56da3-34e0-4f35-bb98-0b2e584119bb",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1], k = 5",
             expected: "[6, 5, 4, 3, 2, 1, 10, 9, 8, 7]", orderMatters: true),
            TestCaseData(id: "61df3e8c-ef28-43d2-98ff-e9352d8905c7",
             input: "nums = [1, 2, 3, 4, 5], k = 10",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "90765178-ac15-49eb-8791-8abffc9bd7fc",
             input: "nums = [1, 2, 3, 4, 5], k = 11",
             expected: "[5, 1, 2, 3, 4]", orderMatters: true),
            TestCaseData(id: "7bdc3649-c44b-483c-baaf-2cf666228c75",
             input: "nums = [1, 1, 1, 1, 1], k = 5",
             expected: "[1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "91087f70-56e6-4d1b-92d4-1e09c9888d45",
             input: "nums = [1, 2, 3, 4, 5], k = 6",
             expected: "[5, 1, 2, 3, 4]", orderMatters: true),
            TestCaseData(id: "ce730fdc-cb34-41cb-bb8d-e31652360330",
             input: "nums = [1, 2, 3, 4, 5], k = 12",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "2f12a9e3-7e8b-46d2-9c40-9ec1d79c5799",
             input: "nums = [1, 2, 3, 4, 5], k = 13",
             expected: "[5, 1, 2, 3, 4]", orderMatters: true),
            TestCaseData(id: "85b4ac3a-892b-435c-ad5e-a448e58b703a",
             input: "nums = [1, 2, 3, 4, 5], k = 14",
             expected: "[4, 5, 1, 2, 3]", orderMatters: true),
            TestCaseData(id: "fc63037d-42d3-49e6-b69b-c35b586a7e4e",
             input: "nums = [1, 2, 3, 4, 5], k = 15",
             expected: "[3, 4, 5, 1, 2]", orderMatters: true),
            TestCaseData(id: "1ba12b39-7f7b-42dc-a5b5-f3ace6886035",
             input: "nums = [1, 2, 3, 4, 5], k = 16",
             expected: "[2, 3, 4, 5, 1]", orderMatters: true),
            TestCaseData(id: "32e64339-6379-4057-9c82-38f44397f335",
             input: "nums = [1, 2, 3, 4, 5], k = 17",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "4a037179-8d7f-4325-b30a-5922cfbc6810",
             input: "nums = [1, 2, 3, 4, 5], k = 18",
             expected: "[5, 1, 2, 3, 4]", orderMatters: true),
            TestCaseData(id: "17ff09b8-e4f3-45f5-abd3-4ae967a48d3a",
             input: "nums = [1, 2, 3, 4, 5], k = 19",
             expected: "[4, 5, 1, 2, 3]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "rotate-array"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -231 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= nums[i] <= 231 - 1"
                )
                return
            }
            guard p_k >= 0 && p_k <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= k <= 105"
                )
                return
            }

            let solution = Solution()
            let didCrash = withCrashGuard {
                solution.rotate(&p_nums, p_k)
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
