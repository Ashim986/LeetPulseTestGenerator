import Foundation
import Testing
@testable import LeetCodeHelpers

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

    @Test func test_0() async {
        let slug = "reverse-nodes-in-k-group"
        let topic = "misc"
        let testId = "ce47c791-9bc0-4277-82e3-d4b41581aaab"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "[2,1,4,3,6,5,8,7,10,9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_k = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.reverseKGroup(p_head, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "reverse-nodes-in-k-group"
        let topic = "misc"
        let testId = "403eced6-ee10-4999-a0e0-25e69351e435"
        let rawInput = "head = [1]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_k = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.reverseKGroup(p_head, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "reverse-nodes-in-k-group"
        let topic = "misc"
        let testId = "419ba198-95ac-4718-9092-71b41d26bc08"
        let rawInput = "head = [1,2,3,4,5], k = 2"
        let expectedOutput = "[2,1,4,3,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_k = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.reverseKGroup(p_head, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "reverse-nodes-in-k-group"
        let topic = "misc"
        let testId = "d6d81c2c-bb12-4372-8815-6ddc2de56730"
        let rawInput = "head = [1,2,3,4,5], k = 3"
        let expectedOutput = "[3,2,1,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_k = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.reverseKGroup(p_head, p_k)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
