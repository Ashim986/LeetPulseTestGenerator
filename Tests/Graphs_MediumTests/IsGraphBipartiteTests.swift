import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCIsGraphBipartite {
    private class Solution {
        func isBipartite(_ graph: [[Int]]) -> Bool {
            var colors = [Int](repeating: -1, count: graph.count)
            for i in 0..<graph.count {
                if colors[i] != -1 { continue }
                var queue = [i]; colors[i] = 0
                while !queue.isEmpty {
                    let node = queue.removeFirst()
                    for neighbor in graph[node] {
                        if colors[neighbor] == -1 { colors[neighbor] = 1 - colors[node]; queue.append(neighbor) }
                        else if colors[neighbor] == colors[node] { return false }
                    }
                }
            }
            return true
        }
    }

    @Suite struct IsGraphBipartiteTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3933f8a4-94d1-471f-826c-1d339a470713",
             input: "graph = [[1,3],[0,2],[1,3],[0,2]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ceaa2f7c-486c-44a3-898a-c56e4b900594",
             input: "graph = [[1,2,3],[0,2],[0,1,3],[0,2]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "357b79e2-1d3e-44fb-a799-68de29f86aff",
             input: "graph = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a037c270-436d-4a38-a410-388f1c2928ad",
             input: "graph = [[1],[0]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f223ea5c-45bf-4e6c-99c1-f15eb5eadd85",
             input: "graph = [[1,2],[0,3],[1,3],[0,2]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8258794d-2e74-4365-a16a-55d571a5149b",
             input: "graph = [[1,2,3,4],[0,2,3,4],[0,1,3,4],[0,1,2,4],[0,1,2,3]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "789fa6d6-cf36-4a10-872a-8d780930e049",
             input: "graph = [[1,2,3],[0,2,3],[0,1,3],[0,1,2]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c8df440a-16b2-495d-b403-140749e51246",
             input: "graph = [[1,2],[0,3],[1,3],[0,2],[4,5],[4,6],[5,6]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "22325606-c643-466c-94ae-c0ffdf72c213",
             input: "graph = [[1,2,3,4,5],[0,2,3,4,5],[0,1,3,4,5],[0,1,2,4,5],[0,1,2,3,5],[0,1,2,3,4]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "fe1efbe8-bdc9-4bd3-8b2f-238efd970749",
             input: "graph = [[1,2,3],[0,2,3],[0,1,3],[0,1,2],[4,5,6],[4,5,6],[4,5,6],[4,5,6]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7eff1956-82b4-4aa8-8478-5796ab78d865",
             input: "graph = [[1,2,3,4,5,6],[0,2,3,4,5,6],[0,1,3,4,5,6],[0,1,2,4,5,6],[0,1,2,3,5,6],[0,1,2,3,4,6],[0,1,2,3,4,5]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "efb8dfe3-aa02-414a-b712-1e34676b3c65",
             input: "graph = [[1,2,3],[0,2,3],[0,1,3],[0,1,2],[4,5,6],[4,5,6],[4,5,6],[4,5,6],[7,8,9]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "774e6b0e-0d76-4115-ae00-ed5dd9b66ed4",
             input: "graph = [[1,2,3,4,5,6,7],[0,2,3,4,5,6,7],[0,1,3,4,5,6,7],[0,1,2,4,5,6,7],[0,1,2,3,5,6,7],[0,1,2,3,4,6,7],[0,1,2,3,4,5,7],[0,1,2,3,4,5,6]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5cbe02c5-600b-4d51-9188-e45fcd800745",
             input: "graph = [[1,2,3],[0,2,3],[0,1,3],[0,1,2],[4,5,6],[4,5,6],[4,5,6],[4,5,6],[7,8,9],[10,11,12]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "11a6c5e2-ef31-4592-9d2d-889ba2d99f67",
             input: "graph = [[1,2,3,4,5,6,7,8],[0,2,3,4,5,6,7,8],[0,1,3,4,5,6,7,8],[0,1,2,4,5,6,7,8],[0,1,2,3,5,6,7,8],[0,1,2,3,4,6,7,8],[0,1,2,3,4,5,7,8],["
                + "0,1,2,3,4,5,6,8],[0,1,2,3,4,5,6,7]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e04dddb0-69d4-446a-9071-c6fb2246dd14",
             input: "graph = [[1,2,3],[0,2,3],[0,1,3],[0,1,2],[4,5,6],[4,5,6],[4,5,6],[4,5,6],[7,8,9],[10,11,12],[13,14,15]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5141d0c3-59b7-4117-aefe-b34e7f05a4ce",
             input: "graph = [[1,2,3,4,5,6,7,8,9],[0,2,3,4,5,6,7,8,9],[0,1,3,4,5,6,7,8,9],[0,1,2,4,5,6,7,8,9],[0,1,2,3,5,6,7,8,9],[0,1,2,3,4,6,7,8,9],[0,1,2,"
                + "3,4,5,7,8,9],[0,1,2,3,4,5,6,8,9],[0,1,2,3,4,5,6,7,9],[0,1,2,3,4,5,6,7,8]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "752a0684-72c0-495e-a472-31eafd5c90fd",
             input: "graph = [[1,2,3],[0,2,3],[0,1,3],[0,1,2],[4,5,6],[4,5,6],[4,5,6],[4,5,6],[7,8,9],[10,11,12],[13,14,15],[16,17,18]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "07786eab-98ef-4ada-8e23-23fe6e4966f3",
             input: "graph = [[1],[0],[2],[3]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6c9d28e5-4587-4ada-b72c-5a139fd7c76e",
             input: "graph = [[1],[0],[2],[3],[4],[5]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4eb86552-7d5e-4abc-97a1-0b326c8d7a49",
             input: "graph = [[1,2],[0,3],[1,3],[0,2],[4,5],[4,6],[5,7],[6,7]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "240bdbbb-e281-4876-ae11-7292572bd3dc",
             input: "graph = [[1],[0],[2],[3],[4],[5],[6]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a32d6dce-60c0-4cf4-8fe7-da05760e08e1",
             input: "graph = [[1,2],[0,3],[1,3],[0,2],[4,5],[4,6],[5,6],[7,8]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5ed5bb1d-b946-40db-997a-abc092cb623e",
             input: "graph = [[1,2],[0,3],[1,3],[0,2],[4,5],[4,6],[5,7],[6,7],[8,9]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "49323486-faf9-4e5c-ae42-3477dbc04024",
             input: "graph = [[1],[0],[2],[3],[4],[5],[6],[7]]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "is-graph-bipartite"
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

            guard let p_graph = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_graph.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: graph 2D array too large (\(p_graph.count))"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isBipartite(p_graph)
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
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
