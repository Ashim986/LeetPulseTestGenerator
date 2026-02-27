import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCombinations {
    private class Solution {
        func combine(_ n: Int, _ k: Int) -> [[Int]] {
            var result: [[Int]] = []
            var combo: [Int] = []
            func backtrack(_ start: Int) {
                if combo.count == k { result.append(combo); return }
                for i in start...n {
                    combo.append(i)
                    backtrack(i + 1)
                    combo.removeLast()
                }
            }
            backtrack(1)
            return result
        }
    }

    @Suite struct CombinationsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8e421ed9-d8af-40c1-b8c9-9daee00413a0",
             input: "n = 10, k = 11",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "83c5998d-9234-4028-90b0-2ab11f7d9519",
             input: "n = -1, k = 1",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "bdb28fe3-25b3-472a-98ea-2e20d0c1d5a4",
             input: "n = 1, k = -1",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "39ab59ce-d118-4396-8838-9bffbc980bf4",
             input: "n = -1, k = -1",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "61ee5203-a7a5-4e5e-87f1-baadd4764458",
             input: "n = 5, k = 0",
             expected: "[[]]", orderMatters: false),
            TestCaseData(id: "253756a1-6441-45a7-9364-c2f46ff44238",
             input: "n = 100, k = 50",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "25efe8ec-e2fd-44c6-8bdd-6afcb87188ab",
             input: "n = 1000, k = 500",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "392ca0af-258b-4a38-9396-db6d61323ff0",
             input: "n = 10000, k = 5000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "f176815c-c0cc-4112-b061-5ff9b543be74",
             input: "n = 100000, k = 50000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "21602bd5-0514-4a72-87c5-9e8b4da39751",
             input: "n = 1000000, k = 500000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "8bf83167-4e21-4d8c-8819-2aef149ecef5",
             input: "n = 10000000, k = 5000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "34d405b7-6fde-4204-9300-8d0bc47024f5",
             input: "n = 100000000, k = 50000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "a6eb9def-b67d-4852-9bed-e820900e6fba",
             input: "n = 1000000000, k = 500000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "cb9bebec-e778-4eef-af1f-8092f6ae4c5f",
             input: "n = 10000000000, k = 5000000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "e3d1f2f4-cf18-4d05-8f41-dc224ef0bc56",
             input: "n = 100000000000, k = 50000000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "16bbed1a-3a88-4cf2-809e-2e091ebdcdb4",
             input: "n = 1000000000000, k = 500000000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "0a467d06-006d-484f-ae4f-6082f636fa8e",
             input: "n = 10000000000000, k = 5000000000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "2ed84f4e-d03b-4bc2-928a-011bc5631ac3",
             input: "n = 100000000000000, k = 50000000000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "9f9456af-6502-4537-b091-bde1b26f0580",
             input: "n = 1000000000000000, k = 500000000000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "dd61d3fe-8ba4-4bf1-899d-e960a2eece13",
             input: "n = 10000000000000000, k = 5000000000000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "c8a563cd-4a21-4b57-8e56-2da52d424f4d",
             input: "n = 100000000000000000, k = 50000000000000000",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "cee9545d-5bc9-428e-bf94-c7781e3035ee",
             input: "n = 1000000000000000000, k = 500000000000000000",
             expected: "null", orderMatters: false),
            TestCaseData(id: "0b3e914d-3e2c-481d-b9b5-7badffa34560",
             input: "n = 4, k = 2",
             expected: "[[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]", orderMatters: false),
            TestCaseData(id: "b546c3d7-3203-4400-a15c-a561382bb601",
             input: "n = 1, k = 1",
             expected: "[[1]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "combinations"
            let topic = "backtracking"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 20 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 20"
                )
                return
            }
            guard p_k >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= n"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.combine(p_n, p_k)
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
