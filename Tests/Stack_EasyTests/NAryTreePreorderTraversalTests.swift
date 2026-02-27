import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNAryTreePreorderTraversal {
    private typealias Node = NAryNode

    private class Solution {
        func preorder(_ root: Node?) -> [Int] {
            var result = [Int]()
            var stack = [Node]()
            if let root = root {
                stack.append(root)
            }
            while !stack.isEmpty {
                let node = stack.removeLast()
                result.append(node.val)
                for child in node.children.reversed() {
                    stack.append(child)
                }
            }
            return result
        }
    }

    @Suite struct NAryTreePreorderTraversalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9a48bb82-80bc-4d29-aee9-82b2a2d50279",
             input: "root = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "abcf5ea8-c255-4421-b4b0-6b3839553806",
             input: "root = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "0eb4a47d-db72-4262-b2cc-f4f92654c809",
             input: "root = [1, [2]]",
             expected: "[1, 2]", orderMatters: true),
            TestCaseData(id: "af8bbaeb-45af-4219-addd-cc9344ae263e",
             input: "root = [1, [2, 3]]",
             expected: "[1, 2, 3]", orderMatters: true),
            TestCaseData(id: "99249663-1f24-4bd0-9d1c-0a8bbdc5d600",
             input: "root = [1, [2, 3, 4]]",
             expected: "[1, 2, 3, 4]", orderMatters: true),
            TestCaseData(id: "3fc70f0f-b4be-4657-b1f6-4d622cb3c2d0",
             input: "root = [1, [2, 3, 4, 5]]",
             expected: "[1, 2, 3, 4, 5]", orderMatters: true),
            TestCaseData(id: "dd19e685-f8c1-47ac-b8c8-87b78f49d6d5",
             input: "root = [1, [2, 3, 4, 5, 6]]",
             expected: "[1, 2, 3, 4, 5, 6]", orderMatters: true),
            TestCaseData(id: "6e3df40c-ef95-4533-9ac0-cebe59920b99",
             input: "root = [1, [2, 3, 4, 5, 6, 7]]",
             expected: "[1, 2, 3, 4, 5, 6, 7]", orderMatters: true),
            TestCaseData(id: "3c5282b8-5b10-4a4b-943c-a32780a53c5a",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8]", orderMatters: true),
            TestCaseData(id: "34f0dc8b-21e7-4bd8-97f0-40026d172e15",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9]", orderMatters: true),
            TestCaseData(id: "72c3bf9a-6024-4996-ae8e-fb23e67a48e1",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]", orderMatters: true),
            TestCaseData(id: "79126c38-af41-42ca-b979-2c2991ce61b0",
             input: "root = [1, [2, 2, 2, 2, 2]]",
             expected: "[1, 2, 2, 2, 2, 2]", orderMatters: true),
            TestCaseData(id: "eff07296-2b85-4d78-a192-2fce810372c4",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]", orderMatters: true),
            TestCaseData(id: "887198dc-9543-4c55-b0e1-688161136e8c",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]", orderMatters: true),
            TestCaseData(id: "ee210553-90f8-494c-b9a7-6daeb98e623b",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]", orderMatters: true),
            TestCaseData(id: "f33a2849-a839-4380-8eb6-b2bafc555d43",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]", orderMatters: true),
            TestCaseData(id: "8e6a2d8f-2cf6-4540-9457-b42b7ca4f19e",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]", orderMatters: true),
            TestCaseData(id: "6b5f85d3-876e-4516-a679-0a3665d78d18",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]", orderMatters: true),
            TestCaseData(id: "240f165a-4ac7-46f9-8eb5-657ca9e0b9a8",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]", orderMatters: true),
            TestCaseData(id: "81a5e61a-67c8-4606-bef6-8966e798912a",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]", orderMatters: true),
            TestCaseData(id: "0469e13a-4a7e-4132-928a-a4035688dcd4",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]", orderMatters: true),
            TestCaseData(id: "7dbef369-5603-43d1-b087-214ba5efb55f",
             input: "root = [1, [2, -3, 4, -5, 6]]",
             expected: "[1, 2, -3, 4, -5, 6]", orderMatters: true),
            TestCaseData(id: "c9ceb826-49f1-4992-ab5a-ab5cc7396952",
             input: "root = [1, [-2, -3, -4, -5, -6]]",
             expected: "[1, -2, -3, -4, -5, -6]", orderMatters: true),
            TestCaseData(id: "84584cd3-e394-4e5d-ba75-18cfb31a7267",
             input: "root = [1, [2, 2, 2, 2, 2, 2]]",
             expected: "[1, 2, 2, 2, 2, 2, 2]", orderMatters: true),
            TestCaseData(id: "6ab2241e-b78c-4a16-9bf7-c46987f6f92e",
             input: "root = [1, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]]",
             expected: "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "n-ary-tree-preorder-traversal"
            let topic = "stack"
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

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildNAryTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as NAryNode?"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.preorder(p_root)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
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
