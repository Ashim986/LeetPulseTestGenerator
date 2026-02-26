import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBulbSwitcher {
    private class Solution {
        func bulbSwitch(_ n: Int) -> Int {
            return Int(sqrt(Double(n)))
        }
    }

    @Suite struct BulbSwitcherTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c993e037-92a0-4a79-98ad-f99fd9acde63",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "53db3314-7228-48a5-a852-171b8710e4a8",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "94e4a8b0-ad12-46ab-99b0-9bc7de86a3a1",
             input: "n = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "02dd9bb0-6096-43cf-aa87-e0b1f0fa8f86",
             input: "n = 5",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1b1c96e4-e25f-462b-8c6d-adc2e30632f9",
             input: "n = 6",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4b8c0e76-b563-432a-92d0-0f70dcb90ac5",
             input: "n = 7",
             expected: "2", orderMatters: true),
            TestCaseData(id: "fa133e57-efb7-44bd-a636-639f253c1a09",
             input: "n = 8",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ecfbf9d9-39c0-463f-93c1-e42a24d49ff8",
             input: "n = 9",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e4ffc034-3a45-4872-bc29-6367caf4ddcc",
             input: "n = 10",
             expected: "3", orderMatters: true),
            TestCaseData(id: "cb0952c4-de5f-4884-9472-1d3e83ff22f9",
             input: "n = 11",
             expected: "3", orderMatters: true),
            TestCaseData(id: "570489f8-4c9e-4c67-89b8-0a049b01fb1c",
             input: "n = 12",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ea07b14f-74c9-4a4d-8c51-d0f0add828ac",
             input: "n = 13",
             expected: "3", orderMatters: true),
            TestCaseData(id: "473086c3-f554-43b1-a2b9-8d49b22eaf5c",
             input: "n = 14",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a8f3cbf2-ac2d-4add-99d6-6b6b849f6545",
             input: "n = 15",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6c3fc62d-c93c-4bcd-a3e6-a4c3ea6f38c0",
             input: "n = 16",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ac04e52d-dad7-4b95-8fec-e2929f30a1da",
             input: "n = 17",
             expected: "4", orderMatters: true),
            TestCaseData(id: "e35a4878-f8ab-4646-b82c-6959853509bd",
             input: "n = 18",
             expected: "4", orderMatters: true),
            TestCaseData(id: "20265c12-3083-4386-ae71-dbaf8b1327bc",
             input: "n = 19",
             expected: "4", orderMatters: true),
            TestCaseData(id: "21c4e4be-ccb1-4966-8a1f-c211fea21c52",
             input: "n = 20",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2738e372-1708-4f34-8a2c-8b16bb46b896",
             input: "n = 21",
             expected: "4", orderMatters: true),
            TestCaseData(id: "6d4b31bf-cfc8-415c-95f6-38db5034dac2",
             input: "n = 22",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2b2dd76e-46f9-49d7-ae66-9d28bcdf1bcd",
             input: "n = 23",
             expected: "4", orderMatters: true),
            TestCaseData(id: "7d843158-9d8e-4e49-b64d-7edcea4037db",
             input: "n = 24",
             expected: "4", orderMatters: true),
            TestCaseData(id: "34af0935-71ac-40e8-a03b-557423be407f",
             input: "n = 25",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e563698c-60b2-4b23-9224-e8006fa27f1a",
             input: "n = 26",
             expected: "5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "bulb-switcher"
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
            guard p_n >= 0 && p_n <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= n <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.bulbSwitch(p_n)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
