import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRangeSumOfBst {
    private class Solution {
      func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        dfs(root, low, high, &sum)
        return sum
      }

      private func dfs(_ node: TreeNode?, _ low: Int, _ high: Int, _ sum: inout Int) {
        guard let node = node else { return }
        if node.val > high {
          dfs(node.left, low, high, &sum)
        } else if node.val < low {
          dfs(node.right, low, high, &sum)
        } else {
          sum += node.val
          dfs(node.left, low, high, &sum)
          dfs(node.right, low, high, &sum)
        }
      }
    }

    @Suite struct RangeSumOfBstTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "69218768-1d46-4026-99fe-a44a69b87d1c",
             input: "root = [1], low = 2, high = 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "688fa6d0-0ea3-4f7e-8bb7-5254332210ba",
             input: "root = [1,2,3], low = 1, high = 3",
             expected: "6", orderMatters: true),
            TestCaseData(id: "c29695a8-594a-47e5-bd4e-d2fca167cd41",
             input: "root = [1,null,2], low = 1, high = 2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ed36c973-1589-40ad-9353-7a5c45b220c2",
             input: "root = [1,2,null], low = 1, high = 2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "b0c6ba71-9422-45ca-ab2c-93eb4191267c",
             input: "root = [1,2,3,4,5,6,7], low = 1, high = 7",
             expected: "28", orderMatters: true),
            TestCaseData(id: "17dc7ccc-78fa-4f0b-b183-6b0fc6d3a60a",
             input: "root = [1,2,3,4,5,6,7], low = 3, high = 5",
             expected: "12", orderMatters: true),
            TestCaseData(id: "8034d482-7993-4494-a9c4-75da744cd0de",
             input: "root = [1,2,3,4,5,6,7], low = 6, high = 7",
             expected: "13", orderMatters: true),
            TestCaseData(id: "60fac0f2-b06e-4534-8d9c-3de60bbb3b53",
             input: "root = [1,2,3,4,5,6,7], low = 1, high = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "45d66691-c5c1-45dd-97e9-27134f65ec07",
             input: "root = [1,2,3,4,5,6,7], low = 7, high = 7",
             expected: "7", orderMatters: true),
            TestCaseData(id: "1c79f9c5-3f9a-4553-9d8d-3473054cbebb",
             input: "root = [1,2,3,4,5,6,7], low = -1, high = 7",
             expected: "28", orderMatters: true),
            TestCaseData(id: "491acbac-44ec-4e29-b728-9f75bff6780a",
             input: "root = [1,2,3,4,5,6,7], low = 1, high = 10",
             expected: "28", orderMatters: true),
            TestCaseData(id: "87d88e99-cfac-4b63-8aa9-be36446882fa",
             input: "root = [1,2,3,4,5,6,7], low = -10, high = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "66ff7d72-b4b7-4f6d-80b0-fec60f81209e",
             input: "root = [1,2,3,4,5,6,7], low = 10, high = 20",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1b1422f6-b0ec-43f2-8b3d-e0a3436f2bbb",
             input: "root = [1,2,3,4,5,6,7], low = 1, high = 2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "5d69cb0a-93e0-4369-9437-5e296b3a9466",
             input: "root = [1,2,3,4,5,6,7], low = 1, high = 3",
             expected: "6", orderMatters: true),
            TestCaseData(id: "6eefccc7-4582-4d77-9074-f66e3d2341f8",
             input: "root = [1,2,3,4,5,6,7], low = 4, high = 6",
             expected: "15", orderMatters: true),
            TestCaseData(id: "3a3e3014-a574-4264-b339-4db866a0d571",
             input: "root = [1,2,3,4,5,6,7], low = 2, high = 4",
             expected: "9", orderMatters: true),
            TestCaseData(id: "49201847-cdf1-4f06-8d8f-7ed4614820d2",
             input: "root = [1,2,3,4,5,6,7], low = 5, high = 7",
             expected: "18", orderMatters: true),
            TestCaseData(id: "e069fdbd-548b-4331-a86f-7c226804a5df",
             input: "root = [1,2,3,4,5,6,7], low = 1, high = 4",
             expected: "10", orderMatters: true),
            TestCaseData(id: "6fb87b0d-ba81-4618-a35c-fe84fb073695",
             input: "root = [1,2,3,4,5,6,7], low = 1, high = 6",
             expected: "21", orderMatters: true),
            TestCaseData(id: "034af61d-5bae-4d05-bf3a-9ec428ea992d",
             input: "root = [1,2,3,4,5,6,7], low = 4, high = 7",
             expected: "22", orderMatters: true),
            TestCaseData(id: "53060acd-ddbc-4ae1-9661-b5a9263d64d4",
             input: "root = [1,2,3,4,5,6,7], low = 1, high = 5",
             expected: "15", orderMatters: true),
            TestCaseData(id: "bc92179d-20ad-4144-8e9f-8cfcac86ed37",
             input: "root = [1,2,3,4,5,6,7], low = 2, high = 5",
             expected: "14", orderMatters: true),
            TestCaseData(id: "8340fd1a-3226-435e-84a8-b61c338a457b",
             input: "root = [1,2,3,4,5,6,7], low = 3, high = 6",
             expected: "18", orderMatters: true),
            TestCaseData(id: "137d5fd7-2870-41cd-b96c-e45a51d75265",
             input: "root = [1,2,3,4,5,6,7], low = 6, high = 6",
             expected: "6", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "range-sum-of-bst"
            let topic = "trees"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as TreeNode?"
                )
                return
            }
            guard let p_low = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_high = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_low >= 1 && p_low <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= Node.val <= 105"
                )
                return
            }
            guard p_low >= 1 && p_low <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= low <= high <= 105"
                )
                return
            }
            guard p_high >= 1 && p_high <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= low <= high <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.rangeSumBST(p_root, p_low, p_high)
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
