import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    var sum = 0
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        reverseInOrder(root)
        return root
    }
    func reverseInOrder(_ node: TreeNode?) {
        guard let node = node else { return }
        reverseInOrder(node.right)
        node.val += sum
        sum = node.val
        reverseInOrder(node.left)
    }
}

@Suite struct ConvertBstToGreaterTreeTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "9cd2ceb8-451d-4c90-b69e-de2eb2295aec"
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
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "3bb0bf04-7a18-4a87-bb9a-1374a8b117d3"
        let rawInput = "root = []"
        let expectedOutput = "null"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "7a61570f-4ae5-466c-8547-81ed82fe49c8"
        let rawInput = "root = [1,null,2]"
        let expectedOutput = "[1,null,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "f8cd68b3-c811-487d-bf7a-c6bc7a8cd3be"
        let rawInput = "root = [2,1,3]"
        let expectedOutput = "[2,6,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "f972d256-b8a7-47cb-86ff-8a744b84f4fb"
        let rawInput = "root = [3,1,4]"
        let expectedOutput = "[3,8,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "b6fc6101-2903-4d3d-a0c2-6322305d1e5d"
        let rawInput = "root = [5,3,8]"
        let expectedOutput = "[5,16,13]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "beccbd1d-5753-44b8-ac42-af6fa8feaca3"
        let rawInput = "root = [5,3,8,1,4,7,10]"
        let expectedOutput = "[5,16,13,38,37,33,26]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "2dae1f97-16f3-4660-be09-9addb0e2fadb"
        let rawInput = "root = [10,5,15]"
        let expectedOutput = "[10,30,25]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "1ad8db42-4162-4212-b96a-1f10b93bed64"
        let rawInput = "root = [10,5,15,null,null,12,20]"
        let expectedOutput = "[10,30,25,null,null,62,50]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "7937b5db-4da5-43f3-82f5-a7ba5c34b612"
        let rawInput = "root = [10,5,15,3,7,null,12,20]"
        let expectedOutput = "[10,30,25,52,49,null,42,null,null,null,null,null,null,null,72]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "d16bd98d-641b-4627-bdee-075942cc4852"
        let rawInput = "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7]"
        let expectedOutput = "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "b456817f-546d-4a9c-8e5d-006632a8eaf4"
        let rawInput = "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8]"
        let expectedOutput = "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "d9607c2f-d4a0-43bd-a29d-32741bc4c649"
        let rawInput = "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9]"
        let expectedOutput = "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "f56844c5-a364-4608-a10e-94e72e1e067b"
        let rawInput = "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]"
        let expectedOutput = "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "fecdef46-62d2-4b63-9dac-1d1f83a45a33"
        let rawInput = "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11]"
        let expectedOutput = "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "1dfe77e4-a90e-4896-978d-922c98fd9995"
        let rawInput = "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12]"
        let expectedOutput = "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36,24]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "0be92ed0-26f5-46ef-989c-8f9890aeae03"
        let rawInput = "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13]"
        let expectedOutput = "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36,24,11]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "180a0fc6-5e2f-4cad-9b5a-f7683319739a"
        let rawInput = "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14]"
        let expectedOutput = "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36,24,11,-3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "688322ee-f51e-4e52-a774-c27c507a5113"
        let rawInput = "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15]"
        let expectedOutput = "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36,24,11,-3,-18]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "b1fe9653-77db-463b-b45e-8897c004819f"
        let rawInput = "root = [10,5,15,3,7,12,20,2,4,6,8,1,9,0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16]"
        let expectedOutput = "[10,15,30,33,40,52,72,74,78,84,92,93,102,102,101,99,96,92,87,81,74,66,57,47,36,24,11,-3,-18,-34]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "689c8fd4-c653-4ca7-8900-739e47246a12"
        let rawInput = "root = [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]"
        let expectedOutput = "[30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "convert-bst-to-greater-tree"
        let topic = "trees"
        let testId = "31280f75-505f-4848-95e6-15ed794dd625"
        let rawInput = "root = [0,null,1]"
        let expectedOutput = "[1,null,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))

        let solution = Solution()
        let result = solution.convertBST(p_root)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
