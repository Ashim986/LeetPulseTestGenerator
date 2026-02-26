import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFloodFill {
    private class Solution {
        func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
            var image = image
            let original = image[sr][sc]
            if original == color { return image }
            func dfs(_ r: Int, _ c: Int) {
                if r < 0 || r >= image.count || c < 0 || c >= image[0].count { return }
                if image[r][c] != original { return }
                image[r][c] = color
                dfs(r+1, c); dfs(r-1, c); dfs(r, c+1); dfs(r, c-1)
            }
            dfs(sr, sc)
            return image
        }
    }

    @Suite struct FloodFillTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6425dcea-fa4e-428a-8ec8-067b71ce3334",
             input: "image = [[0]], sr = 0, sc = 0, color = 1",
             expected: "[[1]]", orderMatters: true),
            TestCaseData(id: "7733acb6-49ff-4bad-888e-9b6dd5159df0",
             input: "image = [[1,1,1],[1,1,1],[1,1,1]], sr = 1, sc = 1, color = 2",
             expected: "[[2,2,2],[2,2,2],[2,2,2]]", orderMatters: true),
            TestCaseData(id: "b716f8b2-99ed-4bab-9c55-de89fd25a7ab",
             input: "image = [[0,0,0],[0,0,0],[0,0,0]], sr = 0, sc = 0, color = 0",
             expected: "[[0,0,0],[0,0,0],[0,0,0]]", orderMatters: true),
            TestCaseData(id: "2c7889d7-e394-4898-969b-604e868aa272",
             input: "image = [[1,1],[1,1]], sr = 0, sc = 0, color = 1",
             expected: "[[1,1],[1,1]]", orderMatters: true),
            TestCaseData(id: "041dcde4-da21-4df3-bbf1-6f4df74fd1dd",
             input: "image = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]], sr = 2, sc = 2, color = 2",
             expected: "[[2,2,2,2],[2,2,2,2],[2,2,2,2],[2,2,2,2]]", orderMatters: true),
            TestCaseData(id: "59504c9b-6583-4b3e-aa9b-ebbf16f5d4d8",
             input: "image = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]], sr = 0, sc = 0, color = 1",
             expected: "[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "4578fbf1-88cf-40e1-b44f-86500d7b8e6a",
             input: "image = [[1,0],[0,1]], sr = 0, sc = 0, color = 2",
             expected: "[[2,0],[0,1]]", orderMatters: true),
            TestCaseData(id: "13088d79-6fe5-4272-9408-445cab491aed",
             input: "image = [[1,1,1],[1,0,1],[1,1,1]], sr = 1, sc = 0, color = 2",
             expected: "[[2,2,2],[2,0,2],[2,2,2]]", orderMatters: true),
            TestCaseData(id: "77ff158f-9fc6-462f-b44a-01c92fd24444",
             input: "image = [[0,0],[0,0]], sr = 0, sc = 0, color = 0",
             expected: "[[0,0],[0,0]]", orderMatters: true),
            TestCaseData(id: "0c015f22-5e65-4c23-89d0-f89b8f5807fc",
             input: "image = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]], sr = 2, sc = 2, color = 2",
             expected: "[[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2]]", orderMatters: true),
            TestCaseData(id: "7c927a82-eec2-4071-8a82-7e41621e7bed",
             input: "image = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]], sr = 0, sc = 0, color = 1",
             expected: "[[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "5264bd0b-fedc-4797-a830-daa7710fca2c",
             input: "image = [[1,0,0],[0,1,0],[0,0,1]], sr = 0, sc = 0, color = 2",
             expected: "[[2,0,0],[0,1,0],[0,0,1]]", orderMatters: true),
            TestCaseData(id: "167e321a-6b19-47bc-b835-2333e33292a8",
             input: "image = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]], sr = 0, sc = 0, color = 2",
             expected: "[[2,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]", orderMatters: true),
            TestCaseData(id: "a850014c-7e33-4f95-b2d7-c0c0ba7f9064",
             input: "image = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]], sr = 0, sc = 0, color = 2",
             expected: "[[2,2,2,2],[2,2,2,2],[2,2,2,2],[2,2,2,2]]", orderMatters: true),
            TestCaseData(id: "f4a6285f-1b3c-4886-9c84-24d0d40cbe58",
             input: "image = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]], sr = 3, sc = 3, color = 1",
             expected: "[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]", orderMatters: true),
            TestCaseData(id: "3a7ed5ed-d556-4b7b-a6e7-ec9d26589769",
             input: "image = [[1,0,1],[0,1,0],[1,0,1]], sr = 1, sc = 1, color = 2",
             expected: "[[1,0,1],[0,2,0],[1,0,1]]", orderMatters: true),
            TestCaseData(id: "ecc8f83f-834e-435a-a1fc-49f82c10e809",
             input: "image = [[0,1,0],[1,0,1],[0,1,0]], sr = 1, sc = 1, color = 2",
             expected: "[[0,1,0],[1,2,1],[0,1,0]]", orderMatters: true),
            TestCaseData(id: "23295364-5c66-4ce0-832e-9b0f0a65afbd",
             input: "image = [[1,1,1],[0,0,0],[1,1,1]], sr = 0, sc = 0, color = 2",
             expected: "[[2,2,2],[0,0,0],[1,1,1]]", orderMatters: true),
            TestCaseData(id: "440d36b8-aeb7-4f2f-b9e6-b50a788b845e",
             input: "image = [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]], sr = 3, sc = 3, color = 2",
             expected: "[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,2]]", orderMatters: true),
            TestCaseData(id: "0bd77604-faaf-4068-9bd4-46f914efe0f1",
             input: "image = [[1,1,1],[1,1,1],[1,1,1]], sr = 0, sc = 0, color = 1",
             expected: "[[1,1,1],[1,1,1],[1,1,1]]", orderMatters: true),
            TestCaseData(id: "fb5eee97-9f9b-4153-9290-c20bbdf7ea92",
             input: "image = [[1,0,1],[0,1,0],[1,0,1]], sr = 0, sc = 0, color = 2",
             expected: "[[2,0,1],[0,1,0],[1,0,1]]", orderMatters: true),
            TestCaseData(id: "36325e5d-f4d6-4992-b2fb-5913cb286eb2",
             input: "image = [[0,1,0,0],[0,1,0,0],[0,1,0,0],[0,1,0,0]], sr = 0, sc = 1, color = 2",
             expected: "[[0,2,0,0],[0,2,0,0],[0,2,0,0],[0,2,0,0]]", orderMatters: true),
            TestCaseData(id: "d474f171-a9ec-4210-9685-a77bdb43bdd4",
             input: "image = [[1,1,1],[1,1,1],[1,1,1]], sr = 1, sc = 0, color = 1",
             expected: "[[1,1,1],[1,1,1],[1,1,1]]", orderMatters: true),
            TestCaseData(id: "9d66019e-f4ec-4be6-964a-6ab5482a3c18",
             input: "image = [[1,0,0],[0,1,0],[0,0,1]], sr = 2, sc = 2, color = 2",
             expected: "[[1,0,0],[0,1,0],[0,0,2]]", orderMatters: true),
            TestCaseData(id: "cfc5a260-5196-4fd8-8225-5680522912bf",
             input: "image = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]], sr = 1, sc = 1, color = 1",
             expected: "[[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "flood-fill"
            let topic = "graphs"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 4 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 4, got \(params.count)"
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
            guard let p_sr = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_sc = InputParser.parseInt(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as Int"
                )
                return
            }
            guard let p_color = InputParser.parseInt(params[3]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 3 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_sr >= 1 && p_sr <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 50"
                )
                return
            }
            guard p_sr >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= sr < m"
                )
                return
            }
            guard p_sc >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= sc < n"
                )
                return
            }

            let solution = Solution()
            let result = solution.floodFill(p_image, p_sr, p_sc, p_color)
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
