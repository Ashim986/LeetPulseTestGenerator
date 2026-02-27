import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPopulatingNextRightPointersInEachNode {
    private typealias Node = NextNode

    private class Solution {
        func connect(_ root: Node?) -> Node? {
            var leftmost = root
            while leftmost?.left != nil {
                var head = leftmost
                while head != nil {
                    head?.left?.next = head?.right
                    if head?.next != nil {
                        head?.right?.next = head?.next?.left
                    }
                    head = head?.next
                }
                leftmost = leftmost?.left
            }
            return root
        }
    }

    @Suite struct PopulatingNextRightPointersInEachNodeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "41d1314e-0eff-4ef9-b3b9-ba288f091b1d",
             input: "root = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "4a591e4b-e2d0-46a0-a367-4ef95d95c199",
             input: "root = [1]",
             expected: "[1,#]", orderMatters: true),
            TestCaseData(id: "ebc9a54e-c8a8-4c25-9452-c41b871b2e31",
             input: "root = [1,2]",
             expected: "[1,#,2,#]", orderMatters: true),
            TestCaseData(id: "e10fc713-8d82-4080-acde-b6306f5df2a4",
             input: "root = [1,null,2]",
             expected: "[1,#,null,2,#]", orderMatters: true),
            TestCaseData(id: "fe4c15c4-47a4-4d9f-b7cd-663f94f16cb6",
             input: "root = [1,2,3,4,null,5,null]",
             expected: "[1,#,2,3,#,4,#,5,#]", orderMatters: true),
            TestCaseData(id: "1efee911-3bd3-44be-acec-77aaf163ea6b",
             input: "root = [1,2,3,4,5,null,6]",
             expected: "[1,#,2,3,#,4,5,#,null,6,#]", orderMatters: true),
            TestCaseData(id: "35fd224c-aab0-4362-8c4e-334410621799",
             input: "root = [1,2,3,4,5,6,7,8]",
             expected: "[1,#,2,3,#,4,5,6,7,#,8,#]", orderMatters: true),
            TestCaseData(id: "5f93b6d5-a687-4f34-a5df-41c301a820ab",
             input: "root = [1,2,3,4,5,6,7,8,9]",
             expected: "[1,#,2,3,#,4,5,6,7,#,8,9,#]", orderMatters: true),
            TestCaseData(id: "900e2ba8-494d-4a57-b720-3c64c2115282",
             input: "root = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,#,2,3,#,4,5,6,7,#,8,9,10,#]", orderMatters: true),
            TestCaseData(id: "5c7e23d4-57af-43ec-8b1b-6793d589e693",
             input: "root = [1,-2,3,-4,5,-6,7,-8,9,-10]",
             expected: "[1,#,-2,3,#,-4,5,-6,7,#,-8,9,-10,#]", orderMatters: true),
            TestCaseData(id: "0203a0fb-7761-4eba-8d02-cf2b4a671e67",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]",
             expected: "[1,null,2,3,null,4,5,6,7,null,8,9,10,11,12,13,14,15,null,16,17,18,19,20,21,22,23,24,25,26,27,28,null]", orderMatters: true),
            TestCaseData(id: "84014edd-4879-4bce-93c6-3e5e8367d21a",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]",
             expected: "[1,null,2,3,null,4,5,6,7,null,8,9,10,11,12,13,14,15,null,16,17,18,19,20,21,22,23,24,25,26,27,28,29,null]", orderMatters: true),
            TestCaseData(id: "0541fc70-faf0-496e-bb10-a6ac2c1689e1",
             input: "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]",
             expected: "[1,null,2,3,null,4,5,6,7,null,8,9,10,11,12,13,14,15,null,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,null]", orderMatters: true),
            TestCaseData(id: "6b62d853-c1d8-48f0-b7fa-2e9ac3037b82",
             input: "root = [1,2,3,4,5,6,7]",
             expected: "[1,#,2,3,#,4,5,6,7,#]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "populating-next-right-pointers-in-each-node"
            let topic = "linked-list"
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

            guard let p_root = InputParser.parseNullableIntArray(params[0]).map({ buildNextTree($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as NextNode?"
                )
                return
            }

            let solution = Solution()
            var resultHolder: NextNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.connect(p_root)
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
            let computedOutput = serializeNextTree(result)

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
