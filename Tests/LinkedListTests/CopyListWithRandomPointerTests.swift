import Foundation
import Testing
@testable import LeetCodeHelpers

private typealias Node = RandomNode

private class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard head != nil else { return nil }

        // Phase 1: Insert copies after originals
        var curr = head
        while let node = curr {
            let copy = Node(node.val)
            copy.next = node.next
            node.next = copy
            curr = copy.next
        }

        // Phase 2: Set random pointers
        curr = head
        while let node = curr {
            let copy = node.next
            copy?.random = node.random?.next  // Random's copy is right after random
            curr = copy?.next
        }

        // Phase 3: Separate lists
        let dummy = Node(0)
        var copyTail = dummy
        curr = head
        while let node = curr {
            let copy = node.next!
            let nextOrig = copy.next

            // Extract copy
            copyTail.next = copy
            copyTail = copy

            // Restore original
            node.next = nextOrig
            curr = nextOrig
        }

        return dummy.next
    }
}

@Suite struct CopyListWithRandomPointerTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "68691F6A-DCE3-4C3D-8B5F-E9A34A320F73"
        let rawInput = "[[7,null],[13,0],[11,4],[10,2],[1,0]]"
        let expectedOutput = "[[7,null],[13,0],[11,4],[10,2],[1,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "307978D5-F0F8-4A98-8F7D-B7BE4FC0589F"
        let rawInput = "[[1,null]]"
        let expectedOutput = "[[1,null]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "CE44A648-82EE-485C-B527-5BAFE759B04C"
        let rawInput = "[[1,0]]"
        let expectedOutput = "[[1,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "5DD16B44-F195-4CF9-8CF3-283ABD7661CB"
        let rawInput = "[[1,1],[2,0]]"
        let expectedOutput = "[[1,1],[2,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "A1C3C0F2-5397-40C8-8A54-6A0488521120"
        let rawInput = "[[1,1],[2,1],[3,0]]"
        let expectedOutput = "[[1,1],[2,1],[3,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "FC040F1A-990A-46D5-B9FA-01EBF295A875"
        let rawInput = "[[1,2],[2,0],[3,1]]"
        let expectedOutput = "[[1,2],[2,0],[3,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "59D3E68A-3137-4528-B412-12CD22A591C4"
        let rawInput = "[[1,0],[2,0],[3,0]]"
        let expectedOutput = "[[1,0],[2,0],[3,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "81D4A608-052E-45C6-A05D-1D7FB74F0C34"
        let rawInput = "[[1,0],[1,0],[1,0]]"
        let expectedOutput = "[[1,0],[1,0],[1,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "84A7C9EE-4D06-4321-BA1F-B37BF8135F09"
        let rawInput = "[[0,null],[1,null],[2,null]]"
        let expectedOutput = "[[0,null],[1,null],[2,null]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "32446074-E601-49ED-A1DA-0C7D7705059F"
        let rawInput = "[[0,2],[1,1],[2,0]]"
        let expectedOutput = "[[0,2],[1,1],[2,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "8B4BACFA-9052-44DA-B175-984985CE4C90"
        let rawInput = "[[1,null],[2,null],[3,null],[4,null],[5,null]]"
        let expectedOutput = "[[1,null],[2,null],[3,null],[4,null],[5,null]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "C666E998-0357-45E6-82C1-D55F63534013"
        let rawInput = "[[1,4],[2,3],[3,2],[4,1],[5,0]]"
        let expectedOutput = "[[1,4],[2,3],[3,2],[4,1],[5,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "309EB43D-02D7-4220-B0B6-F0D059988E47"
        let rawInput = "[[1,0],[2,1],[3,2],[4,3],[5,4]]"
        let expectedOutput = "[[1,0],[2,1],[3,2],[4,3],[5,4]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "7D711557-81B1-47B3-B43F-9ABA55967BD5"
        let rawInput = "[[1,1],[2,0],[3,2],[4,1],[5,3]]"
        let expectedOutput = "[[1,1],[2,0],[3,2],[4,1],[5,3]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "C39AEB43-855B-4403-A0E4-2E1F1CA54E6A"
        let rawInput = "[[1,2],[2,3],[3,4],[4,0],[5,1]]"
        let expectedOutput = "[[1,2],[2,3],[3,4],[4,0],[5,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "036F5908-F179-4203-BB3E-96D22F0E6B83"
        let rawInput = "[[1,3],[2,4],[3,1],[4,2],[5,0]]"
        let expectedOutput = "[[1,3],[2,4],[3,1],[4,2],[5,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "8A610C8A-53F9-4F1B-98A0-A833F43C94BB"
        let rawInput = "[[1,4],[2,4],[3,4],[4,4],[5,4]]"
        let expectedOutput = "[[1,4],[2,4],[3,4],[4,4],[5,4]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "E0A1A53E-A287-4FFD-9DB7-F2E40CC1FDB1"
        let rawInput = "[[1,0],[1,1],[1,2],[1,3],[1,4]]"
        let expectedOutput = "[[1,0],[1,1],[1,2],[1,3],[1,4]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "060C7169-55F7-48A7-A013-EC432BA67E1D"
        let rawInput = "[[1,4],[1,3],[1,2],[1,1],[1,0]]"
        let expectedOutput = "[[1,4],[1,3],[1,2],[1,1],[1,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "65AC530E-5223-475E-8F52-243FDE96E49F"
        let rawInput = "[[1,2],[2,1],[3,3],[4,2],[5,1]]"
        let expectedOutput = "[[1,2],[2,1],[3,3],[4,2],[5,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "97123C05-8A2D-45ED-8A34-C265D79E6824"
        let rawInput = "[[1,0],[2,1],[3,0],[4,1],[5,0]]"
        let expectedOutput = "[[1,0],[2,1],[3,0],[4,1],[5,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "8A742F2B-CD7D-4D6B-9A56-4501795B193A"
        let rawInput = "[[1,-1]]"
        let expectedOutput = "[[1,-1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "A36FCE0C-1654-4AFD-897F-F34A46E6FE87"
        let rawInput = "[[0,0]]"
        let expectedOutput = "[[0,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "48A9AED7-359B-4DD6-ACE0-CD381FD77F78"
        let rawInput = "[[1,0],[2,0]]"
        let expectedOutput = "[[1,0],[2,0]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "copy-list-with-random-pointer"
        let topic = "linked-list"
        let testId = "B109D77A-BABD-4D86-83B2-16947682C5F4"
        let rawInput = "[[1,1],[2,1]]"
        let expectedOutput = "[[1,1],[2,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_head = buildRandomList(InputParser.parse2DIntArray(params[0]).map { $0.map { $0 == -1 ? nil : $0 } as [Int?] })

        let solution = Solution()
        let result = solution.copyRandomList(p_head)
        let computedOutput = serializeRandomList(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
