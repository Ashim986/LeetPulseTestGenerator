import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreePaths {
    private class Solution {
        func binaryTreePaths(_ root: TreeNode?) -> [String] {
            var result = [String]()
            var stack = [(node: TreeNode, path: String)]()
            if let root = root {
                stack.append((root, String(root.val)))
            }
            while !stack.isEmpty {
                let (node, path) = stack.removeLast()
                if node.left == nil && node.right == nil {
                    result.append(path)
                } else {
                    if let left = node.left {
                        stack.append((left, path + "->" + String(left.val)))
                    }
                    if let right = node.right {
                        stack.append((right, path + "->" + String(right.val)))
                    }
                }
            }
            return result
        }
    }

    @Suite struct BinaryTreePathsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0e7d0fee-8ddc-4e35-8e75-4dcd18eb6cd9",
             input: "root = []",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "3fd9e881-5bfd-4cb5-9891-59683e144835",
             input: "root = [1,2]",
             expected: "[\"1->2\"]", orderMatters: false),
            TestCaseData(id: "093761e0-e88c-404f-b5f3-e06778ed95ba",
             input: "root = [1,null,2]",
             expected: "[\"1->2\"]", orderMatters: false),
            TestCaseData(id: "0917bb7c-f474-477d-b69d-bd4f31222548",
             input: "root = [1,2,3]",
             expected: "[\"1->2\",\"1->3\"]", orderMatters: false),
            TestCaseData(id: "b8d58e8e-ffa0-40c5-8485-ac195ab8470a",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[\"1->2->4\",\"1->2->5\",\"1->3->6\",\"1->3->7\"]", orderMatters: false),
            TestCaseData(id: "3603a0ba-f128-4bfe-9f2d-ad231404d292",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "[\"1->2\",\"1->3->4\",\"1->3->5\"]", orderMatters: false),
            TestCaseData(id: "d12b188c-7fd3-4498-9f38-08e2c527aa5c",
             input: "root = [1,-2,3]",
             expected: "[\"1->-2\",\"1->3\"]", orderMatters: false),
            TestCaseData(id: "1cddc1ac-8258-44a2-8ab1-766f285b9506",
             input: "root = [1,2,2]",
             expected: "[\"1->2\",\"1->2\"]", orderMatters: false),
            TestCaseData(id: "a6eb00d0-cc9b-42f3-a6dc-8902c673be21",
             input: "root = [1,2,3,4,4,5,5]",
             expected: "[\"1->2->4\",\"1->2->4\",\"1->3->5\",\"1->3->5\"]", orderMatters: false),
            TestCaseData(id: "9a3a0320-c67b-4144-87b7-9fa080cfff0e",
             input: "root = [1,null,2,null,3]",
             expected: "[\"1->2->3\"]", orderMatters: false),
            TestCaseData(id: "94b77f10-891a-4d34-983a-948c9bb1df36",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]",
             expected: "[\"1->2->4->8->16\",\"1->2->4->8->17\",\"1->2->4->9->18\",\"1->2->5->10\",\"1->2->5->11\",\"1->3->6->12\",\"1->3->6->13\",\"1->3->7->14"
                + "\",\"1->3->7->15\"]", orderMatters: false),
            TestCaseData(id: "e1413637-53c6-4725-851c-78e7d6d25879",
             input: "root = [1,2,3,null,null,null,null,null,null,null,null,null,null,4,5]",
             expected: "[\"1->2\",\"1->3\"]", orderMatters: false),
            TestCaseData(id: "a34670b2-2406-492c-b904-96789e4c8b69",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]",
             expected: "[\"1->2->4->8->16\",\"1->2->4->8->17\",\"1->2->4->9->18\",\"1->2->4->9->19\",\"1->2->5->10\",\"1->2->5->11\",\"1->3->6->12\",\"1->3->6->"
                + "13\",\"1->3->7->14\",\"1->3->7->15\"]", orderMatters: false),
            TestCaseData(id: "7e21102d-af47-4392-ae74-7ccd7c29d83d",
             input: "root = [1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11]",
             expected: "[\"1->-2->-4->-8\",\"1->-2->-4->-9\",\"1->-2->-5->-10\",\"1->-2->-5->-11\",\"1->-3->-6\",\"1->-3->-7\"]", orderMatters: false),
            TestCaseData(id: "6afd0d2f-8bcf-46e2-8cc4-49b889c65ffb",
             input: "root = [1,2,3,null,null,4,5,6,7,8,9,10]",
             expected: "[\"1->2\",\"1->3->4->6->10\",\"1->3->4->7\",\"1->3->5->8\",\"1->3->5->9\"]", orderMatters: false),
            TestCaseData(id: "6c3dc708-033a-49d6-8157-08bc763a47db",
             input: "root = [1,2,3,null,5]",
             expected: "[\"1->2->5\",\"1->3\"]", orderMatters: false),
            TestCaseData(id: "87076341-c8f8-42f9-8303-9324de551d2d",
             input: "root = [1]",
             expected: "[\"1\"]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-tree-paths"
            let topic = "backtracking"
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
            var resultHolder: [String]?
            let didCrash = withCrashGuard {
                resultHolder = solution.binaryTreePaths(p_root)
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

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [String]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
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
