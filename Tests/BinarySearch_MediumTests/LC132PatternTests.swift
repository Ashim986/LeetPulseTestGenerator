import Foundation
@testable import LeetCodeHelpers
import Testing

enum LC132Pattern {
    private class Solution {
        func find132pattern(_ nums: [Int]) -> Bool {
            var stack: [Int] = []
            var s3 = Int.min
            for num in nums.reversed() {
                if num < s3 {
                    return true
                }
                while !stack.isEmpty, stack[stack.count - 1] < num {
                    s3 = stack.removeLast()
                }
                stack.append(num)
            }
            return false
        }
    }

    @Suite struct LC132PatternTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "53a66c70-4ff1-4e04-b635-40be475376a8",
             input: "nums = []",
             expected: "false", orderMatters: true),
            TestCaseData(id: "02dd4137-001e-417e-8490-9cff62c830b8",
             input: "nums = [1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "261b7227-fff8-4a8b-ad0f-6f52d7b91e8f",
             input: "nums = [1, 2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f644ba3f-6e0b-431d-8bd7-3922c5e09ca2",
             input: "nums = [-1, -2, -3, -4]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a7cc6cd1-c9a9-436a-a7a4-ab77f1ff919e",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "31d40cc8-0025-4275-b84b-6fcbeed8e033",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "dbdc77f4-c261-43d1-8961-b1c334f54d7c",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bf67b8ec-ab3e-4260-bc92-498beeefb217",
             input: "nums = [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4288189a-965c-42d9-983b-fc3b26c22599",
             input: "nums = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "63ae2b4f-6c99-4265-9296-54271f87a19d",
             input: "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2cc2bf3b-f4e4-4cde-9b78-5b42bdd5ed43",
             input: "nums = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1e9d2912-9f55-4c9c-802b-52ef7e37cd18",
             input: "nums = [1000, 900, 800, 700, 600, 500, 400, 300, 200, 100]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0e0c8b91-7b0f-41d4-9ade-e90c011f5b2f",
             input: "nums = [1, 3, 2, 4, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "45f02436-ec89-4549-ac3c-ed99dc903a99",
             input: "nums = [1, 2, 3, 4, 3, 2, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "32bc2b43-b8f5-4661-90c6-30e5c64e1703",
             input: "nums = [1, 2, 3, 1, 2, 1, 3, 2, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4e272669-b31c-493f-9955-99566d762dce",
             input: "nums = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4009c3b4-bda4-4577-a433-dd4ff25e5933",
             input: "nums = [1, -2, 3, -4, 5, -6, 7, -8, 9, -10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f7163dff-4fec-4a93-96eb-9cfa1a23377d",
             input: "nums = [3, 1, 4, 1, 5]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0d49f2ef-3010-4128-b620-7a14bce00d08",
             input: "nums = [1, 1, 1, 2, 3, 1, 1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d11cc505-1529-4787-bf1f-6685ad3a3c75",
             input: "nums = [10, 1, 10, 1, 10, 1, 10, 1, 10, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0e6daac6-01c7-4873-99b9-c994a30ef0bb",
             input: "nums = [1, 10, 1, 10, 1, 10, 1, 10, 1, 10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "de1b71b2-1623-44cb-970c-4971d2329492",
             input: "nums = [-1, 1, -1, 1, -1, 1, -1, 1, -1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c8cf4e13-fdfd-484d-982a-fff953d0a829",
             input: "nums = [1, -1, 1, -1, 1, -1, 1, -1, 1, -1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "aebc2526-013c-40a7-824f-4d3f363757d6",
             input: "nums = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c762b38a-cc16-4fdb-8eb0-e055cd151033",
             input: "nums = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "132-pattern"
            let topic = "binary-search"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 2 * 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= nums[i] <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.find132pattern(p_nums)
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
