import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfConnectedComponentsInAnUndirectedGraph {
    private class Solution {
        func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
            var parent = Array(0..<n)
            var rank = [Int](repeating: 0, count: n)
            var components = n

            func find(_ x: Int) -> Int {
                if parent[x] != x {
                    parent[x] = find(parent[x])
                }
                return parent[x]
            }

            func union(_ x: Int, _ y: Int) {
                let px = find(x), py = find(y)
                if px == py { return }
                if rank[px] < rank[py] {
                    parent[px] = py
                } else if rank[px] > rank[py] {
                    parent[py] = px
                } else {
                    parent[py] = px
                    rank[px] += 1
                }
                components -= 1
            }

            for edge in edges {
                union(edge[0], edge[1])
            }

            return components
        }
    }

    @Suite struct NumberOfConnectedComponentsInAnUndirectedGraphTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e4271b2c-d415-4d3e-aed2-c301d00ce803",
             input: "n = 0, edges = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "314f0cfa-3298-4fe2-b4e7-de21d49b03ce",
             input: "n = 1, edges = []",
             expected: "1", orderMatters: true),
            TestCaseData(id: "979749f8-bf15-49d1-b6fc-f126d9aa4062",
             input: "n = 2, edges = [[0,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0fefb260-daaa-4b26-9aa6-ff7e21f2432e",
             input: "n = 2, edges = []",
             expected: "2", orderMatters: true),
            TestCaseData(id: "651482b9-ad0f-47cd-bff4-263835af7c59",
             input: "n = 3, edges = [[0,1],[1,2]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8c45d1c1-c571-4353-ae41-d9e8cc74e44c",
             input: "n = 3, edges = [[0,1],[1,2],[2,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c93dd655-1e47-4059-bf3b-e7cd23317ed0",
             input: "n = 3, edges = [[0,1],[2,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3d742cba-f40b-4503-ad2a-dd704a6c7513",
             input: "n = 4, edges = [[0,1],[1,2],[2,3]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "56e09493-9a61-4bf9-acf8-4b95bca7d239",
             input: "n = 4, edges = [[0,1],[2,3]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f3e25447-310b-4e9a-a03b-a8aa489c66d4",
             input: "n = 5, edges = [[0,1],[1,2],[2,3],[3,4]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0f70cc0d-c40e-45e5-8d81-17dc0a57c7d5",
             input: "n = 6, edges = [[0,1],[1,2],[2,3],[3,4],[4,5]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "52a93f54-125f-4f61-956d-fdf2ef9a30c5",
             input: "n = 7, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b8c6abea-cba6-47dc-bb59-13dff6412f06",
             input: "n = 8, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a91b40b7-e4e0-46aa-bd7f-1a2826964d32",
             input: "n = 9, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "941692fb-7d39-4065-801c-55a456d973d8",
             input: "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "42192452-5e46-425c-8f79-b14f940bf687",
             input: "n = 5, edges = [[0,0],[1,1],[2,2],[3,3],[4,4]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b264d84a-c764-4679-a38a-88f2a7684d60",
             input: "n = 5, edges = [[0,1],[0,2],[0,3],[0,4]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "434b90fd-b7b5-4585-b1fb-34fde51cd924",
             input: "n = 5, edges = [[0,1],[1,2],[2,3],[3,4],[0,4]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2d594347-d1b3-4d25-b8c6-aa3c210fe818",
             input: "n = 10, edges = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8],[0,9]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "38ba09eb-892c-4339-9f25-56fcd2a73211",
             input: "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "88aec137-b0ef-4c90-bf7e-ca561f7df6fd",
             input: "n = 10, edges = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8],[0,9],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[1,9]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "89f4fe25-1f71-48a4-aa3a-537e9597c21c",
             input: "n = 100, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],["
                + "17,18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29],[29,30],[30,31],[31,32],[32,33],[33,34],["
                + "34,35],[35,36],[36,37],[37,38],[38,39],[39,40],[40,41],[41,42],[42,43],[43,44],[44,45],[45,46],[46,47],[47,48],[48,49],[49,50],[50,51],["
                + "51,52],[52,53],[53,54],[54,55],[55,56],[56,57],[57,58],[58,59],[59,60],[60,61],[61,62],[62,63],[63,64],[64,65],[65,66],[66,67],[67,68],["
                + "68,69],[69,70],[70,71],[71,72],[72,73],[73,74],[74,75],[75,76],[76,77],[77,78],[78,79],[79,80],[80,81],[81,82],[82,83],[83,84],[84,85],["
                + "85,86],[86,87],[87,88],[88,89],[89,90],[90,91],[91,92],[92,93],[93,94],[94,95],[95,96],[96,97],[97,98],[98,99]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "24c82bcb-acdf-4c71-9203-6575aae830cd",
             input: "n = 100, edges = []",
             expected: "100", orderMatters: true),
            TestCaseData(id: "9bf7dc73-2648-4ec4-8e7c-f69d919a8056",
             input: "n = 1000, edges = []",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "e6c09bd5-7321-4150-82a1-343f08a95c61",
             input: "n = 10000, edges = []",
             expected: "10000", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-connected-components-in-an-undirected-graph"
            let topic = "misc"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_edges = InputParser.parse2DIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [[Int]]"
                )
                return
            }
            guard p_edges.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.countComponents(p_n, p_edges)
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
