import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCEliminationGame {
    private class Solution {
        func lastRemaining(n: Int) -> Int {
            var head = 1
            var remaining = n
            var isForward = true
            var step = 1
            while remaining > 1 {
                if isForward || remaining % 2 == 1 {
                    head += step
                }
                step *= 2
                remaining /= 2
                isForward.toggle()
            }
            return head
        }
    }

    @Suite struct EliminationGameTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "89b1ae36-440c-47db-b3fc-3ec387aed0b9",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c81d6f33-0287-4509-9d21-a987f51d7cfd",
             input: "n = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "df474e6d-73c9-4a53-b565-062cbbe31c97",
             input: "n = 4",
             expected: "2", orderMatters: true),
            TestCaseData(id: "22c6bdb9-7cd2-4293-8394-5e36c543cc87",
             input: "n = 6",
             expected: "4", orderMatters: true),
            TestCaseData(id: "4bc4d488-58ac-4363-a3db-850dd0e6e891",
             input: "n = 7",
             expected: "4", orderMatters: true),
            TestCaseData(id: "0fe00a0f-c9ce-4254-b79c-1e42a2e6b968",
             input: "n = 8",
             expected: "6", orderMatters: true),
            TestCaseData(id: "23eb51ae-b53c-4236-81d9-85bc6e80bd81",
             input: "n = 10",
             expected: "8", orderMatters: true),
            TestCaseData(id: "5da777d8-a29a-46f0-9cbc-67ed7bdbf043",
             input: "n = 11",
             expected: "8", orderMatters: true),
            TestCaseData(id: "179c4dbd-0366-43df-babf-6bb280e9a5a6",
             input: "n = 12",
             expected: "6", orderMatters: true),
            TestCaseData(id: "43c46539-86cc-49e9-b163-35214620b75f",
             input: "n = 13",
             expected: "6", orderMatters: true),
            TestCaseData(id: "1f852c71-0911-478b-b020-4c7ee4f9f434",
             input: "n = 15",
             expected: "8", orderMatters: true),
            TestCaseData(id: "2eabe374-d793-45dd-943d-fc7ba260fff6",
             input: "n = 16",
             expected: "6", orderMatters: true),
            TestCaseData(id: "eb06bbea-4b08-42fe-b7ab-fca83d17444c",
             input: "n = 17",
             expected: "6", orderMatters: true),
            TestCaseData(id: "c8e55d73-51c3-4d98-a76a-0fef8479d062",
             input: "n = 18",
             expected: "8", orderMatters: true),
            TestCaseData(id: "2e391d11-6693-415d-a07a-a8cf5d7779f1",
             input: "n = 20",
             expected: "6", orderMatters: true),
            TestCaseData(id: "eec661f5-0362-482b-a2a2-cdaf69a37273",
             input: "n = 21",
             expected: "6", orderMatters: true),
            TestCaseData(id: "54e3caf1-9838-47a0-834d-6a59f08edfb4",
             input: "n = 25",
             expected: "14", orderMatters: true),
            TestCaseData(id: "18cdbe89-edb6-412e-a923-3103a6f7193d",
             input: "n = 27",
             expected: "16", orderMatters: true),
            TestCaseData(id: "e83506b2-31fb-4457-82ea-123416d471c0",
             input: "n = 30",
             expected: "16", orderMatters: true),
            TestCaseData(id: "ca0f12da-3b37-4819-ba30-7017f26f1f44",
             input: "n = 32",
             expected: "22", orderMatters: true),
            TestCaseData(id: "80af685f-af79-4efd-81d5-99f0ea522ab8",
             input: "n = 33",
             expected: "22", orderMatters: true),
            TestCaseData(id: "c3de347e-975f-4350-a2cf-f1ee6239be04",
             input: "n = 35",
             expected: "24", orderMatters: true),
            TestCaseData(id: "6b1cfeee-62cf-4270-9d56-566b3cc5547e",
             input: "n = 40",
             expected: "30", orderMatters: true),
            TestCaseData(id: "043a7a71-7e3e-4349-8143-eedc9d429c98",
             input: "n = 42",
             expected: "32", orderMatters: true),
            TestCaseData(id: "a1a642a2-336b-4d28-b3a7-fb0a9e781661",
             input: "n = 45",
             expected: "30", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "elimination-game"
            let topic = "math-geometry"
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

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.lastRemaining(n: p_n)
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
