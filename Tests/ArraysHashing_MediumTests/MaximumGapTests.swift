import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumGap {
    private class Solution {
        func maximumGap(_ nums: [Int]) -> Int {
            guard nums.count > 1 else { return 0 }

            let minNum = nums.min().unsafelyUnwrapped
            let maxNum = nums.max().unsafelyUnwrapped

            if minNum == maxNum {
                return 0
            }

            let bucketSize = max(1, (maxNum - minNum) / (nums.count - 1))
            let bucketCount = (maxNum - minNum) / bucketSize + 1

            var buckets: [[Int]] = Array(repeating: [], count: bucketCount)

            for num in nums {
                let bucketIndex = (num - minNum) / bucketSize
                buckets[bucketIndex].append(num)
            }

            var maxGap = 0
            var prevMax = minNum

            for i in 0...bucketCount - 1 {
                if !buckets[i].isEmpty {
                    if i > 0 {
                        maxGap = max(maxGap, buckets[i].first.unsafelyUnwrapped - prevMax)
                    }
                    prevMax = buckets[i].max().unsafelyUnwrapped
                }
            }

            return maxGap
        }
    }

    @Suite struct MaximumGapTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b913ffcf-4c42-4ddd-aec2-35627a20ea94",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1a77eaf9-f872-4049-b48c-5c4505075e4d",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "376085a0-f7a7-4e7d-94a9-015a3df630cc",
             input: "nums = [1, 2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "707702af-9604-4a9f-8c20-d02726990bd5",
             input: "nums = [2, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3bb4ee9e-adf6-4451-9248-cd6f8b5a8c40",
             input: "nums = [1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0561ec16-9e9d-4537-8e82-921e87d36754",
             input: "nums = [1, 2, 2, 3, 3, 3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e7a80a88-c98a-4140-9e26-4e007131fe80",
             input: "nums = [-1, 0, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "25af5a64-770f-4ff2-81f3-817dc22c08cb",
             input: "nums = [-10, -5, 0, 5, 10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "940f5dcf-5628-476b-88fe-88e092c96124",
             input: "nums = [1000, 2000, 3000]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "2d67e5a8-fbb5-43a2-886a-0959a42d9285",
             input: "nums = [1, 1000, 2000, 3000]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "1efd9abc-5314-4d17-8da7-01b0c8946f47",
             input: "nums = [1000, 1, 2000, 3000]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "18689517-da01-4079-8b3c-57b1869409e8",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e98899d1-b974-41ec-b3a4-e5af80096d19",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "84fc63e6-c3c6-48db-8c85-63666a128139",
             input: "nums = [1, 3, 5, 7, 9]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "78b42457-3d06-4b27-b520-0ce64505ad6e",
             input: "nums = [9, 7, 5, 3, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "92bb4a34-ea09-4441-b036-08cdefbd4ab4",
             input: "nums = [100, 200, 300, 400, 500]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "12b5c3cb-f841-4d0c-963a-25a50efcbc2d",
             input: "nums = [500, 400, 300, 200, 100]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "786dbc0a-de0e-42eb-a570-fd9b5ac10fd4",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c596df01-22c7-48a9-b88a-d47e25cb7a63",
             input: "nums = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3cee200a-c5f6-4533-a83d-4880d72a35de",
             input: "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "81f13e3f-1919-4719-893b-f83732941b2a",
             input: "nums = [10000, 20000, 30000, 40000, 50000]",
             expected: "10000", orderMatters: true),
            TestCaseData(id: "065bb5e3-f800-43dd-91d7-dedae0890956",
             input: "nums = [50000, 40000, 30000, 20000, 10000]",
             expected: "10000", orderMatters: true),
            TestCaseData(id: "424e799a-90b6-4858-b6eb-cae7bac0b71d",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100]",
             expected: "90", orderMatters: true),
            TestCaseData(id: "d9d9f800-5d7a-477d-b704-45f463706405",
             input: "nums = [100, 10, 1]",
             expected: "90", orderMatters: true),
            TestCaseData(id: "7d4647f9-f981-488f-9912-60e48d319e20",
             input: "nums = [1, 10, 100]",
             expected: "90", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-gap"
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
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 1000000000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 10^9"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maximumGap(p_nums)
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
