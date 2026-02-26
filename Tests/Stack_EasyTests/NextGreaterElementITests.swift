import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNextGreaterElementI {
    private class Solution {
        func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            var stack: [Int] = []
            var nextGreater: [Int: Int] = [:]
            for num in nums2 {
                while !stack.isEmpty && stack[stack.count - 1] < num {
                    nextGreater[stack.removeLast()] = num
                }
                stack.append(num)
            }
            return nums1.map { nextGreater[$0] ?? -1 }
        }
    }

    @Suite struct NextGreaterElementITests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "57d42ada-4d00-47bf-bb43-5d21551f8dc5",
             input: "nums1 = [1, 2, 3], nums2 = [4, 5, 6]",
             expected: "[-1, -1, -1]", orderMatters: true),
            TestCaseData(id: "7de90a78-9c73-41c5-b15d-7ccc3e749004",
             input: "nums1 = [], nums2 = [1, 2, 3]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "bca280f8-b8e0-4138-b103-374ced3e2ab5",
             input: "nums1 = [1, 2, 3], nums2 = []",
             expected: "[-1, -1, -1]", orderMatters: true),
            TestCaseData(id: "e0a4948e-9620-4e90-9fac-d216e6983804",
             input: "nums1 = [2], nums2 = [1]",
             expected: "[-1]", orderMatters: true),
            TestCaseData(id: "06c20c0c-5d55-410c-aa65-eb5ea72005e4",
             input: "nums1 = [1, 2, 3], nums2 = [3, 2, 1]",
             expected: "[-1, -1, -1]", orderMatters: true),
            TestCaseData(id: "fa1292ce-185e-4878-aceb-cc4ddac38f78",
             input: "nums1 = [1, 2, 3], nums2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "[2, 3, 4]", orderMatters: true),
            TestCaseData(id: "e1b97be0-0a66-431a-9b0d-1e310005f458",
             input: "nums1 = [-1, -2, -3], nums2 = [-4, -5, -6]",
             expected: "[-1, -1, -1]", orderMatters: true),
            TestCaseData(id: "c38585c6-c56d-4fc4-a4d5-3052b7a73600",
             input: "nums1 = [10, 20, 30], nums2 = [10, 20, 30, 40, 50, 60]",
             expected: "[20, 30, 40]", orderMatters: true),
            TestCaseData(id: "17e8874d-c78e-4308-ba22-0b940249f831",
             input: "nums1 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]", orderMatters: true),
            TestCaseData(id: "626a507b-dbb6-4da5-bd96-d405cd28becc",
             input: "nums1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], nums2 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]", orderMatters: true),
            TestCaseData(id: "0fe9a2df-2e60-4524-8f4f-e004ba7444c1",
             input: "nums1 = [1, 2, 3, 4, 5], nums2 = [1, 2, 3, 4, 5]",
             expected: "[2, 3, 4, 5, -1]", orderMatters: true),
            TestCaseData(id: "72da9ae8-b7d3-4ab7-8db9-bac0e48fdf80",
             input: "nums1 = [5, 4, 3, 2, 1], nums2 = [5, 4, 3, 2, 1]",
             expected: "[-1, -1, -1, -1, -1]", orderMatters: true),
            TestCaseData(id: "98ad86bd-def1-4261-8ec1-7b82120aba41",
             input: "nums1 = [1, 2, 3], nums2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]",
             expected: "[2, 3, 4]", orderMatters: true),
            TestCaseData(id: "87747964-e39c-48ff-aa5d-76f4154b0369",
             input: "nums1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], nums2 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 11, 12, 13, 14, 15]",
             expected: "[11, 11, 11, 11, 11, 11, 11, 11, 11, 11]", orderMatters: true),
            TestCaseData(id: "4d77aed8-9563-4645-90af-30bfdf8042d8",
             input: "nums1 = [1], nums2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "a6c5a922-3aa6-41ac-a81d-6eb830279f91",
             input: "nums1 = [10], nums2 = [1, 2, 3, 4, 5, 6, 7, 8, 9]",
             expected: "[-1]", orderMatters: true),
            TestCaseData(id: "b83f3f6c-b729-4765-9f1e-8d24ece03d00",
             input: "nums1 = [1, 2, 3], nums2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]",
             expected: "[2, 3, 4]", orderMatters: true),
            TestCaseData(id: "bbdbf3a6-e673-488e-bafb-eaefcb84cf42",
             input: "nums1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], nums2 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,"
                + " 25]",
             expected: "[11, 11, 11, 11, 11, 11, 11, 11, 11, 11]", orderMatters: true),
            TestCaseData(id: "f4950e21-abad-4a5b-b94b-d2925f541994",
             input: "nums1 = [1, 2, 3, 4, 5], nums2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,"
                + " 29, 30]",
             expected: "[2, 3, 4, 5, 6]", orderMatters: true),
            TestCaseData(id: "c35e6935-86d1-48ec-be32-dd6b23e72aef",
             input: "nums1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], nums2 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,"
                + " 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]",
             expected: "[11, 11, 11, 11, 11, 11, 11, 11, 11, 11]", orderMatters: true),
            TestCaseData(id: "8b86fee3-f00d-4763-a3d1-b093d9f4a165",
             input: "nums1 = [1, 2, 3], nums2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 3"
                + "0, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40]",
             expected: "[2, 3, 4]", orderMatters: true),
            TestCaseData(id: "8be0cd70-3853-4b93-86bb-5d72c585cb9e",
             input: "nums1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], nums2 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,"
                + " 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45]",
             expected: "[11, 11, 11, 11, 11, 11, 11, 11, 11, 11]", orderMatters: true),
            TestCaseData(id: "48be2a51-1b65-466f-b2e6-969887b4074d",
             input: "nums1 = [10], nums2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32"
                + ", 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45]",
             expected: "[-1]", orderMatters: true),
            TestCaseData(id: "5ec99808-386d-43e6-853e-fae83d1b7d8c",
             input: "nums1 = [1, 2, 3], nums2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 3"
                + "0, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50]",
             expected: "[2, 3, 4]", orderMatters: true),
            TestCaseData(id: "99ad191d-93c1-46e6-a297-4e1c607a2f68",
             input: "nums1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], nums2 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,"
                + " 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55]",
             expected: "[11, 11, 11, 11, 11, 11, 11, 11, 11, 11]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "next-greater-element-i"
            let topic = "stack"
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

            guard let p_nums1 = InputParser.parseIntArray(params[0]) else {
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
            guard p_nums1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums1 array too large (\(p_nums1.count))"
                )
                return
            }
            guard let p_nums2 = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_nums2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums2 array too large (\(p_nums2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums1.count >= 1 && p_nums1.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums1.length <= nums2.length <= 1000"
                )
                return
            }
            guard p_nums2.count >= 1 && p_nums2.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums1.length <= nums2.length <= 1000"
                )
                return
            }
            guard p_nums1.allSatisfy({ $0 >= 0 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums1[i], nums2[i] <= 104"
                )
                return
            }
            guard p_nums2.allSatisfy({ $0 >= 0 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums1[i], nums2[i] <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.nextGreaterElement(p_nums1, p_nums2)
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
