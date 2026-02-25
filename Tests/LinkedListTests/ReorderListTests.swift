import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func reorderList(_ head: ListNode?) {
        guard let head = head else { return }

        // Push all nodes to stack
        var stack: [ListNode] = []
        var node: ListNode? = head
        while let n = node {
            stack.append(n)
            node = n.next
        }

        let count = stack.count
        var curr: ListNode? = head

        // Interleave n/2 nodes from the end
        for _ in 0..<(count / 2) {
            let end = stack.removeLast()
            let next = curr?.next
            curr?.next = end
            end.next = next
            curr = next
        }

        // Terminate the list
        curr?.next = nil
    }
}

@Suite struct ReorderListTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "f29d97f5-fe3a-4247-9bc2-9a831531d42b"
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
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "da5210eb-3fd7-4015-84c9-4b465a770486"
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
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "80078658-97f1-48ff-a41f-4ce010386db2"
        let rawInput = "head = [1,2]"
        let expectedOutput = "[1, 2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "3f94c29f-9ecd-4f04-8158-01cf1b287d27"
        let rawInput = "head = [1,2,3,4,5,6]"
        let expectedOutput = "[1, 6, 2, 5, 3, 4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "34afb59c-fb85-45e6-9514-69e3371b9d5a"
        let rawInput = "head = [-1,-2,-3,-4,-5]"
        let expectedOutput = "[-1, -5, -2, -4, -3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "aba61633-0fe0-409d-ab81-c8564cff039f"
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
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "d2ac2973-234b-4dc2-a5b0-e1de8d86ba79"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "[1, 10, 2, 9, 3, 8, 4, 7, 5, 6]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "18f29e68-78bc-4a45-9b74-f19fe892b649"
        let rawInput = "head = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]"
        let expectedOutput = "[-10, -1, -9, -2, -8, -3, -7, -4, -6, -5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "5a0efb09-3ef1-4b63-828e-a364069a5d43"
        let rawInput = "head = [1,1,1,1,1,1,1,1,1,1]"
        let expectedOutput = "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "44099081-bc47-4219-b204-f903d4fc9fa0"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11]"
        let expectedOutput = "[1, 11, 2, 10, 3, 9, 4, 8, 5, 7, 6]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "8406e538-53ca-44cb-865a-3174fd38975f"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12]"
        let expectedOutput = "[1, 12, 2, 11, 3, 10, 4, 9, 5, 8, 6, 7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "5cf74648-33e9-4776-b619-61bf9f8c64a7"
        let rawInput = "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]"
        let expectedOutput = "[-1, -10, -2, -9, -3, -8, -4, -7, -5, -6]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "292bc9e3-da63-4cd6-9614-078082db2c39"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13]"
        let expectedOutput = "[1, 13, 2, 12, 3, 11, 4, 10, 5, 9, 6, 8, 7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "f1234a63-5362-49ac-ad67-456b055470aa"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]"
        let expectedOutput = "[1, 14, 2, 13, 3, 12, 4, 11, 5, 10, 6, 9, 7, 8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "438a742b-644a-486b-a832-a3c1d56b417c"
        let rawInput = "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12]"
        let expectedOutput = "[-1, -12, -2, -11, -3, -10, -4, -9, -5, -8, -6, -7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "4e49a3af-d8a2-4451-9391-a1bb95401d9f"
        let rawInput = "head = [1,1,1,1,1,1,1,1,1,1,1,1]"
        let expectedOutput = "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "738cee5a-f425-4d41-95a4-f0dbf3d46272"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
        let expectedOutput = "[1, 15, 2, 14, 3, 13, 4, 12, 5, 11, 6, 10, 7, 9, 8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "d723d821-a89b-4f93-9ecf-75b829fa1c77"
        let rawInput = "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14]"
        let expectedOutput = "[-1, -14, -2, -13, -3, -12, -4, -11, -5, -10, -6, -9, -7, -8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "e317a842-ae4e-412b-88cd-6afb45f24027"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]"
        let expectedOutput = "[1, 16, 2, 15, 3, 14, 4, 13, 5, 12, 6, 11, 7, 10, 8, 9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "38c751cb-91b5-4824-a574-011b5e55af3a"
        let rawInput = "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15]"
        let expectedOutput = "[-1, -15, -2, -14, -3, -13, -4, -12, -5, -11, -6, -10, -7, -9, -8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "81315a3c-b0e6-4c48-93f8-fdadf7254c7c"
        let rawInput = "head = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]"
        let expectedOutput = "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "8c067d9c-aa0b-4cde-bba6-625b48830822"
        let rawInput = "head = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]"
        let expectedOutput = "[1, 21, 2, 20, 3, 19, 4, 18, 5, 17, 6, 16, 7, 15, 8, 14, 9, 13, 10, 12, 11]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "85e4d086-2e53-4d30-9201-90ed3d82277e"
        let rawInput = "head = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20]"
        let expectedOutput = "[-1, -20, -2, -19, -3, -18, -4, -17, -5, -16, -6, -15, -7, -14, -8, -13, -9, -12, -10, -11]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "2bcb0dcf-3a80-4683-8347-118b81a2e5a0"
        let rawInput = "head = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]"
        let expectedOutput = "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "reorder-list"
        let topic = "linked-list"
        let testId = "10daa34a-d0d6-4b9e-b6a8-8a35e1821208"
        let rawInput = "head = [1,2,3,4]"
        let expectedOutput = "[1,4,2,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildList(InputParser.parseIntArray(params[0]))

        let solution = Solution()
        solution.reorderList(p_head)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
