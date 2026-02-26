import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPathSumIii {
    private class Solution {
        func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
            var count = 0
            var prefixSumCount: [Int: Int] = [0: 1]
            var currentSum = 0
            func dfs(_ node: TreeNode?) {
                if let node = node {
                    currentSum += node.val
                    count += prefixSumCount[currentSum - targetSum] ?? 0
                    prefixSumCount[currentSum, default: 0] += 1
                    dfs(node.left)
                    dfs(node.right)
                    prefixSumCount[currentSum, default: 0] -= 1
                    if prefixSumCount[currentSum, default: 0] == 0 {
                        prefixSumCount.removeValue(forKey: currentSum)
                    }
                    currentSum -= node.val
                }
            }
            dfs(root)
            return count
        }
    }

    @Suite struct PathSumIiiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6fd9b249-e778-4d18-868c-b4d4f9bf55a0",
             input: "root = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "41184365-7945-4a8c-8fda-9e8bbaf8fe04",
             input: "root = [1,null,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "03027b05-1c95-48f2-b60d-1145fda5c363",
             input: "root = [1,2,null]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "33239aa5-560d-4bd2-a5ae-392d28c2110b",
             input: "root = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8d2573b3-0d50-48a9-8743-c669d409a5fe",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f0cfaa03-56f1-4b6e-9074-ae974a27072d",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "169842b8-2a8e-4c69-94b2-4b8076bf69d3",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e6170cf6-e080-4e67-92e0-268d82cb1334",
             input: "root = [1,-2,3,-4,5,-6,7,-8,9,-10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6486baa5-59a9-4032-8385-26694daa25cf",
             input: "root = [1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f5143351-e54f-4aaa-9ece-0e599860fc09",
             input: "root = [0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "509e5ebc-cb99-4ca9-b6dc-38ca3a8b6e73",
             input: "root = [1,0,-1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "28a030b4-2733-4df7-9844-1473c5c900ac",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b6d66d0d-5719-435f-85fa-daacc880e1a5",
             input: "root = [1,-2,3,-4,5,-6,7,-8,9,-10,11,-12,13,-14,15]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "699f5999-59ff-41e7-85af-a37c907ae367",
             input: "root = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4e095aa0-c9ab-4fdd-80a3-b843e63add8c",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a6988886-2d57-47b6-82f0-8b3f5effc70f",
             input: "root = [1,-2,3,-4,5,-6,7,-8,9,-10,11,-12,13,-14,15,16,-17,18,-19,20]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "920c38e6-12eb-47ac-af31-5bc7e6d1bd23",
             input: "root = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "704bff1d-ff5b-4a04-9877-45d703eef80a",
             input: "root = [0], targetSum = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c087c7f6-96b4-4eb4-b843-14490edc77fd",
             input: "root = [1,2], targetSum = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "59f6989d-f989-47b4-bdfe-4bcd9f45154d",
             input: "root = [], targetSum = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a7774015-7a11-4afb-90f2-a5174cb929aa",
             input: "root = [10,5,-3,3,2,null,11,3,-2,null,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d4595ac0-ae3a-4cad-9109-02f1185d4b3c",
             input: "root = [5,4,8,11,null,13,4,7,2,null,null,5,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a329281a-cfe3-462b-b3bc-d96f9a118a0a",
             input: "root = [0,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ae6b1e17-360b-4b2f-b0ed-ea5ac2f4b7c3",
             input: "root = [1,2,3,null,null,4,5], targetSum = 8",
             expected: "0", orderMatters: true),
            TestCaseData(id: "86a1a692-31ce-4aa9-a58c-f2bebbda8923",
             input: "root = [1,null,2], targetSum = 1",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "path-sum-iii"
            let topic = "trees"
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
            guard p_targetSum >= -109 && p_targetSum <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= Node.val <= 109"
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
