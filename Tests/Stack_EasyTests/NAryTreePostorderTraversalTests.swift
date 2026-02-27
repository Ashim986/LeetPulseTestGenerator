import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNAryTreePostorderTraversal {
    private typealias Node = NAryNode

    private class Solution {
        func postorder(_ root: Node?) -> [Int] {
            var result = [Int]()
            guard let root = root else { return result }
            var stack: [(Node, Bool)] = [(root, false)]
            while !stack.isEmpty {
                let (node, visited) = stack.removeLast()
                if !visited {
                    stack.append((node, true))
                    for child in node.children.reversed() {
                        stack.append((child, false))
                    }
                } else {
                    result.append(node.val)
                }
            }
            return result
        }
    }

    @Suite struct NAryTreePostorderTraversalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9d046c20-8026-4da4-bcd0-b1ca3bb3d1b6",
             input: "root = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "cfce1714-6b7b-4f98-a031-c6eff0615c47",
             input: "root = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "767a0c4b-999f-4bb2-a4cf-8b37fb3cd51f",
             input: "root = [1,2]",
             expected: "[2, 1]", orderMatters: true),
            TestCaseData(id: "f8e9a800-3276-44b5-9465-eab77926a5e0",
             input: "root = [1,null,2]",
             expected: "[2, 1]", orderMatters: true),
            TestCaseData(id: "5042ea43-a620-42aa-8ea2-d64bbe4d8401",
             input: "root = [1,2,3]",
             expected: "[3, 2, 1]", orderMatters: true),
            TestCaseData(id: "4f46fabb-7365-419b-bada-73c12b279f3f",
             input: "root = [1,null,2,3]",
             expected: "[3, 2, 1]", orderMatters: true),
            TestCaseData(id: "47780c5a-1acd-4ad4-9fd9-6714056cfc6d",
             input: "root = [1,2,null,4,5]",
             expected: "[4, 5, 2, 1]", orderMatters: true),
            TestCaseData(id: "b27b41c7-df8d-4623-b386-bacff5e1eeaa",
             input: "root = [1,null,2,null,3,4]",
             expected: "[4, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "b388b27e-073d-4139-bba2-e322c26a07fc",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[4, 5, 6, 7, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "bcdff016-238b-4ec8-a800-3803dbd67b75",
             input: "root = [1,null,2,null,null,3,4]",
             expected: "[4, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "f6dda481-9421-4a49-90ad-05d9a74d0084",
             input: "root = [1,2,3,null,null,4,5]",
             expected: "[4, 5, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "f749fba3-5670-42b9-a2d7-1b3355d351b1",
             input: "root = [1,null,2,3,null,4,5]",
             expected: "[3, 4, 5, 2, 1]", orderMatters: true),
            TestCaseData(id: "9b1e0fed-466e-4ad7-b05d-e1166d783aa9",
             input: "root = [1,2,null,3,null,4,5]",
             expected: "[3, 4, 5, 2, 1]", orderMatters: true),
            TestCaseData(id: "b36f5c24-1794-41f0-935d-ed8216c8b411",
             input: "root = [1,null,2,null,3,null,4,5]",
             expected: "[3, 4, 5, 2, 1]", orderMatters: true),
            TestCaseData(id: "f89e5258-7ba1-4e08-875c-1018e0f6e0db",
             input: "root = [1,null,2,null,null,3,4,5]",
             expected: "[4, 5, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "c1ed46e2-b82f-40ab-9fdb-c4540f428297",
             input: "root = [1,null,2,null,null,3,null,4,5]",
             expected: "[4, 5, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "701b5d35-c4b8-4360-be47-8cf705838e41",
             input: "root = [1,null,2,null,null,3,null,null,4,5]",
             expected: "[4, 5, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "0beb8835-dac3-4002-ab49-8074a85bcf14",
             input: "root = [1,null,2,null,null,3,null,null,null,4,5]",
             expected: "[4, 5, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "92db7d47-b210-470b-b855-d56c60323490",
             input: "root = [1,null,2,null,null,3,null,null,null,null,4,5]",
             expected: "[4, 5, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "342aa171-4b10-427c-be02-f00dead8e3d6",
             input: "root = [1,null,2,null,null,3,null,null,null,null,null,4,5]",
             expected: "[4, 5, 3, 2, 1]", orderMatters: true),
            TestCaseData(id: "61ea8daf-c38f-4b15-bead-a534d8beecba",
             input: "root = [1,null,2,null,null,3,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,4,5]",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "a0cfaa01-c4cc-4a6a-8fed-264a56841ff1",
             input: "root = [1,null,2,null,null,3,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,4,5]",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "05b543b5-eaca-4bd0-b3cc-7ff82eb2e0b1",
             input: "root = [1,null,2,null,null,3,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,4,5]",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "b2518880-4555-4e32-9507-12848d910708",
             input: "root = [1,null,2,null,null,3,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,4,5]",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "ec1ebe50-539a-40a0-beb6-2e9c065fdc9e",
             input: "root = [1,null,2,null,null,3,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,4,5]",
             expected: "[2,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "n-ary-tree-postorder-traversal"
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
                resultHolder = solution.postorder(p_root)
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
