import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSmallestIntegerDivisibleByK {
    private class Solution {
        func smallestRepunitDivisibleByK(_ k: Int) -> Int? {
            var remainder = 0
            for lengthN in 1...k {
                remainder = (remainder * 10 + 1) % k
                if remainder == 0 {
                    return lengthN
                }
            }
            return nil
        }
    }

    @Suite struct SmallestIntegerDivisibleByKTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9ba5d228-01b2-44c7-ba55-090aa512f177",
             input: "k = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "31665ef5-0bf7-4c5c-aa9b-d0700b625762",
             input: "k = 9",
             expected: "9", orderMatters: true),
            TestCaseData(id: "43f5d04d-e8e0-4c62-9b78-f670ea06eff0",
             input: "k = 4",
             expected: "null", orderMatters: true),
            TestCaseData(id: "ce98c8ed-ccd5-4f51-b806-d0f88cb7233d",
             input: "k = 5",
             expected: "null", orderMatters: true),
            TestCaseData(id: "6597803c-f44c-454a-93c0-5d62ce555d05",
             input: "k = 6",
             expected: "null", orderMatters: true),
            TestCaseData(id: "e9907a7e-391b-4722-a78e-5130491dc018",
             input: "k = 7",
             expected: "6", orderMatters: true),
            TestCaseData(id: "5061c4c3-d4ea-430e-8fb0-fac3b27ea41d",
             input: "k = 8",
             expected: "null", orderMatters: true),
            TestCaseData(id: "1cb02f1e-c8e8-4b6b-82a8-01405b5c7acd",
             input: "k = 10",
             expected: "null", orderMatters: true),
            TestCaseData(id: "855d2476-f06c-412a-9eda-dfb3570a140f",
             input: "k = 11",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5a66e3ea-f01e-4faf-a685-9faa9ee73d0f",
             input: "k = 12",
             expected: "null", orderMatters: true),
            TestCaseData(id: "a392b091-a38e-4a83-91b3-815db149faf1",
             input: "k = 13",
             expected: "6", orderMatters: true),
            TestCaseData(id: "b5fa21d4-1188-44ee-aad8-3e2841a4846b",
             input: "k = 14",
             expected: "null", orderMatters: true),
            TestCaseData(id: "8debab8d-6bdd-4f2c-86c8-3bcab2865012",
             input: "k = 15",
             expected: "null", orderMatters: true),
            TestCaseData(id: "0ad39063-844e-4f15-a05b-25493f3eda24",
             input: "k = 16",
             expected: "null", orderMatters: true),
            TestCaseData(id: "4638efdb-5e13-4caf-886e-5c9dc95a6788",
             input: "k = 17",
             expected: "16", orderMatters: true),
            TestCaseData(id: "28a6d8e2-6af0-4842-95ad-80205d1e6e64",
             input: "k = 18",
             expected: "null", orderMatters: true),
            TestCaseData(id: "819bfe42-649f-435c-a502-867d925b7217",
             input: "k = 19",
             expected: "18", orderMatters: true),
            TestCaseData(id: "233aef41-681d-4397-8a6c-c6c15f44c7e5",
             input: "k = 20",
             expected: "null", orderMatters: true),
            TestCaseData(id: "5d19de3e-4051-4387-9ff3-916d92b94c31",
             input: "k = 21",
             expected: "6", orderMatters: true),
            TestCaseData(id: "49bb440b-2ad7-438f-826f-cb69690e6fd7",
             input: "k = 22",
             expected: "null", orderMatters: true),
            TestCaseData(id: "b200721c-d1ee-4676-9460-54e04db51893",
             input: "k = 23",
             expected: "22", orderMatters: true),
            TestCaseData(id: "8e730cf2-89ac-4e91-8aec-fb5ce8615e91",
             input: "k = 24",
             expected: "null", orderMatters: true),
            TestCaseData(id: "46941736-0363-434a-8b01-35fc41290ad3",
             input: "k = 25",
             expected: "null", orderMatters: true),
            TestCaseData(id: "d7951c20-d500-4456-8e52-74915884365f",
             input: "k = 26",
             expected: "null", orderMatters: true),
            TestCaseData(id: "2941303c-037f-4f2e-8954-4d55156a133b",
             input: "k = 27",
             expected: "27", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "smallest-integer-divisible-by-k"
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

            guard let p_k = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_k >= 1 && p_k <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.smallestRepunitDivisibleByK(p_k)
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
            let computedOutput = OutputSerializer.serializeOptionalInt(result)

            // Normalize null representations (nil/None/NULL -> null)
            func normalizeNull(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces).lowercased()
                if t == "nil" || t == "none" || t == "null" { return "null" }
                return s.trimmingCharacters(in: .whitespaces)
            }
            let matches = normalizeNull(computedOutput) == normalizeNull(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
