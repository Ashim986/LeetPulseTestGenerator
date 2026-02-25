import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // First pass: count length
        var length = 0
        var node = head
        while node != nil {
            length += 1
            node = node?.next
        }

        let dummy = ListNode(0)
        dummy.next = head

        // Find predecessor of target (at position length - n - 1 from dummy)
        var curr: ListNode? = dummy
        for _ in 0..<(length - n) {
            curr = curr?.next
        }

        // Skip target
        curr?.next = curr?.next?.next

        return dummy.next
    }
}

@Suite struct RemoveNthNodeFromEndOfListTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "E58917A0-BE4B-4A78-9FF2-D4334A9AF739"
        let rawInput = "[]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "E7F896C6-4FD4-48E3-ACE7-8845934B9754"
        let rawInput = "[1]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "21EC9A4F-CFEE-4AF6-8347-218D47C1DAEE"
        let rawInput = "[1,2]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "DE4A1793-6B32-4CC7-92CA-854A0498C906"
        let rawInput = "[[1,2,3,4,5], 2]"
        let expectedOutput = "[1,2,3,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "FBD438E4-6898-4B47-A4F7-2DEEAD7F1B75"
        let rawInput = "[[1], 1]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "D6FFD945-83DC-451A-8579-59D5CB83E638"
        let rawInput = "[[1,2], 1]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "6185E209-B6DC-4036-80B5-EC13FDB0CB8C"
        let rawInput = "[[1,2,3,4,5], 1]"
        let expectedOutput = "[1,2,3,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "93FFE814-3999-49DB-9A8E-607461DCCB6F"
        let rawInput = "[[], 1]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "36E02958-822D-44A7-9F1A-3C3CA957871E"
        let rawInput = "[[1,2,3], 3]"
        let expectedOutput = "[2,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "388494e0-7f31-444e-a683-04d9c3126e05"
        let rawInput = "head = [5]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "6c6a36da-3d60-48d3-9997-415f9ef156f1"
        let rawInput = "head = [1,1,1,1,1]"
        let expectedOutput = "[1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "82e05c0f-40c0-4d41-bd53-dd1b73358ff8"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "8ca0f604-fe47-4b88-9276-69c1f4777534"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9]"
        let expectedOutput = "[1,2,3,4,5,6,7,8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "f34ce2b1-8a0c-465b-8a3d-c9004439cd1f"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "65a63a65-4575-4e7b-9165-79ba78df043a"
        let rawInput = "head = []"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "d40b4e5a-d23e-4c62-b88f-e58315326528"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,30]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "26B4BA7D-CC1D-4A5C-B9F2-7BAAAC917E5B"
        let rawInput = "[1,2,3,4,5]"
        let expectedOutput = "[1,2,3,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "5AA5B1FA-9C13-4F25-B5CC-B6622844E324"
        let rawInput = "[1,2,3]"
        let expectedOutput = "[1,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "AA2FBD68-9C2D-4653-9D46-C6D0F7FE7C80"
        let rawInput = "[1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "E4D9C248-4121-4D26-879D-947F54F7F577"
        let rawInput = "[[1,2], 2]"
        let expectedOutput = "[2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "22d287bc-2f8e-45fe-9815-a047544bda6d"
        let rawInput = "head = [1,2,3,4,5,6]"
        let expectedOutput = "[1,2,3,4,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "ef836b23-3b6d-4633-a684-3692acd440bb"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "9b2f15f6-5f97-41c2-85f3-5f0655a3f719"
        let rawInput = "head = [-1,-2,-3,-4,-5]"
        let expectedOutput = "[-1,-2,-3,-4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "a60399e1-81a9-4376-a249-e0f435c34594"
        let rawInput = "head = [1,2,3,4,5,6,7]"
        let expectedOutput = "[1,2,3,4,5,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "remove-nth-node-from-end-of-list"
        let topic = "linked-list"
        let testId = "8a0d5177-3cac-4e83-bae8-f2c69237bbae"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12,13,15]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))
        let p_n = InputParser.parseInt(params[1])

        let solution = Solution()
        let result = solution.removeNthFromEnd(p_head, p_n)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
