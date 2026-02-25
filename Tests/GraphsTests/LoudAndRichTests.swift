import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func loudAndRich(_ richer: [[Int]], _ quiet: [Int]) -> [Int] {
        let n = quiet.count
        var graph = [[Int]](repeating: [], count: n)
        for r in richer {
            graph[r[1]].append(r[0])
        }
        var answer = [Int](repeating: -1, count: n)

        func dfs(_ node: Int) -> Int {
            if answer[node] != -1 { return answer[node] }
            answer[node] = node
            for richer in graph[node] {
                let candidate = dfs(richer)
                if quiet[candidate] < quiet[answer[node]] {
                    answer[node] = candidate
                }
            }
            return answer[node]
        }

        for i in 0..<n { dfs(i) }
        return answer
    }
}

@Suite struct LoudAndRichTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "3b2b6c00-0cea-4e76-af0c-962c72e35f66"
        let rawInput = "richer = [[1,0]], quiet = [0,1]"
        let expectedOutput = "[0,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "6e4aaf06-dbc8-4ec0-a674-1927b5584e71"
        let rawInput = "richer = [], quiet = [1]"
        let expectedOutput = "[0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "38c37dca-ad18-4b93-a7c6-a243fe909db5"
        let rawInput = "richer = [[0,1]], quiet = [1,0]"
        let expectedOutput = "[0,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "4d263681-a9b0-4421-83db-bec8d5bf1e13"
        let rawInput = "richer = [[1,0],[2,1]], quiet = [0,1,2]"
        let expectedOutput = "[0,1,2]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "84553347-832a-4f38-a29b-05e9ae36279a"
        let rawInput = "richer = [[0,1],[1,2]], quiet = [1,0,2]"
        let expectedOutput = "[0,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "256436c8-0712-4acd-9597-c19882231a66"
        let rawInput = "richer = [[1,0],[2,1],[3,2]], quiet = [0,1,2,3]"
        let expectedOutput = "[0,1,2,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "225cdd63-1b8a-4956-8668-d8a241a6c2d5"
        let rawInput = "richer = [[0,1],[0,2],[0,3]], quiet = [1,0,2,3]"
        let expectedOutput = "[0,1,0,0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "52d0a933-3004-46ba-87b7-c7a148c85b52"
        let rawInput = "richer = [[1,0],[2,0],[3,0]], quiet = [0,1,2,3]"
        let expectedOutput = "[0,1,2,3]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "6d525184-d75c-40bf-9f1d-e926a099ecfd"
        let rawInput = "richer = [[1,0],[1,2],[1,3]], quiet = [0,1,2,3]"
        let expectedOutput = "[0,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "70ee610b-b40b-4f1f-9a33-25cccf57f0d2"
        let rawInput = "richer = [[0,1],[1,2],[2,3]], quiet = [1,0,2,3]"
        let expectedOutput = "[0,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "94ad0498-0e04-4632-9a7f-e4ee52e1016d"
        let rawInput = "richer = [[0,1],[0,2],[0,3],[1,2],[1,3],[2,3]], quiet = [1,0,2,3]"
        let expectedOutput = "[0,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "0bd7833b-e17e-472c-a6d4-5a877eec8294"
        let rawInput = "richer = [[1,0],[2,1],[3,2],[4,3]], quiet = [0,1,2,3,4]"
        let expectedOutput = "[0,1,2,3,4]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "96de66d1-9884-4ff4-9272-5fb61932ba50"
        let rawInput = "richer = [[0,1],[1,2],[2,3],[3,4]], quiet = [1,0,2,3,4]"
        let expectedOutput = "[0,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "ff96dbaf-d770-461c-ae15-68cce0d6e076"
        let rawInput = "richer = [[0,1],[0,2],[0,3],[0,4]], quiet = [1,0,2,3,4]"
        let expectedOutput = "[0,1,0,0,0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "8c19cee0-eb8f-4b46-ab4e-a432ac26b0ba"
        let rawInput = "richer = [[1,0],[1,2],[1,3],[1,4]], quiet = [0,1,2,3,4]"
        let expectedOutput = "[0,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "0de2aa9c-079e-4936-852f-8c25dc19a902"
        let rawInput = "richer = [[0,1],[1,2],[2,3],[3,4],[4,5]], quiet = [1,0,2,3,4,5]"
        let expectedOutput = "[0,1,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "74138f57-0324-47bd-8cfd-d53d2bdbec7b"
        let rawInput = "richer = [[0,1],[0,2],[0,3],[0,4],[0,5]], quiet = [1,0,2,3,4,5]"
        let expectedOutput = "[0,1,0,0,0,0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "b67c35e1-a001-4aef-b014-131c690c1a9f"
        let rawInput = "richer = [[1,0],[1,2],[1,3],[1,4],[1,5]], quiet = [0,1,2,3,4,5]"
        let expectedOutput = "[0,1,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "cb395833-55c6-4399-b06e-ac45c35dcfed"
        let rawInput = "richer = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6]], quiet = [1,0,2,3,4,5,6]"
        let expectedOutput = "[0,1,1,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "eed90b5d-546d-476d-b527-26b6e1c5f961"
        let rawInput = "richer = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6]], quiet = [1,0,2,3,4,5,6]"
        let expectedOutput = "[0,1,0,0,0,0,0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "8283f8a7-9558-4912-b519-d43ded563c88"
        let rawInput = "richer = [[1,0],[1,2],[1,3],[1,4],[1,5],[1,6]], quiet = [0,1,2,3,4,5,6]"
        let expectedOutput = "[0,1,1,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "e741df6d-5b1e-4bad-887b-0c592c2eb59f"
        let rawInput = "richer = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[1,2],[1,3],[1,4],[1,5],[1,6]], quiet = [1,0,2,3,4,5,6]"
        let expectedOutput = "[0,1,1,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "4d68a9f5-a89f-4e51-864e-78b183803e64"
        let rawInput = "richer = [[1,0],[2,1],[3,2],[4,3],[5,4],[6,5]], quiet = [0,1,2,3,4,5,6]"
        let expectedOutput = "[0,1,2,3,4,5,6]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "effb9a14-0507-4224-8562-f686d016d185"
        let rawInput = "richer = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]], quiet = [1,0,2,3,4,5,6,7]"
        let expectedOutput = "[0,1,1,1,1,1,1,1]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "loud-and-rich"
        let topic = "graphs"
        let testId = "d5e11036-7b35-4ece-9464-d00621329f99"
        let rawInput = "richer = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7]], quiet = [1,0,2,3,4,5,6,7]"
        let expectedOutput = "[0,1,0,0,0,0,0,0]"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_richer = InputParser.parse2DIntArray(params[0])
        guard p_richer.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))")
            return
        }
        let p_quiet = InputParser.parseIntArray(params[1])
        guard p_quiet.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))")
            return
        }

        let solution = Solution()
        let result = solution.loudAndRich(p_richer, p_quiet)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
