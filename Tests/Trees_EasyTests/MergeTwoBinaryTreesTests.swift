import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil {
            return t2
        }
        if t2 == nil {
            return t1
        }
        t1!.val += t2!.val
        t1!.left = mergeTrees(t1!.left, t2!.left)
        t1!.right = mergeTrees(t1!.right, t2!.right)
        return t1
    }
}

@Suite struct MergeTwoBinaryTreesTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "970523b7-2fd3-4fe3-9293-ac246c9e60ae"
        let rawInput = "t1 = [1], t2 = [2]"
        let expectedOutput = "[3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "34da5a89-23e6-4719-aff3-d0fac813b0a7"
        let rawInput = "t1 = [1,2], t2 = [1,null,2]"
        let expectedOutput = "[2,2,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_2() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "58eb82b7-ecfc-4eba-a186-2f597d32652e"
        let rawInput = "t1 = [1,null,2], t2 = [1,2]"
        let expectedOutput = "[2,2,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_3() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "e338ce3d-dff4-4ff8-b96c-0afe14186385"
        let rawInput = "t1 = [], t2 = [1]"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_4() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "773d4eb1-d905-46e9-9277-0da9290adfcb"
        let rawInput = "t1 = [1], t2 = []"
        let expectedOutput = "[1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_5() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "a35408ef-5b10-488c-8a1f-43fffa0dd763"
        let rawInput = "t1 = [1,2,3], t2 = [4,5,6]"
        let expectedOutput = "[5,7,9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_6() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "21497bb2-b013-4b41-8a78-7ce1d43e1df7"
        let rawInput = "t1 = [1,2,3], t2 = [4,null,6]"
        let expectedOutput = "[5,2,9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_7() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "c1bbc7a3-1a1e-4f51-9f6c-d6b11b8f500b"
        let rawInput = "t1 = [1,null,3], t2 = [4,5,6]"
        let expectedOutput = "[5,5,9]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_8() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "b98ad1be-c28f-418c-8c35-f9cc50b2b68f"
        let rawInput = "t1 = [1,2,3,4,5], t2 = [6,7,8,9,10]"
        let expectedOutput = "[7,9,11,13,15]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_9() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "3512362b-a65c-4c4a-a527-ba49cb674420"
        let rawInput = "t1 = [1,2], t2 = [1,null,1]"
        let expectedOutput = "[2,2,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_10() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "87863f17-246c-4871-8fa4-789d9199df06"
        let rawInput = "t1 = [], t2 = [5]"
        let expectedOutput = "[5]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_11() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "57563b2f-092d-44c1-886d-ed23593dfb3e"
        let rawInput = "t1 = [0], t2 = [0]"
        let expectedOutput = "[0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_12() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "88d64c53-7f0c-41f8-9bcb-13b98fff0513"
        let rawInput = "t1 = [1,null,2,null,null,3], t2 = [1,null,2,null,null,3]"
        let expectedOutput = "[2,null,4,null,null,6]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_13() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "4fff0307-9c05-4a72-8645-de70082c3546"
        let rawInput = "t1 = [1,2,3,4,5], t2 = [6,null,8,null,10]"
        let expectedOutput = "[7,2,11,4,5,null,10]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_14() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "9ef2d5ef-e6ee-4ddf-b1d4-0f71622b74f6"
        let rawInput = "t1 = [10,5,15,3,null,12,null,4,null,7], t2 = [10,7,15,2,null,11,null,5,null,6]"
        let expectedOutput = "[20,12,30,5,null,23,null,9,null,null,null,13]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_15() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "f91ed815-bd34-46b6-851d-531a3934f2bd"
        let rawInput = "root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]"
        let expectedOutput = "[3,4,5,5,4,null,7]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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

    @Test func test_16() async {
        let slug = "merge-two-binary-trees"
        let topic = "trees"
        let testId = "c812a768-e111-4179-8926-0ce2aabeb3fb"
        let rawInput = "root1 = [1], root2 = [1,2]"
        let expectedOutput = "[2,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        guard let p_t1 = InputParser.parseNullableIntArray(params[0]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as TreeNode?: '\(params[0])'")
            return
        }
        guard let p_t2 = InputParser.parseNullableIntArray(params[1]).map { buildTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as TreeNode?: '\(params[1])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.mergeTrees(p_t1, p_t2)
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
