import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSumOfTwoIntegers {
    private class Solution {
        func getSum(_ a: Int, _ b: Int) -> Int { return a + b }
    }

    @Suite struct SumOfTwoIntegersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "46f67a9f-f56f-493c-8f0e-bf1f05a6330e",
             input: "a = 0, b = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6bfc1ae0-d2e6-4007-84ef-a08f330ac57d",
             input: "a = 1, b = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "56371ec9-45fa-4469-ac51-0034bb88aea2",
             input: "a = -1, b = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "553b33c1-5cda-40e1-aaba-72aa809e8589",
             input: "a = -1, b = -1",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "0791a679-5e24-4265-86b0-d2666804c704",
             input: "a = 100, b = 0",
             expected: "100", orderMatters: true),
            TestCaseData(id: "b55343b9-f077-4393-b76c-f679bc836497",
             input: "a = 0, b = 100",
             expected: "100", orderMatters: true),
            TestCaseData(id: "915ae20a-c127-4b64-b1b9-a7d79d8db9f5",
             input: "a = 100, b = 100",
             expected: "200", orderMatters: true),
            TestCaseData(id: "71dbff56-49ab-4672-844c-5296584ca456",
             input: "a = -100, b = 0",
             expected: "-100", orderMatters: true),
            TestCaseData(id: "fd61566f-0696-42bc-86af-17074002ec20",
             input: "a = 0, b = -100",
             expected: "-100", orderMatters: true),
            TestCaseData(id: "45ed96c8-74c1-4cb6-8a5a-c1571fd8db35",
             input: "a = -100, b = -100",
             expected: "-200", orderMatters: true),
            TestCaseData(id: "383d0fa5-7cad-46a3-a016-885a50d8209c",
             input: "a = 1000, b = 0",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "57eb737b-cc3e-4581-a6db-7e318961b4fe",
             input: "a = 0, b = 1000",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "6e7ae374-ee66-4f01-a625-d2b65d033635",
             input: "a = 1000, b = 1000",
             expected: "2000", orderMatters: true),
            TestCaseData(id: "55cdcffe-0015-4866-bc68-e320d7dacdf8",
             input: "a = -1000, b = 0",
             expected: "-1000", orderMatters: true),
            TestCaseData(id: "17a5b680-a4a1-46ee-963e-524844e64847",
             input: "a = 0, b = -1000",
             expected: "-1000", orderMatters: true),
            TestCaseData(id: "b6bea90d-0a04-47b4-be98-d797500e0655",
             input: "a = -1000, b = -1000",
             expected: "-2000", orderMatters: true),
            TestCaseData(id: "a576d5d2-9610-4053-a37d-cd950ca31503",
             input: "a = 10, b = 20",
             expected: "30", orderMatters: true),
            TestCaseData(id: "71979cb7-eb90-48e8-a4bd-c116c0dcfc80",
             input: "a = 20, b = 10",
             expected: "30", orderMatters: true),
            TestCaseData(id: "f1800bda-5161-42d0-a919-b6eedbf35d18",
             input: "a = -10, b = 20",
             expected: "10", orderMatters: true),
            TestCaseData(id: "793602ab-9cc7-4e78-8d93-e280a409069d",
             input: "a = 20, b = -10",
             expected: "10", orderMatters: true),
            TestCaseData(id: "c5a50687-efd3-4ed3-ac13-5a0bb8910d72",
             input: "a = -10, b = -20",
             expected: "-30", orderMatters: true),
            TestCaseData(id: "59363ce3-2e28-4375-a400-b40bd27b020a",
             input: "a = -20, b = -10",
             expected: "-30", orderMatters: true),
            TestCaseData(id: "9b770cd2-1d27-4d54-8964-fc568f7924dc",
             input: "a = 10, b = -20",
             expected: "-10", orderMatters: true),
            TestCaseData(id: "2bca8a01-7f21-43e9-9c79-98ac2607e63e",
             input: "a = -20, b = 10",
             expected: "-10", orderMatters: true),
            TestCaseData(id: "4b0b168d-54f1-48e3-a93a-2dee0b946cf3",
             input: "a = 5, b = 5",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sum-of-two-integers"
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

            guard let p_a = InputParser.parseInt(params[0]) else {
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
            guard let p_b = InputParser.parseInt(params[1]) else {
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
            guard p_a >= -1000 && p_a <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= a, b <= 1000"
                )
                return
            }
            guard p_b >= -1000 && p_b <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= a, b <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.getSum(p_a, p_b)
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
