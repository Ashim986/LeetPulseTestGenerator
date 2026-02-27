import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCousinsInBinaryTree {
    private class Solution {
        func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
            var queue: [(TreeNode, Int, Int?)] = [(root.unsafelyUnwrapped, 0, nil)]
            var dict: [Int: (Int, Int?)] = [:]

            while !queue.isEmpty {
                let (node, depth, parent) = queue.removeFirst()
                dict[node.val] = (depth, parent)

                if node.left != nil {
                    queue.append((node.left.unsafelyUnwrapped, depth + 1, node.val))
                }
                if node.right != nil {
                    queue.append((node.right.unsafelyUnwrapped, depth + 1, node.val))
                }
            }

            let (xDepth, xParent) = dict[x].unsafelyUnwrapped
            let (yDepth, yParent) = dict[y].unsafelyUnwrapped

            return xDepth == yDepth && xParent != yParent
        }
    }

    @Suite struct CousinsInBinaryTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6225b74f-8a3f-4eef-8292-12ce4af9728b",
             input: "root = [1,2,3,null,4,null,5]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "663a124b-b8f0-41c0-92db-4791aeceec6b",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "09b7407e-4ef0-4934-a980-51a50fa07da0",
             input: "root = [1]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "f3173282-a877-4c3f-b509-ab55b945d15b",
             input: "root = [1,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "e19a1ff4-0fbf-4a6b-be39-6760b21f1fca",
             input: "root = [1,null,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "17203653-2f37-485a-a23b-63ee7eeeaec4",
             input: "root = [1,-2,3]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "cfa94be9-86b1-437e-bc63-3cbcd86ae9d3",
             input: "root = [1,2,2]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "b633bee4-bfaa-45ef-970d-5f3b2e1c86b6",
             input: "root = [1,2,3,null,4,null,5,6,7]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "80694f22-8cec-482a-9c03-ae721bb3e364",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "029e52aa-1182-409a-adb2-9763a73bf579",
             input: "root = [1,null,2,null,3]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "62bb80ac-2ea7-436e-a97a-eecc4a9b147c",
             input: "root = [1,2,null,4]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "68871c88-0fc0-4625-86c6-73f53d920ca3",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "9faa1728-7c27-4de8-8b36-0028b13db78c",
             input: "root = [1,null,2,null,3,null,4]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "27c76297-7e0f-4de6-9dcd-46294d5817a8",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "28ee5666-978e-4098-a56b-4b8b1505debb",
             input: "root = [1,null,2,null,3,null,4,null,5]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "b071e417-ecec-44d0-ae7c-e17afb6adb2b",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "7e6370f7-b6cd-4b62-aa2b-1b73d48bc948",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "88efd32a-3c06-4fc7-aa44-14c4e018383b",
             input: "root = [1,2,3,null,4,null,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "True", orderMatters: true),
            TestCaseData(id: "f55ca269-f264-481b-a16e-528b4ca1a75c",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "7eb174ca-7421-493b-bdaf-aac15dfa879a",
             input: "root = [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9,null,10]",
             expected: "False", orderMatters: true),
            TestCaseData(id: "09a14ff7-cb3c-4460-baa8-cf9ece18139e",
             input: "root = [1,2,3,null,4,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a7988af9-e572-4c66-8c6a-16b3ffcf2c5e",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b447f592-916a-4d74-bd17-f60ca20f6a2c",
             input: "root = [1,2,3,null,null,4,5,6,7]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2a8c12d1-5c23-44ab-97f4-112e65594f56",
             input: "root = [1,2,3,null,4,null,5,6,7,8,9]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "575c3c4f-b035-411c-9851-cbe96c3d0482",
             input: "root = [1,2,3,4], x = 4, y = 3",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "cousins-in-binary-tree"
            let topic = "trees"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
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
            guard let p_x = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_y = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_x >= 1 && p_x <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= Node.val <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isCousins(p_root, p_x, p_y)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
