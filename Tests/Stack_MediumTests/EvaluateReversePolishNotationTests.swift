import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCEvaluateReversePolishNotation {
    private class Solution {
        func evalRPN(_ tokens: [String]) -> Int {
            var stack: [Int] = []

            for token in tokens {
                switch token {
                case "+":
                    let b = stack.removeLast(), a = stack.removeLast()
                    stack.append(a + b)
                case "-":
                    let b = stack.removeLast(), a = stack.removeLast()
                    stack.append(a - b)
                case "*":
                    let b = stack.removeLast(), a = stack.removeLast()
                    stack.append(a * b)
                case "/":
                    let b = stack.removeLast(), a = stack.removeLast()
                    stack.append(a / b)
                default:
                    stack.append(Int(token).unsafelyUnwrapped)
                }
            }

            return stack[0]
        }
    }

    @Suite struct EvaluateReversePolishNotationTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5D0D5436-E330-4984-8C57-35C9B878190B",
             input: "2\n1\n+\n3\n*",
             expected: "9", orderMatters: true),
            TestCaseData(id: "F2102180-77FF-48ED-AA88-89659FB66951",
             input: "4\n13\n5\n/\n+",
             expected: "6", orderMatters: true),
            TestCaseData(id: "40319198-8B10-41C9-B5CC-2BDD0F5C3062",
             input: "2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5EE2CE51-F12E-4982-AF28-61767B21C9F0",
             input: "2\n1\n+",
             expected: "3", orderMatters: true),
            TestCaseData(id: "AF221B3F-6175-4549-8234-2C18381742D9",
             input: "2\n1\n-",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9651E2E4-5C1C-4DDE-8E1E-4E771554C8CC",
             input: "2\n1\n*",
             expected: "2", orderMatters: true),
            TestCaseData(id: "AE7F85A9-E6E0-406D-9EEC-FC259161F1C0",
             input: "-2\n1\n+",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "897E6C45-1B22-4801-BBE7-42EAEF576772",
             input: "-2\n1\n-",
             expected: "-3", orderMatters: true),
            TestCaseData(id: "5E30030B-5B3C-45F2-ABE8-364609AB687B",
             input: "-2\n1\n*",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "84F5CACA-93A1-42EA-906B-B743F1F5EC39",
             input: "-2\n1\n/",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "A2A45757-E25D-4E73-AC48-6BD3AE1A28FF",
             input: "2\n-1\n+",
             expected: "1", orderMatters: true),
            TestCaseData(id: "CE883A1C-16A5-451F-AADB-0A2BAFAB88E5",
             input: "2\n-1\n-",
             expected: "3", orderMatters: true),
            TestCaseData(id: "C0E74C35-8A4F-463C-B973-175E74010783",
             input: "2\n-1\n*",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "F04B6D11-5001-46C9-9CDD-9ECE7C601BC0",
             input: "2\n-1\n/",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "D6AF7EDB-0D89-4F8F-8A84-D9D2C978671B",
             input: "0\n1\n+",
             expected: "1", orderMatters: true),
            TestCaseData(id: "EAC20B40-1E86-4E60-B194-84B529397079",
             input: "0\n1\n-",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "0C52F0E9-9A60-4290-AEB7-2F21DD15C23C",
             input: "0\n1\n*",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8F5EB12C-46EE-404C-9DDB-382A14F3D87A",
             input: "0\n1\n/",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2EA1EE76-7F67-4E1F-BB4C-76FE5DF5E800",
             input: "2\n0\n+",
             expected: "2", orderMatters: true),
            TestCaseData(id: "A5BB03B8-A6AB-44E9-A024-E12A418A5963",
             input: "2\n0\n-",
             expected: "2", orderMatters: true),
            TestCaseData(id: "B484AD5D-87C5-42C3-B32D-A64AEFC7A2B3",
             input: "2\n0\n*",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1DA9B59A-2E5B-42B0-9C3A-A15C40977230",
             input: "10\n2\n/",
             expected: "5", orderMatters: true),
            TestCaseData(id: "3E9DA495-C50C-4B77-8FFF-1756DC5A57CB",
             input: "10\n2\n+",
             expected: "12", orderMatters: true),
            TestCaseData(id: "C51ED849-C1D7-49A7-89DA-89BFCE5512A9",
             input: "10\n2\n-",
             expected: "8", orderMatters: true),
            TestCaseData(id: "695D9ECD-7795-41E0-9330-3404B5F5D1C9",
             input: "10\n2\n*",
             expected: "20", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "evaluate-reverse-polish-notation"
            let topic = "stack"
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

            guard let p_tokens = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_tokens.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: tokens array too large (\(p_tokens.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_tokens.count >= 1 && p_tokens.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= tokens.length <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.evalRPN(p_tokens)
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
