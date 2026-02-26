import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAllPathsFromSourceToTarget {
    private class Solution {
        func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
            let n = graph.count
            var result: [[Int]] = []
            var memo: [Int: [[Int]]] = [:]
            func dfs(_ node: Int, _ path: [Int]) -> [[Int]] {
                if let cachedResult = memo[node] {
                    return cachedResult
                }
                if node == n - 1 {
                    return [path]
                }
                var paths: [[Int]] = []
                for nextNode in graph[node] {
                    let newPaths = dfs(nextNode, path + [nextNode])
                    paths.append(contentsOf: newPaths)
                }
                memo[node] = paths
                return paths
            }
            result = dfs(0, [0])
            return result
        }
    }

    @Suite struct AllPathsFromSourceToTargetTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7c1a6cdc-96fd-42d7-b2bf-18699717fd39",
             input: "graph = [[1],[2],[]]",
             expected: "[[0, 1, 2]]", orderMatters: false),
            TestCaseData(id: "74d9464c-2b30-4f52-ab3a-e41acada67fc",
             input: "graph = [[1],[2],[3],[]]",
             expected: "[[0, 1, 2, 3]]", orderMatters: false),
            TestCaseData(id: "7fb62000-b502-4c6b-ba77-6443eb19ca52",
             input: "graph = [[1],[2],[3],[4],[]]",
             expected: "[[0, 1, 2, 3, 4]]", orderMatters: false),
            TestCaseData(id: "d57467f1-2caa-4fb2-8f9d-90da1f644c3f",
             input: "graph = [[1],[2],[3],[4],[5],[]]",
             expected: "[[0, 1, 2, 3, 4, 5]]", orderMatters: false),
            TestCaseData(id: "71d4b44d-04ed-4a76-a576-f6e4fc8a8d9e",
             input: "graph = [[1],[2],[3],[4],[5],[6],[]]",
             expected: "[[0, 1, 2, 3, 4, 5, 6]]", orderMatters: false),
            TestCaseData(id: "9d1fe21e-dd33-4831-a7c9-10f0addd6973",
             input: "graph = [[1],[2],[3],[4],[5],[6],[7],[]]",
             expected: "[[0, 1, 2, 3, 4, 5, 6, 7]]", orderMatters: false),
            TestCaseData(id: "e3de5854-48f6-4c35-ab1f-c77d7c80fcaa",
             input: "graph = [[1],[2],[3],[4],[5],[6],[7],[8],[]]",
             expected: "[[0, 1, 2, 3, 4, 5, 6, 7, 8]]", orderMatters: false),
            TestCaseData(id: "ab320c17-dae8-4a3a-b2db-a01d5778e770",
             input: "graph = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[]]",
             expected: "[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]]", orderMatters: false),
            TestCaseData(id: "a1c411ae-5e90-4a23-b234-74665c29acf7",
             input: "graph = [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[]]",
             expected: "[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]]", orderMatters: false),
            TestCaseData(id: "260b06e9-0ef5-425c-8a38-41cca5f21187",
             input: "graph = [[1,2],[3],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "782f4d9b-8296-4b38-9e7c-9e12132ef10d",
             input: "graph = [[1,2,3],[4],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "0e1b1b39-f488-431a-8b52-90ba57f5562b",
             input: "graph = [[1,2,3,4],[5],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "eca1d79a-2da7-4edb-acda-edf1f36f7815",
             input: "graph = [[1,2],[3,4],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "b47922ae-7007-4c43-8e34-421f0bd3f3c0",
             input: "graph = [[1,2,3,4,5],[6],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "ef7e6130-408b-41a8-a49d-0f3b2c78465d",
             input: "graph = [[1,2,3,4,5,6],[7],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "5adb7318-1a4c-4bc2-8a07-8840bf8af9e4",
             input: "graph = [[1,2,3,4,5,6,7],[8],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "55c1b5e0-e3a3-4884-8d66-f493ccbb2ad6",
             input: "graph = [[1,2,3,4,5,6,7,8],[9],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "ae781226-9b4f-4cb8-9b58-f3a650be4c06",
             input: "graph = [[1,2,3,4,5,6,7,8,9],[10],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "1ecd3c25-3f94-475e-8669-8b609202ad32",
             input: "graph = [[1,2,3,4,5,6,7,8,9,10],[11],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "1ce20539-684e-4e9a-9604-43d1364254f0",
             input: "graph = [[1,2,3],[4,5],[]]",
             expected: "[[0,2]]", orderMatters: false),
            TestCaseData(id: "555b431d-5141-4970-93fc-9e55d917569f",
             input: "graph = [[1,2,3,4],[5,6],[]]",
             expected: "null", orderMatters: false),
            TestCaseData(id: "20f633aa-35e4-4df7-9a06-b220c634c95c",
             input: "graph = [[1,2,3,4,5],[6,7],[]]",
             expected: "null", orderMatters: false),
            TestCaseData(id: "50b97029-00a1-4760-85c0-4c64cfaa51db",
             input: "graph = [[1,2,3,4,5,6],[7,8],[]]",
             expected: "null", orderMatters: false),
            TestCaseData(id: "d442b438-6fff-4be3-94b4-5a360a12f71b",
             input: "graph = [[1,2,3,4,5,6,7],[8,9],[]]",
             expected: "null", orderMatters: false),
            TestCaseData(id: "8ed5211e-48b8-4af8-b719-f7b0ebdf5bb8",
             input: "graph = [[1,2,3,4,5,6,7,8],[9,10],[]]",
             expected: "null", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "all-paths-from-source-to-target"
            let topic = "backtracking"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.allPathsSourceTarget(p_graph)
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
