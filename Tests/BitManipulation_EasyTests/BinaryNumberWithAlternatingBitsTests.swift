import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryNumberWithAlternatingBits {
    private class Solution {
        func hasAlternatingBits(_ n: Int) -> Bool {
            var num = n
            var previousBit = num & 1
            num >>= 1
            while num > 0 {
                let currentBit = num & 1
                if currentBit == previousBit {
                    return false
                }
                previousBit = currentBit
                num >>= 1
            }
            return true
        }
    }

    @Suite struct BinaryNumberWithAlternatingBitsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2edf652b-493e-41ed-b247-9523bb4f9d95",
             input: "n = 0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c8ad9996-44e1-4278-9198-239c558641a3",
             input: "n = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ee4d2657-29f5-46ed-8735-8b7b284b6005",
             input: "n = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "332e863d-4670-43ed-b4c3-42148e521c3c",
             input: "n = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2897276d-44f7-4852-98ad-59aa22ae8607",
             input: "n = 9",
             expected: "false", orderMatters: true),
            TestCaseData(id: "eac0b745-dedc-42c0-a524-905722592e7e",
             input: "n = 11",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bf6651d9-2949-42b8-86a0-946a31123d04",
             input: "n = 13",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a2bbb02f-db98-4816-8c03-1b8aabeeb87e",
             input: "n = 15",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c274fa6d-7e1d-4b78-9a93-ae7d8f0abfc2",
             input: "n = 17",
             expected: "false", orderMatters: true),
            TestCaseData(id: "719139ee-83f1-4ea6-ac41-040afc422143",
             input: "n = 25",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e86612a6-3ead-471b-bff4-9fc89ea1a86b",
             input: "n = 27",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0411a28a-ac10-4f92-882c-e11c927ddbf7",
             input: "n = 33",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6905670e-150a-48b3-9a78-d3613a623ec8",
             input: "n = 42",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0311225d-4498-4a0e-8f13-472fc7c835e7",
             input: "n = 65",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4c3fb6b5-ebf3-4ebb-8a70-2670a8b3ab77",
             input: "n = 67",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6cb3f327-8a7a-4030-9ba1-13468414f1ee",
             input: "n = 4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c5c3695f-8154-48ae-8616-18d67aa877f5",
             input: "n = 6",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0d31f844-4fd3-411b-aeb1-f51ff7a61358",
             input: "n = 8",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1dac6ddc-537b-4b45-b6b5-83d0696f01aa",
             input: "n = 12",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ed313677-2a3a-4666-acf4-83cc8b991d2e",
             input: "n = 14",
             expected: "false", orderMatters: true),
            TestCaseData(id: "01b3ea10-e21e-4bf5-a498-3183d780cc51",
             input: "n = 16",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9f7965f3-e99d-44b0-a9df-01195bd5d37b",
             input: "n = 18",
             expected: "false", orderMatters: true),
            TestCaseData(id: "68b7bd59-466a-4ca5-804b-35f6bb9c427e",
             input: "n = 20",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b28f1fd4-cb4b-4643-9f11-ab78d4d66749",
             input: "n = 21",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b8671057-44b6-48e6-b289-22863f3993a5",
             input: "n = 22",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-number-with-alternating-bits"
            let topic = "bit-manipulation"
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
            guard p_n >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.hasAlternatingBits(p_n)
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
