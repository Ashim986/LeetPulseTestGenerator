import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var slow: ListNode? = dummy
        var fast: ListNode? = head

        while fast != nil && fast?.next != nil {
            if fast?.val == fast?.next?.val {
                let val = fast?.val
                while fast != nil && fast?.val == val {
                    fast = fast?.next
                }
                slow?.next = fast
            } else {
                slow = slow?.next
                fast = fast?.next
            }
        }
        return dummy.next
    }
}

@Suite struct RemoveDuplicatesFromSortedListIiTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "114b296c-bee4-4d5d-97f6-ac67c1d2977d"
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
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "7c16f26d-5abb-4f79-9727-b32259b6b1fd"
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
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "fda81d73-7101-47ff-8b2d-66026fb83396"
        let rawInput = "head = [1,1]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "552975d7-00bd-4adb-91ee-06d65f7fbbfd"
        let rawInput = "head = [1,2,3,4,5,6]"
        let expectedOutput = "[1,2,3,4,5,6]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "f173247b-0c72-41c7-9b3e-1efab299b54e"
        let rawInput = "head = [1,1,1,1,1]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "30da08c8-61fc-4d09-954e-c6068a303d35"
        let rawInput = "head = [1,2,2,3,3,4,4,5,5]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "88dad7a9-05d8-45d8-b5ee-347164314282"
        let rawInput = "head = [-1,-1,-2,-2,-3,-3]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "76ee9b67-2c18-4b1c-ad05-0e0c34eb1c8c"
        let rawInput = "head = [1,1,2,2,3,3,4,4,5,5]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "8db4e4ff-d243-4b59-981f-71c9c94c8d57"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "a929a3cd-8ed1-49dc-b481-a8a27e1c9c3e"
        let rawInput = "head = [10,10,10,10,10]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "f18651a7-c77d-4bb5-a26f-5e9a9b303823"
        let rawInput = "head = [1,1,2,3,3,4,5,5]"
        let expectedOutput = "[2,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "fec1c144-1134-4d65-bfcc-72e2d83e085a"
        let rawInput = "head = [1,2,2,3,4,4,5,6,6]"
        let expectedOutput = "[1,3,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "f8513ecb-0849-4f62-92b6-9203dd6947bf"
        let rawInput = "head = [1,1,2,2,3,3,4,4,5,5,6,6]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "2068e17c-18a6-4c9c-b69e-e555749ce404"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,10]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "6f8040bb-6417-4043-8c68-419423bc4314"
        let rawInput = "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "1118069e-91b3-4fb1-aa8c-6666dd6b0d42"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,11]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "93c6e05a-0387-4684-86f1-60d9845faae9"
        let rawInput = "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "002b4731-3483-4847-9d0a-cc7a091c2c59"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,12]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "0cefe0a0-be67-4115-bb4d-9f7dbe6a4d6d"
        let rawInput = "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "c99a194e-f017-42b7-bf71-7e5fc38aa09f"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,13]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "230dfa85-b51d-4345-8b48-d4c860c8572b"
        let rawInput = "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "7fa83f30-4152-463b-905c-ba0fcfa5465e"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,14]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12,13]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "bea6d99b-11b7-4dad-bbef-618859579255"
        let rawInput = "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "3203c2e7-79bd-4118-bc88-220b7014ef96"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,15]"
        let expectedOutput = "[1,2,3,4,5,6,7,8,9,10,11,12,13,14]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "remove-duplicates-from-sorted-list-ii"
        let topic = "linked-list"
        let testId = "15da80a1-8bf8-467d-80fe-6da8a091199d"
        let rawInput = "head = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12]"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        let result = solution.deleteDuplicates(p_head)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
