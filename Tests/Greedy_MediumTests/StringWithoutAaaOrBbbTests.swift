import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCStringWithoutAaaOrBbb {
    private class Solution {
        func strWithout3a3b(_ A: Int, _ B: Int) -> String {
            var res = String()
            var a = A
            var b = B
            while a > 0 || b > 0 {
                if res.count >= 2, res.last == res[res.index(before: res.index(before: res.endIndex))] {
                    if res.last == "A" {
                        if b > 0 {
                            res += "B"
                            b -= 1
                        }
                        else {
                            res += "A"
                            a -= 1
                        }
                    }
                    else {
                        if a > 0 {
                            res += "A"
                            a -= 1
                        }
                        else {
                            res += "B"
                            b -= 1
                        }
                    }
                }
                else {
                    if a >= b {
                        if a > 0 {
                            res += "A"
                            a -= 1
                        }
                    }
                    else {
                        if b > 0 {
                            res += "B"
                            b -= 1
                        }
                    }
                }
            }
            return res
        }
    }

    @Suite struct StringWithoutAaaOrBbbTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5e8664f1-3488-4338-a8bb-53158efea250",
             input: "A = 1, B = 0",
             expected: "A", orderMatters: true),
            TestCaseData(id: "24904fc8-494c-437c-8b80-fd0dc353bd7b",
             input: "A = 0, B = 1",
             expected: "B", orderMatters: true),
            TestCaseData(id: "282c4be6-2d0a-4687-a3bc-21d511739bde",
             input: "A = 2, B = 0",
             expected: "AB", orderMatters: true),
            TestCaseData(id: "7c717f5e-d0f4-4b1b-a0df-c46bc2a9fbfe",
             input: "A = 0, B = 2",
             expected: "BA", orderMatters: true),
            TestCaseData(id: "19246e17-2697-461e-8e68-d46eaa823877",
             input: "A = 3, B = 0",
             expected: "ABA", orderMatters: true),
            TestCaseData(id: "7387b88b-152e-47a6-b435-faac9ed8405e",
             input: "A = 0, B = 3",
             expected: "BAB", orderMatters: true),
            TestCaseData(id: "1b0223aa-0959-4bc0-991f-331b0c1be952",
             input: "A = 1, B = 1",
             expected: "BA", orderMatters: true),
            TestCaseData(id: "2ef3a11e-d7d4-4f89-b960-19b282d85c57",
             input: "A = 3, B = 3",
             expected: "BAABBA", orderMatters: true),
            TestCaseData(id: "39c12a42-a61a-4b98-8112-c3c0f51546fc",
             input: "A = 4, B = 4",
             expected: "BAABBAAB", orderMatters: true),
            TestCaseData(id: "36ed2fe4-aa01-4944-a3a1-d5f70bb27ce8",
             input: "A = 5, B = 5",
             expected: "BAABBAABBA", orderMatters: true),
            TestCaseData(id: "9a39c186-e92e-4576-94c0-4a6481a67d0f",
             input: "A = 0, B = 5",
             expected: "BBABA", orderMatters: true),
            TestCaseData(id: "395b7167-2a35-4f4d-a9df-a784bedbf3e3",
             input: "A = 4, B = 0",
             expected: "AABA", orderMatters: true),
            TestCaseData(id: "10f25ed9-f0f2-4dbc-ba4c-69aa194254b7",
             input: "A = 3, B = 1",
             expected: "AABB", orderMatters: true),
            TestCaseData(id: "1de0ad97-578a-4655-b16d-de961d5cfaf0",
             input: "A = 5, B = 3",
             expected: "AABBAABB", orderMatters: true),
            TestCaseData(id: "b39230b3-cca6-4664-a88e-11c3b1b56790",
             input: "a = 1, b = 2",
             expected: "\"abb\"", orderMatters: true),
            TestCaseData(id: "85ef19f3-e7a6-4ae6-9f13-16d808f624c4",
             input: "a = 4, b = 1",
             expected: "\"aabaa\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "string-without-aaa-or-bbb"
            let topic = "greedy"
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

            guard let p_A = InputParser.parseInt(params[0]) else {
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
            guard let p_B = InputParser.parseInt(params[1]) else {
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
            guard p_A >= 0 && p_A <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= a, b <= 100"
                )
                return
            }
            guard p_B >= 0 && p_B <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= a, b <= 100"
                )
                return
            }

            let solution = Solution()
            let result = solution.strWithout3a3b(p_A, p_B)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
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
