import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n == 1 { return [0] }
        var adj = [[Int]](repeating: [], count: n)
        var degree = [Int](repeating: 0, count: n)
        for e in edges {
            adj[e[0]].append(e[1])
            adj[e[1]].append(e[0])
            degree[e[0]] += 1
            degree[e[1]] += 1
        }
        var leaves = (0..<n).filter { degree[$0] == 1 }
        var remaining = n
        while remaining > 2 {
            var newLeaves: [Int] = []
            for leaf in leaves {
                remaining -= 1
                for neighbor in adj[leaf] {
                    degree[neighbor] -= 1
                    if degree[neighbor] == 1 { newLeaves.append(neighbor) }
                }
            }
            leaves = newLeaves
        }
        return leaves
    }
}

@Suite struct MinimumHeightTreesTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "1d5f1cd7-1ea2-408f-bce4-cb711c3ba998"
        let rawInput = "n = 1, edges = []"
        let expectedOutput = "[0]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "8583125f-756a-4a04-99ae-d01f34c7c0da"
        let rawInput = "n = 2, edges = [[0,1]]"
        let expectedOutput = "[0,1]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "ff0a5f85-2194-40d9-a733-b4dc711dbf63"
        let rawInput = "n = 3, edges = [[0,1],[1,2]]"
        let expectedOutput = "[1]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "7f72527f-8a6a-4392-8d71-8d337a15dbb7"
        let rawInput = "n = 4, edges = [[1,0],[1,2],[1,3]]"
        let expectedOutput = "[1]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "86797458-0ffe-48bc-af1d-7e84ed91e1b0"
        let rawInput = "n = 5, edges = [[0,1],[0,2],[0,3],[0,4]]"
        let expectedOutput = "[0]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "016a1fa0-548f-428b-8607-d87fee1a297d"
        let rawInput = "n = 7, edges = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6]]"
        let expectedOutput = "[0]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "551a22ee-995a-45c4-9d4a-6ed28e0625b1"
        let rawInput = "n = 8, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]"
        let expectedOutput = "[3,4]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "3334677e-f83f-4d56-9305-b35947a75d58"
        let rawInput = "n = 9, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8]]"
        let expectedOutput = "[4]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "9ef1de29-d2b8-4777-bfe2-8d4c4812a36f"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]]"
        let expectedOutput = "[4,5]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "365ef80d-83cc-4c1c-803d-40ad07c56208"
        let rawInput = "n = 0, edges = []"
        let expectedOutput = "[]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "91489fed-e61c-44e4-b7a4-9a5d3c9240b9"
        let rawInput = "n = 100, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,18],[18,19],[19,20],[20,21],[21,22],[22,23],[23,24],[24,25],[25,26],[26,27],[27,28],[28,29],[29,30],[30,31],[31,32],[32,33],[33,34],[34,35],[35,36],[36,37],[37,38],[38,39],[39,40],[40,41],[41,42],[42,43],[43,44],[44,45],[45,46],[46,47],[47,48],[48,49],[49,50],[50,51],[51,52],[52,53],[53,54],[54,55],[55,56],[56,57],[57,58],[58,59],[59,60],[60,61],[61,62],[62,63],[63,64],[64,65],[65,66],[66,67],[67,68],[68,69],[69,70],[70,71],[71,72],[72,73],[73,74],[74,75],[75,76],[76,77],[77,78],[78,79],[79,80],[80,81],[81,82],[82,83],[83,84],[84,85],[85,86],[86,87],[87,88],[88,89],[89,90],[90,91],[91,92],[92,93],[93,94],[94,95],[95,96],[96,97],[97,98],[98,99]]"
        let expectedOutput = "[49,50]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "923a62b0-16d6-4d51-9941-b385e94d1bc2"
        let rawInput = "n = 6, edges = [[0,1],[0,2],[0,3],[3,4],[3,5]]"
        let expectedOutput = "[0,3]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "332e44a2-b36d-4636-9f41-fe0419dd4ff6"
        let rawInput = "n = 100, edges = []"
        let expectedOutput = "Infinite Loop"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "9d8e0ee2-b98c-4a80-89b4-1fca0e413fa0"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0]]"
        let expectedOutput = "Infinite Loop"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "a1ded9ab-012b-4f47-a539-10e790088f8d"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,1]]"
        let expectedOutput = "Infinite Loop"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "76446772-d14f-452e-b342-8c7521d80834"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0],[0,9]]"
        let expectedOutput = "Infinite Loop"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "3e255b27-48b5-477a-805c-b3e60e967597"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0],[0,9],[1,9]]"
        let expectedOutput = "Infinite Loop"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "1e473c20-83d1-4d0c-a72c-100c7563f07a"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0],[0,9],[1,9],[2,9]]"
        let expectedOutput = "Infinite Loop"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "849f8f79-e646-4b76-af0c-ca2cbc80af0f"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0],[0,9],[1,9],[2,9],[3,9]]"
        let expectedOutput = "Infinite Loop"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "87cbdd22-5055-4796-813a-b6ee8e1a8a51"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0],[0,9],[1,9],[2,9],[3,9],[4,9]]"
        let expectedOutput = "null"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "53cbf922-ba76-4ca6-8a4a-a34b1a953854"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0],[0,9],[1,9],[2,9],[3,9],[4,9],[5,9]]"
        let expectedOutput = "null"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "46e2c0c7-b43a-418e-8b26-21de05c650ba"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0],[0,9],[1,9],[2,9],[3,9],[4,9],[5,9],[6,9]]"
        let expectedOutput = "null"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "34112636-3101-4375-8d54-96b58b131fd1"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0],[0,9],[1,9],[2,9],[3,9],[4,9],[5,9],[6,9],[7,9]]"
        let expectedOutput = "null"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "53fe4b3e-abba-4c58-896a-7e0d2dd4ed1e"
        let rawInput = "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,0],[0,9],[1,9],[2,9],[3,9],[4,9],[5,9],[6,9],[7,9],[8,9]]"
        let expectedOutput = "null"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "minimum-height-trees"
        let topic = "graphs"
        let testId = "f82f7985-8cfa-4317-97b7-d81cd9c37fb9"
        let rawInput = "n = 6, edges = [[3,0],[3,1],[3,2],[3,4],[5,4]]"
        let expectedOutput = "[3,4]"
        let orderMatters = false

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_n = InputParser.parseInt(params[0])
        let p_edges = InputParser.parse2DIntArray(params[1])
        guard p_edges.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))")
            return
        }

        // Constraint precondition checks
        guard p_n >= 1 && p_n <= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= n <= 2 * 104")
            return
        }

        let solution = Solution()
        let result = solution.findMinHeightTrees(p_n, p_edges)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
