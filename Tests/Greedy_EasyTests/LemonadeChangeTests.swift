import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLemonadeChange {
    private class Solution {
        func lemonadeChange(_ bills: [Int]) -> Bool {
            var five = 0
            var ten = 0
            for bill in bills {
                if bill == 5 {
                    five += 1
                } else if bill == 10 {
                    if five == 0 {
                        return false
                    }
                    five -= 1
                    ten += 1
                } else if bill == 20 {
                    if ten > 0 && five > 0 {
                        ten -= 1
                        five -= 1
                    } else if five >= 3 {
                        five -= 3
                    } else {
                        return false
                    }
                }
            }
            return true
        }
    }

    @Suite struct LemonadeChangeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0ce7ee35-d29d-4069-a43f-65827f885d69",
             input: "bills = [5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3e8de149-a901-4200-bb24-1d7aba6df4be",
             input: "bills = [10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "063b0fc1-2715-4e28-ae2b-0a13c4b11c7a",
             input: "bills = [5,5,5,5,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2990f067-58e7-4b87-9042-27f64cd5857c",
             input: "bills = [10,10,10,10,10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ddb402c1-5e75-41c2-8345-97aeb99d53a9",
             input: "bills = []",
             expected: "true", orderMatters: true),
            TestCaseData(id: "929b471d-c35d-4c25-b7f2-6ae621f330b1",
             input: "bills = [5,10,5,10,5,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d8a7bddb-c237-48f7-80b7-35ad1754e541",
             input: "bills = [20,20,20,20,20]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "654092d6-7eb2-4332-804e-e39f61e24bc0",
             input: "bills = [10,10,10,10,10,10,10,10,20,20,20,20]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "60fc7a08-60a0-4006-8a24-dff19efaea00",
             input: "bills = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e35de98d-9e88-4408-931a-cc6b39141a59",
             input: "bills = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9f1f5283-e020-4626-a081-2e7774cb4590",
             input: "bills = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "649cba19-bf4e-46ee-8ac2-a7e55937a37f",
             input: "bills = [5,5,5,10,5,5,10,5,5,10,5,5,10,5,5,10,5,5,10,5,5,10,5,5,10,5,5,10,5,5,10,5,5,10,5,5,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d7cc2c66-5400-4254-9169-a0c56142d7d1",
             input: "bills = [10,10,10,10,10,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "676df194-a881-4c26-9443-397087572335",
             input: "bills = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "79d10e57-1e69-4aeb-88db-a78e19aee423",
             input: "bills = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,10,10,10,10,10,10,10,10,10,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2d841d7f-0524-425c-af87-acba23e01a76",
             input: "bills = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,20,20,2"
                + "0,20,20,20,20,20,20,20]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "debecf71-003d-491f-8c7f-3fb0bc1b6869",
             input: "bills = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,10,10,10,10,10,10,10,10,10,"
                + "10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "14dc6539-acf8-4235-bb47-5f7425e4b301",
             input: "bills = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,10,10,10,10,10,10,10,10,10,"
                + "10,20,20,20,20,20,20,20,20,20,20]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0a1aa876-a16a-4db5-90e9-8fcc06a21b7d",
             input: "bills = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,20,20,2"
                + "0,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "53318c28-fed5-429b-a553-b64858301287",
             input: "bills = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,10,10,1"
                + "0,10,10,10,10,10,10,10,20,20,20,20,20,20,20,20,20,20]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "92f204f9-df70-4287-a0be-e719626459d3",
             input: "bills = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,10,10,1"
                + "0,10,10,10,10,10,10,10,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1498ed01-8b6f-44c1-b283-ec93a9f40d99",
             input: "bills = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,20,20,2"
                + "0,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "38766569-2cd9-4bc8-a09e-0f16d4ea1a44",
             input: "bills = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,10,10,1"
                + "0,10,10,10,10,10,10,10,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e3b7494b-764d-442b-ba07-338ae9043f6c",
             input: "bills = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,10,10,1"
                + "0,10,10,10,10,10,10,10,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6aabfdeb-f597-444e-a547-c4a2122787bb",
             input: "bills = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,20,20,2"
                + "0,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "lemonade-change"
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

            guard let p_bills = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_bills.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: bills array too large (\(p_bills.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_bills.count >= 1 && p_bills.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= bills.length <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.lemonadeChange(p_bills)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
