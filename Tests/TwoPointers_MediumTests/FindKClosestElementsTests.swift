import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindKClosestElements {
    private class Solution {
        func findKClosestElementsOptimized(_ nums: [Int], _ k: Int, _ x: Int) -> [Int] {
            var left = 0
            var right = nums.count - k

            while left < right {
                let mid = (left + right) / 2
                if x - nums[mid] > nums[mid + k] - x {
                    left = mid + 1
                } else {
                    right = mid
                }
            }

            return Array(nums[left..<left+k])
        }
    }

    @Suite struct FindKClosestElementsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "fdfad32c-0d24-4697-b91b-92ac4f3873fc",
             input: "nums = [1,2,3,4,5], k = 1, x = 3",
             expected: "[3]", orderMatters: true),
            TestCaseData(id: "f1a00e66-cab3-4b67-959f-57af66e00b02",
             input: "nums = [1,2,3,4,5], k = 5, x = 0",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "fe052636-c216-494e-9e29-986c420304f6",
             input: "nums = [1,1,1,1,1], k = 3, x = 1",
             expected: "[1,1,1]", orderMatters: true),
            TestCaseData(id: "91f9a5a8-35e5-43de-bba4-cf79f51f2399",
             input: "nums = [1,2,3,4,5], k = 4, x = 6",
             expected: "[2,3,4,5]", orderMatters: true),
            TestCaseData(id: "dd7c5a8a-45a0-41c6-a5c4-8ef58af84983",
             input: "nums = [-1,-2,-3,-4,-5], k = 3, x = -3",
             expected: "[-3,-2,-4]", orderMatters: true),
            TestCaseData(id: "b153bead-78e8-4d2a-9bcb-95afafca97c0",
             input: "nums = [1,2,3,4,5], k = 0, x = 3",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "6b366798-6f81-42a0-b395-fac62b72570d",
             input: "nums = [], k = 2, x = 3",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "5e819f6b-af76-4d93-9cca-0d0f5d34e0c0",
             input: "nums = [1], k = 1, x = 1",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "f4bc2931-e38c-441d-a784-ab9349c189ee",
             input: "nums = [1,2,3,4,5], k = 6, x = 3",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "75754eb3-0260-4c84-9aee-9cb35bac489d",
             input: "nums = [10,20,30,40,50], k = 2, x = 25",
             expected: "[20,30]", orderMatters: true),
            TestCaseData(id: "f4a67bb2-a49d-4b43-9e70-fdebeb2fbf12",
             input: "nums = [1,2,3,4,5], k = 4, x = -1",
             expected: "[1,2,3,4]", orderMatters: true),
            TestCaseData(id: "e9adf4fd-d410-43e4-8bf7-f4d746359325",
             input: "nums = [1,1,1,1,1], k = 5, x = 1",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "8f70005f-2e2f-40ab-abf2-1fdf75c69c9c",
             input: "nums = [5,4,3,2,1], k = 5, x = 3",
             expected: "[5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "ed1677af-7997-4ff7-9110-08d152397f62",
             input: "nums = [1,2,3,4,5], k = 1, x = 2",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "bebf3f19-64be-4e51-82fb-492feded6fd2",
             input: "nums = [-10,-20,-30,-40,-50], k = 3, x = -30",
             expected: "[-30,-20,-40]", orderMatters: true),
            TestCaseData(id: "b4fecb52-ec08-48a0-8202-c0228c2d2bdd",
             input: "nums = [100,200,300,400,500], k = 2, x = 250",
             expected: "[200,300]", orderMatters: true),
            TestCaseData(id: "989c46b5-9174-494d-80ca-3c9cc144d2ae",
             input: "nums = [1,2,3,4,5], k = 4, x = 5",
             expected: "[2,3,4,5]", orderMatters: true),
            TestCaseData(id: "4add843a-1200-4086-b3f8-4c4fd3633ec1",
             input: "nums = [2,4,6,8,10], k = 2, x = 5",
             expected: "[4,6]", orderMatters: true),
            TestCaseData(id: "880f83e1-3056-4398-8ad8-a387ec5a5784",
             input: "nums = [1,1,2,2,3], k = 4, x = 2",
             expected: "[1,1,2,2]", orderMatters: true),
            TestCaseData(id: "8e8a1b22-e62c-4805-910b-64c8ff8bba9c",
             input: "nums = [10,9,8,7,6], k = 3, x = 7",
             expected: "[8,7,6]", orderMatters: true),
            TestCaseData(id: "42ff7f8b-1a8c-4a6b-a907-ea7bf13ad2ad",
             input: "nums = [1,2,3,4,5], k = 1, x = 0",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "de312728-cb50-48de-aa0c-211fd864dfa7",
             input: "nums = [5,4,3,2,1], k = 1, x = 3",
             expected: "[3]", orderMatters: true),
            TestCaseData(id: "24b76112-fe56-4357-ba20-999dba4b2396",
             input: "nums = [1,2,3,4,5], k = 5, x = 5",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "ac05846e-f295-4c55-afa3-bb84b33d0654",
             input: "nums = [1,2,3,4,5], k = 2, x = 2.5",
             expected: "[2,3]", orderMatters: true),
            TestCaseData(id: "0ebccc1a-536d-4e69-b1f4-89ea95218f93",
             input: "nums = [1,2,3,4,5], k = 3, x = 0",
             expected: "[1,2,3]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-k-closest-elements"
            let topic = "two-pointers"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_x = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= arr.length <= 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= arr[i], x <= 104"
                )
                return
            }
            guard p_x >= -104 && p_x <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= arr[i], x <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.findKClosestElementsOptimized(p_nums, p_k, p_x)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
