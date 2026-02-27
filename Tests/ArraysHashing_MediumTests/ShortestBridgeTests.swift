import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCShortestBridge {
    private class Solution {
        func shortestBridge(_ A: [[Int]]) -> Int {
            var dirs = [[-1, 0], [0, -1], [0, 1], [1, 0]]
            var queue = [(Int, Int, Int)]()
            var visited = [[Bool]](repeating: [Bool](repeating: false, count: A[0].count), count: A.count)

            func isValid(_ x: Int, _ y: Int) -> Bool {
                return x >= 0 && x < A.count && y >= 0 && y < A[0].count
            }

            func bfs() -> Int {
                var res = 0
                while !queue.isEmpty {
                    let (x, y, d) = queue.removeFirst()

                    if A[x][y] == 1 && d > 0 {
                        return d
                    }

                    for dir in dirs {
                        let nx = x + dir[0]
                        let ny = y + dir[1]

                        if isValid(nx, ny) && !visited[nx][ny] {
                            visited[nx][ny] = true

                            if A[nx][ny] == 1 {
                                queue.append((nx, ny, d + 1))
                            } else {
                                queue.append((nx, ny, d + 1))
                            }
                        }
                    }
                }
                return res
            }

            func getFirstIsland() -> [(Int, Int)] {
                var island = [(Int, Int)]()
                for i in 0...A.count-1 {
                    for j in 0...A[0].count-1 {
                        if A[i][j] == 1 {
                            island.append((i, j))
                            visited[i][j] = true
                            var stack = [(i, j)]
                            while !stack.isEmpty {
                                let (x, y) = stack.removeLast()
                                for dir in dirs {
                                    let nx = x + dir[0]
                                    let ny = y + dir[1]

                                    if isValid(nx, ny) && !visited[nx][ny] && A[nx][ny] == 1 {
                                        island.append((nx, ny))
                                        visited[nx][ny] = true
                                        stack.append((nx, ny))
                                    }
                                }
                            }
                            return island
                        }
                    }
                }
                return island
            }

            var island = getFirstIsland()
            for (x, y) in island {
                queue.append((x, y, 0))
            }
            return bfs()
        }
    }

    @Suite struct ShortestBridgeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "de10c6d3-90d7-42aa-a5e7-eccadce475f3",
             input: "A = [[1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b84a72c9-f65a-47b7-8ad7-a836b8f3f62a",
             input: "A = [[0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2d7228d6-ee76-4af0-ab25-6e113ea1c46b",
             input: "A = [[0,0],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dc02737e-ae8d-490e-b498-02ce0a9b8f88",
             input: "A = [[0,0,0,0,0,0,0],[0,1,1,1,1,1,0],[0,0,0,0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "29511aed-63f8-4910-811d-67bd27880ca8",
             input: "A = [[1,1,1,1,1,1,1],[1,0,0,0,0,0,1],[1,0,1,0,1,0,1],[1,0,0,0,0,0,1],[1,1,1,1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ad93f165-2e4c-461a-9826-c8fccaeca3cc",
             input: "A = [[0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5c415d6a-5f74-47b4-bdd3-50c0582dea0f",
             input: "A = [[0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "77d95444-1862-443c-9a80-d00ff1dc72f8",
             input: "A = [[1,1,1,1,1,1,1,1,1],[1,0,0,0,0,0,0,0,1],[1,0,1,0,1,0,1,0,1],[1,0,0,0,0,0,0,0,1],[1,1,1,1,1,1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1723b92f-2a46-49fa-86f6-16d72c67cd9c",
             input: "A = [[0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ca2902de-ef85-467b-8883-e36be343f07b",
             input: "A = [[0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2a83f390-42b7-4fa3-bf73-de7c8d0f2480",
             input: "A = [[1,1,1,1,1,1,1,1,1,1,1],[1,0,0,0,0,0,0,0,0,0,1],[1,0,1,0,1,0,1,0,1,0,1],[1,0,0,0,0,0,0,0,0,0,1],[1,1,1,1,1,1,1,1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e8a373a9-74cc-4213-b0b1-b133976d4a21",
             input: "A = [[0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "27e74b59-3eec-4643-92e9-57938966998b",
             input: "A = [[1,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0],["
                + "0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,"
                + "0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,1]]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "34ef6fde-1592-4111-9b0b-fe2a405d7aad",
             input: "A = [[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f0c13298-8835-4a37-aba9-709de78737ed",
             input: "A = [[1,1,1,1,1,1,1,1,1,1,1,1,1],[1,0,0,0,0,0,0,0,0,0,0,0,1],[1,0,1,0,1,0,1,0,1,0,1,0,1],[1,0,0,0,0,0,0,0,0,0,0,0,1],[1,1,1,1,1,1,1,1,1,"
                + "1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6dfc20f9-991f-42d9-b5e0-cf3afb436d6b",
             input: "A = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "67a16330-a042-4df0-9a19-d794827cd732",
             input: "A = [[1,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,"
                + "0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,"
                + "0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,"
                + "0,0,0,0,0,0,0,1]]",
             expected: "13", orderMatters: true),
            TestCaseData(id: "afe62b0c-3d4a-43f3-baaf-df0da12f0595",
             input: "A = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6ac8cc37-6074-419c-8ba9-dc3e8d3a1de3",
             input: "A = [[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],[1,0,0,0,0,0,0,0,0,0,0,0,0,0,1],[1,0,1,0,1,0,1,0,1,0,1,0,1,0,1],[1,0,0,0,0,0,0,0,0,0,0,0,0,0,1],[1,"
                + "1,1,1,1,1,1,1,1,1,1,1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "54dc07f8-1208-4521-9e7c-19c03690ab3d",
             input: "A = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2a78717b-f9b7-4087-80bb-f4d192c143df",
             input: "A = [[1,0],[0,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8816ac9b-7abe-4255-886b-332e0ecacf0a",
             input: "A = [[1,1],[1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3d9c58e2-7782-4ca0-9613-e764f9aa4ec9",
             input: "A = [[0,0,0],[0,1,0],[0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f03d949e-db2f-4a92-a52c-29d070f9fc5a",
             input: "A = [[0,0,0,0],[0,1,1,0],[0,0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7b3e2ff4-440d-4e73-aa4f-dc27ff5951f0",
             input: "A = [[1,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,1]]",
             expected: "6", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "shortest-bridge"
            let topic = "arrays-hashing"
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

            guard let p_A = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_A.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A 2D array too large (\(p_A.count))"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.shortestBridge(p_A)
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
