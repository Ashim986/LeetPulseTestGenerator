import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumProductSubarray {
    private class Solution {
        func maxProduct(_ nums: [Int]) -> Int {
            var maxProd = nums[0]
            var minProd = nums[0]
            var result = nums[0]

            for i in 1..<nums.count {
                let candidates = [nums[i], nums[i] * maxProd, nums[i] * minProd]
                maxProd = candidates.max().unsafelyUnwrapped
                minProd = candidates.min().unsafelyUnwrapped
                result = max(result, maxProd)
            }

            return result
        }
    }

    @Suite struct MaximumProductSubarrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b7f64602-b60c-4cfb-b25f-d685936b1ebf",
             input: "nums = [1,2,3]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "e287f7c6-1dab-40c7-a0e5-5cdd6565e51c",
             input: "nums = [-2,0,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "938014ce-8b0f-45f8-b8d9-dca8942e9490",
             input: "nums = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5db9de75-6c78-4134-a114-ddafc1598b1f",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "46852211-b5ab-475b-b666-ef8e32116d53",
             input: "nums = [-1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "f7b47ec0-9240-4ba3-b759-33d3c3ab285b",
             input: "nums = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "358ffeb4-291a-482c-9178-0d1fdfaa7671",
             input: "nums = [5,6,7,8,9]",
             expected: "15120", orderMatters: true),
            TestCaseData(id: "8dc460e9-faa7-438b-8b67-c7621d487794",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "3628800", orderMatters: true),
            TestCaseData(id: "98eb4079-4745-4eaa-9139-a66a7b52542d",
             input: "nums = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]",
             expected: "3628800", orderMatters: true),
            TestCaseData(id: "8227ecec-00a1-409a-b896-fa32d87aed70",
             input: "nums = [-10,-20,-30,-40,-50]",
             expected: "1200000", orderMatters: true),
            TestCaseData(id: "b4db5190-4766-4f98-a375-289351f67c1c",
             input: "nums = [1,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "535b7954-8dd9-4e5c-b228-2cb28856dade",
             input: "nums = [0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ead49c43-4a44-46e7-a43c-ad546703c4a6",
             input: "nums = [1,0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c1863fd7-ab63-4c4b-9ecf-7c4ac1f65cd6",
             input: "nums = [0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "889f6616-75c2-471e-803d-daf281a8362b",
             input: "nums = [1000000]",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "91e83d33-a6ec-4e52-893e-c09027075ecc",
             input: "nums = [-1000000]",
             expected: "-1000000", orderMatters: true),
            TestCaseData(id: "93333451-4d1e-41cf-9137-89151d1d63df",
             input: "nums = [1,1000000]",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "980a7524-a8bf-4a93-92e0-408775dd5648",
             input: "nums = [1000000,1]",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "d7ed8ef2-43aa-48ab-b729-59ded8dbb159",
             input: "nums = [-1,1000000]",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "2db18407-0cd2-4398-b622-4cce638c3b5c",
             input: "nums = [1000000,-1]",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "976f6bc7-b430-4dc1-8bfa-9a3376ed4053",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "1307674368000", orderMatters: true),
            TestCaseData(id: "a43ecf77-5dba-4e34-8d90-1773e9b3b2e4",
             input: "nums = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15]",
             expected: "1307674368000", orderMatters: true),
            TestCaseData(id: "087beaf3-9f5d-49f0-83ae-83e8188cda4f",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "3628800", orderMatters: true),
            TestCaseData(id: "96352bd3-5574-42f2-806a-5920c0fd9b47",
             input: "nums = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "3628800", orderMatters: true),
            TestCaseData(id: "dd17255b-b078-4e20-ae9f-0ca7ee0f705d",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-product-subarray"
            let topic = "dynamic-programming"
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
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 2 * 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -10 && $0 <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10 <= nums[i] <= 10"
                )
                return
            }

            let solution = Solution()
            let result = solution.maxProduct(p_nums)
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
