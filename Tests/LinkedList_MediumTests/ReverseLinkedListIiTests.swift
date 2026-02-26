import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil || left == right { return head }
        let dummy = ListNode(0)
        dummy.next = head
        var pre: ListNode? = dummy

        var pos = 1
        while pos < left {
            pre = pre?.next
            pos += 1
        }

        let start = pre?.next
        var then = start?.next
        var i = 0
        while i < right - left {
            start?.next = then?.next
            then?.next = pre?.next
            pre?.next = then
            then = start?.next
            i += 1
        }

        return dummy.next
    }
}

@Suite struct ReverseLinkedListIiTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "6552374C-8FE8-45FA-B301-AF1AFFAB5E46"
        let rawInput = "[1,2,3,4,5]\n1\n3"
        let expectedOutput = "[3,2,1,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "0795F064-FEA8-4633-B86A-BDFD4B5DFC4D"
        let rawInput = "[5]"
        let expectedOutput = "[5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_2() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "3A9B961C-1FC1-42A0-BA5C-A848AD584992"
        let rawInput = "[1,2]\n1\n1"
        let expectedOutput = "[1,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_3() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "1B5F8741-F3C5-4DB7-A682-DDD2C1D62805"
        let rawInput = "[1,2,3,4,5]\n1\n5"
        let expectedOutput = "[5,4,3,2,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_4() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "05C23E4A-A190-45C5-A378-3A9F883CC9B2"
        let rawInput = "[1,2]\n2\n2"
        let expectedOutput = "[1,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_5() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "2359C0ED-8C1F-479D-8370-F11F47CCE55F"
        let rawInput = "[5]\n1\n1"
        let expectedOutput = "[5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_6() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "2BFD9E3C-79FC-408E-9727-68DD015B487E"
        let rawInput = "[1,2,3,4,5]\n2\n4"
        let expectedOutput = "[1,4,3,2,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_7() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "B4AD86AE-A788-415D-91CF-0B7AA85C9B05"
        let rawInput = "[1,2,3,4,5]\n1\n2"
        let expectedOutput = "[2,1,3,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_8() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "BA247A60-5578-46ED-8C17-8B5B15AC35D9"
        let rawInput = "[1,2,3,4,5]\n4\n5"
        let expectedOutput = "[1,2,3,5,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_9() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "5DDC8208-83DF-4AD2-807D-62846EA26086"
        let rawInput = "[1,1,1,1]\n1\n4"
        let expectedOutput = "[1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_10() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "DE1102D8-DB4E-4B5D-8F15-CC5F47BA940F"
        let rawInput = "[1,1,1,1]\n2\n3"
        let expectedOutput = "[1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_11() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "4B7227CF-3435-4AE0-AD1D-F9C50715D78D"
        let rawInput = "[-1,-2,-3,-4,-5]\n1\n5"
        let expectedOutput = "[-5,-4,-3,-2,-1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_12() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "86F08AA0-2CB7-4207-8C57-4E1899F4A6AB"
        let rawInput = "[1,-2,3,-4,5]\n1\n2"
        let expectedOutput = "[-2,1,3,-4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_13() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "D54F5825-7086-4504-9170-633FB5A294A6"
        let rawInput = "[1,2,3,4,5]\n5\n5"
        let expectedOutput = "[1,2,3,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_14() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "604D6A9A-7EF0-4E14-9416-3D83B5EA1EC2"
        let rawInput = "[1,2,3,4,5]\n3\n3"
        let expectedOutput = "[1,2,3,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_15() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "17F67BAD-9D7A-4933-A965-E15A99BADDD6"
        let rawInput = "[1,1,1,1,1]\n1\n5"
        let expectedOutput = "[1,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_16() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "46491355-AD14-415E-BE4C-4BA6DB1DF555"
        let rawInput = "[1,2,3,4,5]\n1\n1"
        let expectedOutput = "[1,2,3,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_17() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "FCE602BC-89AC-4E34-B94B-35980B127129"
        let rawInput = "[1,2,3,4,5]\n4\n4"
        let expectedOutput = "[1,2,3,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_18() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "656FDA94-C4A5-40F9-BFAC-2F99057EB911"
        let rawInput = "[1,-1,2,-2,3,-3]\n1\n6"
        let expectedOutput = "[-3,3,-2,2,-1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_19() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "92C42241-41DD-448D-9FA1-15072B8D0F3D"
        let rawInput = "[1,2,3,4,5,6,7,8,9,10]\n5\n6"
        let expectedOutput = "[1,2,3,4,6,5,7,8,9,10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_20() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "8FE00FA7-F73B-4DEF-94D6-D4E05CA85038"
        let rawInput = "[10,9,8,7,6,5,4,3,2,1]\n1\n10"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_21() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "84B21292-4C7D-4982-BA8D-E45F88373240"
        let rawInput = "[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]\n1\n10"
        let expectedOutput = "[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_22() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "3733B35B-E3AC-40A6-994A-209EAE31BAD0"
        let rawInput = "[1,2,3,4,5,6,7,8,9,10]\n1\n10"
        let expectedOutput = "[10,9,8,7,6,5,4,3,2,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_23() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "8560C668-E648-4F27-912D-473ACA3DA1ED"
        let rawInput = "[1,-1,1,-1,1,-1,1,-1,1,-1]\n1\n10"
        let expectedOutput = "[1,-1,1,-1,1,-1,1,-1,1,-1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_24() async {
        let slug = "reverse-linked-list-ii"
        let topic = "linked-list"
        let testId = "75031C8D-9EBF-45A6-97E4-78F9237001B3"
        let rawInput = "[1,2,3,4,5]\n6\n6"
        let expectedOutput = "[1,2,3,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        guard let p_head = InputParser.parseIntArray(params[0]).map { buildList($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as ListNode?: '\(params[0])'")
            return
        }
        guard let p_left = InputParser.parseInt(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
            return
        }
        guard let p_right = InputParser.parseInt(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as Int: '\(params[2])'")
            return
        }

        // Constraint precondition checks
        guard p_left >= -500 && p_left <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: -500 <= Node.val <= 500")
            return
        }
        guard p_left >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }
        guard p_right >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= left <= right <= n")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.reverseBetween(p_head, p_left, p_right)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical list format
            // Normalization: linked list arrow format (1->2->3) converted to [1,2,3]
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
