import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGraphValidTree {
    private class Solution {
        func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
            if edges.count != n - 1 { return false }

            var parent = Array(0..<n)

            func find(_ x: Int) -> Int {
                if parent[x] != x {
                    parent[x] = find(parent[x])
                }
                return parent[x]
            }

            for edge in edges {
                let p1 = find(edge[0]), p2 = find(edge[1])
                if p1 == p2 { return false }  // Cycle detected
                parent[p1] = p2
            }

            return true
        }
    }

    @Suite struct GraphValidTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "13005bf4-3be3-48f0-9461-bf5173c1696b",
             input: "n = 1, edges = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3dbfad9c-535e-48a8-9ab4-7d74b567a495",
             input: "n = 3, edges = [[0,1],[1,2]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d9599a52-1bc9-4098-ba73-e3cd92016798",
             input: "n = 3, edges = [[0,1],[1,2],[0,2]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "18ce0695-4caf-4930-b0d8-fdd5ee73345f",
             input: "n = 3, edges = [[0,1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "049fd028-8ec7-443d-a02e-b6135f906cb8",
             input: "n = 4, edges = [[0,1],[1,2],[2,3]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c1f6c9e0-ecd8-43cc-a6ad-82a74c1628c2",
             input: "n = 4, edges = [[0,1],[1,2],[2,3],[0,3]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f9c06499-371c-42da-aecf-24b55c1334e6",
             input: "n = 4, edges = [[0,1],[1,2]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3d7f6a52-17d5-42b5-874a-8e09d968f635",
             input: "n = 5, edges = [[0,1],[1,2],[2,3],[3,4]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f3bb1f59-3952-4675-b243-1553a221b571",
             input: "n = 5, edges = [[0,1],[1,2],[2,3],[3,4],[0,4]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6c9e6ff8-566b-4100-b5be-8407eed0c7a9",
             input: "n = 5, edges = [[0,1],[1,2],[2,3]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e2ee45d8-7b94-4e27-b301-752f0636cc0c",
             input: "n = 6, edges = [[0,1],[1,2],[2,3],[3,4],[4,5]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0bc742ac-0251-4a69-bb2a-568018772737",
             input: "n = 6, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[0,5]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "46dd1836-a8f8-46c5-b0eb-734ddd5e4f89",
             input: "n = 6, edges = [[0,1],[1,2],[2,3],[3,4]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "520c12ff-0e02-4888-b407-a76608f4acb6",
             input: "n = 7, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "703a8c10-0f54-4d96-a01b-679899d6d5fe",
             input: "n = 7, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[0,6]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "92089e8b-3142-41a4-9eec-9629774d21b4",
             input: "n = 7, edges = [[0,1],[1,2],[2,3],[3,4],[4,5]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1ffa1460-63ca-4b22-9c92-ab616cb94f4b",
             input: "n = 8, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3eafd6ad-917c-4c5b-b625-892d1a0d8b4b",
             input: "n = 8, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[0,7]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "176794c7-26dc-4e1e-984c-c41683a23231",
             input: "n = 8, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "986572de-ae72-437d-86c0-28051ebb2801",
             input: "n = 9, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8f2093da-1b67-4ba3-9909-4e13ee00ad75",
             input: "n = 9, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[0,8]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d7d1a15a-e0fa-4994-a839-a10033cfd340",
             input: "n = 9, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ae4cc14b-07f5-4b43-b0fa-6421bf73c13d",
             input: "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7d8d4f49-69a4-4ae8-82e8-51ac237fdc7f",
             input: "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[0,9]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "aef97c90-310a-4571-b3f1-ccde1d1125b5",
             input: "n = 10, edges = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8]]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "graph-valid-tree"
            let topic = "misc"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_edges = InputParser.parse2DIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [[Int]]"
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

            let solution = Solution()
            let result = solution.validTree(p_n, p_edges)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
