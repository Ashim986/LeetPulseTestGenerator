import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreeLevelOrderTraversal {
    private class Solution {
        func levelOrder(_ root: TreeNode?) -> [[Int]] {
            guard let root = root else { return [] }
            var result: [[Int]] = []
            var queue: [TreeNode] = [root]
            var index = 0

            while index < queue.count {
                let levelCount = queue.count - index
                var level: [Int] = []
                for _ in 0..<levelCount {
                    let node = queue[index]
                    index += 1
                    level.append(node.val)
                    if let left = node.left { queue.append(left) }
                    if let right = node.right { queue.append(right) }
                }
                result.append(level)
            }

            return result
        }
    }

    @Suite struct BinaryTreeLevelOrderTraversalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "06ACC87C-C0D5-4F9D-82AD-E64B52297540",
             input: "[3,9,20,null,null,15,7]",
             expected: "[[3],[9,20],[15,7]]", orderMatters: true),
            TestCaseData(id: "C578D830-DD5F-4684-AC73-93012E561890",
             input: "[]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "69CA8534-E743-4532-BFE1-B47A98211E36",
             input: "[1]",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "14AFC6C0-B705-4D82-970F-66D0AECA7AD2",
             input: "[1,null,2]",
             expected: "[[1],[2]]", orderMatters: true),
            TestCaseData(id: "5A3FF2D5-7526-49C2-A851-D779959A2544",
             input: "[3,9,20,1,2,15,7]",
             expected: "[[3],[9,20],[1,2,15,7]]", orderMatters: true),
            TestCaseData(id: "6BB8C463-3684-407B-B56C-888A523A999E",
             input: "[1,2,3,4,5,6,7]",
             expected: "[[1],[2,3],[4,5,6,7]]", orderMatters: true),
            TestCaseData(id: "0A888E5F-4D6E-4856-8CFE-3067F139F5B7",
             input: "[1,2,3,null,4,null,5]",
             expected: "[[1],[2,3],[4,5]]", orderMatters: true),
            TestCaseData(id: "1E61B81E-BB93-4742-9DA5-4867AF32DE5D",
             input: "[1,2,3,4,null,null,5]",
             expected: "[[1],[2,3],[4,5]]", orderMatters: true),
            TestCaseData(id: "8E5EB6E4-EF5A-49DA-BEFD-7BC8BA444F6C",
             input: "[1,2]",
             expected: "[[1],[2]]", orderMatters: true),
            TestCaseData(id: "659C1FC7-BD5F-4C40-9513-8663081D3D8A",
             input: "[3,9,20,15,7]",
             expected: "[[3],[9,20],[15,7]]", orderMatters: true),
            TestCaseData(id: "B28CC539-B53F-4A45-8918-AB251242426E",
             input: "[1,null,2,3]",
             expected: "[[1],[2],[3]]", orderMatters: true),
            TestCaseData(id: "B8F87AEA-E074-4C36-9E74-FEA26F4EB508",
             input: "[1,2,3,4,5]",
             expected: "[[1],[2,3],[4,5]]", orderMatters: true),
            TestCaseData(id: "007D08BE-0B88-4A9F-9FDA-9E5DE3BAC2B5",
             input: "[1,2,3,null,5,null,4]",
             expected: "[[1], [2, 3], [5, 4]]", orderMatters: true),
            TestCaseData(id: "E5A056C7-A694-4BCA-A6F8-510AA0F0EBDA",
             input: "[1,2,null,3,null,4,null,5]",
             expected: "[[1],[2],[3],[4],[5]]", orderMatters: true),
            TestCaseData(id: "b39f743c-b1a3-4ea9-b35c-5ae3e133a5e8",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "[[1], [2, 3], [4, 5]]", orderMatters: true),
            TestCaseData(id: "a711f68c-2f60-4c77-8865-600d99ba79d9",
             input: "root = [1,null,2,null,null,3]",
             expected: "[[1], [2], [3]]", orderMatters: true),
            TestCaseData(id: "229a3a0b-9be7-42b5-90ae-fe0220121fec",
             input: "root = [1,2,null,4]",
             expected: "[[1], [2], [4]]", orderMatters: true),
            TestCaseData(id: "b9530086-3f4c-4f0e-96c9-7389272124f8",
             input: "root = [1,null,2,3]",
             expected: "[[1], [2], [3]]", orderMatters: true),
            TestCaseData(id: "3cad7953-f6a9-4198-9570-589481ab84a5",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[[1], [2, 3], [4, 5, 6, 7]]", orderMatters: true),
            TestCaseData(id: "dd6aee89-c816-44af-8b5f-c1b88c56f61c",
             input: "root = [1,-2,3]",
             expected: "[[1], [-2, 3]]", orderMatters: true),
            TestCaseData(id: "3c7520ca-c94a-4ead-8cfb-05aa429fa4b2",
             input: "root = [1,2,2]",
             expected: "[[1], [2, 2]]", orderMatters: true),
            TestCaseData(id: "eab84fc0-831e-4f20-9b3f-78d2399991c1",
             input: "root = [1,null,null]",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "35ee4be4-08f0-4238-a212-b847c6bc4b05",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[[1], [2, 3], [4, 5, 6, 7], [8, 9, 10]]", orderMatters: true),
            TestCaseData(id: "3ec2bb45-0adf-4cfa-96af-eaf9348bbc63",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[[1], [2, 3], [4, 5, 6, 7], [8, 9, 10, 11, 12, 13, 14, 15]]", orderMatters: true),
            TestCaseData(id: "d609f7ad-8583-4e1c-b099-7b27a77e2bdd",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]",
             expected: "[[1], [2, 3], [4, 5, 6, 7], [8, 9, 10, 11, 12, 13, 14]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-tree-level-order-traversal"
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
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.levelOrder(p_root)
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

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
