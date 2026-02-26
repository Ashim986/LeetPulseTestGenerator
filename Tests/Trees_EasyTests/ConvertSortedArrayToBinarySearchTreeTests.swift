import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCConvertSortedArrayToBinarySearchTree {
    private class Solution {
        func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
            return helper(nums, 0, nums.count - 1)
        }
        func helper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
            if left > right {
                return nil
            }
            let mid = left + (right - left) / 2
            let node = TreeNode(nums[mid])
            node.left = helper(nums, left, mid - 1)
            node.right = helper(nums, mid + 1, right)
            return node
        }
    }

    @Suite struct ConvertSortedArrayToBinarySearchTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2c457975-501c-47f0-8352-24e603526f2f",
             input: "nums = []",
             expected: "null", orderMatters: true),
            TestCaseData(id: "f382f87f-ed29-45e5-95da-8b26fb586b73",
             input: "nums = [1]",
             expected: "{\"val\":1,\"left\":null,\"right\":null}", orderMatters: true),
            TestCaseData(id: "bcf9a06d-2722-4470-82c0-7dd5f1413f58",
             input: "nums = [1,2]",
             expected: "{\"val\":1,\"left\":null,\"right\":{\"val\":2,\"left\":null,\"right\":null}}", orderMatters: true),
            TestCaseData(id: "c94074be-0d21-4c87-b2cc-c77aed0b2a89",
             input: "nums = [1,2,3,4]",
             expected: "{\"val\":1,\"left\":null,\"right\":{\"val\":2,\"left\":null,\"right\":{\"val\":3,\"left\":null,\"right\":{\"val\":4,\"left\":null,\"righ"
                + "t\":null}}}}}", orderMatters: true),
            TestCaseData(id: "e3980394-7bf5-4492-b5ba-4f7671400866",
             input: "nums = [1,2,3,4,5,6,7]",
             expected: "{\"val\":1,\"left\":null,\"right\":{\"val\":2,\"left\":null,\"right\":{\"val\":3,\"left\":null,\"right\":{\"val\":4,\"left\":null,\"righ"
                + "t\":{\"val\":5,\"left\":null,\"right\":{\"val\":6,\"left\":null,\"right\":{\"val\":7,\"left\":null,\"right\":null}}}}}}}", orderMatters: true),
            TestCaseData(id: "235c944b-405f-4c74-89c6-76b079f9f90a",
             input: "nums = [-5,-4,-3,-2,-1]",
             expected: "{\"val\":-5,\"left\":null,\"right\":{\"val\":-4,\"left\":null,\"right\":{\"val\":-3,\"left\":null,\"right\":{\"val\":-2,\"left\":null,\""
                + "right\":{\"val\":-1,\"left\":null,\"right\":null}}}}}", orderMatters: true),
            TestCaseData(id: "0116d439-f1c9-4bd4-b37e-b22bb130545c",
             input: "nums = [10,20,30,40,50]",
             expected: "{\"val\":10,\"left\":null,\"right\":{\"val\":20,\"left\":null,\"right\":{\"val\":30,\"left\":null,\"right\":{\"val\":40,\"left\":null,\""
                + "right\":{\"val\":50,\"left\":null,\"right\":null}}}}}", orderMatters: true),
            TestCaseData(id: "64bf3b42-6a4f-42f3-9c16-f5fba827fb0b",
             input: "nums = [1,1,1,1,1]",
             expected: "{\"val\":1,\"left\":null,\"right\":null}", orderMatters: true),
            TestCaseData(id: "935b9fba-0c88-4b37-95d8-adda1713c018",
             input: "nums = [1,2,2,2,2]",
             expected: "{\"val\":1,\"left\":null,\"right\":{\"val\":2,\"left\":null,\"right\":null}}", orderMatters: true),
            TestCaseData(id: "0cf1c157-092a-4193-a9b4-fce05a8e43cc",
             input: "nums = [5,5,5,5,5,5,5]",
             expected: "{\"val\":5,\"left\":null,\"right\":null}", orderMatters: true),
            TestCaseData(id: "91abc5e5-a0cf-4dc3-8f97-475c0daee1d1",
             input: "nums = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]",
             expected: "{\"val\":10,\"left\":null,\"right\":null}", orderMatters: true),
            TestCaseData(id: "5bd00948-4f79-4091-a158-fbeef964f969",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "{\"val\":1,\"left\":null,\"right\":{\"val\":2,\"left\":null,\"right\":{\"val\":3,\"left\":null,\"right\":{\"val\":4,\"left\":null,\"righ"
                + "t\":{\"val\":5,\"left\":null,\"right\":{\"val\":6,\"left\":null,\"right\":{\"val\":7,\"left\":null,\"right\":{\"val\":8,\"left\":null,\""
                + "right\":{\"val\":9,\"left\":null,\"right\":{\"val\":10,\"left\":null,\"right\":null}}}}}}}}}}}", orderMatters: true),
            TestCaseData(id: "0556f59f-1f19-4db0-a99c-ed7ac2f678a5",
             input: "nums = [-10,-3,0,5,9]",
             expected: "[0,-3,9,-10,null,5]", orderMatters: true),
            TestCaseData(id: "41c45d60-71c9-4b30-b3d7-a16d6b17b29f",
             input: "nums = [1,3]",
             expected: "[3,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "convert-sorted-array-to-binary-search-tree"
            let topic = "trees"
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
            guard p_nums.count >= 1 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 104"
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
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.sortedArrayToBST(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical tree format
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
