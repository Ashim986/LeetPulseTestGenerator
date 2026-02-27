import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCClimbingStairs {
    private class Solution {
        func climbStairs(_ n: Int) -> Int {
            if n <= 2 { return n }
            var a = 1
            var b = 2
            for _ in 3...n {
                let c = a + b
                a = b
                b = c
            }
            return b
        }
    }

    @Suite struct ClimbingStairsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4D10D10A-626E-41F6-A68C-ACA6C5513B06",
             input: "1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "141A7111-4807-4675-ACD1-99ADC7C7720F",
             input: "2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8AAFF8E2-73AB-4551-BB42-BDF4A2010176",
             input: "3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6726E436-89CE-4299-9A90-C6DB91BDC2F3",
             input: "4",
             expected: "5", orderMatters: true),
            TestCaseData(id: "56B77CFE-4A52-4F32-A7AA-5E01F9524E21",
             input: "5",
             expected: "8", orderMatters: true),
            TestCaseData(id: "BAC96167-4BB4-4E93-8D5A-96F4F4472DA5",
             input: "6",
             expected: "13", orderMatters: true),
            TestCaseData(id: "403EF705-8D14-4752-A516-6B774AA8A176",
             input: "7",
             expected: "21", orderMatters: true),
            TestCaseData(id: "FF9F87CD-4591-4FE4-A11A-E7358CCB065D",
             input: "8",
             expected: "34", orderMatters: true),
            TestCaseData(id: "D8D4A7EF-3855-4538-A1CB-C3B9BA27823E",
             input: "44",
             expected: "1134903170", orderMatters: true),
            TestCaseData(id: "7000ec6e-49e4-4b08-bc5f-3bcea51c8040",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d3845c01-77dc-48ef-a1d0-0259f879d2b1",
             input: "n = 4",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e1966470-8a56-44af-a20d-708a5626ca65",
             input: "n = 6",
             expected: "13", orderMatters: true),
            TestCaseData(id: "b32f397a-89c7-4bb4-a7de-50751cffc049",
             input: "n = 10",
             expected: "89", orderMatters: true),
            TestCaseData(id: "233b2e9c-8397-4b2a-bb6c-2f4e97b83756",
             input: "n = 20",
             expected: "10946", orderMatters: true),
            TestCaseData(id: "a2be0595-56dc-4e1c-abea-96fbd652045d",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "03a361a7-3da5-4d75-8bb1-a2b419028b96",
             input: "n = -1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "6f5d7356-ea15-4523-abb3-f0013dd49d91",
             input: "n = 30",
             expected: "1346269", orderMatters: true),
            TestCaseData(id: "51c2b8d0-28ff-40d5-b3ad-b69ad4ec6791",
             input: "n = 40",
             expected: "165580141", orderMatters: true),
            TestCaseData(id: "d7e83a3b-a61c-44e2-86ed-f383e8f994c4",
             input: "n = 50",
             expected: "20365011074", orderMatters: true),
            TestCaseData(id: "406c8723-3ff7-4b1b-8d18-223cafbc5a56",
             input: "n = -5",
             expected: "-5", orderMatters: true),
            TestCaseData(id: "316a069a-bcb0-4dba-8674-4fa472bd83ba",
             input: "n = 4000",
             expected: "-1000000000000000000", orderMatters: true),
            TestCaseData(id: "39306697-d3fb-40fa-9a9b-0736d3a7a3cc",
             input: "n = 5000",
             expected: "-1000000000000000000", orderMatters: true),
            TestCaseData(id: "11625b92-b182-4a25-8337-39728f1ffc90",
             input: "n = 10000",
             expected: "-1000000000000000000", orderMatters: true),
            TestCaseData(id: "45e812b1-4ea7-4b85-89cb-7c01fed9217f",
             input: "n = 20000",
             expected: "-1000000000000000000", orderMatters: true),
            TestCaseData(id: "19cfd59d-1658-44e9-8f07-66fe6c4edde3",
             input: "n = 30000",
             expected: "-1000000000000000000", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "climbing-stairs"
            let topic = "dynamic-programming"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 45 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 45"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.climbStairs(p_n)
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
