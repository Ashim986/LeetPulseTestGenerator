import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMergeSortedArray {
    private class Solution {
        func merge(_ nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int] {
            var i = m - 1
            var j = n - 1
            var k = m + n - 1
            var nums1 = nums1
            while j >= 0 {
                if i >= 0 && nums1[i] > nums2[j] {
                    nums1[k] = nums1[i]
                    i -= 1
                }
                else {
                    nums1[k] = nums2[j]
                    j -= 1
                }
                k -= 1
            }
            return nums1
        }
    }

    @Suite struct MergeSortedArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "93f6f74c-663d-4083-8a40-5bb4973c3120",
             input: "nums1 = [], m = 0, nums2 = [], n = 0",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "9d9a59d9-4761-4b33-a35a-714f59e78075",
             input: "nums1 = [1], m = 1, nums2 = [2], n = 1",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "3cb7477c-e788-4003-908a-e80946aac7b9",
             input: "nums1 = [1,2,3,4,5,6], m = 6, nums2 = [], n = 0",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "b3d4b646-d912-468f-83c0-b9b87d47500a",
             input: "nums1 = [1,2,3,4,5,6], m = 6, nums2 = [7], n = 1",
             expected: "[1,2,3,4,5,6,7]", orderMatters: true),
            TestCaseData(id: "43d4e94c-9de4-4695-84cf-a6ee2b07205a",
             input: "nums1 = [1,2,3,4,5,6,7,8,9], m = 9, nums2 = [10], n = 1",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "f82b747f-8daa-4eab-b93c-4524ff94b2e6",
             input: "nums1 = [4,5,6,0,0,0], m = 3, nums2 = [1,2,3], n = 3",
             expected: "[0,0,0,1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "6291a576-d772-4cd4-8cf0-b68bd6948df1",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [], n = 0",
             expected: "[0,0,0,1,2,3]", orderMatters: true),
            TestCaseData(id: "27db928a-0ff3-45c7-9708-8ce1386d48a6",
             input: "nums1 = [0,0,0], m = 0, nums2 = [1,2,3], n = 3",
             expected: "[0,0,0,1,2,3]", orderMatters: true),
            TestCaseData(id: "2a67589a-437f-4490-8ef5-4d53c6861606",
             input: "nums1 = [1,1,1,0,0,0], m = 3, nums2 = [1,1,1], n = 3",
             expected: "[0,0,0,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "050fa161-4398-4580-989e-20f509231d08",
             input: "nums1 = [-1,-2,-3,0,0,0], m = 3, nums2 = [-4,-5,-6], n = 3",
             expected: "[-6,-5,-4,-3,-2,-1,0,0,0]", orderMatters: true),
            TestCaseData(id: "e7da45dd-f733-4ba2-80b0-610ab1897f0d",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [4,5,6], n = 3",
             expected: "[0,0,0,1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "6bc8ec43-2275-4962-aa8f-6d635a05fbd6",
             input: "nums1 = [1,3,5,0,0,0], m = 3, nums2 = [2,4,6], n = 3",
             expected: "[0,0,0,1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "8bfa75eb-f8e6-40f6-9668-978bd567b8f9",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [7,8,9], n = 3",
             expected: "[0,0,0,1,2,3,7,8,9]", orderMatters: true),
            TestCaseData(id: "de85174a-aa0b-408f-9bd6-f6fdb5738d0d",
             input: "nums1 = [10,20,30,0,0,0], m = 3, nums2 = [1,2,3], n = 3",
             expected: "[0,0,0,1,2,3,10,20,30]", orderMatters: true),
            TestCaseData(id: "9f847fb4-0aed-4fb4-ab15-7ed80fec321d",
             input: "nums1 = [1,1,1,0,0,0], m = 3, nums2 = [2,2,2], n = 3",
             expected: "[0,0,0,1,1,1,2,2,2]", orderMatters: true),
            TestCaseData(id: "881b8a14-5e40-46ed-af03-014e4e4c02fd",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [3,3,3], n = 3",
             expected: "[0,0,0,1,2,3,3,3,3]", orderMatters: true),
            TestCaseData(id: "a3b11599-110d-485b-bdcf-3890403334fc",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [-1,-2,-3], n = 3",
             expected: "[-3,-2,-1,0,0,0,1,2,3]", orderMatters: true),
            TestCaseData(id: "34c09ccc-a159-4752-b0f3-63d0cc5fded3",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [4,5,6,7,8,9], n = 6",
             expected: "[0,0,0,1,2,3,4,5,6,7,8,9]", orderMatters: true),
            TestCaseData(id: "118af429-1e42-47ab-bb8e-3ae8342f56ae",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [10,20,30], n = 3",
             expected: "[0,0,0,1,2,3,10,20,30]", orderMatters: true),
            TestCaseData(id: "e9595ca1-546c-47cf-9510-523ed8ad6658",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [100,200,300], n = 3",
             expected: "[0,0,0,1,2,3,100,200,300]", orderMatters: true),
            TestCaseData(id: "aae48d64-758c-4059-80ff-764b0e471e80",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [1000,2000,3000], n = 3",
             expected: "[0,0,0,1,2,3,1000,2000,3000]", orderMatters: true),
            TestCaseData(id: "0f35c827-b3c8-4967-899b-95277d1d2787",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [1,1,1], n = 3",
             expected: "[0,0,0,1,1,1,1,2,3]", orderMatters: true),
            TestCaseData(id: "d0f67ba4-a14b-4c54-accc-d8f261c73b78",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,2,2], n = 3",
             expected: "[0,0,0,1,2,2,2,2,3]", orderMatters: true),
            TestCaseData(id: "7bfa13db-f57d-417a-8371-9ec2c2e31484",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [0,0,0], n = 3",
             expected: "[0,0,0,0,0,0,1,2,3]", orderMatters: true),
            TestCaseData(id: "5775f40a-dc83-42f6-b3c8-63cb15a83c58",
             input: "nums1 = [1,2,3,0,0,0], m = 3, nums2 = [10,11,12], n = 3",
             expected: "[0,0,0,1,2,3,10,11,12]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "merge-sorted-array"
            let topic = "two-pointers"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 4 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 4, got \(params.count)"
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
            guard let p_m = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_nums2 = InputParser.parseIntArray(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as [Int]"
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
            guard let p_n = InputParser.parseInt(params[3]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 3 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_m >= 0 && p_m <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= m, n <= 200"
                )
                return
            }
            guard p_n >= 0 && p_n <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= m, n <= 200"
                )
                return
            }
            guard p_nums1.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= nums1[i], nums2[j] <= 109"
                )
                return
            }
            guard p_nums2.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= nums1[i], nums2[j] <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.merge(p_nums1, p_m, p_nums2, p_n)
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
