import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCHouseRobber {
    private class Solution {
        func rob(_ nums: [Int]) -> Int {
            var prev2 = 0  // max from 2 houses back
            var prev1 = 0  // max from previous house

            for num in nums {
                let curr = max(prev1, prev2 + num)
                prev2 = prev1
                prev1 = curr
            }

            return prev1
        }
    }

    @Suite struct HouseRobberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f368e928-9e1c-4668-860b-564bfb390d4a",
             input: "nums = [1,2,3]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "850dde3a-c365-44a0-8bfd-2eaf2e50d909",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1c10ecaf-d253-4179-ab39-57548906493b",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "32082ec6-b961-41b3-83c4-a022cb35d714",
             input: "nums = [1,1,1,1,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d54a3c98-b963-4b61-946f-ed024af2452b",
             input: "nums = [5,1,1,5]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "7c4289ef-c559-4452-8f2b-d4138ef69153",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "373ff9b5-0041-4370-9ef1-f6dadee0a3e7",
             input: "nums = [10,20,30,40,50]",
             expected: "90", orderMatters: true),
            TestCaseData(id: "995f7e7b-2e3e-4719-8a94-69f14d5a5bcd",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "a389d6e0-71d4-4c56-a894-f95c5e8cfcac",
             input: "nums = [100,200,300,400,500]",
             expected: "900", orderMatters: true),
            TestCaseData(id: "d8bc1e38-21d1-44e5-82be-b5df78598960",
             input: "nums = [1,100,1,100,1,100]",
             expected: "300", orderMatters: true),
            TestCaseData(id: "b4e68410-8c5f-44bb-85eb-7b00a33f2f47",
             input: "nums = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "198e8449-28eb-4105-9bb6-61c48dfc6a55",
             input: "nums = [1,0,1,0,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "8c7214b7-2a3c-40aa-94a4-167e29a64613",
             input: "nums = [0,1,0,1,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "06dec121-e8a0-4418-9aa5-06019804bbdf",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "06367990-d5d8-4405-a0c1-c06b9e79e88a",
             input: "nums = [10,1,10,1,10,1,10,1,10,1]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "44160a96-c9a7-4df3-91ad-f2fe56ea6b52",
             input: "nums = [1,10,1,10,1,10,1,10,1,10]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "09f4c688-d341-4fc2-8208-2a686cfbcf40",
             input: "nums = [-10,-20,-30,-40,-50]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e4d3d42f-252c-495b-9eac-b0e2a0c302a7",
             input: "nums = [-1,-1,-1,-1,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2b8769b4-0b65-4c92-99d6-be583a436c14",
             input: "nums = [0,1,0,1,0,1,0,1,0,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "aa93604b-a1c1-40e8-8480-87e6215f5e59",
             input: "nums = [1,0,1,0,1,0,1,0,1,0]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a74745d7-3f12-4cd8-88e4-c79cf4b9b7d2",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "9000", orderMatters: true),
            TestCaseData(id: "6ea86b3c-77f4-4233-87ad-a5cf44978106",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "d8ec59c7-4e73-4994-ab9c-b5e0d0e96e45",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "28b8cbf6-a5fb-4ef7-a332-8679eeb5e6ea",
             input: "nums = [0,0,0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "548ee8b5-9037-4648-8f48-f7a2be2e80b4",
             input: "nums = [-1,2,-3,4,-5]",
             expected: "6", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "house-robber"
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
            guard p_nums.count >= 1 && p_nums.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 100"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 400 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 400"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.rob(p_nums)
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
