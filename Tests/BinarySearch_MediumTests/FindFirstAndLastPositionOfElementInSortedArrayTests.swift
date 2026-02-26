import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindFirstAndLastPositionOfElementInSortedArray {
    private class Solution {
        func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
            func findFirst() -> Int {
                var l = 0, r = nums.count - 1, result = -1
                while l <= r {
                    let m = l + (r - l) / 2
                    if nums[m] == target { result = m; r = m - 1 }
                    else if nums[m] < target { l = m + 1 }
                    else { r = m - 1 }
                }
                return result
            }
            func findLast() -> Int {
                var l = 0, r = nums.count - 1, result = -1
                while l <= r {
                    let m = l + (r - l) / 2
                    if nums[m] == target { result = m; l = m + 1 }
                    else if nums[m] < target { l = m + 1 }
                    else { r = m - 1 }
                }
                return result
            }
            return [findFirst(), findLast()]
        }
    }

    @Suite struct FindFirstAndLastPositionOfElementInSortedArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "766157DB-6F25-4B4B-ACF5-47CFF0BFDE93",
             input: "[], 0",
             expected: "[-1,-1]", orderMatters: true),
            TestCaseData(id: "4EB7CA38-C50D-45AC-A734-D476A4116210",
             input: "[1], 1",
             expected: "[0, 0]", orderMatters: true),
            TestCaseData(id: "458DF344-D22A-4DA0-B53E-5938B746F32A",
             input: "[1], 0",
             expected: "[-1, -1]", orderMatters: true),
            TestCaseData(id: "A92AD3CE-6684-46C8-AF96-A1EC7D9F3965",
             input: "[1,2,3,4,5], 3",
             expected: "[2, 2]", orderMatters: true),
            TestCaseData(id: "F71EA3B9-C23F-4648-9604-C98B8477D7FB",
             input: "[5,7,7,8,8,10], 8",
             expected: "[3,4]", orderMatters: true),
            TestCaseData(id: "583F71B3-1C6C-442E-A46B-9810DFB1C8BC",
             input: "[1,1,2,3,4], 1",
             expected: "[0, 1]", orderMatters: true),
            TestCaseData(id: "E7927913-9FC9-461E-AA58-7A27DBC19A24",
             input: "[7,7,7,7,7], 7",
             expected: "[0, 4]", orderMatters: true),
            TestCaseData(id: "631B2DE9-5708-4F29-95F8-6E71380E1A93",
             input: "[1,2,3,3,3,3,4,5,6,7,8,9], 3",
             expected: "[2, 5]", orderMatters: true),
            TestCaseData(id: "4B531BFB-D0EC-4202-9A6B-D0C7FDCD096B",
             input: "{\"nums\": [], \"target\": 0}",
             expected: "[-1, -1]", orderMatters: true),
            TestCaseData(id: "D649F85B-FB0B-4707-A45B-DC2B750070A0",
             input: "{\"nums\": [1], \"target\": 1}",
             expected: "[0, 0]", orderMatters: true),
            TestCaseData(id: "A89CD354-DCE2-48A6-8673-BD6D54EF9CA8",
             input: "{\"nums\": [1], \"target\": 0}",
             expected: "[-1, -1]", orderMatters: true),
            TestCaseData(id: "5B619573-F615-490C-9E99-982D08C1ECC2",
             input: "{\"nums\": [5, 7, 7, 8, 8, 10], \"target\": 2}",
             expected: "[-1, -1]", orderMatters: true),
            TestCaseData(id: "7315B1B8-6043-4E09-B94C-A494DBF45E53",
             input: "{\"nums\": [5, 7, 7, 8, 8, 10], \"target\": 12}",
             expected: "[-1, -1]", orderMatters: true),
            TestCaseData(id: "AA1F7173-B7AA-46ED-8694-F3DA819EA772",
             input: "{\"nums\": [5, 7, 7, 8, 8, 10], \"target\": 10}",
             expected: "[5, 5]", orderMatters: true),
            TestCaseData(id: "13D1FB74-A630-46BC-9195-B23B70D07CC9",
             input: "{\"nums\": [1, 1, 2, 3, 4, 5], \"target\": 1}",
             expected: "[0, 1]", orderMatters: true),
            TestCaseData(id: "0F9B5D71-1738-40D1-9B3B-4B92A07572ED",
             input: "{\"nums\": [1, 2, 3, 4, 5, 5], \"target\": 5}",
             expected: "[4, 5]", orderMatters: true),
            TestCaseData(id: "FC2DE93F-3AA0-43A5-84B1-929AA65BACC9",
             input: "{\"nums\": [6, 6, 6, 6, 6, 6], \"target\": 6}",
             expected: "[0, 5]", orderMatters: true),
            TestCaseData(id: "9FF125B7-CA0F-40B1-8553-2C5E4D556BBF",
             input: "{\"nums\": [1, 3, 5, 7, 9], \"target\": 4}",
             expected: "[-1, -1]", orderMatters: true),
            TestCaseData(id: "00035210-CA1A-4FD6-8C3B-E1A0C3C7988A",
             input: "{\"nums\": [5, 7, 7, 8, 8, 10], \"target\": 8}",
             expected: "[3, 4]", orderMatters: true),
            TestCaseData(id: "2025777D-5344-4845-ABCE-1B6E5BFBF26B",
             input: "{\"nums\": [6, 6, 6, 6, 6], \"target\": 6}",
             expected: "[0, 4]", orderMatters: true),
            TestCaseData(id: "3CF7DB3C-A96B-4187-B140-8F229148C240",
             input: "{\"nums\": [1, 2, 3, 4, 5], \"target\": 3}",
             expected: "[2, 2]", orderMatters: true),
            TestCaseData(id: "6A413ACD-C501-41A3-B722-9E560BB34633",
             input: "{\"nums\": [10, 20, 30], \"target\": 35}",
             expected: "[-1, -1]", orderMatters: true),
            TestCaseData(id: "51866E75-D034-4BFF-8317-F19226B55985",
             input: "nums = [], target = 0",
             expected: "[-1,-1]", orderMatters: true),
            TestCaseData(id: "5F2D538B-01DF-4B4C-9837-48920BB03095",
             input: "nums = [5], target = 5",
             expected: "[0, 0]", orderMatters: true),
            TestCaseData(id: "8E14E93F-FDD3-4EA5-AE52-76E9B0C9017B",
             input: "nums = [1, 3, 5, 7], target = 4",
             expected: "[-1, -1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-first-and-last-position-of-element-in-sorted-array"
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
            guard p_nums.count >= 0 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= nums[i] <= 109"
                )
                return
            }
            guard p_target >= -109 && p_target <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= target <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.searchRange(p_nums, p_target)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
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
