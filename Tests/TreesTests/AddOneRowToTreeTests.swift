import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        if depth == 1 {
            let newNode = TreeNode(val)
            newNode.left = root
            return newNode
        }
        addRowHelper(root, val, depth, 1, true)
        return root
    }

    func addRowHelper(_ node: TreeNode?, _ val: Int, _ depth: Int, _ currentDepth: Int, _ isLeft: Bool) {
        guard let node = node else { return }
        if currentDepth == depth - 1 {
            let tempLeft = node.left
            let tempRight = node.right
            if isLeft {
                node.left = TreeNode(val)
                node.left?.left = tempLeft
                node.right = TreeNode(val)
                node.right?.right = tempRight
            } else {
                node.left = TreeNode(val)
                node.left?.right = tempLeft
                node.right = TreeNode(val)
                node.right?.left = tempRight
            }
            return
        }
        addRowHelper(node.left, val, depth, currentDepth + 1, true)
        addRowHelper(node.right, val, depth, currentDepth + 1, false)
    }
}

@Suite struct AddOneRowToTreeTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "0fa59eaa-bf16-49db-a0a1-b3dff5f0c004"
        let rawInput = "root = [1,2,3], val = 4, depth = 1"
        let expectedOutput = "[4,1,null,2,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "3ef99311-9401-4be0-bddc-4e9fb0893c18"
        let rawInput = "root = [1,2,3], val = 4, depth = 3"
        let expectedOutput = "[1,2,3,4,4,4,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "22c614b4-c6da-47a7-9a28-e48788fb0594"
        let rawInput = "root = [1,2,3], val = 4, depth = 2, isLeft = false"
        let expectedOutput = "[1,4,4,2,null,null,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "35a3b637-ab12-41ec-b1e9-ccca111e703c"
        let rawInput = "root = [1,2,3], val = 4, depth = 2"
        let expectedOutput = "[1,4,4,2,null,null,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "c62820e2-4e5a-43b9-9dac-109d56259cde"
        let rawInput = "root = [1], val = 2, depth = 1"
        let expectedOutput = "[2,1,null]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "cedd35a1-06af-4348-9459-4cf69ba14e6a"
        let rawInput = "root = [1], val = 2, depth = 2"
        let expectedOutput = "[1,2,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "b38dc87a-9523-44a4-99c5-688878d6068b"
        let rawInput = "root = [1,2], val = 3, depth = 1"
        let expectedOutput = "[3,1,null,2,null]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "dcd46abe-a21e-4336-956c-ba2eb1194adf"
        let rawInput = "root = [1,2], val = 3, depth = 2"
        let expectedOutput = "[1,3,3,2,null,null,null]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "bb045f65-07f4-4400-95b0-f73520c17a3e"
        let rawInput = "root = [1,2], val = 3, depth = 3"
        let expectedOutput = "[1,2,null,3,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "c83d1042-acb5-4f37-b380-f2776f9fc6f0"
        let rawInput = "root = [1,2,3,4,5,6,7], val = 8, depth = 4"
        let expectedOutput = "[1,2,3,4,5,6,7,8,8,8,8,8,8,8,8]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "a9ab6f9e-c2f1-4e51-a2ee-a31390d01c5e"
        let rawInput = "root = [1,2,3,4,5,6,7], val = 0, depth = 1"
        let expectedOutput = "[0,1,null,2,3,null,null,4,5,6,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "a387af10-97bf-4ae8-a91e-f6d4e4d84d51"
        let rawInput = "root = [1,2,3,4,5,6,7], val = 0, depth = 2"
        let expectedOutput = "[1,0,0,2,null,null,3,4,5,6,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "db3970e0-e51b-4a65-a8ba-b1c2455623a9"
        let rawInput = "root = [1,2,3,4,5,6,7], val = 0, depth = 3"
        let expectedOutput = "[1,2,3,0,0,0,0,4,null,null,5,6,null,null,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "b9a87130-553d-438b-b8ac-0447f17c3cfd"
        let rawInput = "root = [1,2,3,4,5,6,7], val = 0, depth = 4"
        let expectedOutput = "[1,2,3,4,5,6,7,0,0,0,0,0,0,0,0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "d32e91a0-cba8-4d96-8a0c-c0e0fa64f16e"
        let rawInput = "root = [1,2,3,4,5,6,7], val = 0, depth = 5"
        let expectedOutput = "[1,2,3,4,5,6,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "dabf29b4-0780-4f01-9a16-ae2e7f30b9d9"
        let rawInput = "root = [4,2,6,3,1,5], val = 1, depth = 2"
        let expectedOutput = "[4,1,1,2,null,null,6,3,1,5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "add-one-row-to-tree"
        let topic = "trees"
        let testId = "4d5d669e-f5c5-4897-a842-8b393f2070f7"
        let rawInput = "root = [4,2,null,3,1], val = 1, depth = 3"
        let expectedOutput = "[4,2,null,1,1,3,null,null,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_root = buildTree(InputParser.parseNullableIntArray(params[0]))
        let p_val = InputParser.parseInt(params[1])
        let p_depth = InputParser.parseInt(params[2])

        // Constraint precondition checks
        guard p_val >= -105 && p_val <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: -105 <= val <= 105")
            return
        }

        let solution = Solution()
        let result = solution.addOneRow(p_root, p_val, p_depth)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
