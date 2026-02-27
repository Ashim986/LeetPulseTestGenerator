import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDistributeCoinsInBinaryTree {
    /**
     * Definition for a binary tree node.
     *
     */
    private class Solution {
        var moves = 0

        func distributeCoins(_ root: TreeNode?) -> Int {
            dfs(root)
            return moves
        }

        func dfs(_ node: TreeNode?) -> Int {
            if node == nil {
                return 0
            }
            let leftSurplus = dfs(node.unsafelyUnwrapped.left)
            let rightSurplus = dfs(node.unsafelyUnwrapped.right)
            moves += abs(leftSurplus) + abs(rightSurplus)
            return node.unsafelyUnwrapped.val + leftSurplus + rightSurplus - 1
        }
    }

    @Suite struct DistributeCoinsInBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8cdcb60d-b312-49c8-8ac1-7fa2024df5e3",
             input: "root = [1,null,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "04347627-397e-4953-8b4e-0636437c2ab2",
             input: "root = [1,0,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "28153c83-d6f8-446b-aeab-582570f2d281",
             input: "root = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0c89f105-2b5c-4f6f-9ebe-58dc1f88c6ce",
             input: "root = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "688176d7-8008-4b3c-b9be-22dd2f8b4e5b",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "e3c1d966-9e02-4c75-8be4-7f5af4142e61",
             input: "root = [0,3,0]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1acd4015-22c1-4c8d-89d3-fab01558f027",
             input: "root = [3,0,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a31aad54-9b60-44e5-a90f-10527536eb75",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "f41bd9a1-b753-4be2-8409-84fbc272be88",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "ef74ed27-12ed-4f8e-abb7-28954e1efb4f",
             input: "root = [1,2,null,3,null,4,null,5]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "7b163b1d-2d07-4c94-b582-b06939db1a3f",
             input: "root = [1,null,2,3,null,4,null,5]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "5bdbcb5b-7627-46d3-9143-7eacbe5dd028",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "45", orderMatters: true),
            TestCaseData(id: "ffde4e86-fc5a-4f4b-a49f-82234494326f",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "8541f5e1-39b7-47fa-b38b-d75f4bca8573",
             input: "root = [1,2,null,3,null,4,null,5,null,6]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "abeffd5b-bcdb-425f-9f07-0ae2a9789980",
             input: "root = [1,null,2,3,null,4,null,5,null,6]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "962deecf-7434-41dc-817f-c2ac36758e3b",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "66", orderMatters: true),
            TestCaseData(id: "01241e07-63b4-4b2b-81bf-4e493563bcf2",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "21a45a1c-1c4d-413c-acb2-fbee5b21c9f0",
             input: "root = [1,2,null,3,null,4,null,5,null,6,null,7]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "3df7c97f-b7d7-4cca-82b8-9441b957ce49",
             input: "root = [1,null,2,3,null,4,null,5,null,6,null,7]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "b3621ca6-0072-4006-b006-55ffdda1455e",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "91", orderMatters: true),
            TestCaseData(id: "51459413-dd52-4403-9a9c-5f9e2fa9eee1",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "28", orderMatters: true),
            TestCaseData(id: "cc30ec71-9ddc-4e62-a7eb-91a7f470fee7",
             input: "root = [1,2,null,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "28", orderMatters: true),
            TestCaseData(id: "4dd24087-d30e-4bd0-9a6e-2407b5de5e06",
             input: "root = [1,null,2,3,null,4,null,5,null,6,null,7,null,8]",
             expected: "28", orderMatters: true),
            TestCaseData(id: "19e0596d-67db-4346-9266-03a8e68b38bf",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "105", orderMatters: true),
            TestCaseData(id: "17f19e95-832a-4808-8061-40cc0296cffb",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]",
             expected: "36", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "distribute-coins-in-binary-tree"
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
                resultHolder = solution.distributeCoins(p_root)
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
