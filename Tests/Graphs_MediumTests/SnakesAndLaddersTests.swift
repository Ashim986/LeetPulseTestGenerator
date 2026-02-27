import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSnakesAndLadders {
    private class Solution {
        func snakesAndLadders(_ board: [[Int]]) -> Int {
            let n = board.count
            func getCoord(_ s: Int) -> (Int, Int) {
                let r = (s - 1) / n
                let c = (s - 1) % n
                let row = n - 1 - r
                let col = r % 2 == 0 ? c : n - 1 - c
                return (row, col)
            }
            var visited = Set<Int>([1])
            var queue = [(1, 0)]
            while !queue.isEmpty {
                let (curr, moves) = queue.removeFirst()
                for i in 1...6 {
                    var next = curr + i
                    if next > n * n { continue }
                    let (r, c) = getCoord(next)
                    if board[r][c] != -1 { next = board[r][c] }
                    if next == n * n { return moves + 1 }
                    if !visited.contains(next) {
                        visited.insert(next)
                        queue.append((next, moves + 1))
                    }
                }
            }
            return -1
        }
    }

    @Suite struct SnakesAndLaddersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "89d517fc-67a4-406e-b5e4-83ef7b1d8b0e",
             input: "board = [[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,36]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cbf4f21a-6570-4eea-88b6-6f72bdb31e4b",
             input: "board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "39866839-8d9a-45fa-be19-fc2e2755bc53",
             input: "board = [[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "1715dedc-20e7-460b-9da5-2106dda42f6e",
             input: "board = [[-1,-1,-1,-1,-1,-1],[-1,2,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "7c0ff23c-3a58-487d-8f67-8717bfe26ed5",
             input: "board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,36]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9d1a1c24-b982-4e92-832a-b25620cd1e66",
             input: "board = [[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,1],[1,1,1,1,1,-1]]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "6be117b1-d36b-43bb-8ad3-918c35210819",
             input: "board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,1]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "40ac7766-4463-497b-b433-cba59238c30d",
             input: "board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "841cf945-5493-4f2d-af75-0279e8762ed0",
             input: "board = [[-1,-1],[-1,3]]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "snakes-and-ladders"
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

            guard let p_board = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_board.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: board 2D array too large (\(p_board.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_board.count >= 2 && p_board.count <= 20 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= n <= 20"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.snakesAndLadders(p_board)
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
