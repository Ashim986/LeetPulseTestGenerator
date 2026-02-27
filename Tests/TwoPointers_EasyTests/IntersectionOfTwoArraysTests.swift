import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCIntersectionOfTwoArrays {
    private class Solution {
        func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            var hashTable = Set<Int>(nums1)
            var result = Set<Int>()
            for num in nums2 {
                if hashTable.contains(num) {
                    result.insert(num)
                }
            }
            return Array(result)
        }
    }

    @Suite struct IntersectionOfTwoArraysTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c12c86d1-9dc1-4d85-8f31-ab2415b8b025",
             input: "nums1 = [1], nums2 = [1]",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "2a795bfe-dcbd-4715-b16d-54c30e7b2221",
             input: "nums1 = [], nums2 = [1,2,3]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "eefc0895-f75f-407e-807c-40e1d609f43c",
             input: "nums1 = [1,2,3], nums2 = []",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "54064796-65ba-4291-8fa7-7c26030fd831",
             input: "nums1 = [1,2,3], nums2 = [4,5,6]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "3d1eb2c9-946d-407c-8ead-52041e3db71b",
             input: "nums1 = [1,2,3], nums2 = [3,2,1]",
             expected: "[1,2,3]", orderMatters: false),
            TestCaseData(id: "c9c62c8c-2d10-4108-b950-fea1828a45f9",
             input: "nums1 = [1,1,1], nums2 = [1,1,1]",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "5d97590a-a9ec-4aa0-ae6b-77a9d87ae9e6",
             input: "nums1 = [-1,-2,-3], nums2 = [-3,-2,-1]",
             expected: "[-1,-2,-3]", orderMatters: false),
            TestCaseData(id: "14e64010-0093-4b1c-87b0-508af7013cd9",
             input: "nums1 = [1000,2000,3000], nums2 = [3000,2000,1000]",
             expected: "[1000,2000,3000]", orderMatters: false),
            TestCaseData(id: "216c5990-045b-4b41-b5c3-8a8c4f7cbee5",
             input: "nums1 = [1,2,3,4,5], nums2 = [6,7,8,9,10]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "69b6dfc3-1765-4905-904d-18ee8ce1d0eb",
             input: "nums1 = [1,1,1,1,1], nums2 = [1,1,1,1,1]",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "f5bbe3c7-c652-40fc-ae80-505a3042de2f",
             input: "nums1 = [1,2,3,4,5], nums2 = [1,3,5]",
             expected: "[1,3,5]", orderMatters: false),
            TestCaseData(id: "35313f35-9c6d-44a1-ae5b-b42a141319cd",
             input: "nums1 = [1,3,5], nums2 = [1,2,3,4,5]",
             expected: "[1,3,5]", orderMatters: false),
            TestCaseData(id: "08750ba1-45ec-484a-9356-4e3ce7110fbd",
             input: "nums1 = [1,2,3,4,5], nums2 = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,2,3,4,5]", orderMatters: false),
            TestCaseData(id: "72e4072d-8984-4607-b75f-9a02e2c6f46e",
             input: "nums1 = [1,2,3,4,5,6,7,8,9,10], nums2 = [1,2,3,4,5]",
             expected: "[1,2,3,4,5]", orderMatters: false),
            TestCaseData(id: "c673a5fe-a1d9-4c44-8913-c08308cef67d",
             input: "nums1 = [-10,-9,-8,-7,-6], nums2 = [-5,-4,-3,-2,-1]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "b01e5942-7233-4f0b-b965-111e971fa883",
             input: "nums1 = [-10,-9,-8,-7,-6], nums2 = [-10,-9,-8,-7,-6]",
             expected: "[-10,-9,-8,-7,-6]", orderMatters: false),
            TestCaseData(id: "936bc293-1142-45f7-b107-3538ee3a94b6",
             input: "nums1 = [1,3,5,7,9], nums2 = [2,4,6,8,10]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "96ba086a-1717-420c-9b1a-1ac9c4cd50c4",
             input: "nums1 = [1,1,1,1,1], nums2 = [2,2,2,2,2]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "67de1236-13ae-498a-9345-3d1935c2114b",
             input: "nums1 = [1,2,3,4,5], nums2 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "[1,2,3,4,5]", orderMatters: false),
            TestCaseData(id: "12156ae5-0dae-4202-9699-915ef57e2d0f",
             input: "nums1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], nums2 = [1,2,3,4,5]",
             expected: "[1,2,3,4,5]", orderMatters: false),
            TestCaseData(id: "a9ba8175-a7de-4067-abf1-246afec50f59",
             input: "nums1 = [1,1,2,2,3,3], nums2 = [1,1,2,2,3,3]",
             expected: "[1,2,3]", orderMatters: false),
            TestCaseData(id: "eade13fc-1376-4b5c-8f42-4ae7dec77fed",
             input: "nums1 = [1,2,3,4,5], nums2 = [5,4,3,2,1]",
             expected: "[1,2,3,4,5]", orderMatters: false),
            TestCaseData(id: "1e65909b-2142-4435-a028-9da28d8a6c3e",
             input: "nums1 = [1,1,1,1,1], nums2 = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "e15f586c-02a6-461b-a826-ff73f971e2c2",
             input: "nums1 = [1,2,3,4,5,6,7,8,9,10], nums2 = [10,9,8,7,6,5,4,3,2,1]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: false),
            TestCaseData(id: "fecd2232-3b0a-47d1-984b-abe604afca38",
             input: "nums1 = [0,0,0,0,0], nums2 = [0,0,0,0,0]",
             expected: "[0]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "intersection-of-two-arrays"
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

            guard let p_nums1 = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums1 array too large (\(p_nums1.count))"
                )
                return
            }
            guard let p_nums2 = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_nums2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums2 array too large (\(p_nums2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums1.count >= 1 && p_nums1.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums1.length, nums2.length <= 1000"
                )
                return
            }
            guard p_nums2.count >= 1 && p_nums2.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums1.length, nums2.length <= 1000"
                )
                return
            }
            guard p_nums1.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums1[i], nums2[i] <= 1000"
                )
                return
            }
            guard p_nums2.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums1[i], nums2[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.intersection(p_nums1, p_nums2)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
