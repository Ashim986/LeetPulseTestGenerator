import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTargetSum {
    private class Solution {
        func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
            var memo: [String: Int] = [:]

            func dfs(_ i: Int, _ sum: Int) -> Int {
                if i == nums.count {
                    return sum == target ? 1 : 0
                }

                let key = "\(i),\(sum)"
                if let cached = memo[key] { return cached }

                let result = dfs(i + 1, sum + nums[i]) + dfs(i + 1, sum - nums[i])
                memo[key] = result
                return result
            }

            return dfs(0, 0)
        }
    }

    @Suite struct TargetSumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2c139d9c-433a-499f-8d10-3b9109fada57",
             input: "nums = [], target = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b74eae4b-6a26-431a-8e0b-d85ea3aa181a",
             input: "nums = [1], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fc8db882-40a4-47c5-8dd1-c1a04894065d",
             input: "nums = [1,1], target = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ec6e401f-f0db-4567-acc3-1f3d935c9a70",
             input: "nums = [1,2,3,4,5], target = 15",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c3c1cfd8-0bc6-49c4-8c7a-2fc4325f4df8",
             input: "nums = [10,20,30,40,50], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fd4b68d2-b0bc-4cda-b21a-6077102d5b6d",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], target = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c1174ed0-146c-46b2-b8b1-62792e42a706",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 55",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4553fe51-0d7b-4db1-92ba-8b858ce9d7ff",
             input: "nums = [-10,-20,-30,-40,-50], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "52fb6d9c-11ed-4f33-a511-f6bc5fc87158",
             input: "nums = [100,200,300,400,500], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1985fe80-a75a-41fb-bc7e-f7ea9084a171",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], target = 11",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dd71e40b-49de-4f78-a040-0f54f5ce5521",
             input: "nums = [0,0,0,0,0], target = 5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e4b69d15-0c95-4872-96d6-9d791c70bd80",
             input: "nums = [5,5,5,5,5], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "18395eeb-be6e-464a-b718-66c82d81a32e",
             input: "nums = [5,5,5,5,5], target = 25",
             expected: "1", orderMatters: true),
            TestCaseData(id: "609db4f3-6fc7-4296-99f5-8231078f25fb",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], target = 120",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e3c2dee4-e357-4df3-b99e-976fca6d5910",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], target = 15",
             expected: "1", orderMatters: true),
            TestCaseData(id: "086dcd61-38f0-48fd-b635-f21c55874b9f",
             input: "nums = [-1,-2,-3,-4,-5], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "97038736-dc6f-464f-b411-861bb0696c69",
             input: "nums = [10,10,10,10,10], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "21a09d6a-057b-49cd-a5de-2726e8f461d4",
             input: "nums = [10,10,10,10,10], target = 50",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a831d74e-c04e-4e47-bf9c-e31e05fb693f",
             input: "nums = [1,2,3], target = 6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bda672fe-041f-4229-80fc-4a68a434c205",
             input: "nums = [0], target = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ce2407c8-8570-487f-8a2b-80ebaab2f52b",
             input: "nums = [1,1], target = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6ca6c931-f56a-4a91-89d6-ccf3eee54e1e",
             input: "nums = [1,2,3,4,5], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8109e766-e5b1-4f33-a817-ac7d5c7d565a",
             input: "nums = [-1,1,-1,1], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8f3aaa6e-5b51-4329-8b37-1d7f6d9e14e3",
             input: "nums = [-1,-1,-1,-1], target = -4",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cab4a371-484f-437e-8de6-0f7856990f58",
             input: "nums = [10,20,30,40,50], target = 100",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "target-sum"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
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
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 20"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 1000"
                )
                return
            }
            guard p_target >= -1000 && p_target <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= target <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.findTargetSumWays(p_nums, p_target)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
