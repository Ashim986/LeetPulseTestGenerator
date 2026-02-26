import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCArrayOfDoubledPairs {
    private class Solution {
        func canReorderDoubled(_ arr: [Int]) -> Bool {
            var count: [Int: Int] = [:]

            for num in arr {
                count[num, default: 0] += 1
            }

            let sortedKeys = Array(count.keys).sorted { abs($0) < abs($1) }

            for key in sortedKeys {
                if count[key] == 0 {
                    continue
                }

                let double = key * 2
                if count[double] == nil || count[key].unsafelyUnwrapped > (count[double] ?? 0) {
                    return false
                }

                count[double] = (count[double] ?? 0) - count[key].unsafelyUnwrapped
            }

            return true
        }
    }

    @Suite struct ArrayOfDoubledPairsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "25d12a6c-d51b-4ba7-932c-993c36c2c84b",
             input: "nums = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0a0e2efa-dbf4-4054-b934-d82a5bad452e",
             input: "nums = [1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b146bd96-d400-421a-9f2e-a65ae8a39840",
             input: "nums = [2, 4]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "897e5200-8f18-4620-b8e3-1287a022583b",
             input: "nums = [1, 2, 4, 8]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "92f4977a-7cb4-4fe0-88d9-c3da5f1fa93a",
             input: "nums = [-2, -4]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e4efbbb1-3cd9-4544-b6b1-8d3af6617776",
             input: "nums = [0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "269a3867-2253-4a4a-b2f6-09795e93db31",
             input: "nums = [10, 20, 40, 80]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "96e89bb2-7b38-4e6a-96c1-68839e37b2c0",
             input: "nums = [-10, -20, -40, -80]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "40064c6e-e271-471b-8900-154a1985a403",
             input: "nums = [100, 200, 400, 800]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f5355c7d-4adc-40c5-9f6e-23d6e4023dd2",
             input: "nums = [1000, 2000, 4000, 8000]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "60ad6587-7a1f-49a4-885d-ac0a470e29b0",
             input: "nums = [1, 2, 3, 6, 12, 24]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8022d108-8785-4783-8d5c-cba9a58a2ca0",
             input: "nums = [5, 10, 20, 40]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0fd19f72-7030-4063-b07a-672606888cb3",
             input: "nums = [3, 6, 12, 24]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7fb10a37-ca8b-4ce6-b4d4-19f0c18c3f56",
             input: "nums = [7, 14, 28, 56]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "099d6790-5848-4fcf-89e9-30c1394457de",
             input: "nums = [11, 22, 44, 88]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "24232a15-c9d8-4e1c-8269-434e9d657eb8",
             input: "nums = [13, 26, 52, 104]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4e6c30aa-f2bf-4148-942f-47230e3e7349",
             input: "nums = [17, 34, 68, 136]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "745e64d7-4573-4f2a-aa3b-86e7d82ee0ff",
             input: "nums = [19, 38, 76, 152]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "96773723-c955-4cb9-8f3f-91a884fe029d",
             input: "nums = [23, 46, 92, 184]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "359d2b72-764c-4d69-b93b-6cd2e7ae0460",
             input: "nums = [29, 58, 116, 232]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3f9e383c-0381-4b05-971c-d6c4197b97cd",
             input: "nums = [31, 62, 124, 248]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "87c48840-a0e2-492c-8cf9-bfbb180a12b9",
             input: "nums = [37, 74, 148, 296]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "cdb94292-8481-4336-944b-f9c77e930bd9",
             input: "nums = [41, 82, 164, 328]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d848fd39-8d65-4076-8e5c-63caf8c6e285",
             input: "nums = [43, 86, 172, 344]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "63605373-c610-4c73-a166-ae1bbc39988c",
             input: "nums = [47, 94, 188, 376]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "array-of-doubled-pairs"
            let topic = "greedy"
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

            guard let p_arr = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_arr.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: arr array too large (\(p_arr.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_arr.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= arr.length <= 3 * 104"
                )
                return
            }
            guard p_arr.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -105 <= arr[i] <= 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.canReorderDoubled(p_arr)
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
