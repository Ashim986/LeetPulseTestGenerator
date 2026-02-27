import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumDistanceBetweenBstNodes {
    private class Solution {
        func minDiffInBST(_ root: TreeNode?) -> Int {
          var minDiff = Int.max
          var prev: Int?

          inOrderTraversal(root, &minDiff, &prev)
          return minDiff
        }

        func inOrderTraversal(_ node: TreeNode?, _ minDiff: inout Int, _ prev: inout Int?) {
          if node == nil { return }
          inOrderTraversal(node?.left, &minDiff, &prev)
          if let prevVal = prev {
            minDiff = min(minDiff, node.unsafelyUnwrapped.val - prevVal)
          }
          prev = node.unsafelyUnwrapped.val
          inOrderTraversal(node?.right, &minDiff, &prev)
        }
    }

    @Suite struct MinimumDistanceBetweenBstNodesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4eeeece6-07ab-4597-a802-f894c8e72fab",
             input: "root = [1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d37ab7cf-b3c5-4ba2-8618-6403f1b7f443",
             input: "root = [2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f6dc69e2-5162-4a2b-b644-faa9cf60b0fc",
             input: "root = [1,null,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7303308b-213a-4ff0-97c2-546609fc6e9c",
             input: "root = [1,2,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f2d1e55b-708b-406c-aef1-57eb01a55061",
             input: "root = [10,5,15,3,7,13,17]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bd7f71f4-5b2b-4e8d-abac-8d2cca594181",
             input: "root = [5,3,7,2,4,6,8]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4c4e600e-bde4-449f-bdd9-184027a66404",
             input: "root = [1,0,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c8438cb1-09d9-4e4f-8b8e-a4f0eabe1662",
             input: "root = [1,-1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "439e8d2b-ee0d-407c-9545-4e7dba3422f4",
             input: "root = [1,1,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "df38184e-6ca5-4c08-a703-f4d86c714fe1",
             input: "root = [1,2,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9be3fdbb-10d2-4ea8-a30f-d1c75448eb02",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "738334ba-591f-4c0b-a274-c6cbe004abb1",
             input: "root = [5,3,7,2,4,6,8,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "eb2b5b43-17e6-413b-8870-c6a8a5676798",
             input: "root = [1,null,2,null,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0f15d1f5-2229-4a09-9521-e6973269cc59",
             input: "root = [1,2,null,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ac1b40be-43b6-4eaa-9319-fdaab431431b",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "edfa5e3f-8a04-442c-bd3c-41f05cf085dd",
             input: "root = [7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2bd6ed6e-cd73-408a-a47d-fa612b5fafc9",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b4f3d37c-00ac-48fd-929b-c3ef7756565b",
             input: "root = [10,9,8,7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c47b1187-d877-4890-927a-aca3747fdbeb",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5869ccfa-61fd-4519-bb9a-8508aafc836f",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "414b17b3-3ea9-4b13-8d76-183a7d6edd25",
             input: "root = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c069f7e6-270d-4321-b020-4c40b15f3dc8",
             input: "root = [1,-1,2,-2,3,-3,4,-4,5,-5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "32b238a2-adc8-4af9-9c62-8e0f34432967",
             input: "root = [5,-4,3,-2,1,-1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3a734267-8a89-468b-9a64-363069a94319",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "62bd85ba-fcf1-40ee-a3f5-a6dbdfd318c0",
             input: "root = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-distance-between-bst-nodes"
            let topic = "trees"
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

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as TreeNode?"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.minDiffInBST(p_root)
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
