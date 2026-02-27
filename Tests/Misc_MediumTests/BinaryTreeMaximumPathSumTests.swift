import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreeMaximumPathSum {
    private class Solution {
        func maxPathSum(_ root: TreeNode?) -> Int {
            var best = Int.min

            func dfs(_ node: TreeNode?) -> Int {
                guard let node = node else { return 0 }
                let left = max(0, dfs(node.left))
                let right = max(0, dfs(node.right))
                best = max(best, left + node.val + right)
                return node.val + max(left, right)
            }

            _ = dfs(root)
            return best
        }
    }

    @Suite struct BinaryTreeMaximumPathSumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "01e12fc9-16f0-43ac-ba21-626aac30a48a",
             input: "root = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "36ec1d3d-7a50-47e3-a95f-083a4afa9478",
             input: "root = [1,null,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "5ef3cbd4-d200-45c4-bb07-50c453d2ec8e",
             input: "root = [1,2,null]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "fc6a8014-d5ef-4c1b-9b34-866c37ef4031",
             input: "root = [-1,-2,-3]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "b1b70763-6150-4046-a35e-812f2c1e8443",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "38644b80-cc0d-476b-9295-ace2e6e6d982",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "bab45985-c66f-4c93-ab5e-dbdad9efa6b2",
             input: "root = [-10,-20,-30,-40,-50,-60,-70,-80,-90,-100]",
             expected: "-10", orderMatters: true),
            TestCaseData(id: "c8521855-642f-4638-b299-892002bddb2f",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10]",
             expected: "55", orderMatters: true),
            TestCaseData(id: "f92bc7d4-0012-41b3-b66f-184295a839b9",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11]",
             expected: "66", orderMatters: true),
            TestCaseData(id: "fb644131-b69a-45f4-b1b1-3e75ca2b2848",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "120", orderMatters: true),
            TestCaseData(id: "db27c7c7-fec8-41b0-a055-301df1a3b894",
             input: "root = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "4a1969d4-7a69-442f-a936-783523ff2e19",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12]",
             expected: "78", orderMatters: true),
            TestCaseData(id: "740d445e-5516-4e3e-9942-76e580b0bc50",
             input: "root = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "0eea6b92-fcfc-4ff6-80f3-79c72e8f9248",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13]",
             expected: "91", orderMatters: true),
            TestCaseData(id: "b4d2ff00-2054-4940-bb47-5722c85d6038",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14]",
             expected: "105", orderMatters: true),
            TestCaseData(id: "4afa8387-03f0-4f56-bf16-f499ff36ad87",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]",
             expected: "325", orderMatters: true),
            TestCaseData(id: "e1bc8d49-cfaa-44b7-88a7-111d010f90b7",
             input: "root = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "35145a39-dbbc-425b-b8d1-c3c36ec85e97",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15]",
             expected: "120", orderMatters: true),
            TestCaseData(id: "10cb4263-90aa-4ae0-b034-f1cf250caa54",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10,null,11,null,12,null,13,null,14,null,15,null,16]",
             expected: "136", orderMatters: true),
            TestCaseData(id: "edfaa682-fb35-4742-a49e-99497645633c",
             input: "root = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25,-26,-27,-28,-29,-30]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "bce1891c-57ec-40da-a22b-b34f56d6875b",
             input: "root = []",
             expected: "-9223372036854775808", orderMatters: true),
            TestCaseData(id: "fa82d0df-2a78-4b6a-9c95-ca6475816b21",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "5d3ddf28-6731-4634-94ec-016a2e010b4b",
             input: "root = [1,2,null,4,5]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "6d670433-7379-409c-b254-82620b85b584",
             input: "root = [1,2,3,4,null,6,7]",
             expected: "17", orderMatters: true),
            TestCaseData(id: "fbafaafb-39bd-4a09-822b-36c5cb33c526",
             input: "root = [1,null,2,3,null,4,null,5]",
             expected: "15", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-tree-maximum-path-sum"
            let topic = "misc"
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
                resultHolder = solution.maxPathSum(p_root)
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
