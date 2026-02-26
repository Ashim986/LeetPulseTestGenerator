import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUglyNumber {
    private class Solution {
        func isUgly(_ n: Int) -> Bool {
           if n <= 0 { return false }
           let primes = [2, 3, 5]
           var num = n
           for prime in primes {
              while num % prime == 0 {
                 num /= prime
              }
           }
           return num == 1
        }
    }

    @Suite struct UglyNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "42162851-ec0a-4d70-9c86-7d1112442746",
             input: "n = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "daf1d7e6-ddb8-4971-9fbb-3e57fb92abd6",
             input: "n = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9680a600-6e53-464e-adbf-52e41d3cc4f2",
             input: "n = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "42f715dd-7da0-47aa-b166-6ea5c7da0112",
             input: "n = 4",
             expected: "true", orderMatters: true),
            TestCaseData(id: "17726553-3339-44f4-a845-2d058e6fed6d",
             input: "n = 5",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a9a075ba-6555-4e0f-b1d6-5a6cdbcfec5a",
             input: "n = 7",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6732c43c-6958-47da-881e-7e41a8bfb87c",
             input: "n = 9",
             expected: "true", orderMatters: true),
            TestCaseData(id: "df4b95a4-82c7-4e84-8384-b5c7b71e5ac9",
             input: "n = 10",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a93f6454-4746-4ccc-a55e-777a523181b9",
             input: "n = 11",
             expected: "false", orderMatters: true),
            TestCaseData(id: "33bfd93b-b35e-43dc-ad2e-f4e0a7ac85f6",
             input: "n = 12",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7f4c0ced-4ce8-422f-b070-2747a4649a3e",
             input: "n = 13",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0977dc4d-aeaf-4e7b-aca3-7aa83a4b28a3",
             input: "n = 15",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e2f7b1e1-0360-4486-bc3b-2f1dee000b81",
             input: "n = 16",
             expected: "true", orderMatters: true),
            TestCaseData(id: "34b07e3a-da65-4669-b0f3-968620322066",
             input: "n = 17",
             expected: "false", orderMatters: true),
            TestCaseData(id: "71e68626-175e-44bf-b639-30639f4befcb",
             input: "n = 18",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d8359372-5dbf-47ab-980c-516292828bc5",
             input: "n = 19",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f91e2673-7257-4953-b377-ad3f5354c4e6",
             input: "n = 20",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1818b05e-b99e-48fd-8436-b8312c3b24a2",
             input: "n = 22",
             expected: "false", orderMatters: true),
            TestCaseData(id: "35010210-aaa5-4178-a64d-c5a5cc2f0cce",
             input: "n = 23",
             expected: "false", orderMatters: true),
            TestCaseData(id: "19db585c-4ac4-4500-9947-856021409258",
             input: "n = 24",
             expected: "true", orderMatters: true),
            TestCaseData(id: "53602778-504f-4a5c-8a86-8a1433744842",
             input: "n = 25",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5e0ff25a-e9d0-4f29-93a9-834d1d8c43bd",
             input: "n = 26",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0a599d15-ba57-4bd7-a2bc-927986383d97",
             input: "n = 27",
             expected: "true", orderMatters: true),
            TestCaseData(id: "25938b83-ec95-49c5-8ff9-e64496d1fe53",
             input: "n = 29",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5e787d2a-9ff9-4b7b-a771-2fa80ca68617",
             input: "n = 30",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "ugly-number"
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
            guard p_n >= -231 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= n <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.isUgly(p_n)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
