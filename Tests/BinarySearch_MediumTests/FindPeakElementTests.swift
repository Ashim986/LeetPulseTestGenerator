import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindPeakElement {
    private class Solution {
        func findPeakElement(_ nums: [Int]) -> Int {
            var l = 0, r = nums.count - 1
            while l < r {
                let m = l + (r - l) / 2
                if nums[m] < nums[m + 1] { l = m + 1 }
                else { r = m }
            }
            return l
        }
    }

    @Suite struct FindPeakElementTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e98582a4-fee6-446a-851b-7f375f3e554f",
             input: "nums = [5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "18cf6843-af04-4b7f-a2b0-8b2d0bc478fc",
             input: "nums = [1,2,3,4,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "012ff37c-e5de-4c1b-8798-634729a70205",
             input: "nums = [1,3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "49e9da1d-7729-476d-9b01-cb41e6b75304",
             input: "nums = [1,2,1,3,5,6,4]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "0499fec4-8bd4-4ec2-89fd-7a9d389dda6e",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d93ed24a-95b2-43c8-97db-addd5aa7510c",
             input: "nums = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c8c6680f-2ca3-4486-b78c-2120e0d20c80",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "75644241-bdab-4c3a-aa69-95d399552c40",
             input: "nums = [10,20,30,40,50]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "fa71ea6f-d010-4ba1-99b4-8d192c49046d",
             input: "nums = [5,5,5,5,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "47776372-502b-4ac0-b9e5-a275a332e03f",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "117743d0-87a5-44f1-83d0-24b71faa0dce",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "27dd9cad-ea26-4452-956a-fe528dfe494b",
             input: "nums = [1,3,5,7,9]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "941d8907-b950-41dd-988b-27508e36ad9f",
             input: "nums = [9,7,5,3,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cf10c8c5-6aba-4265-8500-86d34d57b747",
             input: "nums = [5,5,5,5,5,5,5,5,5,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "be252f13-6106-453e-b9a9-fb78474f51fa",
             input: "nums = [0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "63473056-b86a-4dd5-8617-bb39640e077a",
             input: "nums = [0,0,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "84262a7b-43e1-4d7d-b718-bcde294d463a",
             input: "nums = [1,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2c95314e-c0e6-4ff5-864c-872768a3b402",
             input: "nums = [0,0,0,0,0,1,0,0,0,0]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5162aedf-51f6-4321-9ec0-c7075d7495d6",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0d9c45b3-5eaa-4d98-8919-69b9b1dee836",
             input: "nums = [10,10,10,10,10,10,10,10,10,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "86ecc971-25af-467d-be1a-2813afc83479",
             input: "nums = [0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "52966ca8-406c-46a0-a6ab-df6fa8bc431a",
             input: "nums = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "09cb56b8-14a9-4c33-bf20-42c7bb0599d2",
             input: "nums = [100,99,98,97,96,95,94,93,92,91]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e4404066-a6a5-44a3-be23-0225456d0b49",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "b1ba84a6-4890-4afd-9cd2-3af8d8d7bc44",
             input: "nums = [5000,4000,3000,2000,1000]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-peak-element"
            let topic = "binary-search"
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
            guard p_nums.count >= 1 && p_nums.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 1000"
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
            let result = solution.findPeakElement(p_nums)
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
