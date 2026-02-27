import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCloneGraph {
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

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "21137d78-1741-46b3-bd4d-c28ee41e57b4",
             input: "adjList = [[2,4],[1,3],[2,4],[1,3]]",
             expected: "[[2,4],[1,3],[2,4],[1,3]]", orderMatters: true),
            TestCaseData(id: "68e66756-7e3d-442d-a7ff-72364c17d29e",
             input: "adjList = [[]]",
             expected: "[[]]", orderMatters: true),
            TestCaseData(id: "a99d96cb-ceb1-484c-a19e-5ce2ef1841b7",
             input: "adjList = []",
             expected: "[]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "clone-graph"
            let topic = "graphs"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_node = InputParser.parse2DIntArray(params[0]).map({ buildGraph($0) }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as GraphNode?"
                )
                return
            }

            let solution = Solution()
            var resultHolder: GraphNode?
            let didCrash = withCrashGuard {
                resultHolder = solution.cloneGraph(p_node)
            }
            guard !didCrash, let result = resultHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = serializeGraph(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
