import Foundation
@testable import LeetCodeHelpers
import Testing

enum LC3sumWithMultiplicity {
    private class Solution {
        func threeSumMulti(_ nums: [Int], _ target: Int) -> Int {
            let sortedNums = nums.sorted()
            var count = 0
            for i in 0...sortedNums.count - 3 {
                var left = i + 1
                var right = sortedNums.count - 1
                while left < right {
                    let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                    if sum < target {
                        left += 1
                    } else if sum > target {
                        right -= 1
                    } else {
                        var leftCount = 1
                        var rightCount = 1
                        while left + 1 < right && sortedNums[left] == sortedNums[left + 1] {
                            leftCount += 1
                            left += 1
                        }
                        while right - 1 > left && sortedNums[right] == sortedNums[right - 1] {
                            rightCount += 1
                            right -= 1
                        }
                        count += leftCount * rightCount
                        left += 1
                        right -= 1
                    }
                }
            }
            return count
        }
    }

    @Suite struct LC3sumWithMultiplicityTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "76b68871-1f42-4cd7-9841-9f1e1fb12855",
             input: "nums = [], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dcc2e230-e8f4-4c7f-8ba1-e2d8cfe053f5",
             input: "nums = [0], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d9676534-a5a2-4651-9a14-50c117e663cd",
             input: "nums = [1,2,3], target = 6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "90b244bd-3928-47a1-a909-ac5b0588c8ba",
             input: "nums = [1,1,1], target = 3",
             expected: "1", orderMatters: true),
            TestCaseData(id: "69eabce9-43db-4cd7-bb53-4fe412759bc4",
             input: "nums = [1,1,1,1,1], target = 3",
             expected: "10", orderMatters: true),
            TestCaseData(id: "e09aef70-cc31-4e97-824e-d1145d7bda73",
             input: "nums = [-1,-2,-3], target = -6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "633edd26-47e0-42de-859c-3b1619385bc0",
             input: "nums = [-1,-1,-1], target = -3",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bb1cc834-fbd3-42d3-8efe-8ce715e60ff5",
             input: "nums = [0,0,0], target = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "29c3f3e8-7c03-4db3-9943-a22aa55f8235",
             input: "nums = [1,1,1,1,1,1,1,1,1,1], target = 3",
             expected: "120", orderMatters: true),
            TestCaseData(id: "e4c46443-ff2a-41e0-b7d1-ebf59cb6d36c",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], target = 3",
             expected: "455", orderMatters: true),
            TestCaseData(id: "0f023398-3b67-404d-ada4-47aad0af65c3",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], target = 3",
             expected: "1140", orderMatters: true),
            TestCaseData(id: "f01055d6-8214-4fa0-bc82-9028fb52356c",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], target = 3",
             expected: "2300", orderMatters: true),
            TestCaseData(id: "bb1cb403-7371-4e2e-bf74-31eee76e193a",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], target = 3",
             expected: "4060", orderMatters: true),
            TestCaseData(id: "ee90640a-8f8a-4a9c-88e5-59d586040fe2",
             input: "nums = [1,2,3,4,5], target = 6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b7911111-f926-4096-b423-109ba05f3219",
             input: "nums = [5,5,5,5,5], target = 15",
             expected: "10", orderMatters: true),
            TestCaseData(id: "262f45cb-a46a-43ff-9ff2-373a48b82273",
             input: "nums = [10,20,30,40,50], target = 60",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7c47f105-c0a1-417e-b5e2-f59803e997db",
             input: "nums = [100,200,300,400,500], target = 600",
             expected: "1", orderMatters: true),
            TestCaseData(id: "be223ae0-4a4c-4beb-ba43-a6d5ac9e8649",
             input: "nums = [5,5,5,5,5,5,5,5,5,5], target = 15",
             expected: "120", orderMatters: true),
            TestCaseData(id: "f815ad9b-8f1e-4e39-8c8b-51e3f13d74fc",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 15",
             expected: "12", orderMatters: true),
            TestCaseData(id: "3efd8fa4-0fcb-4bf7-bf1f-2c9a39861959",
             input: "nums = [10,9,8,7,6,5,4,3,2,1], target = 15",
             expected: "10", orderMatters: true),
            TestCaseData(id: "47772507-a240-45a2-bc07-595a195eb4d5",
             input: "nums = [1,1,2,2,3,3,4,4,5,5], target = 9",
             expected: "20", orderMatters: true),
            TestCaseData(id: "92104e51-835c-4fac-9bbb-d6f9ef277adf",
             input: "nums = [1,1,1,2,2,2,3,3,3], target = 6",
             expected: "28", orderMatters: true),
            TestCaseData(id: "df9d2444-ef6b-4181-a8c1-bb431302ca7d",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], target = 15",
             expected: "12", orderMatters: true),
            TestCaseData(id: "f3dbbb40-1d25-4622-a940-e9ee89c2ac46",
             input: "nums = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1], target = 15",
             expected: "12", orderMatters: true),
            TestCaseData(id: "b3630d3d-1bba-47ef-af9b-86ad20b7b001",
             input: "nums = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5], target = 15",
             expected: "455", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "3sum-with-multiplicity"
            let topic = "two-pointers"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 3 <= arr.length <= 3000"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= arr[i] <= 100"
                )
                return
            }
            guard p_target >= 0 && p_target <= 300 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= target <= 300"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.threeSumMulti(p_nums, p_target)
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
