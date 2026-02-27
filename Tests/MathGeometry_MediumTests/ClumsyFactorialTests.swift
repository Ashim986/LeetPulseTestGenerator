import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCClumsyFactorial {
    private class Solution {
        func clumsy(_ N: Int) -> Int {
            var res: [Int64] = [Int64(N)]
            let operators: [String] = ["]", "+", "-", "*"]
            var idx = 0
            for num in stride(from: N-1, to: 0, by: -1) {
                switch operators[idx%4] {
                case "*":
                    res[res.count-1] *= Int64(num)
                case "/":
                    res[res.count-1] /= Int64(num)
                case "+":
                    res.append(Int64(num))
                case "-":
                    res.append(-Int64(num))
                default:
                    break
                }
                idx += 1
            }
            return Int(res.reduce(0) { $0 + $1 })
        }
    }

    @Suite struct ClumsyFactorialTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "02afadaa-2658-4b53-83f2-640bf0153963",
             input: "N = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e48ed47e-a4a7-41a4-8eb8-da4a6061c708",
             input: "N = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "94a830e3-6839-4662-8a00-959edabbf419",
             input: "N = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "877dd2ba-0d03-490e-9dd1-ab857943d1f0",
             input: "N = 3",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2f9959fb-8188-4b45-b6db-3ec749b09cd2",
             input: "N = 5",
             expected: "12", orderMatters: true),
            TestCaseData(id: "e7a68326-e963-4f2c-9b27-92f3fae8f4f6",
             input: "N = 6",
             expected: "21", orderMatters: true),
            TestCaseData(id: "bfcdc891-c447-4d2d-9ace-5613e5d7bc43",
             input: "N = 7",
             expected: "34", orderMatters: true),
            TestCaseData(id: "58e4338e-ba5e-4a3a-beb8-8ba2b3af8a11",
             input: "N = 8",
             expected: "46", orderMatters: true),
            TestCaseData(id: "b6993d46-40cf-4a4d-8074-ddba0dcbb1f2",
             input: "N = 9",
             expected: "122", orderMatters: true),
            TestCaseData(id: "2507b9c9-4166-4878-9b4d-3059ecc47c59",
             input: "N = 11",
             expected: "390", orderMatters: true),
            TestCaseData(id: "e7d692ca-7ffc-4c81-87af-17a03e03a48f",
             input: "N = 12",
             expected: "591", orderMatters: true),
            TestCaseData(id: "43e9e29e-5cdb-46cf-bb2a-df4c04327d54",
             input: "N = 13",
             expected: "1694", orderMatters: true),
            TestCaseData(id: "5ce800a1-92f0-46f2-818e-9454c582eab3",
             input: "N = 14",
             expected: "3489", orderMatters: true),
            TestCaseData(id: "0a945b9b-4672-4298-b97c-723b0e8ae35b",
             input: "N = 15",
             expected: "6182", orderMatters: true),
            TestCaseData(id: "727263ce-0fba-453d-9544-30e0fe965ad0",
             input: "N = 16",
             expected: "9996", orderMatters: true),
            TestCaseData(id: "2c13ac9a-7273-4a51-bef2-0d007182a4e9",
             input: "N = 17",
             expected: "30374", orderMatters: true),
            TestCaseData(id: "0cf96e14-ea59-416a-b96d-1ad1a60f01b1",
             input: "N = 18",
             expected: "66090", orderMatters: true),
            TestCaseData(id: "3dc58c23-cb95-43b0-b0df-845d264f8559",
             input: "N = 19",
             expected: "123302", orderMatters: true),
            TestCaseData(id: "7ec879d6-2b37-4c39-bde5-f35113db7f92",
             input: "N = 20",
             expected: "200000", orderMatters: true),
            TestCaseData(id: "a633de45-806b-4744-aa2d-1f1cd985244a",
             input: "N = 25",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "76beb898-b75b-44bd-adf8-3876dcdc15d1",
             input: "N = 30",
             expected: "3000000", orderMatters: true),
            TestCaseData(id: "aec3720c-da14-47be-b902-fe20a5a95e69",
             input: "N = 35",
             expected: "95212468646", orderMatters: true),
            TestCaseData(id: "e4f7d54c-a42f-4096-9f80-f0f04fa7cc5b",
             input: "N = 40",
             expected: "1000000000000000000", orderMatters: true),
            TestCaseData(id: "961028a7-b253-4ee9-a645-20900f44e1ee",
             input: "N = 45",
             expected: "1000000000000000000", orderMatters: true),
            TestCaseData(id: "c3a39e6b-fb65-4722-a578-36774d5449d7",
             input: "N = 50",
             expected: "1000000000000000000", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "clumsy-factorial"
            let topic = "math-geometry"
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

            guard let p_N = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_N >= 1 && p_N <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.clumsy(p_N)
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
