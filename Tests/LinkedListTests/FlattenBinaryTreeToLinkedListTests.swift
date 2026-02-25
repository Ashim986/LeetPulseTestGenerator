import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func flatten(_ root: TreeNode?) {
        var curr = root
        while curr != nil {
            if curr?.left != nil {
                var rightmost = curr?.left
                while rightmost?.right != nil {
                    rightmost = rightmost?.right
                }
                rightmost?.right = curr?.right
                curr?.right = curr?.left
                curr?.left = nil
            }
            curr = curr?.right
        }
    }
}

@Suite struct FlattenBinaryTreeToLinkedListTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "ccecbbdc-8a10-43e5-8248-42ee3150e894"
        let rawInput = "root = []"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "0f4c8ed4-643d-4731-ac36-7748a190d3c5"
        let rawInput = "root = [1]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "8f00bef0-89c3-4787-b0c0-598cc679f244"
        let rawInput = "root = [1,2]"
        let expectedOutput = "[1,null,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "0b4ec906-be49-4dac-bec9-6f39abea5492"
        let rawInput = "root = [1,null,2]"
        let expectedOutput = "[1,null,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "96749234-072c-4417-8e46-92bffd49419a"
        let rawInput = "root = [1,2,3]"
        let expectedOutput = "[1,null,2,null,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "5b68f59d-4c62-439f-864c-dcdb1a013366"
        let rawInput = "root = [1,null,2,3]"
        let expectedOutput = "[1,null,2,null,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "bfd94ed3-3b95-4634-be17-a132404c9edc"
        let rawInput = "root = [1,2,null,3]"
        let expectedOutput = "[1,null,2,null,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "76c4a7c2-3065-4873-9648-a836b0bc0469"
        let rawInput = "root = [1,null,2,null,3]"
        let expectedOutput = "[1,null,2,null,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "4d6605e2-ddd4-400a-8877-ae63af9b52ff"
        let rawInput = "root = [1,2,3,4,5,6,7]"
        let expectedOutput = "[1,null,2,null,4,null,5,null,3,null,6,null,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "8c4c702d-3cb2-48a6-ae5f-f5d7051d8396"
        let rawInput = "root = [1,-2,3,-4,5,-6,7]"
        let expectedOutput = "[1,null,-2,null,-4,null,5,null,3,null,-6,null,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "ab30b037-8cb6-4c6d-a2a0-b53f49e92fb3"
        let rawInput = "root = [1,2,5,3,4,null,6]"
        let expectedOutput = "[1,null,2,null,3,null,4,null,5,null,6]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "flatten-binary-tree-to-linked-list"
        let topic = "linked-list"
        let testId = "6dc1b533-6e18-400f-a97e-5d9ad631ef57"
        let rawInput = "root = [0]"
        let expectedOutput = "[0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        solution.flatten(p_root)
        let computedOutput = OutputSerializer.serializeVoid()

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
