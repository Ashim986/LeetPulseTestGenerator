import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPathSumIi {
    private class Solution {
       func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
          var result: [[Int]] = []
          dfs(root, 0, [], &result, targetSum)
          return result
       }

       func dfs(_ node: TreeNode?, _ sum: Int, _ path: [Int], _ result: inout [[Int]], _ targetSum: Int) {
          guard let node = node else { return }
          if sum > targetSum {
             return
          }
          let newSum = sum + node.val
          var newPath = path
          newPath.append(node.val)

          if newSum == targetSum && node.left == nil && node.right == nil {
             result.append(newPath)
          } else {
             dfs(node.left, newSum, newPath, &result, targetSum)
             dfs(node.right, newSum, newPath, &result, targetSum)
          }
       }
    }

    @Suite struct PathSumIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "65b4ef8a-67c6-4ec2-bad7-fb4d55be6f69",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "249ed526-2a07-4478-b864-23abffaeb82c",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "356d1030-48e8-4594-98a7-f4c2f465d018",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "d9a39221-623a-4f8a-b32a-5a01174de39d",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "0b7c852c-8c30-4e36-bca6-b507da0a54c0",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "f4796873-1466-4bc0-8544-d93c1f27881e",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "5927df1b-2cb5-4355-ba8c-213202ead3d2",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "ea099f43-c233-4b65-a58e-7c419e0ab949",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "56883593-8467-41eb-9b6c-d30f94224b54",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15,null,16]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "d13acd62-adaa-476f-a3f5-2ffc3420acb5",
             input: "root = [1]",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "8cc7d8f5-6ba3-4a29-916b-e3485ad6b7fa",
             input: "root = [1,2]",
             expected: "[[1,2]]", orderMatters: true),
            TestCaseData(id: "034215f5-8926-48b7-a0e9-dc3d24fcab4b",
             input: "root = [1,null,2]",
             expected: "[[1,2]]", orderMatters: true),
            TestCaseData(id: "d2742813-9a67-40f5-b428-41a011ddc809",
             input: "root = [1,2,3]",
             expected: "[[1,2],[1,3]]", orderMatters: true),
            TestCaseData(id: "be6f3bdb-6104-4813-84fe-bad441b4a0f2",
             input: "root = [1,null,2,null,3]",
             expected: "[[1,2,3]]", orderMatters: true),
            TestCaseData(id: "2dea0b24-4dbe-4bd5-9880-5479afbd6d8b",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "[[1,2,3,4]]", orderMatters: true),
            TestCaseData(id: "94c87d3f-28fc-4bb8-aa3d-d233a33c7633",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[[1,2,4],[1,2,5],[1,3,6],[1,3,7]]", orderMatters: true),
            TestCaseData(id: "f07e749d-c360-4840-9dfa-0f73fb1c6672",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[[1,2,4,8,10],[1,2,4,9],[1,2,5],[1,3,6],[1,3,7]]", orderMatters: true),
            TestCaseData(id: "93aa1155-84ae-4ee8-bf29-64c54db60813",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[[1,2,4,8],[1,2,4,9],[1,2,5,10],[1,2,5,11],[1,3,6,12],[1,3,6,13],[1,3,7,14],[1,3,7,15]]", orderMatters: true),
            TestCaseData(id: "49c1c523-d195-46d5-8f89-1460b44550c4",
             input: "root = [1,-2,3,-4,5,-6,7,-8,9,-10]",
             expected: "[[1,-2,-4,-8,-10],[1,-2,-4,9],[1,-2,5],[1,3,-6],[1,3,7]]", orderMatters: true),
            TestCaseData(id: "f9f049ad-3857-4c2d-9eac-b773ea80bc8e",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7]",
             expected: "[[1,2,3,4,5,6,7]]", orderMatters: true),
            TestCaseData(id: "4574e3bb-27e5-42ef-8b9f-083152fa4e6b",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15,null,16,null,17]",
             expected: "[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]]", orderMatters: true),
            TestCaseData(id: "5277402c-a14d-4872-b5bd-ddb606a7c955",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15,null,16,null,17,null,18]",
             expected: "[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]]", orderMatters: true),
            TestCaseData(id: "9582ef7f-863c-42a7-83df-d344de99b2b6",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15,null,16,null,17,null,1"
                + "8,null,19]",
             expected: "[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]", orderMatters: true),
            TestCaseData(id: "a823e9c1-5243-40d9-b0ac-22c7111820ec",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15,null,16,null,17,null,1"
                + "8,null,19,null,20]",
             expected: "[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]]", orderMatters: true),
            TestCaseData(id: "7ef9eacb-3c5e-4bd6-8e84-7228d3502fb9",
             input: "{'root': [1, -2, -3, 1, 3, -2, None, -1], 'targetSum': -1}",
             expected: "[[1,-2,1,-1]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "path-sum-ii"
            let topic = "backtracking"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            guard let p_targetSum = InputParser.parseInt(params[1]) else {
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

            // Constraint precondition checks
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= Node.val <= 1000"
                )
                return
            }
            guard p_targetSum >= -1000 && p_targetSum <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= targetSum <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.pathSum(p_root, p_targetSum)
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
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
