import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSortAnArray {
    private class Solution {
        func sortArray(_ nums: [Int]) -> [Int] {
            var nums = nums
            quickSort(&nums, 0, nums.count - 1)
            return nums
        }

        func quickSort(_ nums: inout [Int], _ low: Int, _ high: Int) {
            if low < high {
                let pivot = partition(&nums, low, high)
                quickSort(&nums, low, pivot - 1)
                quickSort(&nums, pivot + 1, high)
            }
        }

        func partition(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {
            let pivot = nums[high]
            var i = low - 1
            for j in low..<high {
                if nums[j] < pivot {
                    i += 1
                    (nums[i], nums[j]) = (nums[j], nums[i])
                }
            }
            (nums[i + 1], nums[high]) = (nums[high], nums[i + 1])
            return i + 1
        }
    }

    @Suite struct SortAnArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "fc3c381f-8917-4a8a-8d1e-120c06e01ae1",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "98b740a8-0db4-436c-bce6-62941e80ad55",
             input: "nums = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "b34291da-eb99-42bd-be2e-e2261f69f57a",
             input: "nums = [5,5]",
             expected: "[5,5]", orderMatters: true),
            TestCaseData(id: "7b5cf595-1516-4422-bee7-c595f00c88eb",
             input: "nums = [-1,0,1]",
             expected: "[-1,0,1]", orderMatters: true),
            TestCaseData(id: "3ab3d813-14e4-4e40-af79-ac6a36105489",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "bbd2df46-d64d-44ff-9b31-d7847fc6c61d",
             input: "nums = [1,1,1,1,1]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "9cd63b30-3644-4954-a95c-4e3f5ee875f0",
             input: "nums = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]", orderMatters: true),
            TestCaseData(id: "34f78ac3-294e-44e2-b84a-02d46b635a80",
             input: "nums = [100,200,300,400,500]",
             expected: "[100,200,300,400,500]", orderMatters: true),
            TestCaseData(id: "20fc973d-3a63-470a-a327-0ac7156c06e6",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "[1000,2000,3000,4000,5000]", orderMatters: true),
            TestCaseData(id: "e584a43e-a81b-4d89-849e-63deb2e1c9dd",
             input: "nums = [-100,-200,-300,-400,-500]",
             expected: "[-500,-400,-300,-200,-100]", orderMatters: true),
            TestCaseData(id: "dd42a352-ac2b-45d0-ba3e-5dc27d040a1c",
             input: "nums = [0,0,0,0,0]",
             expected: "[0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "f16abd33-4626-4f85-9842-a8337ebeffb6",
             input: "nums = [10,20,30,40,50,60,70,80,90,100]",
             expected: "[10,20,30,40,50,60,70,80,90,100]", orderMatters: true),
            TestCaseData(id: "7afa4e0b-4fa3-4c7e-ac6d-f95e212440a8",
             input: "nums = [1,3,5,7,9]",
             expected: "[1,3,5,7,9]", orderMatters: true),
            TestCaseData(id: "12431b66-ec42-4623-b80d-f75616e418e1",
             input: "nums = [2,4,6,8,10]",
             expected: "[2,4,6,8,10]", orderMatters: true),
            TestCaseData(id: "81993563-7647-44d9-9bb9-35f6a7c5f564",
             input: "nums = [-1,-3,-5,-7,-9]",
             expected: "[-9,-7,-5,-3,-1]", orderMatters: true),
            TestCaseData(id: "48d6a2be-c468-4992-bd80-0005c62bca86",
             input: "nums = [-2,-4,-6,-8,-10]",
             expected: "[-10,-8,-6,-4,-2]", orderMatters: true),
            TestCaseData(id: "7859e682-1669-4fb7-8010-7ba0758bd33e",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]", orderMatters: true),
            TestCaseData(id: "800c9a75-0dd2-4c74-b3cb-b04cba56372e",
             input: "nums = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]", orderMatters: true),
            TestCaseData(id: "c7572a30-d0e9-4210-9bb9-62a5afbb36b2",
             input: "nums = [1,3,2,5,4]",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "7a896254-402e-4433-9e79-883eb6ca80df",
             input: "nums = [5,4,3,2,1,6,7,8,9,10]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "00c2a48f-0dbd-4dce-b5fb-25d7a9e042b9",
             input: "nums = [10,9,8,7,6,5,4,3,2,1,0,-1,-2,-3,-4,-5]",
             expected: "[-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "c5a28221-0d22-4004-be09-68b8d00f14c5",
             input: "nums = [0,-1,1,-2,2,-3,3,-4,4,-5,5]",
             expected: "[-5,-4,-3,-2,-1,0,1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "3f841379-d7b5-4d1b-afe7-15b0eb8b272c",
             input: "nums = [100,-100,200,-200,300,-300]",
             expected: "[-300,-200,-100,100,200,300]", orderMatters: true),
            TestCaseData(id: "b0878627-d1b4-4e6f-bfc8-58474a017167",
             input: "nums = [1000,-1000,2000,-2000,3000,-3000]",
             expected: "[-3000,-2000,-1000,1000,2000,3000]", orderMatters: true),
            TestCaseData(id: "94f9802d-e286-4102-a406-68d048307630",
             input: "nums = [1,1,1,1,1,2,2,2,2,2]",
             expected: "[1,1,1,1,1,2,2,2,2,2]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sort-an-array"
            let topic = "heap-priority-queue"
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
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.sortArray(p_nums)
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
