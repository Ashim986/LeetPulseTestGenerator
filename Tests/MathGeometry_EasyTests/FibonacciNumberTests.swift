import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFibonacciNumber {
    private class Solution {
        func fib(_ n: Int) -> Int {
            var memo: [Int: Int] = [0: 0, 1: 1]
            func fibonacci(_ n: Int) -> Int {
                if memo[n] != nil { return memo[n].unsafelyUnwrapped }
                let result = fibonacci(n-1) + fibonacci(n-2)
                memo[n] = result
                return result
            }
            return fibonacci(n)
        }
    }

    @Suite struct FibonacciNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "63ac2d9d-0bb6-4f9e-936b-12d64277971a",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e57de767-f6e9-461c-b3da-8b19aeec9e62",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e22cf5e2-0fbb-4cb2-b9db-0606167344a1",
             input: "n = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "448fae5b-4a81-4a64-a2df-cc4bf7a6d493",
             input: "n = 6",
             expected: "8", orderMatters: true),
            TestCaseData(id: "31744659-94a0-4abc-9d6a-f3b3eadb052d",
             input: "n = 7",
             expected: "13", orderMatters: true),
            TestCaseData(id: "2ecb25d9-8cd1-408b-9746-74be65624191",
             input: "n = 8",
             expected: "21", orderMatters: true),
            TestCaseData(id: "c776dcf9-8c9e-4ef5-9d11-1eafba6716ab",
             input: "n = 9",
             expected: "34", orderMatters: true),
            TestCaseData(id: "555758d6-e8e6-490b-80eb-33e75248c816",
             input: "n = 10",
             expected: "55", orderMatters: true),
            TestCaseData(id: "4209afdd-e6cd-4c1e-890b-b5b85e5d69b4",
             input: "n = 11",
             expected: "89", orderMatters: true),
            TestCaseData(id: "682f9bb3-2e21-44fe-b771-c3fd6c34ac6a",
             input: "n = 12",
             expected: "144", orderMatters: true),
            TestCaseData(id: "3aeef0c2-6777-4f56-b15b-f81eab236c8d",
             input: "n = 13",
             expected: "233", orderMatters: true),
            TestCaseData(id: "1419d2c3-87c5-400f-93a7-d97616cc1787",
             input: "n = 14",
             expected: "377", orderMatters: true),
            TestCaseData(id: "7dadb673-6283-4b08-ac57-d2a05cf1dba0",
             input: "n = 15",
             expected: "610", orderMatters: true),
            TestCaseData(id: "31a5c556-c714-42bb-83d3-d6aacbe51f51",
             input: "n = 17",
             expected: "1597", orderMatters: true),
            TestCaseData(id: "5d0c5d40-3659-4690-bfc6-54a7bb316c70",
             input: "n = 18",
             expected: "2584", orderMatters: true),
            TestCaseData(id: "cc0bb74f-0fea-40ab-a6c2-420c4b4b00f9",
             input: "n = 19",
             expected: "4181", orderMatters: true),
            TestCaseData(id: "8c6523f2-c314-47f6-8b6d-e75193f2e2c6",
             input: "n = 20",
             expected: "6765", orderMatters: true),
            TestCaseData(id: "49037941-7f11-4733-a819-a0866246c6b5",
             input: "n = 21",
             expected: "10946", orderMatters: true),
            TestCaseData(id: "965b0f45-d54d-4436-8c33-4a1fce53240c",
             input: "n = 22",
             expected: "17711", orderMatters: true),
            TestCaseData(id: "544fc732-7a61-4cdf-bf73-2a7cb6d18650",
             input: "n = 23",
             expected: "28657", orderMatters: true),
            TestCaseData(id: "3613cac9-cc1c-4b5f-9869-1ee96e1a4819",
             input: "n = 24",
             expected: "46368", orderMatters: true),
            TestCaseData(id: "05e7993a-1216-4c46-84e4-fe0fd4f20408",
             input: "n = 25",
             expected: "75025", orderMatters: true),
            TestCaseData(id: "5bc6f629-50e7-44f2-b80f-522d059a9254",
             input: "n = 26",
             expected: "121393", orderMatters: true),
            TestCaseData(id: "ba50f9bc-8684-4af6-b61d-b83d85a9ff88",
             input: "n = 27",
             expected: "196418", orderMatters: true),
            TestCaseData(id: "0f398a21-2b3d-47c1-b681-2f3a428e5913",
             input: "n = 28",
             expected: "317811", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "fibonacci-number"
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
            guard p_n >= 0 && p_n <= 30 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= n <= 30"
                )
                return
            }

            let solution = Solution()
            let result = solution.fib(p_n)
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
