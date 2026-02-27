import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRemoveElement {
    private class Solution {
        func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
            var i = 0
            for j in 0..<nums.count {
                if nums[j] != val {
                    nums[i] = nums[j]
                    i += 1
                }
            }
            return i
        }
    }

    @Suite struct RemoveElementTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "871BEF86-D758-4014-8E92-30678641F240",
             input: "nums = [], val = 0",
             expected: "0", orderMatters: false),
            TestCaseData(id: "D447BE6A-4230-4443-82D1-DE5B9CDDEE45",
             input: "nums = [1,2,3,4], val = 5",
             expected: "4", orderMatters: false),
            TestCaseData(id: "96609D42-79C8-4E05-A14B-9E17D4CB3219",
             input: "nums = [3,3,3,3], val = 3",
             expected: "0", orderMatters: false),
            TestCaseData(id: "23AAAB00-4FB5-4FF0-A876-AC9521E5A6AD",
             input: "nums = [1], val = 1",
             expected: "0", orderMatters: false),
            TestCaseData(id: "0915E23B-212E-434D-9E37-40E650AD7AD3",
             input: "nums = [1], val = 0",
             expected: "1", orderMatters: false),
            TestCaseData(id: "9B67212C-D43B-4C26-8005-3A79807FBA7F",
             input: "nums = [3,2,2,3], val = 3",
             expected: "2, nums = [2,2,_,_]", orderMatters: false),
            TestCaseData(id: "C1457DAC-2786-4200-82E9-50BAFD21494D",
             input: "nums = [0,1,2,2,3,0,4,2], val = 2",
             expected: "5, nums = [0,1,4,0,3,_,_,_]", orderMatters: false),
            TestCaseData(id: "7CD793DD-1076-4902-962D-1A1468E85B62",
             input: "nums = [1000000000, 7, 1000000000, 42], val = 1000000000",
             expected: "2", orderMatters: false),
            TestCaseData(id: "D5F0ABFC-A41E-4883-9122-EEA6FFAD1FC7",
             input: "nums = [0,1,0,3,0,5,0,7,0,9,0], val = 0",
             expected: "5", orderMatters: false),
            TestCaseData(id: "EE480AEE-FDED-4BF9-A403-6201162F0CB2",
             input: "[]:0",
             expected: "0", orderMatters: false),
            TestCaseData(id: "B1876453-C12F-41FC-8F4D-34418A50E5D7",
             input: "[3]:3",
             expected: "0", orderMatters: false),
            TestCaseData(id: "B47E3B0D-84C2-4147-A3AC-B59986A3CBD4",
             input: "[[3,2,2,3], 3]",
             expected: "2", orderMatters: false),
            TestCaseData(id: "6A617BF4-3A81-44B0-9641-127CC8CBCEC3",
             input: "[[0,0,0,0], 0]",
             expected: "0", orderMatters: false),
            TestCaseData(id: "4239D2A9-E414-4DCE-B895-7F832245C6F2",
             input: "[[1,2,3,4], 5]",
             expected: "4", orderMatters: false),
            TestCaseData(id: "3A3E740D-7C11-4349-AC14-A1AC4FBCCC43",
             input: "[[], 0]",
             expected: "0", orderMatters: false),
            TestCaseData(id: "16A0A569-27C9-4187-A8F8-6A500734D36E",
             input: "[[7], 7]",
             expected: "0", orderMatters: false),
            TestCaseData(id: "7ABFC3DF-003D-4D67-B972-6D2836141812",
             input: "[], 0",
             expected: "0", orderMatters: false),
            TestCaseData(id: "21641C06-8397-48DA-A158-4057F3EB4F99",
             input: "[1,2,3,4,5], 6",
             expected: "5", orderMatters: false),
            TestCaseData(id: "880D52FA-1BAC-4EBD-9DBB-93A334B9857C",
             input: "[3,3,3,3], 3",
             expected: "0", orderMatters: false),
            TestCaseData(id: "BF7B9CB1-B84C-40B5-B799-400261BEC8DF",
             input: "[3,2,2,3], 3",
             expected: "2, nums = [2,2,_,_]", orderMatters: false),
            TestCaseData(id: "F19C1A96-BDA6-4C76-AA1B-BF153A2197C1",
             input: "[1,2,3,3], 3",
             expected: "2", orderMatters: false),
            TestCaseData(id: "8B75469D-AD98-4738-BD03-3002D40902A2",
             input: "[1,3,2,3,4], 3",
             expected: "3", orderMatters: false),
            TestCaseData(id: "515A4407-122E-4BEB-A627-C14EC0F45C26",
             input: "{\"nums\": [], \"val\": 3}",
             expected: "0", orderMatters: false),
            TestCaseData(id: "3AF3C8DA-DA0E-4951-A0AC-F96611CED5ED",
             input: "{\"nums\": [1,2,3,4,5], \"val\": 6}",
             expected: "5", orderMatters: false),
            TestCaseData(id: "F5259DAB-EFFB-4BA3-87B1-B7870B990189",
             input: "{\"nums\": [7,7,7,7], \"val\": 7}",
             expected: "0", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "remove-element"
            let topic = "two-pointers"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            guard let p_val = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums.length <= 100"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 50 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 50"
                )
                return
            }
            guard p_val >= 0 && p_val <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= val <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.removeElement(&p_nums, p_val)
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
