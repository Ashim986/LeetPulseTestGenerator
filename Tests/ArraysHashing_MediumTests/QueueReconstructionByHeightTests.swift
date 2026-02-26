import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCQueueReconstructionByHeight {
    private class Solution {
        func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
            var res = [[Int]]()
            let sortedPeople = people.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] > $1[0] }
            for person in sortedPeople {
                res.insert(person, at: person[1])
            }
            return res
        }
    }

    @Suite struct QueueReconstructionByHeightTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "56af6e6c-e431-4f2c-bcee-d3eb7af4e0f9",
             input: "people = [[1,0]]",
             expected: "[[1,0]]", orderMatters: true),
            TestCaseData(id: "697b625b-e594-442e-8f10-05ce7caaa677",
             input: "people = [[1,0],[1,0]]",
             expected: "[[1,0],[1,0]]", orderMatters: true),
            TestCaseData(id: "a7c3dc73-b65d-431e-982a-25f14a91095c",
             input: "people = [[1,1],[2,0]]",
             expected: "[[2,0],[1,1]]", orderMatters: true),
            TestCaseData(id: "c5aa5eba-271f-4680-878e-3f08cdea7815",
             input: "people = [[1,0],[1,1]]",
             expected: "[[1,0],[1,1]]", orderMatters: true),
            TestCaseData(id: "bc8a0795-079c-493e-a287-3c6c894657d2",
             input: "people = [[5,0],[5,1],[5,2]]",
             expected: "[[5,0],[5,1],[5,2]]", orderMatters: true),
            TestCaseData(id: "6e04547c-d360-4fd1-805f-8e5a21cd13e3",
             input: "people = [[1,0],[1,1],[1,2]]",
             expected: "[[1,0],[1,1],[1,2]]", orderMatters: true),
            TestCaseData(id: "520f397e-c05c-4c62-9e3f-651bd4d1c09a",
             input: "people = [[1,0],[1,1],[1,2],[1,3]]",
             expected: "[[1,0],[1,1],[1,2],[1,3]]", orderMatters: true),
            TestCaseData(id: "0e8be780-d452-4628-be18-8a9623bdaeab",
             input: "people = [[1,0],[1,1],[1,2],[1,3],[1,4]]",
             expected: "[[1,0],[1,1],[1,2],[1,3],[1,4]]", orderMatters: true),
            TestCaseData(id: "22467503-6c15-409a-badb-7e3d58959aff",
             input: "people = [[10,0],[10,1],[10,2],[10,3],[10,4]]",
             expected: "[[10,0],[10,1],[10,2],[10,3],[10,4]]", orderMatters: true),
            TestCaseData(id: "183f7c38-1eb5-453c-b1b1-c2b69477af4d",
             input: "people = [[1,0],[1,1],[1,2],[1,3],[1,4],[1,5]]",
             expected: "[[1,0],[1,1],[1,2],[1,3],[1,4],[1,5]]", orderMatters: true),
            TestCaseData(id: "d85a5b4c-66e4-4e04-a20c-943fcd9acd5a",
             input: "people = [[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6]]",
             expected: "[[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6]]", orderMatters: true),
            TestCaseData(id: "c8ca7ce7-074c-423f-b94f-b28e84d8c235",
             input: "people = [[10,0],[10,1],[10,2],[10,3],[10,4],[10,5],[10,6]]",
             expected: "[[10,0],[10,1],[10,2],[10,3],[10,4],[10,5],[10,6]]", orderMatters: true),
            TestCaseData(id: "3fa8b726-2e1c-445d-aaf9-a166e70e49a8",
             input: "people = [[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7]]",
             expected: "[[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7]]", orderMatters: true),
            TestCaseData(id: "95111882-d008-435d-a75c-56349c5ed28f",
             input: "people = [[10,0],[10,1],[10,2],[10,3],[10,4],[10,5],[10,6],[10,7]]",
             expected: "[[10,0],[10,1],[10,2],[10,3],[10,4],[10,5],[10,6],[10,7]]", orderMatters: true),
            TestCaseData(id: "9b4c5913-e9c1-4dd3-be05-29a6c4692002",
             input: "people = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "49cf57e0-3aed-49a6-b74a-eb1a6bb822b6",
             input: "people = [[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8]]",
             expected: "[[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8]]", orderMatters: true),
            TestCaseData(id: "48dd25e6-d72d-441a-89b2-22a12c4d88f9",
             input: "people = [[10,0],[10,1],[10,2],[10,3],[10,4],[10,5],[10,6],[10,7],[10,8]]",
             expected: "[[10,0],[10,1],[10,2],[10,3],[10,4],[10,5],[10,6],[10,7],[10,8]]", orderMatters: true),
            TestCaseData(id: "1d6b7fa6-d846-43a6-9547-73747e447183",
             input: "people = [[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[1,9]]",
             expected: "[[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[1,9]]", orderMatters: true),
            TestCaseData(id: "55a2888c-8ee7-4581-aa41-554de645584f",
             input: "people = [[10,0],[10,1],[10,2],[10,3],[10,4],[10,5],[10,6],[10,7],[10,8],[10,9]]",
             expected: "[[10,0],[10,1],[10,2],[10,3],[10,4],[10,5],[10,6],[10,7],[10,8],[10,9]]", orderMatters: true),
            TestCaseData(id: "b3f6a954-0f86-4230-95b7-e44b4d8cc613",
             input: "people = [[2,0],[1,0]]",
             expected: "[[1,0],[2,0]]", orderMatters: true),
            TestCaseData(id: "c0ac6a44-9991-4518-ae52-67f6b55c13a8",
             input: "people = [[1,0],[2,0],[3,0]]",
             expected: "[[1,0],[2,0],[3,0]]", orderMatters: true),
            TestCaseData(id: "e9a07f17-6cc9-4023-ace1-207d6db98519",
             input: "people = [[1,0],[2,0],[3,0],[4,0]]",
             expected: "[[1,0],[2,0],[3,0],[4,0]]", orderMatters: true),
            TestCaseData(id: "967a3ed2-70d6-47f7-9593-b91c095cfe98",
             input: "people = [[1,0],[2,0],[3,0],[4,0],[5,0]]",
             expected: "[[1,0],[2,0],[3,0],[4,0],[5,0]]", orderMatters: true),
            TestCaseData(id: "82ae3eda-5e62-422c-9a8e-4f1c2df665cf",
             input: "people = [[1,0],[2,0],[3,0],[4,0],[5,0],[6,0]]",
             expected: "[[1,0],[2,0],[3,0],[4,0],[5,0],[6,0]]", orderMatters: true),
            TestCaseData(id: "91a0e8a4-8ca4-44f5-9aa7-b36eccb6104e",
             input: "people = [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]",
             expected: "[[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "queue-reconstruction-by-height"
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

            guard let p_people = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_people.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: people 2D array too large (\(p_people.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_people.count >= 1 && p_people.count <= 2000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= people.length <= 2000"
                )
                return
            }

            let solution = Solution()
            let result = solution.reconstructQueue(p_people)
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
