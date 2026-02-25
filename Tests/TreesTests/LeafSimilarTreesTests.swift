import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var stack1: [TreeNode] = [root1!]
        var stack2: [TreeNode] = [root2!]

        while !stack1.isEmpty && !stack2.isEmpty {
            let node1 = stack1.removeLast()
            let node2 = stack2.removeLast()

            if node1.val != node2.val { return false }

            if node1.left == nil && node1.right == nil && node2.left == nil && node2.right == nil {
                if node1.val != node2.val { return false }
                continue
            } else if (node1.left == nil && node1.right != nil) || (node1.left != nil && node1.right == nil) {
                return false
            } else if (node2.left == nil && node2.right != nil) || (node2.left != nil && node2.right == nil) {
                return false
            }

            if node1.left != nil { stack1.append(node1.left!) }
            if node1.right != nil { stack1.append(node1.right!) }
            if node2.left != nil { stack2.append(node2.left!) }
            if node2.right != nil { stack2.append(node2.right!) }
        }

        return stack1.isEmpty && stack2.isEmpty
    }
}

@Suite struct LeafSimilarTreesTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "5636100d-ea18-4525-b1ce-3b012fad674a"
        let rawInput = "root1 = [1], root2 = [1]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "58f64d95-ff23-40fe-8e63-be3b154026e9"
        let rawInput = "root1 = [1], root2 = [2]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "7aaff65b-835d-43bf-8a2f-c340b1b3428b"
        let rawInput = "root1 = [], root2 = []"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "635f7199-f2e0-4771-b16b-22d212544014"
        let rawInput = "root1 = [1,2], root2 = [1,2]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "29c0604f-6a12-4d73-b86d-56c1df56a4d6"
        let rawInput = "root1 = [1,2], root2 = [1,3]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "c232f62b-51c7-4dbb-a489-8ff4d089ba1d"
        let rawInput = "root1 = [1,null,2], root2 = [1,null,2]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "c307dc37-f2b2-46d1-baf4-bf6017ca3be4"
        let rawInput = "root1 = [1,null,2], root2 = [1,null,3]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "6d4b582b-d804-4046-ad57-3f3697990b3a"
        let rawInput = "root1 = [1,2,3,4,5,6,7], root2 = [1,2,3,4,5,6,7]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "16366b29-ff53-4c18-b41e-7ef219af0193"
        let rawInput = "root1 = [1,2,3,4,5,6,7], root2 = [1,2,3,4,5,6,8]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "6f98d0e4-5ff7-42d1-9470-60743da0597e"
        let rawInput = "root1 = [1,-2,3], root2 = [1,-2,3]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "543a2342-d40d-4dcd-a3d5-13cd37d17fce"
        let rawInput = "root1 = [1,-2,3], root2 = [1,2,3]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "577d0b1a-d025-4ba0-893a-621146686a25"
        let rawInput = "root1 = [1,2,2], root2 = [1,2,2]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "18ea0dd2-f976-4f62-b479-5f8ff1270fe4"
        let rawInput = "root1 = [1,2,2], root2 = [1,2,3]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "30ef8599-3735-42dd-9966-73ca228d2de6"
        let rawInput = "root1 = [1,null,2,null,3], root2 = [1,null,2,null,3]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "35324eb9-1f76-4ad4-a3cc-c1942ec5e19c"
        let rawInput = "root1 = [1,null,2,null,3], root2 = [1,null,2,null,4]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "6a84199d-bc73-4c8e-87e5-a7f9625c9034"
        let rawInput = "root1 = [1,2,3,4,5,6,7,8,9,10], root2 = [1,2,3,4,5,6,7,8,9,10]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "e5ef0ef2-d7fd-4b49-827c-6fdb1ffb6b8a"
        let rawInput = "root1 = [1,2,3,4,5,6,7,8,9,10], root2 = [1,2,3,4,5,6,7,8,9,11]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "a095e703-c26e-4e58-987e-f11c6fef800c"
        let rawInput = "root1 = [1,null,null], root2 = [1,null,null]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "d8450743-290b-433c-9ab7-0bc807963f56"
        let rawInput = "root1 = [1,null,null], root2 = [2,null,null]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "742633d1-7a23-43b5-9bfd-b4c16504b19e"
        let rawInput = "root1 = [1,2,null,4], root2 = [1,2,null,4]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "a6f05e84-f888-436e-beaa-84da5c1fe825"
        let rawInput = "root1 = [1,2,null,4], root2 = [1,2,null,5]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "a4745ff2-365a-4296-bea8-7ab44c444f17"
        let rawInput = "root1 = [1,2,3,null,null,4,5], root2 = [1,2,3,null,null,4,5]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "9a22bb51-05f5-4507-a5b6-54a159880606"
        let rawInput = "root1 = [1,2,3,null,null,4,5], root2 = [1,2,3,null,null,4,6]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "92967486-bad1-490e-8f4c-ae32c3060ec5"
        let rawInput = "root1 = [1,2,3,4,5,6,7,8], root2 = [1,2,3,4,5,6,7,8]"
        let expectedOutput = "True"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "leaf-similar-trees"
        let topic = "trees"
        let testId = "d497dc45-b5ab-49a6-9c23-7339320f9ca7"
        let rawInput = "root1 = [1,2,3,4,5,6,7,8], root2 = [1,2,3,4,5,6,7,9]"
        let expectedOutput = "False"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_root1 = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_root2 = buildTree(InputParser.parseNullableIntArray(params[1]))

        let solution = Solution()
        let result = solution.leafSimilar(p_root1, p_root2)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
