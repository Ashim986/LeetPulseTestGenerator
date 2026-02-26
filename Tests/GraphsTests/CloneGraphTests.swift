import Foundation
import Testing
@testable import LeetCodeHelpers

private typealias Node = GraphNode

private class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }

        var cloned: [Int: Node] = [:]

        func dfs(_ node: Node) -> Node {
            if let clone = cloned[node.val] { return clone }

            let clone = Node(node.val)
            cloned[node.val] = clone

            for neighbor in node.neighbors {
                if let n = neighbor {
                    clone.neighbors.append(dfs(n))
                }
            }

            return clone
        }

        return dfs(node)
    }
}

@Suite struct CloneGraphTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "clone-graph"
        let topic = "graphs"
        let testId = "21137d78-1741-46b3-bd4d-c28ee41e57b4"
        let rawInput = "adjList = [[2,4],[1,3],[2,4],[1,3]]"
        let expectedOutput = "[[2,4],[1,3],[2,4],[1,3]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_node = InputParser.parse2DIntArray(params[0]).map { buildGraph($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as GraphNode?: '\(params[0])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.cloneGraph(p_node)
            let computedOutput = serializeGraph(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "clone-graph"
        let topic = "graphs"
        let testId = "68e66756-7e3d-442d-a7ff-72364c17d29e"
        let rawInput = "adjList = [[]]"
        let expectedOutput = "[[]]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_node = InputParser.parse2DIntArray(params[0]).map { buildGraph($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as GraphNode?: '\(params[0])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.cloneGraph(p_node)
            let computedOutput = serializeGraph(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_2() async {
        let slug = "clone-graph"
        let topic = "graphs"
        let testId = "a99d96cb-ceb1-484c-a19e-5ce2ef1841b7"
        let rawInput = "adjList = []"
        let expectedOutput = "[]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        guard let p_node = InputParser.parse2DIntArray(params[0]).map { buildGraph($0) } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as GraphNode?: '\(params[0])'")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.cloneGraph(p_node)
            let computedOutput = serializeGraph(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
