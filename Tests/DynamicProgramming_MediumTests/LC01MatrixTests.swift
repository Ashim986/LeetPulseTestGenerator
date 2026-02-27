import Foundation
@testable import LeetCodeHelpers
import Testing

enum LC01Matrix {
    // Create a new Swift file named `Solution.swift` and paste this code into it

    private class Solution {
        func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
            let n = mat.count
            let m = mat[0].count
            var result = Array(repeating: Array(repeating: 1000000, count: m), count: n)
            var queue: [(Int, Int)] = []

            for i in 0..<n {
                for j in 0..<m {
                    if mat[i][j] == 0 {
                        result[i][j] = 0
                        queue.append((i, j))
                    }
                }
            }

            let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
            while !queue.isEmpty {
                let (x, y) = queue.removeFirst()
                for (dx, dy) in directions {
                    let nx = x + dx
                    let ny = y + dy
                    if nx >= 0 && nx < n && ny >= 0 && ny < m {
                        if result[nx][ny] > result[x][y] + 1 {
                            result[nx][ny] = result[x][y] + 1
                            queue.append((nx, ny))
                        }
                    }
                }
            }

            return result
        }
    }

    @Suite struct LC01MatrixTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b7e5d123-9ede-42e6-a5d4-52dc2d0ecc50",
             input: "mat = [[0]]",
             expected: "[[0]]", orderMatters: true),
            TestCaseData(id: "bc63d20c-fdd8-4b93-8066-7b976e479041",
             input: "mat = [[0,0]]",
             expected: "[[0,0]]", orderMatters: true),
            TestCaseData(id: "35010fb6-e5ca-46b1-91a8-718fa8f6b37d",
             input: "mat = [[0,1]]",
             expected: "[[0,1]]", orderMatters: true),
            TestCaseData(id: "e4530186-43cc-43b0-8c10-57607598e467",
             input: "mat = [[0,0,0]]",
             expected: "[[0,0,0]]", orderMatters: true),
            TestCaseData(id: "a9d29b3f-39b8-470b-bf60-e28284a97ad8",
             input: "mat = [[0,1,0]]",
             expected: "[[0,1,0]]", orderMatters: true),
            TestCaseData(id: "1c67f9c4-5557-42c0-a4ea-b1ab7a93e4b2",
             input: "mat = [[0,0,0,0]]",
             expected: "[[0,0,0,0]]", orderMatters: true),
            TestCaseData(id: "a0cba5c8-4ea4-419d-841d-f993d0d92aff",
             input: "mat = [[0,1,0,1]]",
             expected: "[[0,1,0,1]]", orderMatters: true),
            TestCaseData(id: "a9c4f54a-be19-4fa8-96fe-d427d3b4bd63",
             input: "mat = [[0],[0],[0]]",
             expected: "[[0],[0],[0]]", orderMatters: true),
            TestCaseData(id: "87df3a9b-a145-4089-ac66-37c7cbe1eb3e",
             input: "mat = [[0],[1],[0]]",
             expected: "[[0],[1],[0]]", orderMatters: true),
            TestCaseData(id: "83f25eec-5d3d-46f6-a568-18d07a904e17",
             input: "mat = [[0,0],[0,0],[0,0]]",
             expected: "[[0,0],[0,0],[0,0]]", orderMatters: true),
            TestCaseData(id: "2194697b-ec67-4ea0-945f-85912fbb272a",
             input: "mat = [[0,1],[0,1],[0,1]]",
             expected: "[[0,1],[0,1],[0,1]]", orderMatters: true),
            TestCaseData(id: "bee63761-0513-41c6-9cd0-53c4385b0442",
             input: "mat = [[0,0,0],[0,1,0],[0,0,0],[0,1,0]]",
             expected: "[[0,0,0],[0,1,0],[0,0,0],[0,1,0]]", orderMatters: true),
            TestCaseData(id: "155ea1ed-b79a-48d3-beb2-a7dc817d2c5a",
             input: "mat = [[0,0,0,0],[0,1,0,0],[0,0,0,0],[0,1,0,0]]",
             expected: "[[0,0,0,0],[0,1,0,0],[0,0,0,0],[0,1,0,0]]", orderMatters: true),
            TestCaseData(id: "348cea70-f7b5-43c1-a572-3442e8f25830",
             input: "mat = [[0,0,0,0,0],[0,1,0,1,0],[0,0,0,0,0],[0,1,0,1,0]]",
             expected: "[[0,0,0,0,0],[0,1,0,1,0],[0,0,0,0,0],[0,1,0,1,0]]", orderMatters: true),
            TestCaseData(id: "79ec03b0-5a8a-4829-8c5c-bd0d429ff91d",
             input: "mat = [[1]]",
             expected: "[[1000000]]", orderMatters: true),
            TestCaseData(id: "32cb92d4-f45d-48e4-a576-7f4fe8bf971c",
             input: "mat = [[1,1]]",
             expected: "[[1000000,1000000]]", orderMatters: true),
            TestCaseData(id: "01de5524-760d-43ad-9abc-455e95d75d5f",
             input: "mat = [[1,1,1]]",
             expected: "[[1000000,1000000,1000000]]", orderMatters: true),
            TestCaseData(id: "20f8b45c-101e-42a7-86f3-d074d1b53c9d",
             input: "mat = [[1,1,1,1]]",
             expected: "[[1000000,1000000,1000000,1000000]]", orderMatters: true),
            TestCaseData(id: "b2b7327d-d315-4ca0-9f86-797ca0d940c0",
             input: "mat = [[1],[1],[1]]",
             expected: "[[1000000],[1000000],[1000000]]", orderMatters: true),
            TestCaseData(id: "040b2266-a0a5-409b-b1cb-3723c55601f8",
             input: "mat = [[1,1],[1,1],[1,1]]",
             expected: "[[1000000,1000000],[1000000,1000000],[1000000,1000000]]", orderMatters: true),
            TestCaseData(id: "9b3911d4-a27c-4c79-9398-709aa214455e",
             input: "mat = [[0,0,0],[0,1,0],[0,0,0]]",
             expected: "[[0,0,0],[0,1,0],[0,0,0]]", orderMatters: true),
            TestCaseData(id: "4b8e6d77-331c-439d-9a55-09037a9f91ec",
             input: "mat = [[0,0,0],[0,1,0],[1,1,1]]",
             expected: "[[0,0,0],[0,1,0],[1,2,1]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "01-matrix"
            let topic = "dynamic-programming"
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

            guard let p_mat = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_mat.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: mat 2D array too large (\(p_mat.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_mat.count >= 1 && p_mat.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.updateMatrix(p_mat)
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

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
