import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindAllNumbersDisappearedInAnArray {
    private class Solution {
        func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
            let n = nums.count
            var nums = nums
            for i in 0..<n {
                let num = abs(nums[i])
                if num - 1 < n && nums[num - 1] > 0 {
                    nums[num - 1] = -nums[num - 1]
                }
            }
            var result: [Int] = []
            for i in 0..<n {
                if nums[i] > 0 {
                    result.append(i + 1)
                }
            }
            return result
        }
    }

    @Suite struct FindAllNumbersDisappearedInAnArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "12499D29-9E08-46CC-8342-FBCC5088FB6C",
             input: "[4,3,2,7,8,2,3,1]",
             expected: "[5,6]", orderMatters: true),
            TestCaseData(id: "A10A9172-F47A-48B3-8B36-920827156B86",
             input: "[1,1]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "B35ABAE3-5E98-421E-91BF-7F3BFB47354E",
             input: "[]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "159975E5-38F0-443F-A307-7DEF753B2C03",
             input: "[-1,-2,-3]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "07B88D51-A7F0-4A3F-B8F6-F8C3DD20E9D6",
             input: "[-5,-4,-3,-2,-1]",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "A750250C-7768-48D9-9B9A-4F071B13D7CA",
             input: "[1,2,3,4,5]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "08C2D9EE-5B38-4E42-B56F-6D9C5F0BC9C8",
             input: "[1,2,3,4,5,6,7,8,9,10]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "9AF54ECA-71BA-47F4-9D7F-8E218C3DAD63",
             input: "[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "4A03152D-D19A-4FDB-BE0A-4E4ABB230514",
             input: "[2,2,2]",
             expected: "[1,3]", orderMatters: true),
            TestCaseData(id: "E1C2B65F-FAD6-4355-9D14-6BC7CE68790E",
             input: "[2,2,2,2]",
             expected: "[1,3,4]", orderMatters: true),
            TestCaseData(id: "1463D167-A3DE-4CB9-8E59-5A3CC242C40A",
             input: "[2,2,2,2,2]",
             expected: "[1,3,4,5]", orderMatters: true),
            TestCaseData(id: "02A821EE-0C1D-4369-83EE-CA1FFF376309",
             input: "[-2,-2,-2,-2,-2]",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "495362C6-3B0E-4153-B020-1CCFCAEFC001",
             input: "[-5,-5,-5,-5,-5,-5,-5,-5,-5,-5]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "C0E5D3F3-71F6-4C67-BD48-C30DAD2F0CE5",
             input: "[0,0,0]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "A21C8535-601B-48F5-B423-ADABF8794CA8",
             input: "[1,2,3,4,5,6,7,8,9,0]",
             expected: "[10]", orderMatters: true),
            TestCaseData(id: "C68B32C5-B8B6-4B94-8456-68419038B2FD",
             input: "[-10,-20,-30,-40,-50,-60,-70,-80,-90,-100]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "e559464e-b3d3-47b6-bb61-a4adc3296f2e",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "c33904c8-f0eb-4faf-9b8e-aaf752aec399",
             input: "nums = [-1,-2,-3]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "4b22517e-91f7-49bd-afd5-86da5eee6dad",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "587ac5f8-f8d8-42d1-bfe8-d1491020253b",
             input: "nums = [1,1,1,1,1]",
             expected: "[2,3,4,5]", orderMatters: true),
            TestCaseData(id: "072D12AA-1FFD-47BB-880E-CA83FB923D3D",
             input: "[1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "B704EC3D-472B-46A7-BE32-966FF261C0DF",
             input: "[10]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "91CC0418-48F4-4C7E-89E8-8B98756ED7A0",
             input: "[1,2,2,3,3,4,5]",
             expected: "[6,7]", orderMatters: true),
            TestCaseData(id: "D416722B-5EB3-4989-AA72-A9B6D17D1297",
             input: "[10,20,30]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "F217A83F-5614-4F00-86AB-D48A9146F3DD",
             input: "[10,10,20,30]",
             expected: "[1,2,3,4]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-all-numbers-disappeared-in-an-array"
            let topic = "arrays-hashing"
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
            guard p_nums.count >= 1 && p_nums.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 10^5"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 1 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums[i] <= n"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.findDisappearedNumbers(p_nums)
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
