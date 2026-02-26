import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfEnclaves {
    private class Solution {
        func numEnclaves(_ grid: [[Int]]) -> Int {
            let rows = grid.count
            let cols = grid.first?.count ?? 0
            guard rows > 0, cols > 0 else { return 0 }

            var grid = grid
            var queue: [(Int, Int)] = []

            func add(_ r: Int, _ c: Int) {
                guard r >= 0, r < rows, c >= 0, c < cols else { return }
                guard grid[r][c] == 1 else { return }
                grid[r][c] = 0
                queue.append((r, c))
            }

            for r in 0..<rows {
                add(r, 0)
                add(r, cols - 1)
            }
            for c in 0..<cols {
                add(0, c)
                add(rows - 1, c)
            }

            var index = 0
            let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
            while index < queue.count {
                let (r, c) = queue[index]
                index += 1
                for (dr, dc) in dirs {
                    add(r + dr, c + dc)
                }
            }

            var remaining = 0
            for r in 0..<rows {
                for c in 0..<cols {
                    if grid[r][c] == 1 { remaining += 1 }
                }
            }
            return remaining
        }
    }

    @Suite struct NumberOfEnclavesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "32352896-fd50-4bdc-8517-d5c9f295c8cf",
             input: "grid = [[1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b3101985-9718-4ed2-813c-7d9906bbea35",
             input: "grid = [[0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e17e89ca-8122-4129-8217-6ccde4012ab8",
             input: "grid = [[0,0],[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7825773d-a029-492c-8c6f-7ec80f5844ff",
             input: "grid = [[0,1,0],[1,0,1],[0,1,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7c71598f-5d19-4248-bdd1-cbb9d994b618",
             input: "grid = [[0,0,0],[0,1,0],[0,0,0]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dd763706-61fa-40b8-b016-4d84d75cda35",
             input: "grid = [[1,1,1,1],[1,0,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5e59aa62-193b-45d2-a266-a3ee442e70a3",
             input: "grid = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "90c9a72f-2bb9-4881-8225-7a28d0c0711c",
             input: "grid = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0567246b-290d-4ca6-af1f-ce2ab47cc6e0",
             input: "grid = [[0,1,0,0],[0,1,0,0],[0,1,0,0],[0,1,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "148e65e5-a45f-494d-9eb0-0e3bbf35a4cc",
             input: "grid = [[1,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b0ae8371-7a55-4d9f-be3e-de2f56fe74af",
             input: "grid = [[0,0,0,0],[0,1,1,0],[0,1,1,0],[0,0,0,0]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "37041068-7f63-4b35-a7e7-054ffaf30fc4",
             input: "grid = [[1,1,1,1,1,1,1,1],[1,0,0,0,0,0,0,1],[1,0,1,1,1,1,0,1],[1,0,1,0,0,1,0,1],[1,0,1,1,1,1,0,1],[1,0,0,0,0,0,0,1],[1,1,1,1,1,1,1,1]]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "7bf5ffbe-e5fa-4f81-90fa-1107135e3b0d",
             input: "grid = [[1,1],[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8f0d3cfb-5c09-409d-92cd-87060f21734d",
             input: "grid = [[1,0,1],[0,1,0],[1,0,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "212e6f31-f78b-4a02-8d8d-37245cbebdcf",
             input: "grid = [[1,1,1],[1,0,1],[1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9c027709-df21-412e-8156-c916d2bef5c9",
             input: "grid = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "edad8d39-8351-4038-b049-c7cdb5cd0245",
             input: "grid = [[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cdcd183a-8ba3-48da-ba53-7ba97219d933",
             input: "grid = [[1,1,1,1],[1,0,0,1],[1,0,0,1],[1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "71494cb7-bd0b-4fd6-b57c-df97c7f43646",
             input: "grid = [[0,0,0,0,0],[0,1,1,1,0],[0,1,0,1,0],[0,1,1,1,0],[0,0,0,0,0]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "14649062-8274-4073-a31e-ed24baa05887",
             input: "grid = [[1,1,1,1,1],[1,0,0,0,1],[1,0,0,0,1],[1,0,0,0,1],[1,1,1,1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d29781d7-e052-41fe-b10c-72e38f83673c",
             input: "grid = [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ac00d888-91e1-40fe-b853-aa46331020c4",
             input: "grid = [[0,0,0,0,0,0],[0,1,1,1,1,0],[0,1,0,0,1,0],[0,1,0,0,1,0],[0,1,1,1,1,0],[0,0,0,0,0,0]]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "d450bde7-ccaf-4122-8d0d-9e7ffa37936c",
             input: "grid = [[1,1,1,1,1,1],[1,0,0,0,0,1],[1,0,1,1,0,1],[1,0,0,0,0,1],[1,0,1,1,0,1],[1,1,1,1,1,1]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "31472c36-c49a-4b4e-973d-8a9fcb67e6e1",
             input: "grid = [[0,0,0,0,0,0,0],[0,1,1,1,1,1,0],[0,1,0,0,0,1,0],[0,1,0,0,0,1,0],[0,1,1,1,1,1,0],[0,0,0,0,0,0,0]]",
             expected: "14", orderMatters: true),
            TestCaseData(id: "b9e1e2b9-b038-4913-ad10-e6d4748c9ad9",
             input: "grid = [[1,1,1,1,1,1,1],[1,0,0,0,0,0,1],[1,0,1,1,1,0,1],[1,0,0,0,0,0,1],[1,0,1,1,1,0,1],[1,0,0,0,0,0,1],[1,1,1,1,1,1,1]]",
             expected: "6", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-enclaves"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_grid = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_grid.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: grid 2D array too large (\(p_grid.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.numEnclaves(p_grid)
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
