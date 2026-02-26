import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMostStonesRemovedWithSameRowOrColumn {
    private class Solution {
        func removeStones(_ stones: [[Int]]) -> Int {
            var parent: [Int: Int] = [:]
            var rank: [Int: Int] = [:]

            func find(_ x: Int) -> Int {
                if parent[x] == nil {
                    parent[x] = x
                    rank[x] = 0
                }
                if parent[x] == x { return x }
                parent[x] = find(parent[x] ?? x)
                return parent[x] ?? x
            }

            func union(_ a: Int, _ b: Int) {
                let ra = find(a)
                let rb = find(b)
                if ra == rb { return }
                let rka = rank[ra, default: 0]
                let rkb = rank[rb, default: 0]
                if rka < rkb {
                    parent[ra] = rb
                } else if rka > rkb {
                    parent[rb] = ra
                } else {
                    parent[rb] = ra
                    rank[ra] = rka + 1
                }
            }

            let offset = 100_000
            for stone in stones {
                let r = stone[0]
                let c = stone[1] + offset
                union(r, c)
            }

            var roots = Set<Int>()
            for stone in stones {
                roots.insert(find(stone[0]))
            }
            return stones.count - roots.count
        }
    }

    @Suite struct MostStonesRemovedWithSameRowOrColumnTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "48bc6306-1aab-4b47-8986-1eaf68b4b683",
             input: "stones = [[1,1],[1,2],[2,1],[2,2]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "7f7a9de4-b693-4ca4-88d0-a6ecd263a1d4",
             input: "stones = [[0,0],[0,0],[0,0]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "cf2f9dda-d19b-4eca-98e5-e0b7082336e5",
             input: "stones = [[-1,-1],[-1,0],[-1,1]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d1442daf-4086-4434-96c6-7d68a1ea5c54",
             input: "stones = [[100,100],[100,101],[101,100],[101,101]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2c2ba6d9-9ae6-434b-a62f-6e4ddccc088d",
             input: "stones = [[1,1],[2,2],[3,3],[4,4]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "aada6635-b7d1-41e2-b61e-2fb9f265b1a9",
             input: "stones = [[0,0],[1,1],[2,2],[3,3],[4,4]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2be9519a-8757-4865-9ebf-c8a5bbfe57ba",
             input: "stones = [[0,0]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f4e15095-772a-4801-b874-5ef14001fc64",
             input: "stones = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "564f0382-4b73-4a1a-87ad-195b37a3eb6b",
             input: "stones = [[1,1],[1,1],[1,1],[1,1]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "73a41d02-882c-42ac-b80c-4ab1e75ce85d",
             input: "stones = [[0,0],[0,1],[0,2],[0,3]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c501037c-ff90-4dba-8eba-61c3da42171e",
             input: "stones = [[0,0],[1,0],[2,0],[3,0]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "5228c5c9-defc-4d59-ae8e-4a094d80d4d2",
             input: "stones = [[0,0],[0,1],[1,1],[1,2]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "34093a60-3c04-495b-9b06-cce2c591b871",
             input: "stones = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4d61d40b-d663-4109-9a47-8d57495f2a58",
             input: "stones = [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5fa6f703-aa79-428b-aea8-2e2288464156",
             input: "stones = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5]]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "89f241f6-ab1f-4e5f-92a6-533c559067ff",
             input: "stones = [[-10,-10],[-10,-9],[-10,-8],[-10,-7]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "25a18b86-5268-4f93-ae59-2204a3d8ffcb",
             input: "stones = [[10,10],[10,11],[10,12],[10,13]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "343cc225-539c-4da1-81d6-ec26fd1167ca",
             input: "stones = [[-100,-100],[-100,-99],[-100,-98],[-100,-97]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "44c058aa-a27a-4f10-9f27-76980b158b58",
             input: "stones = [[100,100],[100,101],[100,102],[100,103]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "83c46284-1ce7-4f6d-90c1-df4f8beb9726",
             input: "stones = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "100b309c-dadf-4eda-ba94-bc79b962ce50",
             input: "stones = [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0]]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "995bda91-1495-4d71-a926-8dc74f568f58",
             input: "stones = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7]]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "c6ea7be4-e0bf-4984-ac86-108810b162ac",
             input: "stones = [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0]]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "ca62e78f-568e-4f88-856f-6b2121cce13f",
             input: "stones = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8]]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "fde33606-6221-414a-b2cd-79bc341dbec4",
             input: "stones = [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0]]",
             expected: "8", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "most-stones-removed-with-same-row-or-column"
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

            guard let p_stones = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_stones.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: stones 2D array too large (\(p_stones.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_stones.count >= 1 && p_stones.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= stones.length <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.removeStones(p_stones)
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
