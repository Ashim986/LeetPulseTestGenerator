import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCJumpGameIi {
    private class Solution {
        func jump(_ nums: [Int]) -> Int {
            let n = nums.count
            var dp = [Int](repeating: Int.max, count: n)
            dp[0] = 0

            for i in 0..<n {
                for j in i+1...min(i + nums[i], n - 1) {
                    dp[j] = min(dp[j], dp[i] + 1)
                }
            }

            return dp[n - 1]
        }
    }

    @Suite struct JumpGameIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "AC546117-93F3-4D94-BDA9-094F026991E0",
             input: "[1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7DEE9340-01CA-4BE8-9F57-F410DE3F2C7E",
             input: "[2,3,1,1,4]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2AAE8213-FBFB-4429-95F6-E0A238B29137",
             input: "[1,1,1,1,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "A454608F-6280-4D34-8DC2-804FA16E107F",
             input: "[5,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "D37FF024-BFD1-4F6A-B258-86E7D24D9735",
             input: "[4,1,1,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "AAD9D2A9-5AD5-4569-979F-48DD29D4C121",
             input: "[100,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "01048E0C-CCE4-455B-9054-792CED09E96C",
             input: "[1,2,3,4,5,6,7,8,9,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "73E1706F-1236-459E-A48B-C1DD09260EA5",
             input: "[3,1,1,1,1,1,1,1,1,1]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "17CB8200-4FE8-4BFF-B94C-F4AC646688E3",
             input: "[0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "31867EAD-2A19-4615-A8A9-EE73F50CAB11",
             input: "[1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "B20B368E-579F-4B9C-A272-27C88BADFD3E",
             input: "[1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "E9022F13-DB5A-48EC-861C-36339A964C60",
             input: "[5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "F20B855A-2A83-41DE-8AE6-339AA723EAC6",
             input: "[3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9A306D26-A780-4063-ACFB-1BC38B598CAC",
             input: "[7,0,9,6,9,6,1,7,9,0,1,2,9,0,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4FE44656-3BAD-4D85-B0D5-5E566C65000D",
             input: "[5,0,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "D6B3227A-62C7-44E8-8CE2-6C9BFE0DC215",
             input: "[2,0,1,1,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9F084C4E-CA78-47F4-B53F-005A28D0D04C",
             input: "[2,3,0,1,4]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "C5EA5316-7A1B-43CF-9266-FFE1D9D4401C",
             input: "[3,3,1,0,4]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9bdb2a32-057c-44d9-92bd-4dc7e408f81a",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b9626f44-8dae-4ecf-a327-c6be1a235936",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e9274988-91f5-4d69-b501-b808523c2322",
             input: "nums = [0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fcc72106-f39e-4e73-af0d-a089bb4f71f8",
             input: "nums = [1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a32b3273-b123-4da6-9d0d-56121167a82c",
             input: "nums = [5,0,0,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "76e5bb8d-dac1-4328-860f-966e35acc931",
             input: "nums = [1,1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a13e24ee-1449-4ae5-8b57-36b60053791a",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "jump-game-ii"
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
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.jump(p_nums)
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
