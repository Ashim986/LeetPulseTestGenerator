import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLoudAndRich {
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

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3b2b6c00-0cea-4e76-af0c-962c72e35f66",
             input: "richer = [[1,0]], quiet = [0,1]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "6e4aaf06-dbc8-4ec0-a674-1927b5584e71",
             input: "richer = [], quiet = [1]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "38c37dca-ad18-4b93-a7c6-a243fe909db5",
             input: "richer = [[0,1]], quiet = [1,0]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "4d263681-a9b0-4421-83db-bec8d5bf1e13",
             input: "richer = [[1,0],[2,1]], quiet = [0,1,2]",
             expected: "[0,1,2]", orderMatters: true),
            TestCaseData(id: "84553347-832a-4f38-a29b-05e9ae36279a",
             input: "richer = [[0,1],[1,2]], quiet = [1,0,2]",
             expected: "[0,1,1]", orderMatters: true),
            TestCaseData(id: "256436c8-0712-4acd-9597-c19882231a66",
             input: "richer = [[1,0],[2,1],[3,2]], quiet = [0,1,2,3]",
             expected: "[0,1,2,3]", orderMatters: true),
            TestCaseData(id: "225cdd63-1b8a-4956-8668-d8a241a6c2d5",
             input: "richer = [[0,1],[0,2],[0,3]], quiet = [1,0,2,3]",
             expected: "[0,1,0,0]", orderMatters: true),
            TestCaseData(id: "52d0a933-3004-46ba-87b7-c7a148c85b52",
             input: "richer = [[1,0],[2,0],[3,0]], quiet = [0,1,2,3]",
             expected: "[0,1,2,3]", orderMatters: true),
            TestCaseData(id: "6d525184-d75c-40bf-9f1d-e926a099ecfd",
             input: "richer = [[1,0],[1,2],[1,3]], quiet = [0,1,2,3]",
             expected: "[0,1,1,1]", orderMatters: true),
            TestCaseData(id: "70ee610b-b40b-4f1f-9a33-25cccf57f0d2",
             input: "richer = [[0,1],[1,2],[2,3]], quiet = [1,0,2,3]",
             expected: "[0,1,1,1]", orderMatters: true),
            TestCaseData(id: "94ad0498-0e04-4632-9a7f-e4ee52e1016d",
             input: "richer = [[0,1],[0,2],[0,3],[1,2],[1,3],[2,3]], quiet = [1,0,2,3]",
             expected: "[0,1,1,1]", orderMatters: true),
            TestCaseData(id: "0bd7833b-e17e-472c-a6d4-5a877eec8294",
             input: "richer = [[1,0],[2,1],[3,2],[4,3]], quiet = [0,1,2,3,4]",
             expected: "[0,1,2,3,4]", orderMatters: true),
            TestCaseData(id: "96de66d1-9884-4ff4-9272-5fb61932ba50",
             input: "richer = [[0,1],[1,2],[2,3],[3,4]], quiet = [1,0,2,3,4]",
             expected: "[0,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "ff96dbaf-d770-461c-ae15-68cce0d6e076",
             input: "richer = [[0,1],[0,2],[0,3],[0,4]], quiet = [1,0,2,3,4]",
             expected: "[0,1,0,0,0]", orderMatters: true),
            TestCaseData(id: "8c19cee0-eb8f-4b46-ab4e-a432ac26b0ba",
             input: "richer = [[1,0],[1,2],[1,3],[1,4]], quiet = [0,1,2,3,4]",
             expected: "[0,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "0de2aa9c-079e-4936-852f-8c25dc19a902",
             input: "richer = [[0,1],[1,2],[2,3],[3,4],[4,5]], quiet = [1,0,2,3,4,5]",
             expected: "[0,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "74138f57-0324-47bd-8cfd-d53d2bdbec7b",
             input: "richer = [[0,1],[0,2],[0,3],[0,4],[0,5]], quiet = [1,0,2,3,4,5]",
             expected: "[0,1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "b67c35e1-a001-4aef-b014-131c690c1a9f",
             input: "richer = [[1,0],[1,2],[1,3],[1,4],[1,5]], quiet = [0,1,2,3,4,5]",
             expected: "[0,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "cb395833-55c6-4399-b06e-ac45c35dcfed",
             input: "richer = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6]], quiet = [1,0,2,3,4,5,6]",
             expected: "[0,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "eed90b5d-546d-476d-b527-26b6e1c5f961",
             input: "richer = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6]], quiet = [1,0,2,3,4,5,6]",
             expected: "[0,1,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "8283f8a7-9558-4912-b519-d43ded563c88",
             input: "richer = [[1,0],[1,2],[1,3],[1,4],[1,5],[1,6]], quiet = [0,1,2,3,4,5,6]",
             expected: "[0,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "e741df6d-5b1e-4bad-887b-0c592c2eb59f",
             input: "richer = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[1,2],[1,3],[1,4],[1,5],[1,6]], quiet = [1,0,2,3,4,5,6]",
             expected: "[0,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "4d68a9f5-a89f-4e51-864e-78b183803e64",
             input: "richer = [[1,0],[2,1],[3,2],[4,3],[5,4],[6,5]], quiet = [0,1,2,3,4,5,6]",
             expected: "[0,1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "effb9a14-0507-4224-8562-f686d016d185",
             input: "richer = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]], quiet = [1,0,2,3,4,5,6,7]",
             expected: "[0,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "d5e11036-7b35-4ece-9464-d00621329f99",
             input: "richer = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7]], quiet = [1,0,2,3,4,5,6,7]",
             expected: "[0,1,0,0,0,0,0,0]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "loud-and-rich"
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

            guard let p_richer = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_richer.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: richer 2D array too large (\(p_richer.count))"
                )
                return
            }
            guard let p_quiet = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_quiet.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: quiet array too large (\(p_quiet.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.loudAndRich(p_richer, p_quiet)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
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
