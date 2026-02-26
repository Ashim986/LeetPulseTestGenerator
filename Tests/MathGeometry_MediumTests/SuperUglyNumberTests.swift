import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSuperUglyNumber {
    private class Solution {
        func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
            var ugly = [1]
            var indices = [Int](repeating: 0, count: primes.count)
            while ugly.count < n {
                let candidates: [Int] = (0..<primes.count).map { index in ugly[indices[index]] * primes[index] }
                let nextUgly = candidates.min() ?? 0
                ugly.append(nextUgly)
                for (index, candidate) in candidates.enumerated() {
                    if candidate == nextUgly {
                        indices[index] += 1
                    }
                }
            }
            return ugly[ugly.count - 1]
        }
    }

    @Suite struct SuperUglyNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7c0e8935-4382-4cf9-9a0d-c9bab6f6bd40",
             input: "n = 1, primes = []",
             expected: "1", orderMatters: true),
            TestCaseData(id: "14b1d19a-fb96-47ec-baed-2733e0f9fea4",
             input: "n = 1, primes = [2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fe2708cb-da68-405e-9d35-3afd6ef0cb93",
             input: "n = 2, primes = [2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5b000eb9-7544-4490-9c09-5c1ed2f8d398",
             input: "n = 1, primes = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "774668ab-4104-4ced-834f-0f04608ddc5c",
             input: "n = 1, primes = [-1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6f8876ca-cd0a-4c60-ba8b-5f1a8aeff4c2",
             input: "n = 1, primes = [0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "487a3176-4c3b-4cb1-8dcf-d913721dc888",
             input: "n = 1, primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a33333f6-651e-4396-bc18-86baf9a0bcd4",
             input: "n = 1, primes = [-1,-2,-3,-4,-5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "726538d0-022f-4294-a75a-e41bb0573717",
             input: "n = 1, primes = [1,2,3,4,5,6,7,8,9,10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "03b3088c-e45a-4bb8-ad25-de0d954b231e",
             input: "n = 1, primes = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "51eae363-7c0f-4683-88f7-96e34e90cfc0",
             input: "n = 1, primes = [1000,999,998,997,996,995,994,993,992,991,990,989,988,987,986,985,984,983,982,981,980]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0e9d150e-7783-49bc-8ef3-74d048cb5ff7",
             input: "n = 1, primes = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "387ae703-65e4-40dc-a573-d7d115e86ee0",
             input: "n = 1, primes = [-1000,-999,-998,-997,-996,-995,-994,-993,-992,-991,-990,-989,-988,-987,-986,-985,-984,-983,-982,-981,-980]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9458d549-778d-4fb7-bb37-a79643aeff1d",
             input: "n = 100, primes = [2,3,5,7,11,13,17,19,23,29]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bb50cd51-fe27-4482-bfe6-964d754f556c",
             input: "n = 1000, primes = [2,3,5,7,11,13,17,19,23,29]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2e4de065-a46e-43f6-b2c6-45ac8a2c04dd",
             input: "n = 10, primes = [3,2,5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3a572a38-ab25-4dec-bfe1-51685104e3a2",
             input: "n = 10, primes = [5,3,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "04399617-07a1-4f8e-8747-8f5265a2575c",
             input: "n = 100, primes = [2,3,5,7,11,13,17,19,23,29,31]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "95851618-cfc2-4e6c-9dd2-9866dc6d8e9d",
             input: "n = 1000, primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b05d229f-f6af-4658-8de7-dfc9decfd905",
             input: "n = 10, primes = [2,4,6,8,10]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4f6dd3bb-7e7f-443b-a898-140aa511d186",
             input: "n = 100, primes = [2,4,6,8,10,12,14,16,18,20]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7fb45222-45d7-4c41-a100-ed4c8e88f0a8",
             input: "n = 12, primes = [2,7,13,19]",
             expected: "32", orderMatters: true),
            TestCaseData(id: "66b433c6-b72c-41fd-bf4f-4fcdb6397bc8",
             input: "n = 1, primes = [2,3,5]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "super-ugly-number"
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
            guard let p_primes = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_primes.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: primes array too large (\(p_primes.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 105"
                )
                return
            }
            guard p_primes.count >= 1 && p_primes.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= primes.length <= 100"
                )
                return
            }
            guard p_primes.allSatisfy({ $0 >= 2 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= primes[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.nthSuperUglyNumber(p_n, p_primes)
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
