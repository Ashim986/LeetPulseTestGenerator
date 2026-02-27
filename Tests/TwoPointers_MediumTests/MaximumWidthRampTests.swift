import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumWidthRamp {
    private class Solution {
        func maxWidthRamp(_ nums: [Int]) -> Int {
         var stack: [Int] = []
         var maxWidth = 0
         for i in 0..<nums.count {
         while !stack.isEmpty && nums[stack[stack.count - 1]] > nums[i] {
         let index = stack.removeLast()
         let width = i - index
         if width > maxWidth {
         maxWidth = width
         }
         }
         stack.append(i)
         }
         return maxWidth
         }
    }

    @Suite struct MaximumWidthRampTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bfdcf30b-ac9c-4581-8713-2a175423a23b",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "41d7df3d-a555-4527-aeaa-fd657d4356fe",
             input: "nums = [1, 2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3f3a12f4-abd2-41b6-8298-8fdc23e66e2c",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "30714356-1ae4-4a61-a583-7a1f1eaa84be",
             input: "nums = [2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cd10072e-0115-47bc-b463-7832c0efadb9",
             input: "nums = [1, 1, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6650b1a3-e6a0-4815-b75b-e62444d58c5f",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "52d84681-f742-404b-a67b-4efd4f7b0439",
             input: "nums = [5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e97693c6-e61d-449c-818d-f45974d26316",
             input: "nums = [-1, -2, -3, -4, -5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e0724054-597d-4be1-bc89-a8090d14d571",
             input: "nums = [10, 20, 30, 40, 50]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "da9cdb93-a403-4ca3-9a7c-7f3a24a71d9f",
             input: "nums = [50, 40, 30, 20, 10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "442c453e-7c8a-4234-8cef-a216383f8f76",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "9eecd3f7-c427-48ac-b3fd-8ac28cb82b58",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "53a205d9-3174-45b1-8038-d99cbbc67002",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c0b02e63-4dc0-459f-be22-7f3b34eff588",
             input: "nums = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "85969001-d2e8-4459-b5f9-67662563ab40",
             input: "nums = [100, 200, 300, 400, 500]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "69b76303-2ee8-4019-b8bf-03e99de0f824",
             input: "nums = [500, 400, 300, 200, 100]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7e0649aa-8020-4171-86fb-d15767399adc",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "941be8ed-678a-4d67-97b4-01f6a3290476",
             input: "nums = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "63432385-37b4-4cd8-87e8-786e38b46206",
             input: "nums = [10, 8, 6, 4, 2, 1, 3, 5, 7, 9]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "f06141b5-2bb3-4028-b0bd-b510378d7218",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]",
             expected: "14", orderMatters: true),
            TestCaseData(id: "a349fe91-d2a5-4c2e-9219-60cc74007160",
             input: "nums = [15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5c5e50b5-97a4-4027-a84b-ea0645098c4b",
             input: "nums = [-15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "14", orderMatters: true),
            TestCaseData(id: "d8ca705c-3695-4c17-8b9c-48138829caa5",
             input: "nums = [1000, 2000, 3000, 4000, 5000]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "4bfd1746-6b99-4f58-883c-8921f644c9f0",
             input: "nums = [5000, 4000, 3000, 2000, 1000]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "38f8ee8d-df39-40c6-be4f-d55acbaf0b74",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "14", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-width-ramp"
            let topic = "two-pointers"
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
            guard p_nums.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= nums.length <= 5 * 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 5 * 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxWidthRamp(p_nums)
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
