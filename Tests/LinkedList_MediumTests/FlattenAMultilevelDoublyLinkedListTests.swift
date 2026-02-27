import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFlattenAMultilevelDoublyLinkedList {
    private typealias Node = DoublyNode

    private class Solution {
        func flatten(_ head: Node?) -> Node? {
            if head == nil {
                return nil
            }

            var stack: [Node] = [head.unsafelyUnwrapped]
            var prev: Node? = nil

            while !stack.isEmpty {
                let curr = stack.removeLast()
                curr.prev = prev

                if prev != nil {
                    prev?.next = curr
                }

                if curr.next != nil {
                    stack.append(curr.next.unsafelyUnwrapped)
                }

                if curr.child != nil {
                    stack.append(curr.child.unsafelyUnwrapped)
                    curr.child = nil
                }

                prev = curr
            }

            return head
        }
    }

    @Suite struct FlattenAMultilevelDoublyLinkedListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f7b4ca24-f81f-4516-a44c-712165cc7213",
             input: "head = [1,2,3,4,5,6,7]",
             expected: "[1,2,3,4,5,6,7]", orderMatters: true),
            TestCaseData(id: "01db7729-c3b6-4749-a81c-b408c06f33d0",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "88b0e54a-d77b-4d1e-b75a-9e4d86d8d4b0",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "81543e2e-f43e-4577-9a8f-2019067e3c6a",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12]", orderMatters: true),
            TestCaseData(id: "f5d318b6-5e12-422e-bfaa-70f3ca79d928",
             input: "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]", orderMatters: true),
            TestCaseData(id: "1338a2ad-2865-4c73-8603-86b63af4bd3f",
             input: "head = [1,-2,3,-4,5,-6]",
             expected: "[1,-2,3,-4,5,-6]", orderMatters: true),
            TestCaseData(id: "89d68d2e-19bc-4038-93ba-1e415d06963b",
             input: "head = [1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "a1a42660-bbf1-4aef-b3a7-69e272b318df",
             input: "head = [1,2,3,4,5,6] with 3 -> 7 <-> 8 <-> 9",
             expected: "[1,2,3,7,4,5,6]", orderMatters: true),
            TestCaseData(id: "d5a3b229-9818-4503-9a4f-196fdda72bcc",
             input: "head = [1,2,3,4,5,6] with 2 -> 7 <-> 8 <-> 9",
             expected: "[1,2,7,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "7c5ffe4d-1d16-4d2d-8045-5bf649f490d7",
             input: "head = [1,2,3,4,5,6] with 5 -> 7 <-> 8 <-> 9",
             expected: "[1,2,3,4,5,7,6]", orderMatters: true),
            TestCaseData(id: "16cb6fd2-caad-4daa-9f7c-27d79bf6dd24",
             input: "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9",
             expected: "[1,7,8,9,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "abfb985d-d9e8-475d-b01b-301ec3a631b0",
             input: "head = [1,2,3,4,5,6] with 6 -> 7 <-> 8 <-> 9",
             expected: "[1,2,3,4,5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "d307514d-439f-45db-be9f-932a43505b54",
             input: "head = [1,2,3,4,5,6] with 4 -> 7 <-> 8 <-> 9",
             expected: "[1,2,3,4,7,8,9,5,6]", orderMatters: true),
            TestCaseData(id: "fb4d89fd-2b75-42c2-b5af-0b17bd40e214",
             input: "head = [1,2,3,4,5,6] with 3 -> 7 <-> 8 <-> 9 and 7 -> 10 <-> 11 <-> 12",
             expected: "[1,2,3,7,10,11,12,8,9,4,5,6]", orderMatters: true),
            TestCaseData(id: "377ab540-475a-48f6-a370-08a32764c9b2",
             input: "head = [1,2,3,4,5,6] with 3 -> 7 <-> 8 <-> 9 and 8 -> 10 <-> 11 <-> 12",
             expected: "[1,2,3,7,8,10,11,12,9,4,5,6]", orderMatters: true),
            TestCaseData(id: "1021112d-c6e0-433d-8476-a04e703fa6fa",
             input: "head = [1,2,3,4,5,6] with 3 -> 7 <-> 8 <-> 9 and 9 -> 10 <-> 11 <-> 12",
             expected: "[1,2,3,7,8,9,10,11,12,4,5,6]", orderMatters: true),
            TestCaseData(id: "c91b2a30-1041-4c11-8de5-d78d94868406",
             input: "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9 and 2 -> 10 <-> 11 <-> 12",
             expected: "[1,7,8,9,2,10,11,12,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "e26101d3-8f4f-4c4d-aba2-ef7d86ddc2ee",
             input: "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9 and 3 -> 10 <-> 11 <-> 12",
             expected: "[1,7,8,9,2,3,10,11,12,4,5,6]", orderMatters: true),
            TestCaseData(id: "84c79e9c-d487-4722-b9c7-98f72601a0a7",
             input: "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9 and 4 -> 10 <-> 11 <-> 12",
             expected: "[1,7,8,9,2,3,4,10,11,12,5,6]", orderMatters: true),
            TestCaseData(id: "ec391691-d7c1-40e2-969e-c082ed7ad165",
             input: "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9 and 5 -> 10 <-> 11 <-> 12",
             expected: "[1,7,8,9,2,3,4,5,10,11,12,6]", orderMatters: true),
            TestCaseData(id: "84ffbda1-ecde-4454-96af-2d77ff8e2290",
             input: "head = [1,2,3,4,5,6] with 1 -> 7 <-> 8 <-> 9 and 6 -> 10 <-> 11 <-> 12",
             expected: "[1,7,2,3,4,5,6,10]", orderMatters: true),
            TestCaseData(id: "8a68e425-1f85-411e-9060-668d43b29066",
             input: "head = [1,2,3,4,5,6] with 2 -> 7 <-> 8 <-> 9 and 3 -> 10 <-> 11 <-> 12",
             expected: "[1,2,7,3,10,4,5,6]", orderMatters: true),
            TestCaseData(id: "d16fdfc4-c715-465f-83dc-c05fa04e408a",
             input: "head = [1,2,3,4,5,6] with 2 -> 7 <-> 8 <-> 9 and 4 -> 10 <-> 11 <-> 12",
             expected: "[1,2,7,3,4,10,5,6]", orderMatters: true),
            TestCaseData(id: "52737cbd-d4a3-4f1d-b2fa-1447847988d2",
             input: "head = [1,2,3,4,5,6] with 2 -> 7 <-> 8 <-> 9 and 5 -> 10 <-> 11 <-> 12",
             expected: "[1,2,7,3,4,5,10,6]", orderMatters: true),
            TestCaseData(id: "9883c47e-ae84-4f33-baa7-c51723f37c56",
             input: "head = [1,2,3,4,5,6] with 2 -> 7 <-> 8 <-> 9 and 6 -> 10 <-> 11 <-> 12",
             expected: "[1,2,7,3,4,5,6,10]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "flatten-a-multilevel-doubly-linked-list"
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

            let p_head = { (_: String) -> DoublyNode? in nil }(params[0])

            let solution = Solution()
            var resultHolder: DoublyNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.flatten(p_head)
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
            let computedOutput = "\(result)"

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
