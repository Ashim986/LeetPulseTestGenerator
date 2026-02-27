import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSingleElementInASortedArray {
    private class Solution {
        func singleNonDuplicate(_ nums: [Int]) -> Int {
            var low = 0
            var high = nums.count - 1

            while low < high {
                let mid = low + (high - low) / 2
                if mid % 2 == 1 {
                    mid - 1
                }

                if nums[mid] == nums[mid ^ 1] {
                    low = mid + 1
                } else {
                    high = mid
                }
            }

            return nums[low]
        }
    }

    @Suite struct SingleElementInASortedArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "23735ff5-aafc-44c0-8834-73c3e25790ec",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "40f32c94-65c5-4fb4-afd6-ec2a31f2f112",
             input: "nums = [1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "22d11092-0c13-41c1-905c-f7b12b1060ec",
             input: "nums = [1,2,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "49c75f08-66e5-43a8-9b7d-85a5e276d07b",
             input: "nums = [-1,-1,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a06a0e97-fdeb-4568-a5cb-30692bca951f",
             input: "nums = [0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9777385f-c2d4-4d39-b01c-ab6d28187120",
             input: "nums = [1,2,3,3,4,4,5,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d731521f-5ba9-4032-8226-32e24ca33742",
             input: "nums = [1,1,2,2,3,3,4,4,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "504443ec-59fa-4ddf-bd1d-0dda6815a579",
             input: "nums = [1,1,2,2,3,4,4,5,5]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "bbdedc6a-0a3c-4102-81ff-349a60b10d17",
             input: "nums = [1,2,2,3,3,4,4,5,5,6,6]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "474b7a7c-7533-4c63-8efc-efa52e136806",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6,6,7]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "c949931c-01b6-43cd-a404-f5cc46718374",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "9e709a41-0ef0-4687-9a7f-731f2bcfa80d",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "d7eece23-3d04-4254-a9db-af46781289ff",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "5540494b-3d90-4ae7-abb3-3502bc04eff7",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "d8d31437-59cf-4319-953a-121ec5446d82",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "aef14906-6319-47fd-b074-690cd83efadf",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "6c8743bd-4a19-4d62-bd2f-ea4a236da92a",
             input: "nums = [1,1,1,2,2,3,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "44a0fafb-53f5-4795-9467-da41f3f1349a",
             input: "nums = [1,1,1,1,1,2,2,2,2,2,3,3,3,3,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0e069adf-53a8-45fd-a90e-cf895709c5ce",
             input: "nums = [1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "02714059-f15b-4d4e-b42c-6749dc8df380",
             input: "nums = [1,1,1,1,1,1,1,2,2,2,2,2,2,2,3,3,3,3,3,3,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0f2c2eed-0494-4ab8-9273-f867bb86a2ab",
             input: "nums = [1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1d599b69-619a-431d-bb03-066e8cee6b8a",
             input: "nums = [1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0941305a-8c24-4165-9817-60c07ecb0831",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3cfee11c-aaf6-40b9-97b8-29348a4cb068",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "398a3187-1161-4090-8b07-016b0200a900",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "single-element-in-a-sorted-array"
            let topic = "binary-search"
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
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.singleNonDuplicate(p_nums)
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
