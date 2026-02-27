import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUniqueBinarySearchTrees {
    private class Solution {
        func numTrees(_ n: Int) -> Int {
            let n = n
            var dp = Array(repeating: 0, count: n + 1)
            dp[0] = 1
            dp[1] = 1

            for i in 2...n {
                for j in 0...i - 1 {
                    dp[i] += dp[j] * dp[i - 1 - j]
                }
            }

            return dp[n]
        }
    }

    @Suite struct UniqueBinarySearchTreesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c2507947-4393-49d0-b9dc-100bf521403c",
             input: "n = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7c4c87a1-ae09-408b-8c80-022b0139b075",
             input: "n = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c8b09e34-cac0-4f46-ae6e-c9a475897ad4",
             input: "n = 5",
             expected: "42", orderMatters: true),
            TestCaseData(id: "14785e92-5d87-4469-9a27-137aca120b65",
             input: "n = 6",
             expected: "132", orderMatters: true),
            TestCaseData(id: "9e1f0c8c-0362-4169-9761-1a5c3cd33e54",
             input: "n = 7",
             expected: "429", orderMatters: true),
            TestCaseData(id: "030ae1bb-428b-423f-8b73-0eabf0130010",
             input: "n = 8",
             expected: "1430", orderMatters: true),
            TestCaseData(id: "27d21cce-58ee-4fdb-b386-04f20bf89c9d",
             input: "n = 9",
             expected: "4862", orderMatters: true),
            TestCaseData(id: "029a6299-a2e6-465c-a6f1-06a12a943a95",
             input: "n = 10",
             expected: "16796", orderMatters: true),
            TestCaseData(id: "44154865-dd12-4452-ac3b-88efe4676d2d",
             input: "n = 11",
             expected: "58786", orderMatters: true),
            TestCaseData(id: "e8d63c09-aca1-4f9e-b1a6-fd7db5433a3e",
             input: "n = 12",
             expected: "208012", orderMatters: true),
            TestCaseData(id: "cf86a71b-26a9-4faf-b3b2-ae5bc8f7e7b6",
             input: "n = 13",
             expected: "742900", orderMatters: true),
            TestCaseData(id: "54bf312c-c7fc-4489-91a3-3ce16659daf0",
             input: "n = 14",
             expected: "2674440", orderMatters: true),
            TestCaseData(id: "3204fc81-de5d-47c6-b8b5-255484968466",
             input: "n = 15",
             expected: "9694845", orderMatters: true),
            TestCaseData(id: "36eb2e14-eb58-45b0-a513-87431aeab0bb",
             input: "n = 16",
             expected: "35357670", orderMatters: true),
            TestCaseData(id: "487d6bfe-9ab3-4681-ab7b-40c5d60342c7",
             input: "n = 17",
             expected: "129644790", orderMatters: true),
            TestCaseData(id: "ef4a9e51-7942-4e63-91d7-b608c90b60a4",
             input: "n = 18",
             expected: "477638700", orderMatters: true),
            TestCaseData(id: "76407ddc-1f1f-46b9-9954-8af211bf0a2e",
             input: "n = 19",
             expected: "1767263190", orderMatters: true),
            TestCaseData(id: "60e4bc42-2512-469b-b03c-1323858a9520",
             input: "n = 20",
             expected: "6564120420", orderMatters: true),
            TestCaseData(id: "0113e8a0-b879-4e16-be94-024bfc1ebcae",
             input: "n = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c1cf92ad-9dce-464b-9602-c1f6958f670f",
             input: "n = -2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0b6081fb-edc6-45a8-8593-93d82a82ed29",
             input: "n = -3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d3e36714-0501-4a80-ad13-37266dce42ee",
             input: "n = -4",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3dcdd9f6-a2ed-424d-8436-92284287b5d8",
             input: "n = -5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e81553a9-652b-4753-867d-69e3666ab070",
             input: "n = 3",
             expected: "5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "unique-binary-search-trees"
            let topic = "math-geometry"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 19 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 19"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.numTrees(p_n)
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
