import Foundation
@testable import LeetCodeHelpers
import Testing

enum LC4sum {
    private class Solution {
        func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
           let sortedNums = nums.sorted()
           var result: [[Int]] = []
           for i in 0..<sortedNums.count - 3 {
              if i > 0 && sortedNums[i] == sortedNums[i - 1] { continue }
              for j in i + 1..<sortedNums.count - 2 {
                 if j > i + 1 && sortedNums[j] == sortedNums[j - 1] { continue }
                 var left = j + 1
                 var right = sortedNums.count - 1
                 while left < right {
                    let sum = sortedNums[i] + sortedNums[j] + sortedNums[left] + sortedNums[right]
                    if sum < target {
                       left += 1
                    } else if sum > target {
                       right -= 1
                    } else {
                       result.append([sortedNums[i], sortedNums[j], sortedNums[left], sortedNums[right]])
                       while left < right && sortedNums[left] == sortedNums[left + 1] { left += 1 }
                       while left < right && sortedNums[right] == sortedNums[right - 1] { right -= 1 }
                       left += 1
                       right -= 1
                    }
                 }
              }
           }
           return result
        }
    }

    @Suite struct LC4sumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "A39A29A9-B2E4-4BAE-9773-2A56C4143B4F",
             input: "{\"nums\": [1,2,3,4,5], \"target\": 100}",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "42BEDD6D-CD30-4EA2-A89E-EFE3ED07E896",
             input: "[1, 2, 3, 4, 5], 100",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "6652F16E-40F1-4EA5-86F1-E9F7F115666D",
             input: "[2, 2, 2, 2, 2], 8",
             expected: "[[2,2,2,2]]", orderMatters: false),
            TestCaseData(id: "43F041A6-9FC4-400B-9AF2-681202EA5411",
             input: "[1, 1, 1, 1, 2, 2, 2, 3], 5",
             expected: "[[1, 1, 1, 2]]", orderMatters: false),
            TestCaseData(id: "0B37872D-E180-451A-BE89-46D2438A9289",
             input: "[1000000000, 1000000000, 1000000000, 1000000000], 4000000000",
             expected: "[[1000000000, 1000000000, 1000000000, 1000000000]]", orderMatters: false),
            TestCaseData(id: "B56394E1-C197-4F75-BAFD-AA62B776AF38",
             input: "[-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5], -10",
             expected: "[[-5, -4, -3, 2], [-5, -4, -2, 1], [-5, -4, -1, 0], [-5, -3, -2, 0], [-4, -3, -2, -1]]", orderMatters: false),
            TestCaseData(id: "4f3ea156-fe81-458f-b632-dee1419be706",
             input: "nums = [], target = 0",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "d2d6dd62-0994-4125-8329-413ae8ce63ed",
             input: "nums = [0, 1, 1, 1], target = 3",
             expected: "[[0, 1, 1, 1]]", orderMatters: false),
            TestCaseData(id: "235EE92D-2744-427F-B59F-540D20831608",
             input: "[1, 2, 3], 6",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "711CBF47-D3E4-416E-AF57-C8822120EE64",
             input: "[2, 2, 2, 2, 2], 10",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "B01C87F7-4C51-4767-BFDF-F4942B1F1572",
             input: "[-3, -2, -1, 0, 0, 1, 2, 3], 0",
             expected: "[[-2,-1,0,3],[-3,-1,1,3],[-3,0,0,3],[-3,0,1,2],[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]", orderMatters: false),
            TestCaseData(id: "e998099b-5497-4da0-9050-3958eb67dd1c",
             input: "nums = [0, -1, -1, -1], target = -3",
             expected: "[[-1,-1,-1,0]]", orderMatters: false),
            TestCaseData(id: "93cdd25b-b460-403b-80db-d6845dbd676e",
             input: "nums = [1, 1, 1, 1, 1, 1], target = 5",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "9f736b64-65f9-480c-846b-cd7e9825aa94",
             input: "nums = [1, 0, -1, 0, -2, 2], target = 1",
             expected: "[[-2,0,1,2],[-1,0,0,2]]", orderMatters: false),
            TestCaseData(id: "c410d428-964c-430e-aaf9-4747cfa9e5de",
             input: "nums = [1, 0, -1, 0, -2, 2], target = 2",
             expected: "[[-1,0,1,2]]", orderMatters: false),
            TestCaseData(id: "61d2f9a5-c197-41c9-b81a-8e3b07047d7d",
             input: "nums = [1,0,-1,0,-2,2], target = 0",
             expected: "[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "4sum"
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
            guard let p_target = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 200 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 200"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= nums[i] <= 109"
                )
                return
            }
            guard p_target >= -109 && p_target <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= target <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.fourSum(p_nums, p_target)
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

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
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
