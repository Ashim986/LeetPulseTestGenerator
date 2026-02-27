import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRemoveDuplicatesFromSortedArray {
    private class Solution {
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            guard nums.count > 0 else { return 0 }

            var writeIndex = 0

            for i in 1..<nums.count {
                if nums[i] != nums[writeIndex] {
                    writeIndex += 1
                    nums[writeIndex] = nums[i]
                }
            }

            return writeIndex + 1
        }
    }

    @Suite struct RemoveDuplicatesFromSortedArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "A67364A2-B99B-43B2-905B-EF6864B50E16",
             input: "[]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1A766738-17E7-420A-9D77-401F1484FF43",
             input: "[7]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "E31E8E06-14A2-471D-9785-C809674F01BA",
             input: "[1, 2, 3, 4, 5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "B8015AD9-8E69-4A75-A0AB-16AC84AF413E",
             input: "[1, 1, 1, 1, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "34674F90-47EF-49EB-9219-119C38F52834",
             input: "[1, 1, 2, 3, 3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9DA48417-5D45-4B3A-B904-DB79399689E3",
             input: "[0, 0, 1, 1, 1, 2, 2, 3, 3, 4]",
             expected: "5, nums = [0,1,2,3,4,_,_,_,_,_]", orderMatters: true),
            TestCaseData(id: "9F7F6B9A-D511-407B-BD76-3957238F975A",
             input: "[5, 5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0D8076CB-C206-4C0E-BA10-8A1AE1BB1418",
             input: "[-3, -3, -2, -1, -1, 0, 0, 0, 1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "D0656FA2-EA26-4B4C-99D8-AFBA8A90D4D9",
             input: "[100, 200, 300, 400]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2298C0F1-FA71-456E-9414-F71481600EF5",
             input: "[1, 1, 1, 2, 2, 3, 4, 4, 4, 4, 5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "66C4B777-F0C1-4A06-95AA-D29B1265DAB4",
             input: "[1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2081C1D4-447D-4785-8B54-6A0134831D3B",
             input: "[7,7,7,7,7]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "F3AE9FF0-E9C6-47CA-BD85-2D601231147B",
             input: "[1,1,2]",
             expected: "2, nums = [1,2,_]", orderMatters: true),
            TestCaseData(id: "6AD06914-7B0E-41F8-ACF6-CB03CE75D43B",
             input: "[1,1,1,2,3,4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2C893823-D0C5-4A83-B539-42415BBF3AAD",
             input: "[1,2,3,4,4,4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "EB071392-9F58-4DAE-87B1-423FC88B7711",
             input: "[1,1,2,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "F04C391E-24A7-42C4-86DC-D663152424BD",
             input: "[-3,-1,-1,0,0,0,2]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "59ED2EBB-135D-4EC7-99B1-83397AFE9926",
             input: "[100,100,200,300,300,300]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "81F0E9A3-7C36-4D4A-B6C5-586C3EBA26EF",
             input: "[5,6]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8AE3491F-058A-4CEB-98A9-6FEED6DD0289",
             input: "[1,1,2,2,3,4,5,5,5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "A7FA046B-35B7-4471-ABDA-DC91C20C5903",
             input: "[1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "897C58D0-BD2E-4367-B37A-BA97B163986B",
             input: "[1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "87AF18D0-B8DB-496A-8997-09C11D49C93F",
             input: "[-5,-5,-2,0,0,1,3,3,3]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "E0229669-F64B-4089-B5C3-B14E4D2D62AC",
             input: "[100,100,200,300,400,400,500]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "BF4B19F7-EFE1-4295-967B-0341C5E648A7",
             input: "[1,1,1,1,1,2,2,2,2]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "remove-duplicates-from-sorted-array"
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

            guard var p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as inout [Int]"
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
                    errorMessage: "Constraint violation: 1 <= nums.length <= 3 * 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -100 && $0 <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -100 <= nums[i] <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.removeDuplicates(&p_nums)
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
