import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumbersWithSameConsecutiveDifferences {
    private class Solution {
        func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
            if n == 1 {
                return [0,1,2,3,4,5,6,7,8,9]
            }

            var result: [Int] = []
            var queue: [[Int]] = []

            for i in 1...9 {
                queue.append([i])
            }

            while !queue.isEmpty {
                let currentNumber = queue.removeFirst()

                if currentNumber.count == n {
                    result.append(Int(currentNumber.map { String($0) }.joined()).unsafelyUnwrapped)
                } else {
                    let lastDigit = currentNumber[currentNumber.count - 1]

                    if k == 0 {
                        queue.append(currentNumber + [lastDigit])
                    } else {
                        let nextDigit = lastDigit + k
                        if nextDigit <= 9 {
                            queue.append(currentNumber + [nextDigit])
                        }

                        let prevDigit = lastDigit - k
                        if prevDigit >= 0 && prevDigit != nextDigit {
                            queue.append(currentNumber + [prevDigit])
                        }
                    }
                }
            }

            return result
        }
    }

    @Suite struct NumbersWithSameConsecutiveDifferencesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "75959478-800d-4cb0-b4f2-e31643bf98b0",
             input: "n = 3, k = 7",
             expected: "[181,292,707,818,929]", orderMatters: false),
            TestCaseData(id: "1c1b25ee-49d2-4aa7-a6af-677c4d718f19",
             input: "n = 2, k = 1",
             expected: "[10,12,21,23,32,34,43,45,54,56,65,67,76,78,87,89,98]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "numbers-with-same-consecutive-differences"
            let topic = "backtracking"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 2 && p_n <= 9 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= n <= 9"
                )
                return
            }
            guard p_k >= 0 && p_k <= 9 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= k <= 9"
                )
                return
            }

            let solution = Solution()
            let result = solution.numsSameConsecDiff(p_n, p_k)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
