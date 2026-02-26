import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var preorderIndex = 0
        var postorderIndex = 0
        var postorderMap: [Int: Int] = [:]
        
        for i in 0..<postorder.count {
            postorderMap[postorder[i]] = i
        }
        
        return constructFromPrePostHelper(&preorderIndex, &postorderIndex, preorder, postorder, postorderMap)
    }
    
    func constructFromPrePostHelper(_ preorderIndex: inout Int, _ postorderIndex: inout Int, _ preorder: [Int], _ postorder: [Int], _ postorderMap: [Int: Int]) -> TreeNode? {
        if preorderIndex >= preorder.count {
            return nil
        }
        
        let node = TreeNode(preorder[preorderIndex])
        preorderIndex += 1
        
        if preorderIndex >= preorder.count {
            return node
        }
        
        let leftSubtreeRootValue = preorder[preorderIndex]
        node.left = constructFromPrePostHelper(&preorderIndex, &postorderIndex, preorder, postorder, postorderMap)
        
        node.right = constructFromPrePostHelper(&preorderIndex, &postorderIndex, preorder, postorder, postorderMap)
        
        return node
    }
}

@Suite struct ConstructBinaryTreeFromPreorderAndPostorderTraversalTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "construct-binary-tree-from-preorder-and-postorder-traversal"
        let topic = "trees"
        let testId = "e37e3105-87b2-4bf7-8dce-e8830364591b"
        let rawInput = "preorder = [1,2,4,5,3,6,7], postorder = [4,5,2,6,7,3,1]"
        let expectedOutput = "[1,2,3,4,5,6,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_preorder = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_preorder.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: preorder array too large (\(p_preorder.count))")
            return
        }
        guard let p_postorder = InputParser.parseIntArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Int]: '\(params[1])'")
            return
        }
        guard p_postorder.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: postorder array too large (\(p_postorder.count))")
            return
        }

        // Constraint precondition checks
        guard p_preorder.count >= 1 && p_preorder.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= preorder.length <= 30")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.constructFromPrePost(p_preorder, p_postorder)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical tree format
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "construct-binary-tree-from-preorder-and-postorder-traversal"
        let topic = "trees"
        let testId = "89c90961-e22b-45d2-8fc2-20e6d62018c6"
        let rawInput = "preorder = [1], postorder = [1]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_preorder = InputParser.parseIntArray(params[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [Int]: '\(params[0])'")
            return
        }
        guard p_preorder.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: preorder array too large (\(p_preorder.count))")
            return
        }
        guard let p_postorder = InputParser.parseIntArray(params[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as [Int]: '\(params[1])'")
            return
        }
        guard p_postorder.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: postorder array too large (\(p_postorder.count))")
            return
        }

        // Constraint precondition checks
        guard p_preorder.count >= 1 && p_preorder.count <= 30 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= preorder.length <= 30")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.constructFromPrePost(p_preorder, p_postorder)
            let computedOutput = OutputSerializer.serialize(result)

            // Structural comparison: both sides serialized to canonical tree format
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
