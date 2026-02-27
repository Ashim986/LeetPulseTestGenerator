import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestIncreasingSubsequence {
    private class Solution {
        func lengthOfLIS(_ nums: [Int]) -> Int {
            var tails: [Int] = []

            for num in nums {
                var left = 0, right = tails.count
                while left < right {
                    let mid = (left + right) / 2
                    if tails[mid] < num {
                        left = mid + 1
                    } else {
                        right = mid
                    }
                }
                if left == tails.count {
                    tails.append(num)
                } else {
                    tails[left] = num
                }
            }

            return tails.count
        }
    }

    @Suite struct LongestIncreasingSubsequenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "44598a3c-c7fb-41ad-af1d-a7b2526b3f2d",
             input: "nums = [5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7350793a-6bd4-4352-bb6e-c94990b010c4",
             input: "nums = [1,3,5,4,7]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2d632717-baa4-407f-b43a-dca329713cdb",
             input: "nums = [2,2,2,2,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "64286bd8-5707-42c4-ac06-d77ffbce90fb",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "954ebc3e-cc15-4f6a-8c46-ed2fa933391d",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9e9d2fb3-cdce-4747-834d-8c82442ca508",
             input: "nums = [10,9,2,5,3,7,101,18]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "17f866f6-b3bc-43a0-8bd7-f8648a47c061",
             input: "nums = [-1,2,3,4,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4e8da672-3077-463f-b868-ebfd232c650d",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fb487875-cd96-41e8-87cc-07065c2db22e",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "50ffec91-10ff-419d-af7d-12324d44a81c",
             input: "nums = [10,20,30,40,50,60,70,80,90,100]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "c3e7503b-033e-4685-8791-c032ac801ed3",
             input: "nums = [100,90,80,70,60,50,40,30,20,10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "decf4f91-5308-4778-9c52-b99bcf6f329c",
             input: "nums = [1,3,6,7,9,4,10,5,6]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "ce6647cf-a671-406e-9a87-56908c0b7fbb",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "a1a56100-0fa0-4ce5-99fc-e686f05b535f",
             input: "nums = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "85822aca-2b16-4116-9a42-209dafa85287",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "979a2206-a540-45e0-943e-5b8aeb94b355",
             input: "nums = [1,3,5,7,9,11,13,15,17,19]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "a983f96e-40ab-4508-a9c7-ac328bec1c3b",
             input: "nums = [19,17,15,13,11,9,7,5,3,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "00202d01-9327-43c5-b5a9-c8d1efe774e9",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "c14a6fa3-2813-4509-887e-67708da1c3ff",
             input: "nums = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "09910fb3-165c-4713-b78b-f94c48533182",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0639b306-206f-4968-95c1-aed72f1b8300",
             input: "nums = [20,18,16,14,12,10,8,6,4,2,1,3,5,7,9,11,13,15,17,19]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "ac82e1f6-0781-4f8f-8392-fa5fa9072d3a",
             input: "nums = [1,-2,3,-4,5,-6,7,-8,9,-10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ab7cdeb4-095b-4549-b380-ffcdf8b0aa51",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "bd4723d4-67b7-4b8c-b434-160952d4141f",
             input: "nums = [25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "66ebceda-675f-497b-9c0e-633246a9c995",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-increasing-subsequence"
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
            guard p_nums.count >= 1 && p_nums.count <= 2500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 2500"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.lengthOfLIS(p_nums)
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
