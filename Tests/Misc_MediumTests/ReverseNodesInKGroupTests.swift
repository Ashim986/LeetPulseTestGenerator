import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseNodesInKGroup {
    private class Solution {
        func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
            var count = 0
            var curr = head
            while curr != nil && count < k {
                curr = curr?.next
                count += 1
            }
            if count < k { return head }

            var prev: ListNode? = nil
            curr = head
            for _ in 0..<k {
                let next = curr?.next
                curr?.next = prev
                prev = curr
                curr = next
            }
            head?.next = reverseKGroup(curr, k)
            return prev
        }
    }

    @Suite struct ReverseNodesInKGroupTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ce47c791-9bc0-4277-82e3-d4b41581aaab",
             input: "head = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[2,1,4,3,6,5,8,7,10,9]", orderMatters: true),
            TestCaseData(id: "403eced6-ee10-4999-a0e0-25e69351e435",
             input: "head = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "419ba198-95ac-4718-9092-71b41d26bc08",
             input: "head = [1,2,3,4,5], k = 2",
             expected: "[2,1,4,3,5]", orderMatters: true),
            TestCaseData(id: "d6d81c2c-bb12-4372-8815-6ddc2de56730",
             input: "head = [1,2,3,4,5], k = 3",
             expected: "[3,2,1,4,5]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-nodes-in-k-group"
            let topic = "misc"
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
            guard p_k >= 1 && p_k <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= n <= 5000"
                )
                return
            }
            guard p_k >= 1 && p_k <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= n <= 5000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: ListNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.reverseKGroup(p_head, p_k)
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
