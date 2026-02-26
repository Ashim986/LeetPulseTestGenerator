import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPowXN {
    private class Solution {
        func myPow(_ x: Double, _ n: Int) -> Double {
            if n == 0 { return 1 }
            if n < 0 { return 1 / myPow(x, -n) }
            let half = myPow(x, n / 2)
            return n % 2 == 0 ? half * half : half * half * x
        }
    }

    @Suite struct PowXNTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7d32cb29-72f6-40af-9922-82a3005b8c46",
             input: "x = 2.0, n = 0",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "25da6158-263a-4b1e-bb50-de55d1283f88",
             input: "x = 2.1, n = 3",
             expected: "9.261", orderMatters: true),
            TestCaseData(id: "68c4fb34-d7d1-43c4-9ac1-cf71eb7d8751",
             input: "x = 2.0, n = 1",
             expected: "2.0", orderMatters: true),
            TestCaseData(id: "3dbabe45-f284-4137-a77a-cd65c1b91bd1",
             input: "x = 2.0, n = -1",
             expected: "0.5", orderMatters: true),
            TestCaseData(id: "8e6fff1b-3d21-4421-af10-eff0a0b1d1a9",
             input: "x = 2.0, n = -10",
             expected: "0.0009765625", orderMatters: true),
            TestCaseData(id: "4576f459-a760-4d6d-a9af-772be54c5fbe",
             input: "x = -2.0, n = 3",
             expected: "-8.0", orderMatters: true),
            TestCaseData(id: "72ec02ce-f267-4ad3-8f73-a427648c3a9a",
             input: "x = -2.0, n = -3",
             expected: "-0.125", orderMatters: true),
            TestCaseData(id: "3acd4b01-45e0-43dc-bc94-fb6586e4392f",
             input: "x = 0.0, n = 10",
             expected: "0.0", orderMatters: true),
            TestCaseData(id: "3a56a913-0639-414f-acaa-b1150772fd6f",
             input: "x = 1.0, n = 10",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "05747341-94a6-4fed-92cd-d8a5f5bcfced",
             input: "x = 1.0, n = -10",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "07994921-ccbf-4e15-8b3e-97ab58d7f560",
             input: "x = -1.0, n = 10",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "e0260d3d-99da-44e5-b07c-453bf6610445",
             input: "x = -1.0, n = -10",
             expected: "1.0", orderMatters: true),
            TestCaseData(id: "efde81b0-bead-4ceb-a1d0-9c27c2b3a7e5",
             input: "x = 2.0, n = 20",
             expected: "1048576.0", orderMatters: true),
            TestCaseData(id: "9551e7a2-d44e-4a54-8168-edce57a8ecff",
             input: "x = 10.0, n = 2",
             expected: "100.0", orderMatters: true),
            TestCaseData(id: "3698ca26-872c-4674-ab7a-54c5b9be1483",
             input: "x = 10.0, n = -2",
             expected: "0.01", orderMatters: true),
            TestCaseData(id: "a90d42cd-af15-4812-9dfd-c984eb6d67ab",
             input: "x = 0.5, n = 2",
             expected: "0.25", orderMatters: true),
            TestCaseData(id: "a7e16242-6159-4943-96d0-c0ba5bcb4ac7",
             input: "x = 0.5, n = -2",
             expected: "4.0", orderMatters: true),
            TestCaseData(id: "2a7ebb24-adcf-4637-b805-eabc0e456a59",
             input: "x = 2.0, n = 30",
             expected: "1073741824.0", orderMatters: true),
            TestCaseData(id: "ec3833ec-ce4a-4ffa-961c-58cc3b4ff848",
             input: "x = -10.0, n = 2",
             expected: "100.0", orderMatters: true),
            TestCaseData(id: "1cc35cbc-d3bc-46f3-a7e9-0a3a0421b32a",
             input: "x = -10.0, n = -2",
             expected: "0.01", orderMatters: true),
            TestCaseData(id: "8c7e6e3a-f84b-4373-b3d1-3389930bfdb1",
             input: "x = 0.1, n = 2",
             expected: "0.01", orderMatters: true),
            TestCaseData(id: "869eb562-c328-4efd-8685-933cae4d8861",
             input: "x = 0.1, n = -2",
             expected: "100.0", orderMatters: true),
            TestCaseData(id: "8f2f9da8-8bef-4fcd-b9d7-6975f7601011",
             input: "x = 2.0, n = 40",
             expected: "1099511627776.0", orderMatters: true),
            TestCaseData(id: "c65914aa-c8fb-41eb-b4b3-efe204772be6",
             input: "x = 100.0, n = 2",
             expected: "10000.0", orderMatters: true),
            TestCaseData(id: "ebd464b9-6773-44bd-a579-cfc1021bb46d",
             input: "x = 100.0, n = -2",
             expected: "0.0001", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "pow-x-n"
            let topic = "misc"
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

            guard let p_x = InputParser.parseDouble(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Double"
                )
                return
            }
            guard let p_n = InputParser.parseInt(params[1]) else {
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

            let solution = Solution()
            let result = solution.myPow(p_x, p_n)
            let computedOutput = OutputSerializer.serialize(result)

            // Float comparison: epsilon = 1e-5 per LeetCode convention (QUAL-02)
            // Treats -0 and 0 as equal; handles trailing zero normalization
            let expectedVal = Double(expectedOutput.trimmingCharacters(in: .whitespaces)) ?? Double.nan
            let matches = abs(result - expectedVal) < 1e-5
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
