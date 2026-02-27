import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreeZigzagLevelOrderTraversal {
    private class Solution {
        func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
            guard let root = root else { return [] }
            var result: [[Int]] = []
            var queue: [TreeNode] = [root]
            var leftToRight = true

            while !queue.isEmpty {
                var level: [Int] = []
                let size = queue.count
                for _ in 0..<size {
                    let node = queue.removeFirst()
                    level.append(node.val)
                    if let left = node.left { queue.append(left) }
                    if let right = node.right { queue.append(right) }
                }
                result.append(leftToRight ? level : level.reversed())
                leftToRight.toggle()
            }
            return result
        }
    }

    @Suite struct BinaryTreeZigzagLevelOrderTraversalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2c253396-7e8d-4de7-9ba7-0ab92d0b7a73",
             input: "root = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "0ec456f6-7fd7-4f2a-89ed-5fcc15203f00",
             input: "root = [1]",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "0593761f-86ac-4631-afd4-67140c7c0a9c",
             input: "root = [1,2]",
             expected: "[[1], [2]]", orderMatters: true),
            TestCaseData(id: "481245e2-b93b-4631-9a89-fc36d03a0c6c",
             input: "root = [1,null,2]",
             expected: "[[1], [2]]", orderMatters: true),
            TestCaseData(id: "1e394bb7-e03a-4ad0-9efa-02164ffa85c8",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[[1], [3, 2], [4, 5, 6, 7]]", orderMatters: true),
            TestCaseData(id: "70fe949f-f7fa-4a5f-b729-634db5f8f47d",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "[[1], [3, 2], [4, 5]]", orderMatters: true),
            TestCaseData(id: "e8d14d93-eb2e-4aa5-8e00-e635c695bc6e",
             input: "root = [1,2,3,4,null,6,7]",
             expected: "[[1], [3, 2], [4, 6, 7]]", orderMatters: true),
            TestCaseData(id: "3a462b42-93a3-4f03-bf1a-88c88ffd2009",
             input: "root = [1,2,3,null,4,5,6]",
             expected: "[[1], [3, 2], [4, 5, 6]]", orderMatters: true),
            TestCaseData(id: "bf9fe241-011c-423a-ab67-540e52de725d",
             input: "root = [1,null,2,null,null,3]",
             expected: "[[1], [2], [3]]", orderMatters: true),
            TestCaseData(id: "8946acf9-c5d9-45d5-bf2e-a66388182f65",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[[1],[3,2],[4,5,6,7],[15,14,13,12,11,10,9,8]]", orderMatters: true),
            TestCaseData(id: "38c77306-fc40-4e5f-9456-16bd70b632fb",
             input: "root = [1,-2,3,-4,5,-6,7,-8,9,-10,11,-12,13,-14,15]",
             expected: "[[1],[3,-2],[-4,5,-6,7],[15,-14,13,-12,11,-10,9,-8]]", orderMatters: true),
            TestCaseData(id: "0dbdbcc4-5c8a-48c4-be19-00cdc38d2ba5",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]",
             expected: "[[1],[3,2],[4,5,6,7],[15,14,13,12,11,10,9,8],[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]]", orderMatters: true),
            TestCaseData(id: "b1e08803-d872-4c8b-ae69-b990c03bac73",
             input: "root = [1,2,2,3,4,4,3]",
             expected: "[[1],[2,2],[3,4,4,3]]", orderMatters: true),
            TestCaseData(id: "78b08b36-2e3f-4970-8549-ba2714b2f4f9",
             input: "root = [3,9,20,null,null,15,7]",
             expected: "[[3],[20,9],[15,7]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-tree-zigzag-level-order-traversal"
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
                resultHolder = solution.zigzagLevelOrder(p_root)
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
