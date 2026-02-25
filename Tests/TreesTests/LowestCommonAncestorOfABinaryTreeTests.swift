import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        if root === p || root === q { return root }
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        if left != nil && right != nil { return root }
        return left ?? right
    }
}

@Suite struct LowestCommonAncestorOfABinaryTreeTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "a5aea984-009a-43a6-b811-7df20a02a8b9"
        let rawInput = "root = []"
        let expectedOutput = "None"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "acc63703-7d89-4cad-83f0-0db31ab12730"
        let rawInput = "root = [1,2,3]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "880d5f01-ebc7-4c25-88f0-04f52f58e071"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "2974b0b4-2bd6-468f-a3c4-d3e01422d19a"
        let rawInput = "root = [1,-2,3]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "2d2e67a9-8291-4967-89da-d0fb7e581e8b"
        let rawInput = "root = [1,1,1]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "ad1aae4b-5380-4457-a06d-ae0a09c7be58"
        let rawInput = "root = [1,2,3,4,4,4,4]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "8940de76-a19c-4c42-96d8-543394f64dc4"
        let rawInput = "root = [1,2,3,4,5,6,7,null,null,null,null,null,null,8]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "bbe6b339-8a8d-4d16-980e-6b03be5e5d65"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "2994239b-2d66-44ea-a4f0-2a538416d3d2"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "e55cc585-2ec3-4b9c-81ed-14e276c6db4b"
        let rawInput = "root = [1,2]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "52f8698a-52b9-4f49-a967-56db25f74dab"
        let rawInput = "root = [1,null,2]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "b96d60e9-4e71-477e-bbac-24411dbaa3ef"
        let rawInput = "root = [1,2,3,null,null,4,5]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "7bb59c1a-7f14-4d33-b0f4-f0e8e73822f7"
        let rawInput = "root = [1,null,2,null,3]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "61d5af66-d9a7-4a99-b4ca-70fd1e10b382"
        let rawInput = "root = [1,2,3,4,5,6,7]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "43ce172c-da30-47e6-8ce4-29a34dc37734"
        let rawInput = "root = [1,null,2,null,3,null,4]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "b721881f-926f-4758-a473-ddc1bb621402"
        let rawInput = "root = [1,2,3,-4,5,-6,7]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "2f9f041d-a3fd-4f36-81ae-ae712fbcfd17"
        let rawInput = "root = [1,1,1,1,1,1,1]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "ddd36647-bcf6-42c4-a575-2a1ea236bbdc"
        let rawInput = "root = [1]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "24c4a02c-2702-455c-94c8-7bead67d90bc"
        let rawInput = "root = [1,null,null]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "56f9c35a-84c1-42da-9214-9551c3c560ca"
        let rawInput = "root = [1,2,null,4]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "a473e72d-6d4f-4b19-a0b3-6802f20a1489"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "2f748ef0-fd5d-4d39-9c15-e988b251684e"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "6f808a09-fe63-4bf6-a228-b17eff8e1fe8"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "0c359b7b-5c12-48b2-b41d-ffb282fb1e5b"
        let rawInput = "root = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "lowest-common-ancestor-of-a-binary-tree"
        let topic = "trees"
        let testId = "d62c5c1a-5681-4c6a-ad0b-a661cc07bcee"
        let rawInput = "root = [1,2,null,null,null]"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_p = buildTree(InputParser.parseNullableIntArray(params[1]))
        let p_q = buildTree(InputParser.parseNullableIntArray(params[2]))

        let solution = Solution()
        let result = solution.lowestCommonAncestor(p_root, p_p, p_q)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
