import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPossibleBipartition {
    private class Solution {
        func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
            var graph: [Int: [Int]] = [:]
            for i in 1...N {
                graph[i] = []
            }
            for dislike in dislikes {
                let p1 = dislike[0]
                let p2 = dislike[1]
                graph[p1].unsafelyUnwrapped.append(p2)
                graph[p2].unsafelyUnwrapped.append(p1)
            }

            var color: [Int: Int] = [:]
            for node in graph.keys {
                if color[node] == nil {
                    if !dfs(graph, node, 1, &color) {
                        return false
                    }
                }
            }
            return true
        }

        func dfs(_ graph: [Int: [Int]], _ node: Int, _ c: Int, _ color: inout [Int: Int]) -> Bool {
            if let existingColor = color[node] {
                return existingColor == c
            }
            color[node] = c
            for neighbor in graph[node].unsafelyUnwrapped {
                if !dfs(graph, neighbor, -c, &color) {
                    return false
                }
            }
            return true
        }
    }

    @Suite struct PossibleBipartitionTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4b170bbf-6f39-4c89-88fd-abb426bbc260",
             input: "N = 1, dislikes = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "da4f5364-9c32-4ec4-846a-a2fbe027a331",
             input: "N = 2, dislikes = [[1,2]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "330a75f2-ad3d-4fd1-bfa0-2429b7355d03",
             input: "N = 3, dislikes = [[1,2],[2,3]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3e6c4e05-d97d-44ad-82b1-ac76618f7886",
             input: "N = 5, dislikes = [[1,2],[2,3],[3,4],[4,5]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "57f6e564-0ddd-44b3-b757-b20bf9fa6582",
             input: "N = 6, dislikes = [[1,2],[1,3],[2,4],[3,5],[4,6]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "17b2030d-4282-4e07-97f4-d89c85ed8e75",
             input: "N = 7, dislikes = [[1,2],[1,3],[2,4],[3,5],[4,6],[5,7]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e9f88f00-890d-4058-a03e-4226a3ef3041",
             input: "N = 9, dislikes = [[1,2],[3,4],[5,6],[7,8],[1,9]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "49a44144-4fc8-4325-b47b-0fed5fd1ff5e",
             input: "N = 11, dislikes = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "fcf424ba-23cb-4c04-a2c8-caecf662520f",
             input: "N = 13, dislikes = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c8b6b176-2418-4b47-8dda-a6e2cb79cceb",
             input: "N = 15, dislikes = [[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[1,9],[1,10],[1,11],[1,12],[1,13],[1,14],[1,15]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9806be9e-68a0-473e-be13-754c1269aec3",
             input: "N = 17, dislikes = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c56e612b-6931-4df5-82ba-47a08d8700d9",
             input: "N = 19, dislikes = [[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[1,9],[1,10],[1,11],[1,12],[1,13],[1,14],[1,15],[1,16],[1,17],[1,18],[1,19]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0c774d54-ad44-466c-a9a6-3e17f2f9d937",
             input: "N = 2, dislikes = [[1,2],[2,1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2dcd7e7f-0bcc-4ffa-9c12-592396b84e24",
             input: "N = 3, dislikes = [[1,2],[2,1],[1,3],[3,1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3b6b8ad9-e166-4271-9cb1-3c03a9465974",
             input: "N = 5, dislikes = [[1,2],[2,1],[3,4],[4,3],[5,1],[1,5]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4a389fec-1ac1-42f3-bfaa-599ac9f90a40",
             input: "N = 7, dislikes = [[1,2],[2,1],[3,4],[4,3],[5,6],[6,5],[7,1],[1,7]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bbbffdee-13a8-4fbc-ac77-6f9358a1ccfd",
             input: "N = 9, dislikes = [[1,2],[2,1],[3,4],[4,3],[5,6],[6,5],[7,8],[8,7],[9,1],[1,9]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4c3717e2-989f-4e0c-b136-aee38a3d4bed",
             input: "N = 0, dislikes = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "016cab5c-99f1-4f7e-a163-1f8d096b357c",
             input: "N = 100, dislikes = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3e96d280-0eff-4c6e-bce5-6b8cae5c72a2",
             input: "N = 1000, dislikes = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17"
                + ",18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29],[29,30],[30,31],[31,32],[32,33],[33,34],[34"
                + ",35],[35,36],[36,37],[37,38],[38,39],[39,40],[40,41],[41,42],[42,43],[43,44],[44,45],[45,46],[46,47],[47,48],[48,49],[49,50],[50,51],[51"
                + ",52],[52,53],[53,54],[54,55],[55,56],[56,57],[57,58],[58,59],[59,60],[60,61],[61,62],[62,63],[63,64],[64,65],[65,66],[66,67],[67,68],[68"
                + ",69],[69,70],[70,71],[71,72],[72,73],[73,74],[74,75],[75,76],[76,77],[77,78],[78,79],[79,80],[80,81],[81,82],[82,83],[83,84],[84,85],[85"
                + ",86],[86,87],[87,88],[88,89],[89,90],[90,91],[91,92],[92,93],[93,94],[94,95],[95,96],[96,97],[97,98],[98,99],[99,100]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "85f35485-dff7-42a2-953b-16f2f8a1e12b",
             input: "N = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[5,1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2c966589-4fca-40b8-805f-9fa5cca1e746",
             input: "N = 4, dislikes = [[1,2],[3,4]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f31b9cd8-7c07-4fab-840f-1a4647f15081",
             input: "N = 8, dislikes = [[1,2],[3,4],[5,6],[7,8]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b85a5d7e-0ede-4c59-b18c-50f2f4e560d5",
             input: "N = 10, dislikes = [[1,2],[3,4],[5,6],[7,8],[9,10]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bdc4b2e1-277a-49d7-a0b6-ca8efdc90608",
             input: "N = 12, dislikes = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12]]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "possible-bipartition"
            let topic = "graphs"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_N = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_dislikes = InputParser.parse2DIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [[Int]]"
                )
                return
            }
            guard p_dislikes.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: dislikes 2D array too large (\(p_dislikes.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_N >= 1 && p_N <= 2000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 2000"
                )
                return
            }
            guard p_dislikes.count >= 0 && p_dislikes.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= dislikes.length <= 104"
                )
                return
            }
            guard p_dislikes.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: dislikes[i].length == 2"
                )
                return
            }

            let solution = Solution()
            let result = solution.possibleBipartition(p_N, p_dislikes)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
