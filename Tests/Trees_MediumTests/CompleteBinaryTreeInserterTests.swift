import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCompleteBinaryTreeInserter {
    private class Solution {
        class CBTInserter {
            var root: TreeNode?
            var queue: [TreeNode]
            init(_ root: TreeNode?) {
                self.root = root
                self.queue = []
                var q: [TreeNode] = [root.unsafelyUnwrapped]
                while !q.isEmpty {
                    let node = q.removeFirst()
                    if node.left == nil || node.right == nil {
                        queue.append(node)
                    }
                    if node.left != nil {
                        q.append(node.left.unsafelyUnwrapped)
                    }
                    if node.right != nil {
                        q.append(node.right.unsafelyUnwrapped)
                    }
                }
            }
            func insert(_ v: Int) -> Int {
                let node = queue.removeFirst()
                if node.left == nil {
                    node.left = TreeNode(v)
                } else {
                    node.right = TreeNode(v)
                }
                queue.append(node)
                return node.val
            }
            func get_root() -> TreeNode? {
                return root
            }
        }
    }

    @Suite struct CompleteBinaryTreeInserterTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3181111b-f72a-49da-a8bf-0af9699b4e12",
             input: "root = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "942a6e49-aec0-49a9-a285-8174b8714c6d",
             input: "root = [1,2,3,4]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1278e049-8fd4-46e2-b6d1-f66a0fb7ded7",
             input: "root = [1,null,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0253fba2-4963-41b7-a3e5-6258aeebbd61",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ba6021ef-5d3f-41c2-9b08-390a38154404",
             input: "root = [1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d81a505f-2911-4105-8de5-c4f266dd07bb",
             input: "root = [1,null,null]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5dbb30de-c586-465f-88b6-46b2f53d681e",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "d29e4d93-3edf-477d-8ae5-efbbb6973307",
             input: "root = [1,2,3,4,5,6,7,8,9,10,null,null,null,null,null,null,null,null,null,null]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ca99728e-f902-49fb-b12c-c062aa4ced51",
             input: "root = [1,2,null,4,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "617a9be2-8082-43cd-99c0-187c59857303",
             input: "root = [1,2,3,null,null,4,5,6,7]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1a54c608-9b82-4f62-9086-52f855b244fa",
             input: "root = [1,-2,3,-4,5,-6]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "69ffa3bb-180d-4e14-9be0-525717f7b2f9",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,null,null,null,null,null,null,null,null,null,null]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "94aef725-d859-4826-87b0-d4437ad77cc4",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]",
             expected: "13", orderMatters: true),
            TestCaseData(id: "be36400c-359d-4341-84cb-3ab810569e3e",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "2ff16993-52a7-40f9-b761-47640b1b47b8",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "539dde51-f3b8-41dd-bc17-849a3ec919dc",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "9b499129-509c-4da8-9a5b-48f1fad5469b",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33]",
             expected: "17", orderMatters: true),
            TestCaseData(id: "c8a2c0d9-06fc-4b56-926a-96cb800eab92",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34]",
             expected: "17", orderMatters: true),
            TestCaseData(id: "0af0d189-4263-401a-a433-04351544b213",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "edcd0336-bcc1-4508-8876-9ea0ec2de965",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "7a7b9ab2-0a42-46fe-92dd-dcf1a1f1a30d",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37]",
             expected: "19", orderMatters: true),
            TestCaseData(id: "e2a91454-7f8d-477f-89d6-49cd24dcbb2a",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38]",
             expected: "19", orderMatters: true),
            TestCaseData(id: "546e371c-50b4-4b5d-913f-e199cbaae445",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "0bc625b0-f20b-454e-a779-0de6bdfdefdd",
             input: "root = [1,2,3,null,null,4,5,6,null,null,7,8]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "complete-binary-tree-inserter"
            let topic = "trees"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            guard initArgs.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Init args count too small"
                )
                return
            }
            guard let initP_0 = InputParser.parseNullableIntArray(initArgs[0]).map({ buildTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 0 as TreeNode?"
                )
                return
            }
            var objHolder: Solution.CBTInserter?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.CBTInserter(initP_0)
            }
            guard !initDidCrash, var obj = objHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution init crashed at runtime"
                )
                return
            }

            var results: [String] = []
            let loopDidCrash = withCrashGuard {
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "insert":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.insert(mArg_0)
                    results.append("\(rv)")
                case "get_root":
                    let rv = obj.get_root()
                    results.append("\(rv)")
                default:
                    results.append("null")
                }
            }
            }
            guard !loopDidCrash else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution method crashed at runtime"
                )
                return
            }

            let computedOutput = "[" + results.joined(separator: ",") + "]"
            // Class-design comparison: normalize null representations and whitespace
            func normalizeClassOutput(_ s: String) -> String {
                var result = s.replacingOccurrences(of: " ", with: "")
                result = result.replacingOccurrences(of: "nil", with: "null")
                result = result.replacingOccurrences(of: "None", with: "null")
                result = result.replacingOccurrences(of: "NULL", with: "null")
                return result
            }
            let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
