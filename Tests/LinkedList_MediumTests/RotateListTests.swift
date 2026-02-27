import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRotateList {
    private class Solution {
      func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else { return nil }
        var oldTail: ListNode? = head
        var n = 1
        while let next = oldTail?.next {
          oldTail = next
          n += 1
        }
        oldTail?.next = head
        let new_tail = getNewTail(head, n, k)
        let newHead = new_tail?.next
        new_tail?.next = nil
        return newHead
      }

      private func getNewTail(_ head: ListNode?, _ length: Int, _ k: Int) -> ListNode? {
        var current = head
        for _ in 1..<length - k % length {
          current = current?.next
        }
        return current
      }
    }

    @Suite struct RotateListTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4a598aaa-7059-4f01-8c75-ba6f9d239ccb",
             input: "head = [1,2,3,4,5], k = 2",
             expected: "[4,5,1,2,3]", orderMatters: true),
            TestCaseData(id: "100efab0-983c-46e6-8739-29c903118fb2",
             input: "head = [1,2,3,4,5,6,7,8,9,10], k = 2",
             expected: "[9,10,1,2,3,4,5,6,7,8]", orderMatters: true),
            TestCaseData(id: "8398680b-2831-4784-a13c-6a2043edb245",
             input: "head = [1,-2,3,-4,5], k = 2",
             expected: "[-4,5,1,-2,3]", orderMatters: true),
            TestCaseData(id: "7f06c78d-7c68-4d02-b9f1-7ba90ab3de5e",
             input: "head = [0,1,2], k = 4",
             expected: "[2,0,1]", orderMatters: true),
            TestCaseData(id: "5a3a593a-9ffd-4cac-9a79-81600c455ac9",
             input: "head = [1], k = 0",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "1d5fb41e-5699-4de0-aae1-d0d47a76e26b",
             input: "head = [1,2,3], k = 3",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "c9d0e1f2-a3b4-5678-cdef-789012345678",
             input: "head = [1,2], k = 1",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "d0e1f2a3-b4c5-6789-defa-890123456789",
             input: "head = [-100,0,100], k = 1",
             expected: "[100,-100,0]", orderMatters: true),
            TestCaseData(id: "e1f2a3b4-c5d6-7890-efab-901234567890",
             input: "head = [1,2,3,4,5], k = 5",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "f2a3b4c5-d6e7-8901-fabc-012345678901",
             input: "head = [1,2,3,4,5], k = 7",
             expected: "[4,5,1,2,3]", orderMatters: true),
            TestCaseData(id: "a3b4c5d6-e7f8-9012-abcd-123456789abc",
             input: "head = [1,2,3,4,5,6], k = 1",
             expected: "[6,1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "b4c5d6e7-f8a9-0123-bcde-23456789abcd",
             input: "head = [-1,-2,-3], k = 2",
             expected: "[-2,-3,-1]", orderMatters: true),
            TestCaseData(id: "c5d6e7f8-a9b0-1234-cdef-3456789abcde",
             input: "head = [1,2,3,4,5,6,7,8,9,10], k = 13",
             expected: "[8,9,10,1,2,3,4,5,6,7]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "rotate-list"
            let topic = "linked-list"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_head = InputParser.parseIntArray(params[0]).map({ buildList($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as ListNode?"
                )
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_k >= -100 && p_k <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -100 <= Node.val <= 100"
                )
                return
            }
            guard p_k >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= k <= 2 * 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: ListNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.rotateRight(p_head, p_k)
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

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
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
