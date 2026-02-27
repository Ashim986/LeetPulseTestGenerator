import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCArrayNesting {
    private class Solution {
        func arrayNesting(_ nums: [Int]) -> Int {
            var maxLen = 0
            var visited: Set<Int> = Set()
            var n = nums.count

            for i in 0..<n {
                if !visited.contains(i) {
                    var len = 0
                    var j = i
                    while !visited.contains(j) {
                        visited.insert(j)
                        len += 1
                        j = nums[j]
                    }
                    maxLen = max(maxLen, len)
                }
            }

            return maxLen
        }
    }

    @Suite struct ArrayNestingTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "366efd41-fc99-4077-b6f5-978f1f438457",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c38ddeb5-f063-4388-a234-23e3634a0ede",
             input: "nums = [0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "eb306782-c600-4a79-8f63-76a0455fb93f",
             input: "nums = [1, 0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6f59b601-b1e0-475c-8405-b9ca503e31be",
             input: "nums = [5, 4, 0, 3, 1, 6, 2, 7, 8, 9]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "733ef63e-cd5c-4858-8b7e-73801c3a81a1",
             input: "nums = [5, 4, 0, 3, 1, 6, 2, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "3b439314-f344-4cd0-8acf-1b3ad53b4566",
             input: "nums = [-1,0,-2,-3,-4,-5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "49787633-6fb3-4465-8081-5d22332b5e59",
             input: "nums = [0, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1fa98e99-37c2-4bb1-ba5f-3c557cb4fd89",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7b9b7d66-1d74-47f7-9e5b-923e027cd1b0",
             input: "nums = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "60a44b9c-1143-4214-b4b8-5455bb1336a9",
             input: "nums = [0, -1, 1, 2, 3, 4, 5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "17ffa432-2611-46d5-8ca3-23ba10e929a9",
             input: "nums = [1000, 999, 998, 997, 996, 995, 994, 993, 992, 991]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9be42507-14e8-4bee-9000-5dcd04cf1baf",
             input: "nums = [1000, 0, 999, 1, 998, 2, 997, 3, 996, 4]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f78da9a1-2db2-4c82-b32e-93a27f2cefb5",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "26b792be-717d-4153-bab9-3d8eb00809dc",
             input: "nums = [19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2a2ae7bf-687a-4109-a891-57cb73463f18",
             input: "nums = [5,4,0,3,1,6,2]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "b5829034-a11c-40b0-8c5b-03c6c7f7435d",
             input: "nums = [0,1,2]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "array-nesting"
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
                    errorMessage: "Constraint violation: 1 <= nums.length <= 10^5"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.arrayNesting(p_nums)
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
