import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFirstMissingPositive {
    private class Solution {
        func firstMissingPositive(_ nums: [Int]) -> Int {
            var nums = nums
            let n = nums.count
            for i in 0..<n {
                while nums[i] > 0 && nums[i] <= n && nums[nums[i]-1] != nums[i] {
                    nums.swapAt(i, nums[i]-1)
                }
            }
            for i in 0..<n {
                if nums[i] != i + 1 { return i + 1 }
            }
            return n + 1
        }
    }

    @Suite struct FirstMissingPositiveTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "538a9ad1-24e2-476e-8908-79481dbb22c0",
             input: "nums = [1,2,3]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "fd5c9438-f8e4-43ca-9e15-28bf0dcd4762",
             input: "nums = []",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5310afe8-665c-4ab0-b973-8d6624932689",
             input: "nums = [1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a9322331-48b0-4aa9-b7e0-f892aabe6577",
             input: "nums = [2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c459ca8d-1411-4acf-99df-f5b5e2e498cb",
             input: "nums = [-1,-2,-3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d43dfba7-3727-417a-be61-b978dfa342f9",
             input: "nums = [0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c96503e9-c660-4472-9b7e-40282fc2ffd7",
             input: "nums = [1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5c457c2a-1d8b-440d-a181-71eb64beb50b",
             input: "nums = [1000,1001,1002]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "806dba28-eb96-4839-a021-1c14a8bee59b",
             input: "nums = [-1000,-1001,-1002]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5223e761-76b8-4fdf-9ddf-2fa88d3dbc56",
             input: "nums = [1,2,3,4,5]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "c438996d-03af-4ac3-8523-fd0a752a8f26",
             input: "nums = [5,4,3,2,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "1e534cee-ede3-41c3-a777-61eeb1563272",
             input: "nums = [10,20,30,40,50]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0ad33215-f7df-402a-8d99-f8d28e76bfd3",
             input: "nums = [1,3,5,7,9]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "40c67e34-e83f-4d2d-bb72-573447b1eb11",
             input: "nums = [2,4,6,8,10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "287cc096-7e8d-44fb-adf2-aedb77ef70aa",
             input: "nums = [-1,0,1,2,3]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "a792a7a0-e423-4757-bb67-a94a69a7443d",
             input: "nums = [0,1,2,3,4]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "35cb90da-f40d-41bc-a618-d90bcb2ead65",
             input: "nums = [100,200,300,400,500]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "19730361-0bcd-40e5-b102-b1986cf0bb60",
             input: "nums = [1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "251dac3f-42ac-4d9d-8d19-739f11ed1aa1",
             input: "nums = [2,2,2,2,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "83951ab9-db3e-4a2f-88aa-89406e606434",
             input: "nums = [0,0,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a805c1a8-e814-4abb-a19a-3bd5ef675fc7",
             input: "nums = [-1,-1,-1,-1,-1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2cb601af-b171-4c75-8595-ec4b56bda4b0",
             input: "nums = [1000,1000,1000,1000,1000]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5ac0e6d3-ba3d-4346-8744-624dadc8f88e",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "54e8b5aa-e697-451f-ba0e-4ba8acbabbe7",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "23f78d32-f341-49d0-b9ab-3bcb61328056",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "first-missing-positive"
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
            guard p_nums.count >= 1 && p_nums.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 10^5"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.firstMissingPositive(p_nums)
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
