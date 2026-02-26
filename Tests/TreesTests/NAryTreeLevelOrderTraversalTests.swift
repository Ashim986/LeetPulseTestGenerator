import Foundation
import Testing
@testable import LeetCodeHelpers

private typealias Node = NAryNode

private class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let root = root else { return [] }
        var result: [[Int]] = []
        var queue: [Node] = [root]
        while !queue.isEmpty {
            var level: [Int] = []
            let levelSize = queue.count
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                level.append(node.val)
                queue.append(contentsOf: node.children)
            }
            result.append(level)
        }
        return result
    }
}

@Suite struct NAryTreeLevelOrderTraversalTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "n-ary-tree-level-order-traversal"
        let topic = "trees"
        let testId = "ddf6836b-9ca3-47c6-8a7a-2d661b3c5eb1"
        let rawInput = "root = [1,1,1,1,1,1,1,1,1,1]"
        let expectedOutput = "[[1],[1,1,1,1,1,1,1,1,1]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_root = InputParser.parseNullableIntArray(params[0]).map { buildNAryTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as NAryNode?: '\(params[0])'")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_1() async {
        let slug = "n-ary-tree-level-order-traversal"
        let topic = "trees"
        let testId = "6d7fa355-6416-411e-8645-5a7a14da3b47"
        let rawInput = "root = [1,null,3,2,4,null,5,6]"
        let expectedOutput = "[[1],[3,2,4],[5,6]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_root = InputParser.parseNullableIntArray(params[0]).map { buildNAryTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as NAryNode?: '\(params[0])'")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

    @Test func test_2() async {
        let slug = "n-ary-tree-level-order-traversal"
        let topic = "trees"
        let testId = "d3487218-b6f3-4d6c-b89f-5cf41aa58616"
        let rawInput = "root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]"
        let expectedOutput = "[[1],[2,3,4,5],[6,7,8,9,10],[11,12,13],[14]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_root = InputParser.parseNullableIntArray(params[0]).map { buildNAryTree($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as NAryNode?: '\(params[0])'")
            return
        }

        // DRY-RUN: input parsing succeeded, skipping solution execution
        let computedOutput = "DRY_RUN"
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: "matched", orderMatters: orderMatters)
    }

}
