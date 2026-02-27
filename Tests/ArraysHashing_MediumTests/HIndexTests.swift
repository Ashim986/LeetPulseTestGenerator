import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCHIndex {
    private class Solution {
        func hIndex(citations: [Int]) -> Int {
            let n = citations.count
            var buckets = Array(repeating: 0, count: n + 1)
            for citation in citations {
                if citation >= n {
                    buckets[n] += 1
                } else {
                    buckets[citation] += 1
                }
            }
            var papers = 0
            var maxHIndex = 0
            for i in stride(from: n, to: -1, by: -1) {
                papers += buckets[i]
                maxHIndex = max(maxHIndex, min(papers, i))
            }
            return maxHIndex
        }
    }

    @Suite struct HIndexTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "cd9f867f-eb33-431b-aeb3-c81ba4043ffa",
             input: "citations = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "75b29d7a-d085-4a95-b041-23642fd46532",
             input: "citations = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1f8bec44-4747-4ebf-970b-cf9c9515c056",
             input: "citations = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8b967616-7e8b-478d-a616-a85d04a16567",
             input: "citations = [1000]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1f6f8a1c-de69-460f-a400-1729cfee121d",
             input: "citations = [0, 0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a5d9cb2c-481a-4cb2-b1ff-57d7632e499b",
             input: "citations = [1, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f1110ca9-369b-451b-a0a5-1a6f75aa63cc",
             input: "citations = [100, 100]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e9e23d9f-9831-4d99-91c7-c39cbbe616e1",
             input: "citations = [10, 20, 30]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f8ebb426-cf29-4f8b-a159-cfb29a91777a",
             input: "citations = [1000, 1000, 1000]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f8345cf8-217d-4c62-8bb5-014175b48e26",
             input: "citations = [-1, -2, -3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f141e0c7-846e-470b-b9d9-9471f5375a92",
             input: "citations = [-10, 0, 10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f01569d9-12c5-4986-b42e-1db9fe9e2a6e",
             input: "citations = [1, 2, 3, 4, 5]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6fb9df2e-6def-4c95-ae5c-9cab32b65a73",
             input: "citations = [5, 4, 3, 2, 1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "452e8993-2600-423d-8077-8a072029e7ce",
             input: "citations = [100, 200, 300, 400, 500]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "92eecc49-100c-4773-863a-1744ab6f3275",
             input: "citations = [500, 400, 300, 200, 100]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e2ea7b82-a4cb-4ca4-b454-79849a5b600d",
             input: "citations = [0, 1, 3, 5, 6]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d9ecb4dc-38e5-484d-ace1-bbc2f84c0564",
             input: "citations = [6, 5, 3, 1, 0]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1ecc2633-68a0-4ae5-b46a-5352ae601c18",
             input: "citations = [10, 10, 10, 10, 10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "75a3f691-3576-46ce-abb2-756981914ce5",
             input: "citations = [0, 0, 0, 0, 1000]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d421116e-44a0-4d3c-a88e-bea44b346b21",
             input: "citations = [1000, 0, 0, 0, 0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d0b7925d-cc46-4d5a-b2b3-ad7fd4298da9",
             input: "citations = [1, 2, 3, 4, 5, 6]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "8a993f11-2a89-4f38-bd31-d3a902a1e3d1",
             input: "citations = [6, 5, 4, 3, 2, 1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "63c295ae-ec1a-43d4-81f4-8525360bb6ad",
             input: "citations = [100, 200, 300, 400, 500, 600]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "b8754cd7-b447-450b-a095-d8d0ef6e519e",
             input: "citations = [600, 500, 400, 300, 200, 100]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "50a9eb54-7a9d-4a43-8690-fb5d914c7616",
             input: "citations = [0, 1, 3, 5, 6, 7]",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "h-index"
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

            guard let p_citations = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_citations.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: citations array too large (\(p_citations.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_citations.count >= 1 && p_citations.count <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 5000"
                )
                return
            }
            guard p_citations.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= citations[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.hIndex(citations: p_citations)
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
