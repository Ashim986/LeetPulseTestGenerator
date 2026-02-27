import Foundation
@testable import LeetCodeHelpers
import Testing

enum LC1BitAnd2BitCharacters {
    private class Solution {
        func isOneBitCharacter(_ bits: [Int]) -> Bool {
            var i = 0
            while i < bits.count {
                if i == bits.count - 1 {
                    return bits[i] == 0
                }
                if bits[i] == 1 {
                    i += 2
                } else {
                    i += 1
                }
            }
            return false
        }
    }

    @Suite struct LC1BitAnd2BitCharactersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e3108154-58c0-40c6-938d-8319b63043bf",
             input: "bits = [0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6be64de2-3d27-466a-9a6f-01ae40802737",
             input: "bits = [1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e5d61096-27a0-4258-82f3-50684668cb59",
             input: "bits = [0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "92407618-97c5-4d16-a6a3-d4568a339bd2",
             input: "bits = [0, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8a7c1653-1cc9-49e5-a19a-cd9adff860cb",
             input: "bits = [0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "58574a3e-e9d4-4c02-b8f2-da0413dfd590",
             input: "bits = [1, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "21a806d7-aae6-42da-a404-737e24a6bb45",
             input: "bits = [0, 0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "da43221a-027f-4c7e-875c-98ef830a3904",
             input: "bits = [0, 0, 0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1a4499ef-f0bc-47e6-a160-6d0519b04a01",
             input: "bits = [1, 0, 1, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "720611ac-3e9e-47f1-ad72-0c9766b8c90e",
             input: "bits = [0, 1, 1, 1, 0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8cce5774-9c6f-4a15-94a8-b1e0a6953b03",
             input: "bits = [0, 0, 0, 0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "63a1d71e-f189-47f4-93a8-7404125801fb",
             input: "bits = [1, 1, 1, 1, 1, 0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "69c91246-78cc-4f26-9191-41d3e08fa085",
             input: "bits = [0, 0, 0, 0, 0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a3ca6fc8-5cac-4455-8d68-0cbdf26e22ea",
             input: "bits = [1, 0, 1, 0, 1, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1e0c13c7-a581-4503-aabd-bc775467dbaf",
             input: "bits = [0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9c5f0b9d-2660-41fe-ad6e-bf339feae805",
             input: "bits = [0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0c44b5a0-2f0f-4e35-93ae-88d3ccb42388",
             input: "bits = [1, 0, 1, 0, 1, 0, 1, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c3e749f9-9d62-4859-92ca-5f3e95b46b0b",
             input: "bits = [1, 1, 1, 1, 1, 1, 1, 1, 1, 0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1cedc9b1-b466-411a-b79b-728785302223",
             input: "bits = [1, 1, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c14eb521-63a5-4286-929d-31421b30c624",
             input: "bits = [1, 0, 1, 0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9d053e58-84b7-4d8e-a01d-3e1f672f4ee6",
             input: "bits = [0, 1, 1, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "152ea468-1f15-4cf0-bd97-f2ba622aff05",
             input: "bits = [1, 1, 1, 1, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a9737a40-2ac0-485c-8e10-8ec4968ec9d7",
             input: "bits = [1, 0, 1, 0, 1, 0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "67fdc6ca-5e25-48f8-99f8-c963a625260f",
             input: "bits = [1,1,1,0]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "1-bit-and-2-bit-characters"
            let topic = "arrays-hashing"
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

            guard let p_bits = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_bits.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: bits array too large (\(p_bits.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_bits.count >= 1 && p_bits.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= bits.length <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isOneBitCharacter(p_bits)
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
