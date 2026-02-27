import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSetMismatch {
    private class Solution {
        func findErrorNums(_ nums: [Int]) -> [Int] {
            var nums = nums
            var duplicate = 0
            var missing = 0
            for i in 0..<nums.count {
                let index = abs(nums[i]) - 1
                if nums[index] < 0 {
                    duplicate = abs(nums[i])
                } else {
                    nums[index] *= -1
                }
            }
            for i in 0..<nums.count {
                if nums[i] > 0 {
                    missing = i + 1
                }
            }
            return [duplicate, missing]
        }
    }

    @Suite struct SetMismatchTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7c00c10e-292e-4cf7-b799-e314270d7263",
             input: "nums = [1,1,2,3,4,5,6,7,8,9]",
             expected: "[1,0]", orderMatters: true),
            TestCaseData(id: "00b4871b-efa8-4f57-a318-13af784c30b8",
             input: "nums = []",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "0938bd6e-a939-4f59-a339-3f86034820e9",
             input: "nums = [1]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "3f94937b-b9e7-427e-9d2a-ecd4c3a4ed39",
             input: "nums = [1,2,3,4,5]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "8a2b7846-91f2-4b04-b32f-e4a8cec0773f",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "06b711f0-ab02-47c7-83e1-3d0ecf114b95",
             input: "nums = [1,1,1,1,1]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "ec25a934-4e2d-400a-baf0-a4145a3fdd20",
             input: "nums = [5,5,5,5,5]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "c233c759-bd76-4294-924b-ea6bd1ebd435",
             input: "nums = [10,20,30,40,50]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "7daaf40a-d5aa-41ef-b9cd-555326f45de3",
             input: "nums = [1,3,5,7,9]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "8e17924c-b92f-4fd7-b4f2-a356c37fdf39",
             input: "nums = [2,4,6,8,10]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "d733e1d9-198c-426a-9da4-4e1a0ba6d9a5",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "eba80c95-ce61-4307-9810-aaee990d0047",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "440acfde-642c-47bb-ad9f-ff65584a5d93",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "b4e9ff85-dd2e-4bad-bdd2-a1709a00ca6d",
             input: "nums = [5,1,2,3,4]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "f236be39-87dd-4a88-8bb5-fe480c4bad5d",
             input: "nums = [1,2,3,4,10]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "67823082-23b6-43b8-8efe-a6582ee7843f",
             input: "nums = [1,2,3,4,100]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "0ebbf6f5-ad66-4103-ba6b-e9319228b082",
             input: "nums = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "624891f5-ac26-482b-ae67-31423b5fd212",
             input: "nums = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "59d33eee-5cc2-48f5-bb6e-6c022924f2a7",
             input: "nums = [1,2,3,4,5,6,7,8,9,1000]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "9b894d0a-c370-4d54-8e0b-38bf73630d95",
             input: "nums = [1,2,3,4,5,6,7,8,9,10000]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "bb1d9217-8b05-46f7-b3a5-4b0cfc083173",
             input: "nums = [1000,1001,1002,1003,1004,1005,1006,1007,1008,1009]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "4166c136-bb17-4282-b53a-bbcd87d5dad7",
             input: "nums = [1,3,5,7,9,11,13,15,17,19]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "2b702a58-b46f-4501-bc3c-ac43c4416dda",
             input: "nums = [2,4,6,8,10,12,14,16,18,20]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "20db35e2-c096-492c-9060-c64f6b6f7f52",
             input: "nums = [1,1,2,2,3,3,4,4,5,5]",
             expected: "[5,0]", orderMatters: true),
            TestCaseData(id: "73702071-ff18-4555-8f8b-1eaa8d619b1a",
             input: "nums = [1,2,2,3,3,4,4,5,5,6]",
             expected: "[5,0]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "set-mismatch"
            let topic = "bit-manipulation"
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
            guard p_nums.count >= 2 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= nums.length <= 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 1 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.findErrorNums(p_nums)
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
