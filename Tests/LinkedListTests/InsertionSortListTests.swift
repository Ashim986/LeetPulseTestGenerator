import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var curr = head
        while curr != nil {
            let next = curr?.next
            var prev = dummy
            while prev.next != nil && prev.next!.val < curr!.val {
                prev = prev.next!
            }
            curr?.next = prev.next
            prev.next = curr
            curr = next
        }
        return dummy.next
    }
}

@Suite struct InsertionSortListTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "e51777ae-dbc4-4714-90a9-a70393f98fd4"
        let rawInput = "head = []"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "cada5a59-f55c-4bce-842e-26e12bea7711"
        let rawInput = "head = [1]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "bfbddadb-e59b-4ec2-a961-382c263370d3"
        let rawInput = "head = [5,4,3,2,1]"
        let expectedOutput = "[1, 2, 3, 4, 5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "e55d907d-d090-487b-8748-a5f6f15cb07b"
        let rawInput = "head = [-5,-4,-3,-2,-1]"
        let expectedOutput = "[-5, -4, -3, -2, -1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "dcf77272-981a-42db-90e3-f83d55d8750f"
        let rawInput = "head = [1,1,1,1,1]"
        let expectedOutput = "[1, 1, 1, 1, 1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "b1f71070-d93c-4f6c-9b47-07eb0f3f1740"
        let rawInput = "head = [10,9,8,7,6,5,4,3,2,1]"
        let expectedOutput = "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "7250397a-d07b-49af-964a-c2900d54d8f2"
        let rawInput = "head = [1,3,5,7,9]"
        let expectedOutput = "[1, 3, 5, 7, 9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "492933f2-9487-4b7f-b21b-c40320d564b0"
        let rawInput = "head = [2,4,6,8,10]"
        let expectedOutput = "[2, 4, 6, 8, 10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "4911abcd-70fc-43aa-8df9-08cec6bcae48"
        let rawInput = "head = [-10,-8,-6,-4,-2]"
        let expectedOutput = "[-10, -8, -6, -4, -2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "ddce281e-2805-41be-905d-54f48228604e"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12]"
        let expectedOutput = "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "270c6c74-561e-4659-a9b0-21547cdda317"
        let rawInput = "head = [12,11,10,9,8,7,6,5,4,3,2,1]"
        let expectedOutput = "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "d035f245-9428-4957-9232-55684f10edc5"
        let rawInput = "head = [1,3,5,7,9,2,4,6,8,10]"
        let expectedOutput = "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "251e761f-49a4-4f63-a8f5-142306868685"
        let rawInput = "head = [5,1,3,2,4]"
        let expectedOutput = "[1, 2, 3, 4, 5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "3ebf37b1-4ad8-44f3-9bc0-f2239c46c9ee"
        let rawInput = "head = [10,1,5,3,2,8,6,4,9,7]"
        let expectedOutput = "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "7bc297cb-b446-4a37-ad0a-d6c75bd8c755"
        let rawInput = "head = [1,1,2,2,3,3,4,4,5,5]"
        let expectedOutput = "[1, 1, 2, 2, 3, 3, 4, 4, 5, 5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "3444f11d-363b-4e99-9e1d-98eff208602f"
        let rawInput = "head = [-1,-2,-3,-4,-5]"
        let expectedOutput = "[-5, -4, -3, -2, -1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "0a56f6c0-6b0c-4013-9fab-e564ea9e6565"
        let rawInput = "head = [0,0,0,0,0]"
        let expectedOutput = "[0, 0, 0, 0, 0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "f9a11af1-7cbf-466e-9f0e-19bd987795ef"
        let rawInput = "head = [1,-1,1,-1,1,-1]"
        let expectedOutput = "[-1, -1, -1, 1, 1, 1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "7e10168a-3cbf-4f24-8d52-b82936465991"
        let rawInput = "head = [10,-10,20,-20,30,-30]"
        let expectedOutput = "[-30, -20, -10, 10, 20, 30]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "e32898a6-7205-4246-88a2-548c85a1aa96"
        let rawInput = "head = [5,10,15,20,25]"
        let expectedOutput = "[5, 10, 15, 20, 25]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "0201db49-7b83-4712-8d3f-5ca35801b8a5"
        let rawInput = "head = [25,20,15,10,5]"
        let expectedOutput = "[5, 10, 15, 20, 25]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "3cc4d902-c506-4751-8f79-513dd561d3ad"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9]"
        let expectedOutput = "[1, 2, 3, 4, 5, 6, 7, 8, 9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "ae2e3565-4cf6-4e68-b9fd-6f21b4a1cfa0"
        let rawInput = "head = [9,8,7,6,5,4,3,2,1]"
        let expectedOutput = "[1, 2, 3, 4, 5, 6, 7, 8, 9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "00164002-e3e7-4c41-a21f-56558d969052"
        let rawInput = "head = [1,3,5,7,9,11,13,15]"
        let expectedOutput = "[1, 3, 5, 7, 9, 11, 13, 15]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "insertion-sort-list"
        let topic = "linked-list"
        let testId = "0e6cb27f-c2ea-4020-9439-e5ad0af57a3b"
        let rawInput = "head = [15,13,11,9,7,5,3,1]"
        let expectedOutput = "[1, 3, 5, 7, 9, 11, 13, 15]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.insertionSortList(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
