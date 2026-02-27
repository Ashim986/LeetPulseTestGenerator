import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinarySearchTreeIterator {
    private class Solution {
        class BSTIterator {
            var stack: [TreeNode] = []

            init(_ root: TreeNode?) {
                pushLeft(root)
            }

            private func pushLeft(_ node: TreeNode?) {
                var currentNode = node
                while currentNode != nil {
                    stack.append(currentNode.unsafelyUnwrapped)
                    currentNode = currentNode?.left
                }
            }

            func next() -> Int {
                let topNode = stack.removeLast()
                if topNode.right != nil {
                    pushLeft(topNode.right)
                }
                return topNode.val
            }

            func hasNext() -> Bool {
                return !stack.isEmpty
            }
        }
    }

    @Suite struct BinarySearchTreeIteratorTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "260339b0-1dd4-49a4-94b2-8d6ad84bdeef",
             input: "['BSTIterator', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "a039f61d-2637-4a75-a317-6557a561c45a",
             input: "['BSTIterator', 'next', 'next', 'next']",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "e5de9637-2922-4c50-9017-a840bc983fa6",
             input: "['BSTIterator', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4]", orderMatters: true),
            TestCaseData(id: "0be68c6b-ec63-4146-91ce-3babcda60ce1",
             input: "['BSTIterator', 'next']",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "bfd2d5ea-33ba-498f-87f5-eafc0608dbb0",
             input: "['BSTIterator', 'next', 'next']",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "ef93c48e-c3e1-474f-829d-18d2c86c73d8",
             input: "['BSTIterator', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "c00cfa59-a50a-4894-ac1d-a8159bc10960",
             input: "['BSTIterator', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7]", orderMatters: true),
            TestCaseData(id: "dda91dba-439b-4396-9eb9-814fea284f26",
             input: "['BSTIterator', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8]", orderMatters: true),
            TestCaseData(id: "2a7fe996-bf7a-4175-ab1f-6ced022d85d0",
             input: "['BSTIterator', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "9b3ee564-715a-42f8-99c5-2b4dbcb1bfbe",
             input: "['BSTIterator', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "1bc90a13-ae04-46a6-b871-c218c5cb5e71",
             input: "['BSTIterator', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,3,7,9,15,20,null,null,null,null,null]", orderMatters: true),
            TestCaseData(id: "39832787-fbf4-4a3d-8706-6afeee9a5238",
             input: "['BSTIterator', 'hasNext', 'next', 'hasNext', 'next', 'hasNext', 'next', 'hasNext', 'next', 'hasNext']",
             expected: "[null,true,3,true,7,true,9,true,15,true]", orderMatters: true),
            TestCaseData(id: "aec7951a-c3fd-4ff1-99c9-dffa9cddab33",
             input: "['BSTIterator', 'hasNext', 'next', 'hasNext', 'next']",
             expected: "[null,true,3,true,7]", orderMatters: true),
            TestCaseData(id: "32da9209-4fb6-4cb1-92d8-1b3b7e810f59",
             input: "['BSTIterator', 'next', 'hasNext', 'next', 'hasNext']",
             expected: "[null,3,true,7,true]", orderMatters: true),
            TestCaseData(id: "1f1aa71b-a26d-40a8-8378-fb0b3826d58c",
             input: "['BSTIterator', 'next', 'next', 'hasNext', 'next']",
             expected: "[null,3,7,true,9]", orderMatters: true),
            TestCaseData(id: "e8bb29db-3070-4b05-8557-386fe37ab4e3",
             input: "['BSTIterator', 'hasNext', 'hasNext', 'hasNext', 'hasNext', 'hasNext']",
             expected: "[null,true,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "e652791b-c258-4940-beb6-71779aa1a871",
             input: "['BSTIterator', 'hasNext', 'next', 'hasNext', 'next', 'hasNext']",
             expected: "[null,true,3,true,7,true]", orderMatters: true),
            TestCaseData(id: "a54050ae-d951-4324-a90e-1dc78d1a1125",
             input: "['BSTIterator', 'next', 'next', 'next', 'hasNext']",
             expected: "[null,3,7,9,true]", orderMatters: true),
            TestCaseData(id: "cadbb976-7011-467d-bcb0-034a1ec62769",
             input: "['BSTIterator', 'hasNext', 'next', 'next', 'next', 'next', 'next', 'hasNext']",
             expected: "[null,true,3,7,9,15,20,false]", orderMatters: true),
            TestCaseData(id: "0c6eec70-e9dd-47cf-a2c8-bc24c53ea872",
             input: "['BSTIterator', 'next', 'hasNext', 'next', 'hasNext', 'next']",
             expected: "[null,3,true,7,true,9]", orderMatters: true),
            TestCaseData(id: "f656f1f3-f36d-447f-9aa8-c5a76df3adf8",
             input: "['BSTIterator', 'hasNext', 'hasNext', 'hasNext', 'hasNext', 'next']",
             expected: "[null,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "aa0ea65e-d04e-4d7f-8246-d43c578d4a38",
             input: "['BSTIterator', 'hasNext', 'next', 'hasNext', 'next', 'hasNext', 'next']",
             expected: "[null,true,3,true,7,true,9]", orderMatters: true),
            TestCaseData(id: "b76d7d95-4732-4057-b074-c7f4b9f9f86a",
             input: "['BSTIterator', 'next', 'hasNext', 'next', 'hasNext', 'next', 'hasNext']",
             expected: "[null,3,true,7,true,9,true]", orderMatters: true),
            TestCaseData(id: "b46e02a3-32a7-4e41-bbd8-6255c85c43b5",
             input: "['BSTIterator', 'hasNext', 'hasNext', 'hasNext', 'hasNext', 'hasNext', 'hasNext']",
             expected: "[null,true,true,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "ce0a85c4-ac87-45a9-8d1a-286edb712fa5",
             input: "['BSTIterator', 'next', 'next', 'next', 'next', 'next', 'next', 'hasNext']",
             expected: "[null,1,2,3,4,5,6,false]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-search-tree-iterator"
            let topic = "stack"
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
            var objHolder: Solution.BSTIterator?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.BSTIterator(initP_0)
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
                case "next":
                    let rv = obj.next()
                    results.append("\(rv)")
                case "hasNext":
                    let rv = obj.hasNext()
                    results.append(rv ? "true" : "false")
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
