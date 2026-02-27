import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFindTheDuplicateNumber {
    private class Solution {
        func findDuplicate(_ nums: [Int]) -> Int {
            var lo = 1
            var hi = nums.count - 1

            while lo < hi {
                let mid = lo + (hi - lo) / 2
                let count = nums.filter { $0 <= mid }.count

                if count > mid {
                    hi = mid  // Duplicate in lower half
                } else {
                    lo = mid + 1  // Duplicate in upper half
                }
            }

            return lo
        }
    }

    @Suite struct FindTheDuplicateNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "F3504BF0-A5F7-43A8-A86E-3C14E33671CD",
             input: "[10,20,30,40,50,60,70,80,90,100,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "3429E689-080E-4296-868F-C71BBD483301",
             input: "[1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7C058CCC-CDBD-455D-8760-806BF3663CBE",
             input: "[0,1,2,3,4,0,1,2,3,4,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "D43A7B2B-AE41-4F86-BF3B-9B95FFC08D4B",
             input: "[1,3,4,2,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7654FE67-3EFD-4E32-8F98-8489B346D6A2",
             input: "[3,1,3,4,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "5EA95924-630F-45A6-A525-E7F1543A633C",
             input: "[1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "563DD992-FCAC-4922-A78E-3D7404539E9D",
             input: "[1,2,3,4,5,6,7,8,9,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "624C9877-8B6F-4355-A293-79953D42C5CC",
             input: "[1,2,3,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7AFEBC02-FE0D-41C9-ACBF-F38ABE7D1899",
             input: "[1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "CFFE7AA0-797A-48AA-A4A6-9B13F03C0B94",
             input: "[0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6ACEFB08-CD74-45A6-96D3-F655ECBC760D",
             input: "1\n3\n4\n2\n2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "484B7F03-058D-40E0-89FA-1D3FFF72B577",
             input: "3\n1\n3\n4\n2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6a67fda9-c157-4ec7-b898-b83c680d6f29",
             input: "nums = [3,3,3,3,3]",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "find-the-duplicate-number"
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
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findDuplicate(p_nums)
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
