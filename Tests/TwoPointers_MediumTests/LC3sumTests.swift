import Foundation
@testable import LeetCodeHelpers
import Testing

enum LC3sum {
    private class Solution {
        func threeSum(_ nums: [Int]) -> [[Int]] {
            let nums = nums.sorted()
            var result: [[Int]] = []
            if nums.count < 3 { return result }

            for i in 0..<(nums.count - 2) {
                if i > 0 && nums[i] == nums[i - 1] { continue }
                var left = i + 1
                var right = nums.count - 1
                while left < right {
                    let sum = nums[i] + nums[left] + nums[right]
                    if sum == 0 {
                        result.append([nums[i], nums[left], nums[right]])
                        left += 1
                        right -= 1
                        while left < right && nums[left] == nums[left - 1] { left += 1 }
                        while left < right && nums[right] == nums[right + 1] { right -= 1 }
                    } else if sum < 0 {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
            return result
        }
    }

    @Suite struct LC3sumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9799078D-9FF2-42DE-AEFD-F2B53F330CEC",
             input: "[-1,0,1,2,-1,-4]",
             expected: "[[-1,-1,2],[-1,0,1]]", orderMatters: true),
            TestCaseData(id: "1D812475-0375-45E4-A509-58DB4D51BAC2",
             input: "[]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "4C449B98-117A-4D39-8DB0-D5F85DD33A11",
             input: "[0]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "07526794-2970-4AE6-9FE8-5813AE150086",
             input: "[0,0,0]",
             expected: "[[0,0,0]]", orderMatters: true),
            TestCaseData(id: "EBA37ADC-2400-4FC0-AC5C-6684AC8B56B9",
             input: "[-1,0,1]",
             expected: "[[-1,0,1]]", orderMatters: true),
            TestCaseData(id: "3DFA8E86-B7EF-482B-8529-EC25A7DD53FE",
             input: "[-2,0,1,1,2]",
             expected: "[[-2,0,2],[-2,1,1]]", orderMatters: true),
            TestCaseData(id: "C006DACA-8651-4DAD-92F1-49A0388ABDD2",
             input: "[-1,0,1,0]",
             expected: "[[-1,0,1]]", orderMatters: true),
            TestCaseData(id: "5f3a308d-c7fd-4522-8eba-7bd7ec29f2ba",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a532e4cb-347b-4cb7-89b2-e3ac59dc9e65",
             input: "nums = [0]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a8a17a08-85ab-41e6-a6b8-c927c8f52cf8",
             input: "nums = [1, 2]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "e9bfe39e-6193-4373-8da3-834935bacd16",
             input: "nums = [1, 1, 1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "786027f3-e57d-428b-bd52-f168e8bb311b",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "1c27b363-9fcc-43b3-bff9-564dd633e271",
             input: "nums = [-5, -4, -3, -2, -1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "95253589-42bb-456d-9806-ee3e293aef13",
             input: "nums = [0, 0, 0, 0, 0]",
             expected: "[[0,0,0]]", orderMatters: true),
            TestCaseData(id: "47577304-b418-45bc-8078-7873b4770e3f",
             input: "nums = [1, -1, 0]",
             expected: "[[-1,0,1]]", orderMatters: true),
            TestCaseData(id: "d1272d0d-167b-4125-bb93-a4b0e28d4554",
             input: "nums = [1, 1, -2]",
             expected: "[[-2,1,1]]", orderMatters: true),
            TestCaseData(id: "84ae64ac-6324-4a33-bbc4-f359dcb755f3",
             input: "nums = [-1, -1, 2]",
             expected: "[[-1,-1,2]]", orderMatters: true),
            TestCaseData(id: "29c9519c-6a45-44c8-8284-ffbeabf56ba4",
             input: "nums = [0, 1, 1, -2]",
             expected: "[[-2,1,1]]", orderMatters: true),
            TestCaseData(id: "6bb75b02-ddf3-4589-82d8-8969034e549a",
             input: "nums = [0, 0, 0, 1, -1]",
             expected: "[[-1,0,1],[0,0,0]]", orderMatters: true),
            TestCaseData(id: "4958422b-25f7-4443-b4e9-685d1ee33d23",
             input: "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "[[0,0,0]]", orderMatters: true),
            TestCaseData(id: "64f1b943-a89f-47af-8082-dbccc606cd94",
             input: "nums = [1, -2, 1, 0, 5]",
             expected: "[[-2, 1, 1]]", orderMatters: true),
            TestCaseData(id: "EA92985F-D5E9-49C0-9125-865DADDA970F",
             input: "[1,2,-2,-1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "003D6784-4A6E-4C62-9739-C00F1F533BEC",
             input: "[-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]",
             expected: "[[-4,-2,6],[-4,0,4],[-4,1,3],[-4,2,2],[-2,-2,4],[-2,0,2]]", orderMatters: true),
            TestCaseData(id: "A5A0A856-654D-4297-B955-FBDF068C64C0",
             input: "[-1,0,1,2,-1,-4,-2,-3,3,0,4]",
             expected: "[[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]]", orderMatters: true),
            TestCaseData(id: "DB94E37D-ED5B-43C2-8209-524CB0C1878E",
             input: "[3,0,-2,-1,1,2]",
             expected: "[[-2,0,2],[-1,0,1]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "3sum"
            let topic = "two-pointers"
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
            guard p_nums.count >= 3 && p_nums.count <= 3000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 3 <= nums.length <= 3000"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -105 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -105 <= nums[i] <= 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.threeSum(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
