import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var queue: [TreeNode] = [root]
        var index = 0
        while index < queue.count {
            let node = queue[index]
            index += 1
            let temp = node.left
            node.left = node.right
            node.right = temp
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
        return root
    }
}

@Suite struct InvertBinaryTreeTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "b775b775-f721-47c2-807c-4736016df4de"
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
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "ac5557e3-68fc-4509-8ce2-e9560826eefb"
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
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "0af9b98f-31d8-4e0b-8494-14430f3c8067"
        let rawInput = "root = [1,2,3,null,null,4,5]"
        let expectedOutput = "[1,3,2,5,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "a166c69d-371f-4478-9869-e661f9be9a93"
        let rawInput = "root = [1,2,3,4,5,6,7]"
        let expectedOutput = "[1,3,2,7,6,5,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "787f38dd-3c4f-4275-b2f4-a4abe703d3c4"
        let rawInput = "root = [1,-2,3]"
        let expectedOutput = "[1,3,-2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "39751494-553a-44dc-8519-37666a97cb18"
        let rawInput = "root = [1,2,2]"
        let expectedOutput = "[1,2,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "2b42c2af-e50a-41ae-8b1e-4c48a718c1b5"
        let rawInput = "root = [1,2,3,4,4,5,6]"
        let expectedOutput = "[1,3,2,6,5,4,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "c3483940-33ca-4325-a82e-4437c9b677eb"
        let rawInput = "root = [10,20,30,40,50,60,70]"
        let expectedOutput = "[10,30,20,70,60,50,40]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "abfd2c4b-01e5-4e43-aa16-8bd3f1e6605d"
        let rawInput = "root = [1,null,null]"
        let expectedOutput = "[1,null,null]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "62288119-c69b-40b8-9969-9ae5c7492543"
        let rawInput = "root = [1,2,3,4,5,6,7,null]"
        let expectedOutput = "[1,3,2,7,6,5,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "7c870023-08ac-4272-9ceb-4d20244535d9"
        let rawInput = "root = [1,2,3,4,5,6,7,null,null]"
        let expectedOutput = "[1,3,2,7,6,5,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "62c1a234-6cd8-4048-8cb0-5c3685669304"
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
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "908d7787-8acd-4f62-b502-1cb87b1a4cd5"
        let rawInput = "root = [1,null,2]"
        let expectedOutput = "[1,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "be3fac32-c0cf-40ea-ab30-bede6b3c2851"
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
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "77dbb392-4498-4d58-b2d7-a0e7a6d21982"
        let rawInput = "root = [1,2,3,null,4]"
        let expectedOutput = "[1,3,2,null,null,4,null]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "0f633525-cf8c-4f13-b89c-4a1a41cde813"
        let rawInput = "root = [1,2,3,4,null,5]"
        let expectedOutput = "[1,3,2,null,5,4,null]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "195531ef-6c54-4e0a-a7c0-37e5e2f1bd0c"
        let rawInput = "root = [1,2,3,4,5,null,6]"
        let expectedOutput = "[1,3,2,6,null,5,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "3820327b-cbdc-4614-9fda-9b409a81fad5"
        let rawInput = "root = [1,2,3,4,5,6,null]"
        let expectedOutput = "[1,3,2,null,6,5,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "5af60cf4-1346-4cd4-8460-1c2c3a12d0c3"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9]"
        let expectedOutput = "[1,3,2,7,6,5,4,null,null,null,null,null,null,9,8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "a708b599-1c38-4a02-a170-080f53940397"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "[1,3,2,7,6,5,4,null,null,null,10,null,9,null,8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "23564db8-a902-4f39-86e1-dbea18035dba"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,null,null,null,null]"
        let expectedOutput = "[1,3,2,7,6,5,4,null,null,9,8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "55dc0dc0-8fe1-4b47-9c31-146636464d78"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,null,null,null,null,null]"
        let expectedOutput = "[1,3,2,7,6,5,4,null,10,9,8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "16d4c342-e75a-43c7-8e71-413d6ef24dd9"
        let rawInput = "root = [5,3,6,2,4,null,null,1]"
        let expectedOutput = "[5,6,3,null,null,4,2,null,null,null,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "cd21b1ed-6aea-4fcd-b447-35b971ef4dce"
        let rawInput = "root = [4,2,7,1,3,6,9]"
        let expectedOutput = "[4,7,2,9,6,3,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "invert-binary-tree"
        let topic = "trees"
        let testId = "f73eef69-be32-4b58-aad3-7178732f1725"
        let rawInput = "root = [2,1,3]"
        let expectedOutput = "[2,3,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.invertTree(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
