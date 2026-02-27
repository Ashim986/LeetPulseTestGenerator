import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBagOfTokens {
    private class Solution {
        func bagOfTokensScore(_ tokens: [Int], _ P: Int) -> Int {
            let n = tokens.count
            var maxScore = 0
            var score = 0
            var points = P
            var left = 0
            var right = n - 1
            let tokens = tokens.sorted()
            while left <= right {
                if points >= tokens[left] {
                    points -= tokens[left]
                    score += 1
                    left += 1
                    maxScore = max(maxScore, score)
                }
                else if score > 0 {
                    points += tokens[right]
                    score -= 1
                    right -= 1
                }
                else {
                    break
                }
            }
            return maxScore
        }
    }

    @Suite struct BagOfTokensTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ecc4671c-4da9-429a-ba72-7013f130484e",
             input: "tokens = [1, 2, 3], P = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "eff656c4-8928-466c-abec-091a662253d4",
             input: "tokens = [1, 1, 1], P = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f2ceea6f-f5a7-440d-b6dc-3d3cc52df84c",
             input: "tokens = [10, 20, 30], P = 15",
             expected: "1", orderMatters: true),
            TestCaseData(id: "350273c4-5876-4d6c-901f-151c0c859455",
             input: "tokens = [5, 5, 5], P = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "154a290d-1f98-4dcb-ba6e-a26ba21535e4",
             input: "tokens = [10, 10, 10], P = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c665bbfc-61aa-4b2b-b347-b94d913c053e",
             input: "tokens = [1, 2, 3, 4, 5], P = 5",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b7789462-20a3-4d0b-ae2d-8611cea13fb4",
             input: "tokens = [5, 4, 3, 2, 1], P = 5",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5e3bb1e0-1836-4dba-af45-f7ac99f9172f",
             input: "tokens = [1, 1, 1, 1, 1], P = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ac6c8717-1c82-46c8-8a8e-c045d06a32b4",
             input: "tokens = [10, 20, 30, 40, 50], P = 25",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a6cf092d-04cd-4433-83af-cf3358e0e614",
             input: "tokens = [50, 40, 30, 20, 10], P = 25",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dadd0cdc-9a9b-4acb-8da8-1a6054873bd0",
             input: "tokens = [], P = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9045c955-f290-4c10-bdb2-db24db0382f3",
             input: "tokens = [1], P = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f5fd1f54-586a-47ec-8ea7-9c66fd6cd211",
             input: "tokens = [10, 20, 30, 40, 50], P = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "eb0cffca-890a-4d15-8123-91e96cf50e02",
             input: "tokens = [50, 40, 30, 20, 10], P = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c430955a-a7cf-42cf-a14e-6f7f8501f645",
             input: "tokens = [1, 2, 3, 4, 5], P = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "490b5def-8435-4591-85cf-e2a1a47ddee5",
             input: "tokens = [5, 4, 3, 2, 1], P = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ddb62e5b-b699-42d6-bd29-3d9f28aa27e1",
             input: "tokens = [1, 1, 1, 1, 1], P = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "16144b98-35a9-49c2-b925-27ec0650c7f6",
             input: "tokens = [10, 20, 30, 40, 50], P = -10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "97353229-0ceb-4287-9d84-556d6fdaf06d",
             input: "tokens = [50, 40, 30, 20, 10], P = -10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b234feeb-5161-4ed8-aad4-c36a377230c2",
             input: "tokens = [1, 2, 3, 4, 5], P = -10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e469e182-5885-4953-ac8a-28eb404c88d5",
             input: "tokens = [5, 4, 3, 2, 1], P = -10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0fe0465d-2166-48e1-8f4c-6f1b4398e337",
             input: "tokens = [1, 1, 1, 1, 1], P = -10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8866da94-22e5-4e25-888e-d15eeb6717ca",
             input: "tokens = [1000, 2000, 3000, 4000, 5000], P = 2500",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b3595094-9a53-4563-ae88-ea122abbaaff",
             input: "tokens = [5000, 4000, 3000, 2000, 1000], P = 2500",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0efaa0eb-3c6c-4074-b8be-655c9f6b0657",
             input: "tokens = [1, 2, 3, 4, 5, 6], P = 6",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "bag-of-tokens"
            let topic = "two-pointers"
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

            guard let p_tokens = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_tokens.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: tokens array too large (\(p_tokens.count))"
                )
                return
            }
            guard let p_P = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_tokens.count >= 0 && p_tokens.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= tokens.length <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.bagOfTokensScore(p_tokens, p_P)
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
