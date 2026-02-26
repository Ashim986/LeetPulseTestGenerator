import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRegionsCutBySlashes {
    private class Solution {
        func regionsBySlashes(_ grid: [String]) -> Int {
            let n = grid.count
            let size = n * 3
            var expanded = Array(repeating: Array(repeating: 0, count: size), count: size)
            let rows = Array(grid.map { Array($0) })

            for r in 0..<n {
                for c in 0..<n {
                    let ch = rows[r][c]
                    if ch == "/" {
                        expanded[r * 3][c * 3 + 2] = 1
                        expanded[r * 3 + 1][c * 3 + 1] = 1
                        expanded[r * 3 + 2][c * 3] = 1
                    } else if ch == "\\" {
                        expanded[r * 3][c * 3] = 1
                        expanded[r * 3 + 1][c * 3 + 1] = 1
                        expanded[r * 3 + 2][c * 3 + 2] = 1
                    }
                }
            }

            func dfs(_ r: Int, _ c: Int) {
                guard r >= 0, r < size, c >= 0, c < size else { return }
                guard expanded[r][c] == 0 else { return }
                expanded[r][c] = 1
                dfs(r + 1, c)
                dfs(r - 1, c)
                dfs(r, c + 1)
                dfs(r, c - 1)
            }

            var regions = 0
            for r in 0..<size {
                for c in 0..<size {
                    if expanded[r][c] == 0 {
                        regions += 1
                        dfs(r, c)
                    }
                }
            }
            return regions
        }
    }

    @Suite struct RegionsCutBySlashesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f2d1ebff-b7ba-486d-80b5-edc7223749ad",
             input: "grid = [\" \",\"/ \",\"/ \",\"/ \"]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "06af822c-847c-4a7c-a7e9-b16ff483f1ca",
             input: "grid = [\"/\",\" \"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "7643e644-abd8-4192-9642-8209d814830f",
             input: "grid = [\" \",\"/ \"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4cc1a34b-ba98-458d-b032-d26bffb01ff6",
             input: "grid = [\"/ \",\"/ \"]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "b755d1e7-806e-4af4-bd32-72802a4b3132",
             input: "grid = [\" \",\" \",\" \"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0e944c59-6963-4c56-a6e9-313b0b591159",
             input: "grid = [\"/\",\"/\",\"/ \"]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "7ed8f522-88f0-4c8e-96c9-bb4a4f5581d5",
             input: "grid = [\" \",\" \",\" \",\" \"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a7f5ed8a-e9b3-48ce-b200-d93c9dcdb3d2",
             input: "grid = [\"/ \",\"/ \",\"/ \",\"/ \"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "5628c973-1a5e-4b0e-a531-fbca496371e0",
             input: "grid = [\" \",\" \",\" \",\" \",\" \"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7389495a-8e10-4a33-bb14-b5b379219b94",
             input: "grid = [\"/\",\"/\",\"/\",\"/ \"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "a407615b-c21b-4768-8fb5-21a2a37a12fc",
             input: "grid = [\" \",\"/ \",\"/ \",\"/ \",\"/ \"]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "9653e0e5-7c99-4a78-954b-1b6e2d46f3a4",
             input: "grid = [\" \",\" \",\" \",\" \",\" \",\" \"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b0cc406b-0f3f-40a4-ae77-2f5d0c18f333",
             input: "grid = [\"/ \",\"/ \",\"/ \",\"/ \",\"/ \"]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "70e9f02d-9b1b-49c2-b4d3-bc56d01c1054",
             input: "grid = [\" \",\"/\",\"/ \",\"/ \",\"/ \"]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "3adf94d3-b00c-49cf-b7d3-7075b85b46f1",
             input: "grid = [\" \",\" \",\" \",\" \",\" \",\" \",\" \"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a3679a4a-1a2d-40cb-a081-377201f8e3a9",
             input: "grid = [\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \"]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "d2673d81-1a1c-401c-8be5-26d0deed594a",
             input: "grid = [\" \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \"]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "d5fdd27b-9641-418f-b58a-69e9605d80ac",
             input: "grid = [\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2d7377e7-1d2e-432f-b049-3528e118b09e",
             input: "grid = [\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \"]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "9654c41a-60a0-4e86-ac04-8374f79bf435",
             input: "grid = [\" \",\"/\",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \"]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "d5305e86-7536-4145-b107-9f55413b5110",
             input: "grid = [\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "86508e93-e99d-4ee0-99d9-ab392c51e8f3",
             input: "grid = [\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e7e469de-5738-4144-a3b5-590fae2a09f7",
             input: "grid = [\" \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5c191301-5638-4cfe-84bb-4531c4aec116",
             input: "grid = [\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9f4a2a5d-1e20-46b7-a714-494e3e473202",
             input: "grid = [\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \",\"/ \"]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "regions-cut-by-slashes"
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

            guard let p_grid = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_grid.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: grid array too large (\(p_grid.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.regionsBySlashes(p_grid)
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
