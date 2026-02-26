import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSingleNumberIi {
    private class Solution {
        func singleNumber(_ nums: [Int]) -> Int {
            var ones = 0
            var twos = 0
            for num in nums {
                twos |= ones & num
                ones ^= num
                let notThrees = ~(ones & twos)
                ones &= notThrees
                twos &= notThrees
            }
            return ones
        }
    }

    @Suite struct SingleNumberIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "66207520-bc4b-498f-9ab9-b606f87a11db",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fad15af3-3097-42ab-bea6-f4d77fc6143f",
             input: "nums = [1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b1263f5d-c993-4fd6-967f-046088879be3",
             input: "nums = [0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d09839db-36d6-445d-ac13-5b12a01cbb2a",
             input: "nums = [-1,-1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9f2a23ef-887f-44b9-8d97-58ca11c8e544",
             input: "nums = [1,1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e149baf9-67f1-4b97-99ab-5c3ca7949e4d",
             input: "nums = [1,2,2,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8528b0fa-d48b-460f-8864-6e8ef6b66b91",
             input: "nums = [1,1,1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "692d18b3-9cf7-44fc-a352-2ae7e3d92dba",
             input: "nums = [-1,-1,-1,-1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "775fa56e-b8c2-44c6-94ca-b8ca0a4e9e95",
             input: "nums = [1,1,1,1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e72d0f95-c347-4d00-bed9-6d5862aa719b",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,11]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "af983f50-a058-436a-92ed-ebd304e931b8",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1f19d693-d202-4878-bf61-d7bfb9a3099d",
             input: "nums = [1000,1000,1000,1001]",
             expected: "1001", orderMatters: true),
            TestCaseData(id: "7ff4e3b1-b479-498f-b394-50b3da980771",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "77777ece-edba-47c2-8484-fc6e698f0b5f",
             input: "nums = [1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "eb452886-69ba-4735-aa06-83b9fb932cec",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "4a2f047f-3715-4efa-9f58-ca3e94d0c686",
             input: "nums = [-10,-10,-10,-9]",
             expected: "-9", orderMatters: true),
            TestCaseData(id: "de13d01a-3396-4468-81a7-7da43953d3d3",
             input: "nums = [100,100,100,101]",
             expected: "101", orderMatters: true),
            TestCaseData(id: "7f8f80a8-3bfb-4b58-b05c-a5101b7574d1",
             input: "nums = [1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9b555b4a-8931-4a18-b9e2-f41de5ef6f16",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f4c9413f-6f79-42df-b647-721183b5232e",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "57061f9e-61ed-4099-bfb4-be6d7beb6fa2",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,19,19,20,20,21]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "8e0a0be4-c1a8-484a-9ef2-efa21aebee61",
             input: "nums = [1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,19,19,20,20,21,21,22]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7a34c911-9e7e-49a6-9455-048994893b4f",
             input: "nums = [1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,19,19,20,20,21,21,22,22,23]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "80b64566-fd41-45ca-a409-157964155f99",
             input: "nums = [1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,19,19,20,20,21,21,22,22,23,23,24]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d00caaef-ff9b-4c0a-a38e-67ea2963fe14",
             input: "nums = [1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,19,19,20,20,21,21,22,22,23,23,24,24,25]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "single-number-ii"
            let topic = "bit-manipulation"
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
                    errorMessage: "Constraint violation: 1 <= nums.length <= 3 * 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -231 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= nums[i] <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.singleNumber(p_nums)
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
