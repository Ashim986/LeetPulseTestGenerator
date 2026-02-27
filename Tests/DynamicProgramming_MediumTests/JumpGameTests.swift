import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCJumpGame {
    private class Solution {
        func canJump(_ nums: [Int]) -> Bool {
            var maxReach = 0

            for i in 0..<nums.count {
                if i > maxReach { return false }
                maxReach = max(maxReach, i + nums[i])
            }

            return true
        }
    }

    @Suite struct JumpGameTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1702ae6e-ada3-44df-93fc-7579f93ad0a5",
             input: "nums = [0, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "370a9092-f5a3-43a4-b088-c03056e7105a",
             input: "nums = [1, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d3efc32f-8e2b-4650-addd-f5396dceab94",
             input: "nums = [1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "12e91bdd-7e7b-4a75-8793-60b8a10bb2ea",
             input: "nums = [0, 0, 0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d077f1c7-0b52-481f-8b16-2dc2d0a9fb1a",
             input: "nums = [5, 0, 0, 0, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4f9b8399-00a8-4c63-8ef4-2b32ae4c2504",
             input: "nums = [0, 0, 0, 0, 5]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e3ac2652-46aa-44ae-9099-7941dbd17016",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "11834d84-d982-4412-8f25-a22749db068f",
             input: "nums = [5, 4, 3, 2, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "998e9823-32eb-43cb-8e1b-4d71f483c8fb",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "089b3406-679c-435d-b51b-d78f71dce24a",
             input: "nums = [0, 1, 1, 1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "efee44a0-45f5-47b2-be97-662b5abee787",
             input: "nums = [1, 1, 1, 1, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "489f7908-640c-4be5-a5cc-f5dfa42ecbcb",
             input: "nums = [0, 0, 1, 1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2a1bfaa9-07f5-4b7e-8699-4486f9c4e6cf",
             input: "nums = [1, 1, 1, 1, 1, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ac99bd56-fb00-4558-82df-64c0ea4c300c",
             input: "nums = [0, 1, 1, 1, 1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4e82773a-6944-4582-a035-f4bf2392a83d",
             input: "nums = [0, 0, 0, 0, 0, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "753c64cc-e6a0-4b4b-8819-99d86abc9260",
             input: "nums = [1, 1, 1, 1, 1, 1, 0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7f592c78-d057-450b-b927-ef057f6ca60e",
             input: "nums = [0, 1, 1, 1, 1, 1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "aee05b99-9004-4ceb-85a9-b1a198da8048",
             input: "nums = [0, 0, 0, 0, 0, 0, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c17fdd40-a612-4f65-8a09-7b232efe9def",
             input: "nums = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d114ed06-50ea-4294-9e78-872a91c1762f",
             input: "nums = [1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5068c723-6a67-4eb1-9046-c7135fc927e0",
             input: "nums = [0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c1c1f899-07b2-4045-8b11-ea7d37458836",
             input: "nums = [1, 0, 1, 1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "73985724-92b6-44f5-bd15-de3185e2a139",
             input: "nums = [1, 1, 0, 1, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "08c26faa-2846-456c-9e2a-4f73f049c747",
             input: "nums = [1, 1, 1, 0, 1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "50876de5-b658-42e8-95a6-05d6a5e56ffd",
             input: "nums = [1, 1, 1, 1, 0, 1]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "jump-game"
            let topic = "dynamic-programming"
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
            guard p_nums.count >= 1 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.canJump(p_nums)
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
