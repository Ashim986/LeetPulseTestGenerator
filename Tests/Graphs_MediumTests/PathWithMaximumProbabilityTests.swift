import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPathWithMaximumProbability {
    private class Solution {
        func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
            var graph = [Int: [(Int, Double)]]()
            for (i, e) in edges.enumerated() {
                graph[e[0], default: []].append((e[1], succProb[i]))
                graph[e[1], default: []].append((e[0], succProb[i]))
            }
            var prob = [Double](repeating: 0, count: n)
            prob[start] = 1
            var heap = [(1.0, start)]  // (prob, node)

            while !heap.isEmpty {
                heap.sort { $0.0 > $1.0 }  // Max heap
                let (p, node) = heap.removeFirst()
                if node == end { return p }
                if p < prob[node] { continue }
                for (next, edgeProb) in graph[node] ?? [] {
                    let newProb = p * edgeProb
                    if newProb > prob[next] {
                        prob[next] = newProb
                        heap.append((newProb, next))
                    }
                }
            }
            return 0
        }
    }

    @Suite struct PathWithMaximumProbabilityTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1362bdb7-b8ad-4fc5-8b13-fb39395a382d",
             input: "n = 1, edges = [], succProb = [], start = 0, end = 0",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "6ab657e7-3222-424b-be38-7f8b6450a67b",
             input: "n = 2, edges = [[0,1]], succProb = [1.0], start = 0, end = 1",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "d191c0b1-f4c9-4e12-9aff-62197d26d7ac",
             input: "n = 2, edges = [[0,1]], succProb = [0.0], start = 0, end = 1",
             expected: "0.0", orderMatters: true),
            TestCaseData(id: "91bd901c-1d19-4e9d-911c-3df40dd53222",
             input: "n = 3, edges = [[0,1],[1,2]], succProb = [0.5,0.5], start = 0, end = 2",
             expected: "0.25", orderMatters: true),
            TestCaseData(id: "8743f509-eea5-4b9e-93e2-a779bc2186d3",
             input: "n = 3, edges = [[0,1],[1,2]], succProb = [0.0,0.0], start = 0, end = 2",
             expected: "0.0", orderMatters: true),
            TestCaseData(id: "49ab43e0-e31e-484d-b75d-2da6c421489c",
             input: "n = 4, edges = [[0,1],[1,2],[2,3]], succProb = [0.5,0.5,0.5], start = 0, end = 3",
             expected: "0.125", orderMatters: true),
            TestCaseData(id: "34006c8b-ec88-435c-abad-4f6de92f7f3f",
             input: "n = 5, edges = [[0,1],[1,2],[2,3],[3,4]], succProb = [0.5,0.5,0.5,0.5], start = 0, end = 4",
             expected: "0.0625", orderMatters: true),
            TestCaseData(id: "45c6f8a6-3028-4c90-98e9-4328da93a240",
             input: "n = 6, edges = [[0,1],[1,2],[2,3],[3,4],[4,5]], succProb = [0.5,0.5,0.5,0.5,0.5], start = 0, end = 5",
             expected: "0.03125", orderMatters: true),
            TestCaseData(id: "8390c96d-ecb7-4ef1-ae9e-fcb2b267976d",
             input: "n = 7, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6]], succProb = [0.5,0.5,0.5,0.5,0.5,0.5], start = 0, end = 6",
             expected: "0.015625", orderMatters: true),
            TestCaseData(id: "f894a202-7aec-4c79-99af-28f2d00b2a38",
             input: "n = 8, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]], succProb = [0.5,0.5,0.5,0.5,0.5,0.5,0.5], start = 0, end = 7",
             expected: "0.0078125", orderMatters: true),
            TestCaseData(id: "5347b4c8-90ed-430b-b030-7332533204c0",
             input: "n = 9, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8]], succProb = [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5], start = 0, end = 8",
             expected: "0.00390625", orderMatters: true),
            TestCaseData(id: "c72fd9d6-8349-4ded-8b22-8ea2eb470f13",
             input: "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]], succProb = [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5], start = 0, en"
                + "d = 9",
             expected: "0.001953125", orderMatters: true),
            TestCaseData(id: "a2354de6-1dd8-493e-8552-8d4518682274",
             input: "n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.0,0.0,0.0], start = 0, end = 2",
             expected: "0.0", orderMatters: true),
            TestCaseData(id: "ab931bc8-f516-4a19-b7c1-457dbdd5e7dd",
             input: "n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [1.0,1.0,1.0], start = 0, end = 2",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "88825568-981e-4215-a7ad-5d77249f9df3",
             input: "n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.5], start = 0, end = 2",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "21986e31-1d53-415a-9dfb-78866db37b62",
             input: "n = 4, edges = [[0,1],[1,2],[2,3],[0,3]], succProb = [0.5,0.5,0.5,0.5], start = 0, end = 3",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "6f0bf11a-78ad-4767-8f50-0fb3073a49e4",
             input: "n = 5, edges = [[0,1],[1,2],[2,3],[3,4],[0,4]], succProb = [0.5,0.5,0.5,0.5,0.5], start = 0, end = 4",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "4a178a65-feb6-48e1-9bf0-23e8861341eb",
             input: "n = 6, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[0,5]], succProb = [0.5,0.5,0.5,0.5,0.5,0.5], start = 0, end = 5",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "69e76158-8929-4ca6-87a3-189fbacfca4a",
             input: "n = 7, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[0,6]], succProb = [0.5,0.5,0.5,0.5,0.5,0.5,0.5], start = 0, end = 6",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "c545b4a2-10c6-44d0-af61-6e66e3205961",
             input: "n = 8, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[0,7]], succProb = [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5], start = 0, end = 7",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "34942581-5dab-4677-b063-4020e82f66cc",
             input: "n = 9, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[0,8]], succProb = [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5], start = 0, end"
                + " = 8",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "29a83447-aa95-4f3f-947e-067ac17016cb",
             input: "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[0,9]], succProb = [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5], sta"
                + "rt = 0, end = 9",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "73b5cf57-0ce8-4f06-90cd-1ce99f0b33cf",
             input: "n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.2,0.2,0.2], start = 0, end = 2",
             expected: "0.2", orderMatters: true),
            TestCaseData(id: "7b0fd395-04a9-418e-9daa-2a5ac866a3a0",
             input: "n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.8,0.8,0.8], start = 0, end = 2",
             expected: "0.8", orderMatters: true),
            TestCaseData(id: "e5cf97a1-dccc-4b7e-89d0-2873a98e2012",
             input: "n = 4, edges = [[0,1],[1,2],[2,3],[0,3]], succProb = [0.2,0.2,0.2,0.2], start = 0, end = 3",
             expected: "0.2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "path-with-maximum-probability"
            let topic = "graphs"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 5 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 5, got \(params.count)"
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
            guard let p_succProb = InputParser.parseDoubleArray(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as [Double]"
                )
                return
            }
            guard p_succProb.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: succProb array too large (\(p_succProb.count))"
                )
                return
            }
            guard let p_start = InputParser.parseInt(params[3]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 3 as Int"
                )
                return
            }
            guard let p_end = InputParser.parseInt(params[4]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 4 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 2 && p_n <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= n <= 10^4"
                )
                return
            }
            guard p_succProb.allSatisfy({ $0 >= 0 && $0 <= 1 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= succProb[i] <= 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Double?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxProbability(p_n, p_edges, p_succProb, p_start, p_end)
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

            // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
            // Treats -0 and 0 as equal; handles trailing zero normalization
            let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
            let matches = abs(result - expectedVal) < 1e-5
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
