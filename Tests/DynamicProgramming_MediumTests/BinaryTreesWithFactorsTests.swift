import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryTreesWithFactors {
    private class Solution {
        func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
            let arr = arr.sorted()
            let n = arr.count
            var memo: [Int: Int] = [:]
            let mod = 1000000007
            for i in 0..<n {
                memo[arr[i]] = 1
            }
            var result: Int64 = 0
            for i in 0..<n {
                for j in 0..<i {
                    if arr[i] % arr[j] == 0 {
                        let other = arr[i] / arr[j]
                        if arr.contains(other) {
                            let val = Int64(memo[arr[j]].unsafelyUnwrapped) * Int64(memo[other].unsafelyUnwrapped)
                            if arr[j] == other {
                                memo[arr[i]] = (memo[arr[i]].unsafelyUnwrapped + Int(val)) % mod
                            } else {
                                memo[arr[i]] = (memo[arr[i]].unsafelyUnwrapped + 2 * Int(val)) % mod
                            }
                        }
                    }
                }
                result = (result + Int64(memo[arr[i]].unsafelyUnwrapped)) % Int64(mod)
            }
            return Int(result)
        }
    }

    @Suite struct BinaryTreesWithFactorsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0703684a-ee6d-426d-9fa8-2c7e68a52a03",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c9ef5f07-d3f6-4346-ba39-3715591782ed",
             input: "nums = [2, 2, 2, 2, 2]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "800e98ab-67e6-482c-9983-e981ee4b1f44",
             input: "nums = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "698e954d-21aa-4a0a-b71a-0cca57a35927",
             input: "nums = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "c262b35a-45ee-4e1f-b489-edbb78f83b86",
             input: "nums = [2, 4, 8, 16]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "7d0ead00-f670-4d99-a366-43c1a8cc5a18",
             input: "nums = [2, 4, 6, 8, 10]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "d8aac093-8338-433e-958f-d6fd6d2ed9ea",
             input: "nums = [10, 20, 30, 40, 50]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b39e515c-0f20-42a5-b9ae-198cc8214992",
             input: "nums = [-1, -2, -3, -4, -5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f4416383-29b5-4c35-9142-4a21402f25f6",
             input: "nums = [100, 200, 300, 400, 500]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "88809e45-a494-4c37-800e-9d420724091c",
             input: "nums = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "edfbbb52-231f-46ca-b287-c983d4b1acc4",
             input: "nums = [2, 4, 8, 16, 32, 64]",
             expected: "129", orderMatters: true),
            TestCaseData(id: "69744dfe-ed23-44b0-93cc-da9d4a007112",
             input: "nums = [2, 6, 10, 14, 18, 22, 26, 30]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "70f90ba8-e7a0-4c9a-8f78-d32e0ea67f6c",
             input: "nums = [4, 8, 12, 16, 20, 24, 28, 32]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "05a15e95-574b-43c7-8261-28c9020312e4",
             input: "nums = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]",
             expected: "1025", orderMatters: true),
            TestCaseData(id: "5ab42ca3-6e83-4242-8d3e-c743a8928e76",
             input: "nums = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "67362ec8-5149-43f3-9c79-e1e7c556c277",
             input: "nums = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "bae36a05-77c8-4b84-83c0-30ca43130c92",
             input: "arr = [2,4]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "b8c9405a-133a-4c7c-9354-fb34db1957e0",
             input: "arr = [2,4,5,10]",
             expected: "7", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-trees-with-factors"
            let topic = "dynamic-programming"
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

            guard let p_arr = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_arr.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: arr array too large (\(p_arr.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_arr.count >= 1 && p_arr.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= arr.length <= 1000"
                )
                return
            }
            guard p_arr.allSatisfy({ $0 >= 2 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= arr[i] <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.numFactoredBinaryTrees(p_arr)
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
