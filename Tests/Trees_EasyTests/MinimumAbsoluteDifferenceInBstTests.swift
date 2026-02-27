import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumAbsoluteDifferenceInBst {
    private class Solution {
        func getMinimumDifference(_ root: TreeNode?) -> Int {
            var prev: Int?
            var minDiff = Int.max
            func inOrderTraversal(_ node: TreeNode?) {
                if let node = node {
                    inOrderTraversal(node.left)
                    if let prev = prev {
                        minDiff = min(minDiff, node.val - prev)
                    }
                    prev = node.val
                    inOrderTraversal(node.right)
                }
            }
            inOrderTraversal(root)
            return minDiff
        }
    }

    @Suite struct MinimumAbsoluteDifferenceInBstTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "52517f8a-f5b7-4615-a08a-c64d67db8d48",
             input: "root = [1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d749e511-897e-4f99-a239-c8fd728b06c5",
             input: "root = [2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "715436fe-16b1-4b5d-8417-da6f54641439",
             input: "root = [1,null,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d5ad4205-f587-4a55-acae-fa5a91fb5126",
             input: "root = [2,null,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b30d13ae-1cb2-4759-ac4a-b593f6277c5f",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "086c7e9c-bcfc-48e2-b2ed-0e5254a7325b",
             input: "root = [1,2,3,null,null,4,6]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bb8c7f48-4d7e-4cd1-9fe4-af2a59e26f0d",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5afbeb41-2f1f-4d30-a14a-24b0fe50e569",
             input: "root = [7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "73002eeb-6f19-4023-9acf-b0dc42480753",
             input: "root = [1,-2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "657e97e4-8e94-49d6-a670-0e31325d95ea",
             input: "root = [1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fe9e0fbb-e14e-4900-ba63-2e0dd7dc02a7",
             input: "root = [1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ac0f08bc-8232-4d13-a2f7-4c99d9874303",
             input: "root = [10,5,15,3,7,13,17]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1c0dab09-d9d1-4296-9831-efa417c5a999",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ce0f50cb-0409-4d77-9d15-83bcb0b3fa03",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a6d915e8-a604-4dc3-8f1c-6a4137a86cad",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "aef7cc4a-1b7d-48df-9ecc-316d73abe3c0",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20,21]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4f76d3f8-8de1-4347-97f0-51c480544cc8",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20,21,22]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "24968f02-835d-48ae-92a6-962cc80710c1",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20,21,22,23]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d5c01ca1-f4f3-4601-93c7-046359d88d1e",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20,21,22,23,24]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bc7fd4f4-ef3c-4685-bca3-8a3a2795c792",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20,21,22,23,24,25]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4614980e-cd1a-4ade-8d3b-6c9c2ec33091",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20,21,22,23,24,25,26]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b723abee-79e3-48f3-a702-fad77a3d1f4b",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20,21,22,23,24,25,26,27]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "72424795-876b-466b-a343-ff9c942f7ea1",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20,21,22,23,24,25,26,27,28]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "24af0f7d-c640-412b-b357-4c1d39a10b45",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20,21,22,23,24,25,26,27,28,29]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fdbb89a5-ab76-4355-b10e-33fddcbc9b3b",
             input: "root = [10,5,15,3,7,13,17,2,4,6,8,12,14,16,18,1,9,11,19,0,20,21,22,23,24,25,26,27,28,29,30]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-absolute-difference-in-bst"
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
                resultHolder = solution.getMinimumDifference(p_root)
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
