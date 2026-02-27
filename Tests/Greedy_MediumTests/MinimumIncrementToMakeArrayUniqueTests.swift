import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumIncrementToMakeArrayUnique {
    private class Solution {
        func minIncrementForUnique(_ A: [Int]) -> Int {
            let sorted = A.sorted()
            var maxSeen = -1
            var result = 0
            for num in sorted {
                if num <= maxSeen {
                    let increment = maxSeen - num + 1
                    result += increment
                    maxSeen += 1
                } else {
                    maxSeen = num
                }
            }
            return result
        }
    }

    @Suite struct MinimumIncrementToMakeArrayUniqueTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2f6ed777-918e-43fe-bdc1-38955e1ff6db",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ac8fecc3-37cc-4bed-8dd9-49f7a4c6fc2d",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9875e761-3059-4fa4-844f-02e4c94db1b6",
             input: "nums = [1, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "59bc4d8f-3d19-4405-8310-65c953b8d6e9",
             input: "nums = [1, 2, 3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "72449219-4ed0-4208-b1f6-5d075b876f4c",
             input: "nums = [3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "29f09fde-9388-4d5e-ba1e-f493cf060232",
             input: "nums = [-1, 0, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4e1b32a5-69e8-4f01-aee7-1914641a07a8",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e69e1951-cfc3-4e51-a1da-40a9c8adb184",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "10cf3fe2-7979-4afb-8395-715ddaa307be",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "49594051-d3a9-41fc-b4f4-91bd7fff9ed2",
             input: "nums = [20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8ad39837-b47b-4133-859d-66a9a81255a2",
             input: "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "190", orderMatters: true),
            TestCaseData(id: "10ccf164-55cc-4136-9070-dbdc8031013b",
             input: "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8ed6ed2b-7894-43f2-b1cd-fcdb14a58bf8",
             input: "nums = [39, 37, 35, 33, 31, 29, 27, 25, 23, 21, 19, 17, 15, 13, 11, 9, 7, 5, 3, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f02f8304-2e14-48c6-979c-56b33e080e7f",
             input: "nums = [1, 1, 3, 3, 5, 5, 7, 7, 9, 9, 11, 11, 13, 13, 15, 15, 17, 17, 19, 19]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "2846476f-8496-4e5e-9890-26f6a845e55d",
             input: "nums = [-1, -3, -5, -7, -9, -11, -13, -15, -17, -19, -21, -23, -25, -27, -29, -31, -33, -35, -37, -39]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0bb09239-2706-423c-9201-f7b165e5f5ac",
             input: "nums = [-39, -37, -35, -33, -31, -29, -27, -25, -23, -21, -19, -17, -15, -13, -11, -9, -7, -5, -3, -1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a352eec9-ed83-4f0b-a26c-3f687abbf8df",
             input: "nums = [-1, -1, -3, -3, -5, -5, -7, -7, -9, -9, -11, -11, -13, -13, -15, -15, -17, -17, -19, -19]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "3b22375d-5c71-4df6-a4b1-8169a610b1ba",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cb99de9e-ad5a-400a-8f98-68b2487c6d64",
             input: "nums = [-1, -2, -3, -4, -5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7e9554ec-65b7-4af4-9681-092f24795051",
             input: "nums = [1, 1, 1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6132a28b-30dd-40ab-a4bb-20f0b10a806b",
             input: "nums = [-1, -1, -1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1e9e708c-4e8f-4b9c-a624-9028cce4f666",
             input: "nums = [1000, 1000, 1000]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9cd6801e-b55d-4cd0-b407-15fc94158f21",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "49883a1d-ec7a-4cfa-af3f-81e17a7df5d4",
             input: "nums = [1, 2, 2, 3, 3, 3]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "6f9b8bf8-7bf2-468a-b132-cf0ca1b37d01",
             input: "nums = [1, 1, 1, 1, 1, 1, 1]",
             expected: "21", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-increment-to-make-array-unique"
            let topic = "greedy"
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

            guard let p_A = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.count >= 1 && p_A.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }
            guard p_A.allSatisfy({ $0 >= 0 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.minIncrementForUnique(p_A)
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
