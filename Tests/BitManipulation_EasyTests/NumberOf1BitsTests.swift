import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOf1Bits {
    private class Solution {
        func hammingWeight(_ n: Int) -> Int {
            var num = n
            var count = 0

            for _ in 0..<32 {
                count += num & 1
                num >>= 1
            }

            return count
        }
    }

    @Suite struct NumberOf1BitsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f21fc603-8fd9-437c-a16e-e170486172b9",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e1c0be4b-5b10-4091-8d9d-da439b221634",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "07fe67ed-6ae6-4dac-83c6-5f7a8543900e",
             input: "n = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "30155921-ee76-4ef3-b66b-7c90bc34d8fb",
             input: "n = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4b1e63fb-1e2d-4cfd-9a05-03f75c8dcfbe",
             input: "n = 4",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f890de3a-1456-482f-9cd2-889ed56a3a2a",
             input: "n = 5",
             expected: "2", orderMatters: true),
            TestCaseData(id: "21162814-6f91-45a2-9194-59417f4534fa",
             input: "n = 6",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6c66fa3a-ad08-4c33-8a5d-2a63e68a9fe7",
             input: "n = 7",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f5612fda-51fe-459e-a881-1557ed15d6c9",
             input: "n = 8",
             expected: "1", orderMatters: true),
            TestCaseData(id: "73aa8d2d-77d4-46c3-95dc-1389ac24f5e6",
             input: "n = 9",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0fa9dcc1-214d-4608-9af7-07ef6d3d56bd",
             input: "n = 10",
             expected: "2", orderMatters: true),
            TestCaseData(id: "33b521d0-1086-47db-b418-fea6004189ce",
             input: "n = 15",
             expected: "4", orderMatters: true),
            TestCaseData(id: "921be83c-6c78-4b13-bece-ac61e420435d",
             input: "n = 16",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1b07cc3a-0976-482c-8e46-182d659b42ae",
             input: "n = 20",
             expected: "2", orderMatters: true),
            TestCaseData(id: "31993a75-094c-42dd-8baa-9df0fc234687",
             input: "n = 25",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c35d2e88-4550-4990-8d2f-cbc9f8ce2583",
             input: "n = 30",
             expected: "4", orderMatters: true),
            TestCaseData(id: "355aafc4-0729-479b-bc1c-4f7e22a3c347",
             input: "n = 31",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2c91bcd5-f296-48e4-abc4-9bdab9427afe",
             input: "n = 32",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8fc1a487-1047-40da-b97f-af6687a25bce",
             input: "n = 33",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e9782ca5-90df-48a3-9a5f-f7e19ed5d022",
             input: "n = 63",
             expected: "6", orderMatters: true),
            TestCaseData(id: "26853b82-e990-47d8-86ec-44efc3d4b1a3",
             input: "n = 64",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2c12f03c-e76c-4096-93f8-bdd69128c28a",
             input: "n = 65",
             expected: "2", orderMatters: true),
            TestCaseData(id: "300f90df-7975-4a93-87b4-e8f1e11e3a30",
             input: "n = 127",
             expected: "7", orderMatters: true),
            TestCaseData(id: "959edb0b-1363-41e7-86ae-315c8b39faf8",
             input: "n = 128",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1418b217-d63e-44a6-8b22-df9f8e852221",
             input: "n = 255",
             expected: "8", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-1-bits"
            let topic = "bit-manipulation"
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
            guard p_n >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.hammingWeight(p_n)
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
