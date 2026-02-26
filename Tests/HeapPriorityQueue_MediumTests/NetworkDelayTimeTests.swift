import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNetworkDelayTime {
    private class Solution {
        func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
            var graph = [Int: [(Int, Int)]]()
            for t in times {
                graph[t[0], default: []].append((t[1], t[2]))
            }

            var dist = [Int: Int]()
            var heap = [(0, k)]  // (distance, node)

            while !heap.isEmpty {
                heap.sort { $0.0 > $1.0 }  // Simple heap simulation
                let (d, node) = heap.removeLast()

                if dist[node] != nil { continue }
                dist[node] = d

                for (neighbor, weight) in graph[node] ?? [] {
                    if dist[neighbor] == nil {
                        heap.append((d + weight, neighbor))
                    }
                }
            }

            if dist.count != n { return -1 }
            return dist.values.max().unsafelyUnwrapped
        }
    }

    @Suite struct NetworkDelayTimeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3c0c815a-a298-4980-98e4-5077cc1317e2",
             input: "times = [[1,2,1]], n = 2, k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2ea172b6-20a4-48de-a1eb-3f86543a50fc",
             input: "times = [[1,2,1],[2,3,1]], n = 3, k = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "28450fb1-1654-4fc0-84e5-35f58e390176",
             input: "times = [[1,2,1],[2,3,1],[3,4,1]], n = 4, k = 1",
             expected: "3", orderMatters: true),
            TestCaseData(id: "b9bda7a3-3f19-4805-86db-e7e3eab2cfd2",
             input: "times = [[1,2,1],[2,1,1]], n = 2, k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fe5b22a6-617b-4575-be4a-24488c871d09",
             input: "times = [[1,2,1],[1,3,1]], n = 3, k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "65d1b2b1-ff99-4fbe-895e-e0879f6991eb",
             input: "times = [[1,2,1],[2,3,1],[3,1,1]], n = 3, k = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1744957f-4e58-4d97-8712-0f958c5f8c73",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1]], n = 5, k = 1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "3f2f87cc-9915-41a3-9922-c5b78e4224ca",
             input: "times = [[1,2,1],[1,3,1],[1,4,1],[1,5,1]], n = 5, k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4cb3060d-ef85-4bcd-9ed9-0e3903be0a28",
             input: "times = [[1,2,1],[2,3,1],[3,1,1],[1,3,1]], n = 3, k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0906d658-a43e-4f93-94e0-c54d1f5b2424",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1]], n = 6, k = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a8049d55-d860-4f80-b298-ee577d337612",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "6804358b-ef13-45ed-91e4-2e9faeb07c58",
             input: "times = [[1,2,1],[1,3,1],[1,4,1],[1,5,1],[1,6,1],[1,7,1]], n = 7, k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c814d74d-a630-4769-b95c-5ec5ad532427",
             input: "times = [[1,2,1],[2,1,1]], n = 2, k = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2d6edea9-c1d7-4c21-af2c-7f5f78ed6535",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[7,1,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "4fa3f802-bf18-48cd-a1b2-3a9825458caf",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[7,2,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "a700a719-5c2a-42a1-b737-bb595ca638c0",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[7,3,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "77a65f4d-db75-4004-90b2-8bb947141d54",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[7,4,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "e723f700-61a8-4419-9a6d-38ae9dd52c55",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[7,5,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "76df7059-57b1-4570-9f00-a6035ac0b5c1",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[7,6,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "2bfb17c2-879c-47ef-9794-6f7657925b26",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[1,1,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "2fedc1a5-1019-4451-a5fc-a8742a2f07a1",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[2,2,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "11fbeb48-8c35-4084-b2e2-5099b5036518",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[3,3,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "d8824b29-0f7e-438c-add3-3bc3747e36ab",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[4,4,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "d376753a-2a41-4784-ac71-d1c04446a42d",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[5,5,1]], n = 7, k = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "51bf8749-d740-413f-b7d1-da288ffa27e1",
             input: "times = [[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,6,1],[6,7,1],[6,6,1]], n = 7, k = 1",
             expected: "6", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "network-delay-time"
            let topic = "heap-priority-queue"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            guard let p_times = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_times.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: times 2D array too large (\(p_times.count))"
                )
                return
            }
            guard let p_n = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_k = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_k >= 1 && p_k <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= n <= 100"
                )
                return
            }
            guard p_n >= 1 && p_n <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= n <= 100"
                )
                return
            }
            guard p_times.count >= 1 && p_times.count <= 6000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= times.length <= 6000"
                )
                return
            }
            guard p_times.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: times[i].length == 3"
                )
                return
            }

            let solution = Solution()
            let result = solution.networkDelayTime(p_times, p_n, p_k)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
