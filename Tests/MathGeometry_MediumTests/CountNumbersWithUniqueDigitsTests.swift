import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCountNumbersWithUniqueDigits {
    private class Solution {
        func countNumbersWithUniqueDigits(_ n: Int) -> Int {
            let length = String(n).count
            var count = 0
            for i in 0...length {
                if i == 0 {
                    count += 1
                    continue
                }
                let available = 9
                let choose = i - 1
                var temp = 1
                for j in 0...choose-1 {
                    temp *= (available - j)
                }
                count += temp
            }
            return count
        }
    }

    @Suite struct CountNumbersWithUniqueDigitsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "806fa4b9-497e-4ca7-8b54-ae61a2adbbda",
             input: "n = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3b02d277-785e-48f3-bbaa-655db7487dea",
             input: "n = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2b1ce177-1223-4eda-ae48-4710c967b97c",
             input: "n = 4",
             expected: "5", orderMatters: true),
            TestCaseData(id: "1b493159-d2a4-4f30-b21e-246d7c478009",
             input: "n = 5",
             expected: "6", orderMatters: true),
            TestCaseData(id: "8b907f6b-ccee-41af-9d03-5aaaccb63fd9",
             input: "n = 6",
             expected: "7", orderMatters: true),
            TestCaseData(id: "1d47a363-5c89-420d-85af-04d3057a877b",
             input: "n = 7",
             expected: "8", orderMatters: true),
            TestCaseData(id: "a265cb84-2409-4c64-96cd-fe8c7cffde35",
             input: "n = 8",
             expected: "9", orderMatters: true),
            TestCaseData(id: "064cec22-32f9-4e89-af15-ba809639570e",
             input: "n = 9",
             expected: "10", orderMatters: true),
            TestCaseData(id: "9ed8fded-2810-4d94-8476-2a201d514f19",
             input: "n = 10",
             expected: "11", orderMatters: true),
            TestCaseData(id: "056c317f-5895-4461-96cc-a10340f5ca7b",
             input: "n = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a8c630c5-3037-4da3-9c05-32a0ac43c8d9",
             input: "n = -2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "32efe79f-4119-4805-bfa3-128a3b6be510",
             input: "n = -10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "79ba348a-88f0-4eaf-a536-36ac0f0ae9c7",
             input: "n = 100",
             expected: "91", orderMatters: true),
            TestCaseData(id: "5167a670-1a06-4171-8f0a-5eddf8dab7af",
             input: "n = 1000",
             expected: "739", orderMatters: true),
            TestCaseData(id: "f101544b-a9e2-4fc5-b044-f45c2e64d994",
             input: "n = 10000",
             expected: "5275", orderMatters: true),
            TestCaseData(id: "95b44750-642f-441a-8efa-866f4568c2e2",
             input: "n = 100000",
             expected: "32491", orderMatters: true),
            TestCaseData(id: "8ddcc104-f632-43ae-8764-be313916cba8",
             input: "n = 1000000",
             expected: "168571", orderMatters: true),
            TestCaseData(id: "89bac8b9-600a-48e4-aab2-6201e1aec941",
             input: "n = 10000000",
             expected: "712891", orderMatters: true),
            TestCaseData(id: "ae04cfc5-b53e-440d-b93b-bbd1c4b4e6ad",
             input: "n = 100000000",
             expected: "2345851", orderMatters: true),
            TestCaseData(id: "102eb27a-0510-421b-82f7-bb3ffc1c6c3f",
             input: "n = 1000000000",
             expected: "5611771", orderMatters: true),
            TestCaseData(id: "3793ad73-1dfe-4a94-94cf-041ae1ba95d2",
             input: "n = -100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e378422c-1f60-460b-84a4-f234cd2f17f6",
             input: "n = -1000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "77816186-8d60-413d-adc0-721c5b3c3536",
             input: "n = -10000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8f20f49a-2de2-4b2a-9181-f6bf5ec5129c",
             input: "n = -100000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "19badff5-aee4-4198-9a3c-bc133456d53f",
             input: "n = -1000000",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "count-numbers-with-unique-digits"
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
            guard p_n >= 0 && p_n <= 8 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= n <= 8"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.countNumbersWithUniqueDigits(p_n)
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
