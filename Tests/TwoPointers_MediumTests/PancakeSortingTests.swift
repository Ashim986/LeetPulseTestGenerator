import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPancakeSorting {
    private class Solution {
        func pancakeSort(_ A: [Int]) -> [Int] {
            var ans: [Int] = []
            var A = A
            for size in stride(from: A.count, to: 0, by: -1) {
                if let maxIndex = A.firstIndex(of: size) {
                    if maxIndex != size - 1 {
                        if maxIndex != 0 {
                            ans.append(maxIndex + 1)
                            A = A.prefix(maxIndex + 1).reversed() + A.dropFirst(maxIndex + 1)
                        }
                        ans.append(size)
                        A = A.prefix(size).reversed() + A.dropFirst(size)
                    }
                }
            }
            return ans
        }
    }

    @Suite struct PancakeSortingTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c9f0381a-7223-4cd1-aa69-5771324ca5ab",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "a29ccace-20a3-45a1-bf6f-944a5df5bdf1",
             input: "nums = [1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "8112ae5e-74e8-46e1-a3c2-31a388da93f4",
             input: "nums = [1, 2]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "ce77d5da-4eb2-4eff-8fc8-5058f15c7711",
             input: "nums = [2, 1]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "423799ba-5b67-4423-86fc-f5ac117cdc1a",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "31002720-6226-46e0-9e7c-70e7c11682dd",
             input: "nums = [1, 1, 1, 1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "4f895334-00fc-413c-aa37-e79a64957977",
             input: "nums = [1000, 999, 998, 997, 996]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "11d4267b-ce04-4f3b-9204-222dea9ca9fe",
             input: "nums = [0, 0, 0, 0, 0]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "c6b9d20d-a9a5-4bfc-99b9-4fa69f392c35",
             input: "nums = [10, 10, 10, 10, 10]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "91db85da-bd23-4eb0-b584-eddb555c6848",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "dfd969d0-ea1d-4e6a-ad4b-a16e35fcf1fb",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "80da7923-02c5-4828-bf14-b6504f7c06f5",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "ca2f923d-2b0c-4d4b-8b51-a856396a0220",
             input: "nums = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "3e625ea0-f84d-4a52-b2f0-0380c7406983",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "504c8360-9777-4443-95a0-1a743af56f85",
             input: "nums = [3, 2, 1]",
             expected: "[3]", orderMatters: true),
            TestCaseData(id: "5a81746a-eb46-4298-a160-15ea8865d86e",
             input: "nums = [5, 4, 3, 2, 1]",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "c9cf8fe6-1c5a-4a9c-bc9b-a7be3148b07a",
             input: "nums = [1, 2, 2, 1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "38570071-3ba5-4c98-a3ec-8798a727418e",
             input: "nums = [-1, -2, -3]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "5e5e9717-787e-4604-b8c8-083a0948b81b",
             input: "nums = [1, -2, 3, -4, 5]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "88459c62-f118-429f-90a6-d54df66309ec",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "[10]", orderMatters: true),
            TestCaseData(id: "8cf9b841-2dbc-4f13-abba-e51d3a0c704b",
             input: "nums = [1, 1000, 1, 1000, 1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "26331ec5-ebfc-46ef-99c9-ecca88737b81",
             input: "nums = [-1000, -999, -998, -997, -996]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "34eb0e59-3054-4355-a74a-16fb3b08da95",
             input: "nums = [1, -1, 1, -1, 1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "20924463-28df-4cf1-85ef-7cc1299f3108",
             input: "nums = [1, 0, 1, 0, 1]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "161461d7-7736-4bc0-b9b2-284b1d6f1ebc",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "[10]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "pancake-sorting"
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
            guard p_A.count >= 1 && p_A.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= arr.length <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.pancakeSort(p_A)
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
