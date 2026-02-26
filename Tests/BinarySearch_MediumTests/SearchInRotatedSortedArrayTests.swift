import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSearchInRotatedSortedArray {
    private class Solution {
        func search(_ nums: [Int], _ target: Int) -> Int {
            var left = 0
            var right = nums.count - 1
            while left <= right {
                let mid = (left + right) / 2
                if nums[mid] == target { return mid }
                if nums[left] <= nums[mid] {
                    if nums[left] <= target && target < nums[mid] {
                        right = mid - 1
                    } else {
                        left = mid + 1
                    }
                } else {
                    if nums[mid] < target && target <= nums[right] {
                        left = mid + 1
                    } else {
                        right = mid - 1
                    }
                }
            }
            return -1
        }
    }

    @Suite struct SearchInRotatedSortedArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "35D7EE00-4257-47EA-ADB8-5FE3104D68DB",
             input: "{\"nums\": [4,5,6,7,0,1,2], \"target\": 0}",
             expected: "4", orderMatters: true),
            TestCaseData(id: "D37B6A7D-35AF-497D-BC03-67A422301BDB",
             input: "{\"nums\": [4,5,6,7,0,1,2], \"target\": 3}",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "CD36332E-6623-49AF-9AFD-7C760BF6A217",
             input: "{\"nums\": [1], \"target\": 0}",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "6F48D81C-7488-46A2-B6BF-B40CBEC8CFB8",
             input: "{\"nums\": [1], \"target\": 1}",
             expected: "0", orderMatters: true),
            TestCaseData(id: "974B9643-1DBD-4E5B-9FE4-5C7B4543A721",
             input: "{\"nums\": [1,3], \"target\": 3}",
             expected: "1", orderMatters: true),
            TestCaseData(id: "156223B0-706F-47F5-9AF9-C9D947EC492A",
             input: "{\"nums\": [1,3], \"target\": 1}",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4A21628D-3F74-4624-A3C9-29D912CD1596",
             input: "{\"nums\": [3,1], \"target\": 1}",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3CA01450-80D2-4791-B641-C746B92E615A",
             input: "{\"nums\": [], \"target\": 5}",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "BD383402-E5E2-484E-8824-7EDBBC2B22AC",
             input: "{\"nums\": [1,3,5], \"target\": 5}",
             expected: "2", orderMatters: true),
            TestCaseData(id: "633DC201-D2FC-4B03-9A93-DCEAD975F29D",
             input: "{\"nums\": [5,1,3], \"target\": 5}",
             expected: "0", orderMatters: true),
            TestCaseData(id: "A7696842-12EB-47E6-AA09-79B9487ADE2E",
             input: "{\"nums\": [1,2,3,4,5,6,7], \"target\": 4}",
             expected: "3", orderMatters: true),
            TestCaseData(id: "514CDDE6-EC44-442A-B760-00B2D23EF59D",
             input: "{\"nums\": [7,8,1,2,3,4,5,6], \"target\": 2}",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f1512c68-3f9a-4f8e-a665-9dddec45ee28",
             input: "nums = [1,2,3], target = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f0a7b85c-a18b-4ea4-8120-efe505150b0e",
             input: "nums = [3,1,2], target = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "06f543ee-ad69-4cfa-819b-4ab427f127f7",
             input: "nums = [5,6,7,8,9,10,0,1,2,3,4], target = 8",
             expected: "3", orderMatters: true),
            TestCaseData(id: "56759588-8de5-4a44-b90a-ffeb47de0b04",
             input: "nums = [10,20,30,40,50], target = 30",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9344c6a1-89a6-4695-a451-5d5922e391e3",
             input: "nums = [1,2,3,4,5], target = 6",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "d754d148-eb1e-4a95-a578-ba7b54bca8ef",
             input: "nums = [-5,-4,-3,-2,-1], target = -3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f8af475d-1c1f-4530-8420-d89567794a10",
             input: "nums = [10,20,30,40,50], target = 60",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "e2f6cd79-0a1c-4cf5-833f-d71d5226b23c",
             input: "nums = [1,3,5,7,9], target = 6",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "004704e0-6c98-42de-b2ac-4df01a3eefaa",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 5",
             expected: "4", orderMatters: true),
            TestCaseData(id: "23595309-87d3-4206-91ae-11cb124761c9",
             input: "nums = [5,1,3], target = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8794b38b-b572-44f3-81ad-c01d1572fb35",
             input: "nums = [1,2,3,4,5], target = 0",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "a6437cdd-5f22-4a2e-ba1e-12dc66c4d877",
             input: "nums = [1], target = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "34774ebe-706d-4e75-89f9-bc226deeaa60",
             input: "nums = [4,5,6,7,0,1,2], target = 0",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "search-in-rotated-sorted-array"
            let topic = "binary-search"
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
            guard p_nums.count >= 1 && p_nums.count <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 5000"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }
            guard p_target >= -104 && p_target <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= target <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.search(p_nums, p_target)
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
