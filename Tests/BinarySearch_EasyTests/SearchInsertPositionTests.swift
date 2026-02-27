import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSearchInsertPosition {
    private class Solution {
        func searchInsert(nums: [Int], _ target: Int) -> Int { var left = 0
        var right = nums.count - 1
        while left <= right { let mid = left + (right - left) / 2
        if nums[mid] == target { return mid }
        if nums[mid] < target { left = mid + 1 } else { right = mid - 1 } }
        return left }
    }

    @Suite struct SearchInsertPositionTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "DE03E109-ECDA-47BE-A20B-D59AC8EE1A05",
             input: "nums = [], target = 7",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4622B34B-4DC9-4123-A058-415CB7ADAF42",
             input: "nums = [5], target = 5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6400E7F3-D4BB-4B9B-8D19-3F856774CC3E",
             input: "nums = [5], target = 2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "865242CD-4ED1-485B-B903-7A9233446B76",
             input: "nums = [5], target = 7",
             expected: "1", orderMatters: true),
            TestCaseData(id: "B1195C20-5205-437C-96DA-ABF206193868",
             input: "nums = [1,3,5,6], target = 5",
             expected: "2", orderMatters: true),
            TestCaseData(id: "26FDB56F-8F4C-42ED-88E6-9C8D927C5FB7",
             input: "nums = [1,3,5,6], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5C186361-75D2-41A5-9F0F-E437397BD439",
             input: "nums = [1,3,5,6], target = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "783A32CF-E065-47E3-AFD4-ACFF0167495C",
             input: "nums = [1,3,5,6], target = 7",
             expected: "4", orderMatters: true),
            TestCaseData(id: "4E4F1A6F-2575-4149-9620-E6C64956AE95",
             input: "nums = [-5,-1,0,3,7], target = -2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8136BCBB-573A-470D-894E-ECF4DCDE747F",
             input: "nums = [2,4,6,8,10,12,14,16,18,20], target = 9",
             expected: "4", orderMatters: true),
            TestCaseData(id: "8DED83A7-8142-4919-91FB-B92B4764C3F6",
             input: "[], 5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "EA85887B-47D3-4D64-AC0E-C83F739D716A",
             input: "[3], 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "C26FFB11-E32D-4EA2-80D9-F9B3FE0CDF2C",
             input: "[3], 2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "CF8D8AA3-9BF8-4BFC-B1B3-E4227AE5FA07",
             input: "[3], 4",
             expected: "1", orderMatters: true),
            TestCaseData(id: "41665140-4014-4B98-B21D-DADE3098D0A8",
             input: "[1,3,5,6], 5",
             expected: "2", orderMatters: true),
            TestCaseData(id: "BEBE4177-B30E-4202-B163-5A9B1A8D750B",
             input: "[1,3,5,6], 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5ACD6306-3122-462C-9856-D22C8CCFD7D4",
             input: "[1,3,5,6], 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "32039242-7B75-4ABA-AAB5-B0318FF2A3B2",
             input: "[1,3,5,6], 7",
             expected: "4", orderMatters: true),
            TestCaseData(id: "4C39920C-E71C-40E3-BEC7-E7CBCDD54408",
             input: "[1,3,5,6], 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "E60CF6C1-820E-4E67-9612-11B2F3FCCB4B",
             input: "[1,3,5,6], 6",
             expected: "3", orderMatters: true),
            TestCaseData(id: "BE4947F6-6F33-494B-BF04-3FFF4BF4F6DD",
             input: "[5], 5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "59999265-7723-44E3-87D1-1D57F283D547",
             input: "[5], 2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "959C1D6E-0845-4BF2-A89A-11A962166870",
             input: "[5], 7",
             expected: "1", orderMatters: true),
            TestCaseData(id: "11DE07F1-C318-461D-8452-1BB7BB48C386",
             input: "[1,2,3,4,5,6,7,8,9,10], 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "501D493C-058F-48F8-96C4-78FD4CFD9F75",
             input: "[1,2,3,4,5,6,7,8,9,10], 10",
             expected: "9", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "search-insert-position"
            let topic = "binary-search"
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
            guard p_nums.count >= 1 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 104"
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
            guard p_target >= -104 && p_target <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= target <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.searchInsert(nums: p_nums, p_target)
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
