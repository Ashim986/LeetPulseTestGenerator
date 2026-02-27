import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCConvertBstToGreaterTree {
    private class Solution {
        var sum = 0
        func convertBST(_ root: TreeNode?) -> TreeNode? {
            reverseInOrder(root)
            return root
        }
        func reverseInOrder(_ node: TreeNode?) {
            guard let node = node else { return }
            reverseInOrder(node.right)
            node.val += sum
            sum = node.val
            reverseInOrder(node.left)
        }
    }

    @Suite struct ConvertBstToGreaterTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9cd2ceb8-451d-4c90-b69e-de2eb2295aec",
             input: "root = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "3bb0bf04-7a18-4a87-bb9a-1374a8b117d3",
             input: "root = []",
             expected: "null", orderMatters: true),
            TestCaseData(id: "7a61570f-4ae5-466c-8547-81ed82fe49c8",
             input: "root = [1,null,2]",
             expected: "[1,null,3]", orderMatters: true),
            TestCaseData(id: "f8cd68b3-c811-487d-bf7a-c6bc7a8cd3be",
             input: "root = [2,1,3]",
             expected: "[2,6,5]", orderMatters: true),
            TestCaseData(id: "f972d256-b8a7-47cb-86ff-8a744b84f4fb",
             input: "root = [3,1,4]",
             expected: "[3,8,7]", orderMatters: true),
            TestCaseData(id: "b6fc6101-2903-4d3d-a0c2-6322305d1e5d",
             input: "root = [5,3,8]",
             expected: "[5,16,13]", orderMatters: true),
            TestCaseData(id: "beccbd1d-5753-44b8-ac42-af6fa8feaca3",
             input: "root = [5,3,8,1,4,7,10]",
             expected: "[5,16,13,38,37,33,26]", orderMatters: true),
            TestCaseData(id: "2dae1f97-16f3-4660-be09-9addb0e2fadb",
             input: "root = [10,5,15]",
             expected: "[10,30,25]", orderMatters: true),
            TestCaseData(id: "1ad8db42-4162-4212-b96a-1f10b93bed64",
             input: "root = [10,5,15,null,null,12,20]",
             expected: "[10,30,25,null,null,62,50]", orderMatters: true),
            TestCaseData(id: "7937b5db-4da5-43f3-82f5-a7ba5c34b612",
             input: "root = [10,5,15,3,7,null,12,20]",
             expected: "[10,30,25,52,49,null,42,null,null,null,null,null,null,null,72]", orderMatters: true),
            TestCaseData(id: "d16bd98d-641b-4627-bdee-075942cc4852",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7]",
             expected: "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74]", orderMatters: true),
            TestCaseData(id: "b456817f-546d-4a9c-8e5d-006632a8eaf4",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8]",
             expected: "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66]", orderMatters: true),
            TestCaseData(id: "d9607c2f-d4a0-43bd-a29d-32741bc4c649",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9]",
             expected: "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57]", orderMatters: true),
            TestCaseData(id: "f56844c5-a364-4608-a10e-94e72e1e067b",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]",
             expected: "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47]", orderMatters: true),
            TestCaseData(id: "fecdef46-62d2-4b63-9dac-1d1f83a45a33",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11]",
             expected: "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36]", orderMatters: true),
            TestCaseData(id: "1dfe77e4-a90e-4896-978d-922c98fd9995",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12]",
             expected: "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36,24]", orderMatters: true),
            TestCaseData(id: "0be92ed0-26f5-46ef-989c-8f9890aeae03",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13]",
             expected: "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36,24,11]", orderMatters: true),
            TestCaseData(id: "180a0fc6-5e2f-4cad-9b5a-f7683319739a",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14]",
             expected: "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36,24,11,-3]", orderMatters: true),
            TestCaseData(id: "688322ee-f51e-4e52-a774-c27c507a5113",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15]",
             expected: "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36,24,11,-3,-18]", orderMatters: true),
            TestCaseData(id: "b1fe9653-77db-463b-b45e-8897c004819f",
             input: "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16]",
             expected: "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36,24,11,-3,-18,-34]", orderMatters: true),
            TestCaseData(id: "689c8fd4-c653-4ca7-8900-739e47246a12",
             input: "root = [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]",
             expected: "[30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]", orderMatters: true),
            TestCaseData(id: "31280f75-505f-4848-95e6-15ed794dd625",
             input: "root = [0,null,1]",
             expected: "[1,null,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "convert-bst-to-greater-tree"
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
            var resultHolder: TreeNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.convertBST(p_root)
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

            // Structural comparison: both sides serialized to canonical tree format
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
