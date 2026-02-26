import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBulbSwitcherIi {
    private class Solution {
        func flipLights(n: Int, presses: Int) -> Int {
            if n == 0 || presses == 0 {
                return 1
            }
            if n == 1 {
                return 2
            }
            if n == 2 {
                return presses == 1 ? 3 : 4
            }
            let masks: [Int] = [0b11111111, 0b10101010, 0b11001100, 0b10010010]
            var result: Set<Int> = []
            for i in 0...15 {
                var cur = (1 << n) - 1
                for _ in 0...presses {
                    cur = cur ^ masks[i % 4]
                }
                result.insert(cur)
            }
            return result.count
        }
    }

    @Suite struct BulbSwitcherIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c726acde-025a-4d20-bd62-37346c62c479",
             input: "n = 0, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "eabe8996-84c4-4ab4-9105-1288d7a9535a",
             input: "n = 1, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a0a58830-fdb0-4da3-bda6-fde19aaaee15",
             input: "n = 2, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "44a5fde4-89a0-4d6c-9852-95e3b1315237",
             input: "n = 3, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a2dad8c9-835f-4da4-83ba-e0be80b33fd8",
             input: "n = 4, presses = 1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "feb8db85-354b-48ad-8eb8-c0591b1cb16a",
             input: "n = 5, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d3b8ebb8-486d-4fce-9652-b25775a88b31",
             input: "n = 6, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "50ec86aa-94fc-49a6-9fcb-315489640efc",
             input: "n = 7, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "10a325a1-188b-4bed-a3f2-94cf3b95ec61",
             input: "n = 8, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3ab47040-3791-4c09-b844-2d2298095e4f",
             input: "n = 9, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2cca9d96-ba9c-4f20-86b2-6f2bff408ce3",
             input: "n = 10, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "284a681e-f37c-4848-8c23-b1fae004ff5d",
             input: "n = 11, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dbcdd770-eb39-4b8c-873b-e786b18fc346",
             input: "n = 12, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f789841c-980a-414b-a488-b0721ed70e88",
             input: "n = 13, presses = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "11fe82bc-15e0-4132-9ff1-052c7897143f",
             input: "n = 1, presses = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "60a0c7da-83b1-4090-b0e4-35f75f70fd70",
             input: "n = 2, presses = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f33e51d3-d828-434b-9795-d0626ad08e95",
             input: "n = 3, presses = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9ced13db-9dd4-46bb-83c2-f153478c11dd",
             input: "n = 4, presses = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "97b8d1a4-7058-483d-b292-b034fc30313a",
             input: "n = 5, presses = 1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ebff3fa1-a301-41d5-9198-0dd8268f8240",
             input: "n = 5, presses = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5fa1738a-017f-401f-a64c-8d6712d194e1",
             input: "n = 6, presses = 1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2cd2a11e-3697-42ff-ae39-002fb8044978",
             input: "n = 6, presses = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e9f9e8d1-bc90-4bf5-834b-19af83325e07",
             input: "n = 7, presses = 1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "03e2d25a-12c1-4ee7-8091-bccf84750630",
             input: "n = 7, presses = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d3912ff8-8ea8-43dd-abf6-a0b516f00f36",
             input: "n = 8, presses = 1",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "bulb-switcher-ii"
            let topic = "math-geometry"
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
            guard let p_presses = InputParser.parseInt(params[1]) else {
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
            guard p_n >= 1 && p_n <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 1000"
                )
                return
            }
            guard p_presses >= 0 && p_presses <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= presses <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.flipLights(n: p_n, presses: p_presses)
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
