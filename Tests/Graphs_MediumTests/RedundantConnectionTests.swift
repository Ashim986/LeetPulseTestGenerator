import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRedundantConnection {
    private class Solution {
        func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
            let n = edges.count
            var parent = Array(0...n)

            func find(_ x: Int) -> Int {
                if parent[x] != x {
                    parent[x] = find(parent[x])
                }
                return parent[x]
            }

            for edge in edges {
                let p1 = find(edge[0]), p2 = find(edge[1])
                if p1 == p2 {
                    return edge
                }
                parent[p1] = p2
            }

            return []
        }
    }

    @Suite struct RedundantConnectionTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bacd8371-2b17-4455-a003-e72e6b59ce4e",
             input: "edges = [[1,2],[2,3],[3,4],[1,4]]",
             expected: "[1,4]", orderMatters: true),
            TestCaseData(id: "df558f6b-bb47-4d8b-a948-0048eb45efdd",
             input: "edges = [[1,2],[1,3],[2,3],[3,4]]",
             expected: "[2,3]", orderMatters: true),
            TestCaseData(id: "e156f489-d5db-44fa-8874-e656932aadfb",
             input: "edges = [[1,2],[2,3],[3,1]]",
             expected: "[3,1]", orderMatters: true),
            TestCaseData(id: "c70d9df5-7bcd-4c05-b60c-c0b5ee7e7c0e",
             input: "edges = [[1,2],[2,3],[3,2]]",
             expected: "[3,2]", orderMatters: true),
            TestCaseData(id: "c97f59e8-364b-43cc-8e6d-f5f988ee5f5b",
             input: "edges = [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]",
             expected: "[2,3]", orderMatters: true),
            TestCaseData(id: "0a6f54f9-a365-4d1f-89d7-5d5e7cfef373",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,1]]",
             expected: "[5,1]", orderMatters: true),
            TestCaseData(id: "5099ab21-ef7d-4f02-91dd-c92d6cb86870",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,2]]",
             expected: "[5,2]", orderMatters: true),
            TestCaseData(id: "7c6fcd3c-2d57-4da3-b833-c1205703f152",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,3]]",
             expected: "[5,3]", orderMatters: true),
            TestCaseData(id: "493fdd1e-3f4b-420b-bf55-664ef99c7219",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,4]]",
             expected: "[5,4]", orderMatters: true),
            TestCaseData(id: "b8bc0445-2a62-4c1b-a301-827bc9f69dc4",
             input: "edges = [[1,2],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5],[3,4],[3,5],[4,5]]",
             expected: "[2,3]", orderMatters: true),
            TestCaseData(id: "38d739a8-fcfd-4f20-b570-2e1cd21d2644",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,1]]",
             expected: "[10,1]", orderMatters: true),
            TestCaseData(id: "6ffdd86a-3a7d-41b9-8d35-f2add9de5700",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,2]]",
             expected: "[10,2]", orderMatters: true),
            TestCaseData(id: "69ab2d1b-713b-42a6-8a44-6c7b699039c4",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,3]]",
             expected: "[10,3]", orderMatters: true),
            TestCaseData(id: "7f566019-378c-4814-a81b-65c9013b5d85",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,4]]",
             expected: "[10,4]", orderMatters: true),
            TestCaseData(id: "9ba27139-1f25-430b-8a2b-0739ff673f08",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,5]]",
             expected: "[10,5]", orderMatters: true),
            TestCaseData(id: "909149ba-6a35-4f03-9950-d52876fe148e",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,6]]",
             expected: "[10,6]", orderMatters: true),
            TestCaseData(id: "761047ae-a3d2-44ca-b7df-81e9307de836",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,7]]",
             expected: "[10,7]", orderMatters: true),
            TestCaseData(id: "08c17f29-b1b0-4473-a42c-ec843d4e07dd",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,8]]",
             expected: "[10,8]", orderMatters: true),
            TestCaseData(id: "1b3714fb-ad68-47a0-ac32-0603979afcd1",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,9]]",
             expected: "[10,9]", orderMatters: true),
            TestCaseData(id: "306d886c-8679-45da-8a5c-9340b3c85a43",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,10]]",
             expected: "[10,10]", orderMatters: true),
            TestCaseData(id: "0f47dbce-b6d9-4c7d-824d-b5bc36bab3a5",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[1,10]]",
             expected: "[1,10]", orderMatters: true),
            TestCaseData(id: "2a1666fa-f0b3-4118-916e-08a5cc2fb9b8",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[2,10]]",
             expected: "[2,10]", orderMatters: true),
            TestCaseData(id: "aa5fc463-3a8c-448d-b393-92f00eeb8985",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[3,10]]",
             expected: "[3,10]", orderMatters: true),
            TestCaseData(id: "161be58a-abfc-4f06-86dd-e86771ed62da",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[4,10]]",
             expected: "[4,10]", orderMatters: true),
            TestCaseData(id: "4dbd685b-f133-4e3c-8b60-28d9ad519f03",
             input: "edges = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[5,10]]",
             expected: "[5,10]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "redundant-connection"
            let topic = "graphs"
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

            guard let p_edges = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_edges.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: edges 2D array too large (\(p_edges.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_edges.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: edges[i].length == 2"
                )
                return
            }

            let solution = Solution()
            let result = solution.findRedundantConnection(p_edges)
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
