import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFlippingAnImage {
    private class Solution {
        func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
            var result = image
            for i in 0..<result.count {
                for j in 0..<result[i].count/2 {
                    result[i].swapAt(j, result[i].count - j - 1)
                    result[i][j] = result[i][j] ^ 1
                    result[i][result[i].count - j - 1] = result[i][result[i].count - j - 1] ^ 1
                }
                if result[i].count % 2 == 1 {
                    result[i][result[i].count/2] = result[i][result[i].count/2] ^ 1
                }
            }
            return result
        }
    }

    @Suite struct FlippingAnImageTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "da4e8d19-2907-47bf-9718-90d4cc99a9c1",
             input: "image = [[0,0,0]]",
             expected: "[[1,1,1]]", orderMatters: true),
            TestCaseData(id: "bf8fef66-3551-494c-abd6-e6b9358f8427",
             input: "image = [[1]]",
             expected: "[[0]]", orderMatters: true),
            TestCaseData(id: "4f3dbd3a-07cb-4e6a-9b58-908fe8557774",
             input: "image = [[0,0]]",
             expected: "[[1,1]]", orderMatters: true),
            TestCaseData(id: "b0131562-3029-4f16-9fc7-1aadb6b8bd40",
             input: "image = [[1,1]]",
             expected: "[[0,0]]", orderMatters: true),
            TestCaseData(id: "03e4d510-e9dd-41c6-ba4e-cf92f73e5fdd",
             input: "image = [[0,0,0,0]]",
             expected: "[[1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "c26c59a8-f574-4701-9124-0a4762e4005c",
             input: "image = [[1,1,1,1]]",
             expected: "[[0,0,0,0]]", orderMatters: true),
            TestCaseData(id: "1077d764-6771-4f30-886e-1a759295893d",
             input: "image = [[0,0,0,0,0]]",
             expected: "[[1,1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "dfd90383-2457-4cc9-b8cd-5fe9af189e63",
             input: "image = [[1,1,1,1,1]]",
             expected: "[[0,0,0,0,0]]", orderMatters: true),
            TestCaseData(id: "feb14054-6a57-47d3-a24a-a5ae0c386885",
             input: "image = [[0,1,0,1,0]]",
             expected: "[[1,0,1,0,1]]", orderMatters: true),
            TestCaseData(id: "f6129f9e-6d6c-468d-9721-4e66839c87c0",
             input: "image = [[1,0,1,0,1]]",
             expected: "[[0,1,0,1,0]]", orderMatters: true),
            TestCaseData(id: "47b40335-63de-46ed-aad7-c0d2bd5ce524",
             input: "image = [[0,0,0,0,0,0]]",
             expected: "[[1,1,1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "20c7f032-3747-424a-92ce-68534b5d15fb",
             input: "image = [[1,1,1,1,1,1]]",
             expected: "[[0,0,0,0,0,0]]", orderMatters: true),
            TestCaseData(id: "b0fed59c-d0d8-4fc4-a4e2-88a32c9e01f6",
             input: "image = [[0,0,0],[0,0,0]]",
             expected: "[[1,1,1],[1,1,1]]", orderMatters: true),
            TestCaseData(id: "a1bd72d8-6a3e-42b0-9f69-0eeb8a325da4",
             input: "image = [[1,1,1],[1,1,1]]",
             expected: "[[0,0,0],[0,0,0]]", orderMatters: true),
            TestCaseData(id: "02259207-70ad-44e2-b412-c2a38f2d5ac7",
             input: "image = [[0,1,0],[1,0,1]]",
             expected: "[[1,0,1],[0,1,0]]", orderMatters: true),
            TestCaseData(id: "9707dd95-b3ef-4d3d-9691-f0d0058751b8",
             input: "image = [[1,0,1],[0,1,0]]",
             expected: "[[0,1,0],[1,0,1]]", orderMatters: true),
            TestCaseData(id: "44b43dcc-2fd7-4e4f-b286-d4cdee1c9ff4",
             input: "image = [[0,0,0,0],[0,0,0,0]]",
             expected: "[[1,1,1,1],[1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "c50caded-0167-415d-be81-cc20768d8505",
             input: "image = [[1,1,1,1],[1,1,1,1]]",
             expected: "[[0,0,0,0],[0,0,0,0]]", orderMatters: true),
            TestCaseData(id: "ba927763-afc2-47c6-bf8d-b4ba1179e81b",
             input: "image = [[0,0,0,0,0],[0,0,0,0,0]]",
             expected: "[[1,1,1,1,1],[1,1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "0a918d6b-4af7-4441-b109-0e65d5c81df7",
             input: "image = [[1,1,1,1,1],[1,1,1,1,1]]",
             expected: "[[0,0,0,0,0],[0,0,0,0,0]]", orderMatters: true),
            TestCaseData(id: "65e6fae5-e323-4266-94c7-1eae01f5f201",
             input: "image = [[0,1,0,1,0],[1,0,1,0,1]]",
             expected: "[[1,0,1,0,1],[0,1,0,1,0]]", orderMatters: true),
            TestCaseData(id: "51562e5e-2368-4c03-9f01-1964b3aaff37",
             input: "image = [[1,0,1,0,1],[0,1,0,1,0]]",
             expected: "[[0,1,0,1,0],[1,0,1,0,1]]", orderMatters: true),
            TestCaseData(id: "5cf8e7bd-8a1b-46da-8e3c-4e805d96533d",
             input: "image = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "7d139020-4870-4c75-ab59-c38db73e661f",
             input: "image = [[]]",
             expected: "[[]]", orderMatters: true),
            TestCaseData(id: "a6865598-0daf-485d-b4fd-cb1a55dbfae6",
             input: "image = [[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]]",
             expected: "[[1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "flipping-an-image"
            let topic = "two-pointers"
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

            guard let p_image = InputParser.parse2DIntArray(params[0]) else {
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
            guard p_image.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: image 2D array too large (\(p_image.count))"
                )
                return
            }

            let solution = Solution()
            let result = solution.flipAndInvertImage(p_image)
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
