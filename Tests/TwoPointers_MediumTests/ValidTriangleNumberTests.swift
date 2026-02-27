import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCValidTriangleNumber {
    private class Solution {
        func triangleNumber(_ nums: [Int]) -> Int {
            let sortedNums = nums.sorted()
            var count = 0
            for i in 0..<sortedNums.count {
                var left = 0
                var right = i - 1
                while left < right {
                    if sortedNums[left] + sortedNums[right] > sortedNums[i] {
                        count += right - left
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
            return count
        }
    }

    @Suite struct ValidTriangleNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5685d29b-6528-47b4-8af3-289fe55f93aa",
             input: "nums = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4c15927c-81ad-4ee0-8eca-92d784d115d0",
             input: "nums = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7386d31d-6668-45a0-a913-5e51d5a58e0f",
             input: "nums = [5,5,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f1bf6e59-fb11-486f-be49-440626d57c36",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7ebbccd7-701a-4242-b27d-e4c1a304e95c",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "81b603da-bb17-4477-bb40-1b16852edfcc",
             input: "nums = [1,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ff1efe51-992f-4b44-a5d6-f65a41d97fa7",
             input: "nums = [1,2,3,4,5]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "533e8149-d1cc-4ff0-adbb-db66b03bc49f",
             input: "nums = [10,10,10,10]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "86a68f1f-154b-41de-9a85-1dc9e21f02c3",
             input: "nums = [-1,-2,-3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c6ba0c06-b2e3-491b-b514-adbc85f23ff7",
             input: "nums = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "53f1f906-f9dc-48f7-b43b-91d6ccf2b473",
             input: "nums = [100,100,100]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f27771a0-829a-4521-b7d5-5574aac3b3f6",
             input: "nums = [1,100,1000]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6bdfbf16-5f46-46eb-abb6-603e3d5a2d37",
             input: "nums = [1,1,1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "f8505b00-df2b-4020-bfad-a7b9c5dfe29d",
             input: "nums = [5,10,15,20,25]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "b0196b5b-0a13-4bc3-a522-4f4b37ee97e2",
             input: "nums = [25,20,15,10,5]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "8a41f3c0-49c4-42fd-ad26-15fa31e433dc",
             input: "nums = [2,3,4,5,6]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "b18b3a83-dc3a-4dac-bb38-5d1f914deacc",
             input: "nums = [6,5,4,3,2]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "9187987f-28bd-4033-905d-a35c9185ce9c",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "1f136d20-9022-4141-9ffe-4a5b85a2ac26",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "df24b7e3-bb77-498f-90b7-0712b692776e",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2ad391a6-0fb4-40d9-9743-959724e8ccf8",
             input: "nums = [5000,4000,3000,2000,1000]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e56bc268-ed05-4464-9311-352f878decba",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "120", orderMatters: true),
            TestCaseData(id: "05441737-ead9-4d62-b758-b46038d1a21c",
             input: "nums = [10,10,10,10,10,10,10,10,10,10]",
             expected: "120", orderMatters: true),
            TestCaseData(id: "f0e93778-f78e-4de8-8293-d9235fcbe3f0",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "203", orderMatters: true),
            TestCaseData(id: "3df06123-cb51-4104-b3f8-dd6ea64e7dae",
             input: "nums = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "203", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "valid-triangle-number"
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
            guard p_nums.count >= 1 && p_nums.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 1000"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.triangleNumber(p_nums)
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
