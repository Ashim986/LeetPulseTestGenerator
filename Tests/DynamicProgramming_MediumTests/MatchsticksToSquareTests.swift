import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMatchsticksToSquare {
    private class Solution {
        func makesquare(matchsticks: [Int]) -> Bool {
            let total = matchsticks.reduce(0, +)
            if total % 4 != 0 {
                return false
            }
            let side = total / 4
            var dp = [Int: Bool]()
            var used = Array(repeating: false, count: matchsticks.count)
            func dfs(_ index: Int, _ mask: Int) -> Bool {
                if index == matchsticks.count {
                    return true
                }
                if let result = dp[mask] {
                    return result
                }
                for i in 0..<4 {
                    if !used[i] && sides[i] + matchsticks[index] <= side {
                        used[i] = true
                        sides[i] += matchsticks[index]
                        if dfs(index + 1, mask | (1 << i)) {
                            dp[mask] = true
                            return true
                        }
                        used[i] = false
                        sides[i] -= matchsticks[index]
                    }
                }
                dp[mask] = false
                return false
            }
            var sides = Array(repeating: 0, count: 4)
            return dfs(0, 0)
        }
    }

    @Suite struct MatchsticksToSquareTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "017447f3-0d74-481d-832d-781ce98beabe",
             input: "matchsticks = [1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bd996f2e-cd53-40d6-b60a-169ab7813d71",
             input: "matchsticks = [1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "661d2cc1-a97c-4d97-befb-61eb6eb89070",
             input: "matchsticks = [1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fff4708d-dcfc-41fb-aeb7-37c431a9ccf0",
             input: "matchsticks = [2, 2, 2, 2, 2, 2, 2, 2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "305412bb-4586-4162-93c1-816974e6a5cf",
             input: "matchsticks = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "782b72ef-d684-4e85-b75c-8e703f7896ce",
             input: "matchsticks = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8befdf09-e628-4bab-b0ff-cf23df1ed949",
             input: "matchsticks = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ec32333d-7ee1-43c9-858b-f5b58622050f",
             input: "matchsticks = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c5857573-21e6-4bf7-8027-37d6d9651180",
             input: "matchsticks = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "561a1b1a-d008-4830-a893-0c897eee8a3e",
             input: "matchsticks = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "41baf8ef-35a1-4c4a-873d-459d450214bf",
             input: "matchsticks = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "de276566-f4d0-41b2-bdcc-0351e84a45ef",
             input: "matchsticks = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "211e6d0b-6628-4a17-863c-4036048165e5",
             input: "matchsticks = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d6d98df9-22c9-49eb-bd8a-04eb8ac4989c",
             input: "matchsticks = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6e9db5e3-ccc1-4631-83ae-dd63138d922d",
             input: "matchsticks = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5f60c272-4ca8-4574-9499-7823aa8a037e",
             input: "matchsticks = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0d4f5aec-1a46-466d-9820-b4e525fca305",
             input: "matchsticks = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6ee0dd71-e1eb-48d2-ad3a-ee612f591f64",
             input: "matchsticks = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1"
                + "0, 10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "80568af8-3d32-4d9e-8c52-cec8818e446c",
             input: "matchsticks = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "521ec96e-17d3-4c6f-82d4-b246b75d626a",
             input: "matchsticks = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1cadf405-687f-45de-bca7-75a1f14b989a",
             input: "matchsticks = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1"
                + "0, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c1453077-0ed7-472f-a378-c7f8842ab097",
             input: "matchsticks = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d124350c-03c7-4a3e-9562-cdb8edd6a87d",
             input: "matchsticks = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "700f1333-b1a7-4e84-bd7d-89d380a2a23f",
             input: "matchsticks = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1ec291cc-df43-4de0-840f-f234873a5b6f",
             input: "matchsticks = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "matchsticks-to-square"
            let topic = "dynamic-programming"
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

            guard let p_matchsticks = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_matchsticks.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: matchsticks array too large (\(p_matchsticks.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_matchsticks.count >= 1 && p_matchsticks.count <= 15 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= matchsticks.length <= 15"
                )
                return
            }
            guard p_matchsticks.allSatisfy({ $0 >= 1 && $0 <= 108 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= matchsticks[i] <= 108"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.makesquare(matchsticks: p_matchsticks)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
