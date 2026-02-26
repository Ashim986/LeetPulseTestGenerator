import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGrayCode {
    private class Solution {
        func grayCode(_ n: Int) -> [Int] {
            var result: [Int] = [0]
            for i in 1...n {
                let mask = 1 << (i - 1)
                for j in stride(from: result.count - 1, to: -1, by: -1) {
                    result.append(result[j] | mask)
                }
            }
            return result
        }
    }

    @Suite struct GrayCodeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ebe4e1b1-f492-4f64-860c-b85afc1ab153",
             input: "n = 28",
             expected: "Output too large to display", orderMatters: true),
            TestCaseData(id: "89a442ea-8f8f-44f2-acdd-a1be7a29bdfb",
             input: "n = 32",
             expected: "Output too large to display", orderMatters: true),
            TestCaseData(id: "508dcc38-6b7f-4eea-aa7f-4dddd0fc123a",
             input: "n = 35",
             expected: "Output too large to display", orderMatters: true),
            TestCaseData(id: "e5f301b0-127a-4fdc-8e5e-b0d493d15a6c",
             input: "n = 2",
             expected: "[0,1,3,2]", orderMatters: true),
            TestCaseData(id: "83d1535e-15d7-466a-9e71-c6174ab00fb1",
             input: "n = 1",
             expected: "[0,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "gray-code"
            let topic = "math-geometry"
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

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 16 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 16"
                )
                return
            }

            let solution = Solution()
            let result = solution.grayCode(p_n)
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
