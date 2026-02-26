import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCountPrimes {
    private class Solution {
        func countPrimes(_ n: Int) -> Int {
            if n <= 2 { return 0 }
            var prime = [Bool](repeating: true, count: n)
            prime[0] = false; prime[1] = false
            for p in 2...Int(sqrt(Double(n))) {
                if prime[p] {
                    for i in stride(from: p*p, to: n, by: p) {
                        prime[i] = false
                    }
                }
            }
            return prime.filter { $0 }.count
        }
    }

    @Suite struct CountPrimesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1760f213-916b-4516-a7cf-d65f992a930f",
             input: "n = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d37f4456-6ae9-42c5-aecb-26a2f38b411e",
             input: "n = 2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ee4e58fd-93fb-4ebc-b266-2761517982b3",
             input: "n = 4",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8a618b6a-db07-41ec-b943-da301b36146a",
             input: "n = 6",
             expected: "3", orderMatters: true),
            TestCaseData(id: "427c900d-9552-44ec-a94f-d74746a8a191",
             input: "n = 8",
             expected: "4", orderMatters: true),
            TestCaseData(id: "9861c4c1-15c0-4137-baf0-b605c93cc5ce",
             input: "n = 9",
             expected: "4", orderMatters: true),
            TestCaseData(id: "cfeb4d37-6b08-40d3-87f0-6c9e6656d507",
             input: "n = 31",
             expected: "10", orderMatters: true),
            TestCaseData(id: "54d92230-f426-4b38-ba47-21d6a8313aac",
             input: "n = 37",
             expected: "11", orderMatters: true),
            TestCaseData(id: "56e7c1ba-ebb6-4fca-99de-ef4a8e53c32c",
             input: "n = 41",
             expected: "12", orderMatters: true),
            TestCaseData(id: "46db37e3-d024-4cc6-9760-35c83f78ce6f",
             input: "n = 43",
             expected: "13", orderMatters: true),
            TestCaseData(id: "39c87c80-f08f-4ff4-aa00-95cba601f46b",
             input: "n = 47",
             expected: "14", orderMatters: true),
            TestCaseData(id: "d4ae8c86-9b7e-4f0b-8b8f-a6dfeea6ece6",
             input: "n = 53",
             expected: "15", orderMatters: true),
            TestCaseData(id: "76ba886e-dfbb-4585-b02d-b6d236bb9e8b",
             input: "n = 59",
             expected: "16", orderMatters: true),
            TestCaseData(id: "2df6b4a4-0c4d-40c0-b689-7eeea3958246",
             input: "n = 61",
             expected: "17", orderMatters: true),
            TestCaseData(id: "013d787a-de85-4b8b-9d67-d3052fb143e1",
             input: "n = 67",
             expected: "18", orderMatters: true),
            TestCaseData(id: "733b4bfb-5b2b-4f45-af10-4d0346c14d46",
             input: "n = 71",
             expected: "19", orderMatters: true),
            TestCaseData(id: "de03a9b3-5fa6-48c9-93af-5fc4509e06ea",
             input: "n = 73",
             expected: "20", orderMatters: true),
            TestCaseData(id: "8768c753-055c-444e-814e-9a0c8b1960b8",
             input: "n = 79",
             expected: "21", orderMatters: true),
            TestCaseData(id: "78354dc4-a918-4ed2-ba29-7dd739fdee56",
             input: "n = 83",
             expected: "22", orderMatters: true),
            TestCaseData(id: "069af7f7-3067-4b21-ae30-07ac45f4c52b",
             input: "n = 89",
             expected: "23", orderMatters: true),
            TestCaseData(id: "5f66e61d-f08f-4a13-9831-8705f18a0877",
             input: "n = 97",
             expected: "24", orderMatters: true),
            TestCaseData(id: "995b4631-8db4-421f-a885-246d57662e4a",
             input: "n = 101",
             expected: "25", orderMatters: true),
            TestCaseData(id: "973a9c1b-4e24-4dec-9eaa-1d596c86c906",
             input: "n = 103",
             expected: "26", orderMatters: true),
            TestCaseData(id: "cfdd604b-7d12-48f8-bb7d-2b77e949cf55",
             input: "n = 107",
             expected: "27", orderMatters: true),
            TestCaseData(id: "219ded1d-b74d-4acb-bc8c-e6bcfd284673",
             input: "n = 1000",
             expected: "168", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "count-primes"
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
            guard p_n >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= n <= 5 * 106"
                )
                return
            }

            let solution = Solution()
            let result = solution.countPrimes(p_n)
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
