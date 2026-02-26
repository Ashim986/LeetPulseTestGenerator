import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindBottomLeftTreeValue {
    private class Solution {
       func findBottomLeftValue(_ root: TreeNode?) -> Int {
          var maxDepth = 0
          var result = 0
          dfs(root, 0, &maxDepth, &result)
          return result
       }

       func dfs(_ node: TreeNode?, _ depth: Int, _ maxDepth: inout Int, _ result: inout Int) {
          guard let node = node else {
             return
          }
          if depth > maxDepth {
             maxDepth = depth
             result = node.val
          }
          dfs(node.left, depth + 1, &maxDepth, &result)
          dfs(node.right, depth + 1, &maxDepth, &result)
       }
    }

    @Suite struct FindBottomLeftTreeValueTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d2a4a903-c646-4c4d-a4bf-6991ba367297",
             input: "root = [1,null,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a4a5da27-b51a-4585-8bcb-31af1f6d6f51",
             input: "root = [1,2,null,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e77fed8d-da82-41c7-9a64-1c196f387aa5",
             input: "root = [1,null,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "306be70c-b601-4985-bc15-c47021942b35",
             input: "root = [1,2,3,4,5,6,7,null,null,null,null,null,null,8]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "e4f488b6-5e40-4a84-9b62-dd6e2848c4e3",
             input: "root = [1,null,null]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cc6f7a57-2f2c-4394-a489-f9b769e75aa5",
             input: "root = [1,2,null,3,null,4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "98a1bc60-8c21-4759-9653-b71412cec184",
             input: "root = [1,null,2,null,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9c5cdd7d-acfc-4bae-a607-353d13cccc98",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "be202bf7-1906-4357-bf0e-98a8579f950d",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "d772fb6f-cd47-4a46-8f38-8dfa1ae120ef",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ada2e7ff-666f-4af2-978e-d1c738ea933c",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "6b83bf52-87ee-40a9-b339-4c62551d9bf8",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "1a153a63-a1e6-4557-a387-623de5b46a00",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "d99eb5c4-8cbe-4dbd-849e-37f89918f559",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "7cead286-1539-4d92-8db9-7e60701fe225",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d615d77f-3830-4d84-9a39-25002e74e345",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "b3aa3807-14ed-49fc-a661-0e07f4cebb86",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "46cd461b-4e5b-4365-bd5c-cb4626923bf1",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13]",
             expected: "13", orderMatters: true),
            TestCaseData(id: "6d1b8ab0-73fa-46a9-bef9-860a16a42ae5",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14]",
             expected: "14", orderMatters: true),
            TestCaseData(id: "6fa9be96-5da2-433d-a473-01a831629e84",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "c44b7195-4620-46b9-be55-f325288d6fdd",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15,null,16]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "7d158063-23ee-4605-898e-964e67223d2f",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "34ea672a-177e-41c6-87d2-e4c4e146f5a2",
             input: "root = [1,2,3,4,5,6,7,null,null,null,null,null,null,8,9]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "7e35ea5f-1edc-460c-b2c0-2928ba0f0bf7",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "9bacc451-53fa-4e74-b281-b8cd1969bf20",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]",
             expected: "16", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-bottom-left-tree-value"
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

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as TreeNode?"
                )
                return
            }

            let solution = Solution()
            let result = solution.findBottomLeftValue(p_root)
            let computedOutput = OutputSerializer.serialize(result)

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
