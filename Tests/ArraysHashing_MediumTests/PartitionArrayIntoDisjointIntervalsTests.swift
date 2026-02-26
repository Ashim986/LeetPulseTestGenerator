import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPartitionArrayIntoDisjointIntervals {
    private class Solution {
        func partitionDisjoint(_ nums: [Int]) -> Int {
            var leftMax = nums[0]
            var currentMax = nums[0]
            var partitionIndex = 0

            for i in 1..<nums.count {
                currentMax = max(currentMax, nums[i])
                if nums[i] < leftMax {
                    leftMax = currentMax
                    partitionIndex = i
                }
            }

            return partitionIndex + 1
        }
    }

    @Suite struct PartitionArrayIntoDisjointIntervalsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b4ef7997-61a3-49de-a376-4cc4917ffb56",
             input: "nums = [1,2,3,4,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "89bcdcc8-4093-4940-93fb-e3819b1ff280",
             input: "nums = [1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0404dc76-1b95-4c06-956f-41d59e87f51f",
             input: "nums = [0,0,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2d6311c0-ec23-4f44-a9b4-6e562e03b4a8",
             input: "nums = [10,20,30,40,50]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ee59a745-8f79-4470-89f4-174f4bc12dcb",
             input: "nums = [5,5,5,5,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1ef521e1-4098-469d-91ac-6274b234f3f5",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "683a186d-68d3-4944-ba98-4eba27f72d4d",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b10bc392-ae86-4888-9327-fde2f41b8d46",
             input: "nums = [0,0,0,0,0,0,0,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e69f9d4b-1022-42fc-b47e-552feb97ea37",
             input: "nums = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2ac27951-c0c7-4fc7-bbaf-4245099e93cf",
             input: "nums = [100,200,300,400,500,600,700,800,900,1000]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d7fb08f5-71f3-422e-8098-723b7d2f71fd",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "413d4761-91f5-4613-995f-9eace7d6b114",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b533f1b1-0a4b-4834-9078-67d730833f0d",
             input: "nums = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "84d3cc2a-46a5-405d-9c52-b11bacc51a3f",
             input: "nums = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "591cb8a6-fce4-4e5b-bb0d-444c49f99434",
             input: "nums = [1000,2000,3000,4000,5000,6000,7000,8000,9000,10000,11000,12000,13000,14000,15000]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "38f55b1d-5ef8-4e4b-872c-c3eb599c552c",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5e47bf06-df79-44a5-915e-3ed1b99a8eae",
             input: "nums = [1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9a0b831e-38b5-4f31-bec4-bc1eca5553c7",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "83779cac-270b-413d-8e5c-9d8db54a3d15",
             input: "nums = [10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6c96e906-c7e0-434e-a2e8-d9b1fbd5e2ac",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "08629e4b-2418-43e1-b444-9ad0ac83ac73",
             input: "nums = [5,4,3,2,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "518800ae-da19-4ff3-9a5b-23153f759656",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4d9f4049-374b-450a-8197-9d9f142097e8",
             input: "nums = [1,10,1,10,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "83831745-d7e3-4be3-92e2-f5af039416ac",
             input: "nums = [10,1,10,1,10]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "a7eb8b74-7719-4305-bc5f-73dcce0d6dc7",
             input: "nums = [1,5,1,5,1]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "partition-array-into-disjoint-intervals"
            let topic = "arrays-hashing"
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

            // Constraint precondition checks
            guard p_nums.count >= 2 && p_nums.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= nums.length <= 10^5"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 1000000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 10^6"
                )
                return
            }

            let solution = Solution()
            let result = solution.partitionDisjoint(p_nums)
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
