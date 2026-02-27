import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCKThSmallestPrimeFraction {
    private class Solution {
        func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> String {
            let n = arr.count
            var pq: [(val: Double, i: Int, j: Int)] = []
            for j in 1..<n {
                if gcd(arr[0], arr[j]) == 1 {
                    pq.append((val: Double(arr[0]) / Double(arr[j]), i: 0, j: j))
                }
            }
            var count = 0
            while !pq.isEmpty {
                pq.sort { $0.val < $1.val }
                let (val, i, j) = pq.removeFirst()
                count += 1
                if count == k {
                    return "(arr[i])/(arr[j])"
                }
                if i + 1 < n {
                    if gcd(arr[i+1], arr[j]) == 1 {
                        pq.append((val: Double(arr[i+1]) / Double(arr[j]), i: i+1, j: j))
                    }
                }
            }
            return ""
        }

        func gcd(_ a: Int, _ b: Int) -> Int {
            if b == 0 {
                return a
            }
            return gcd(b, a % b)
        }
    }

    @Suite struct KThSmallestPrimeFractionTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "74f8f55d-cb0d-45be-b46b-ce4ffde25f7f",
             input: "arr = [1,2,3,5], k = 1",
             expected: "(fractions[k-1].n)/(fractions[k-1].d)", orderMatters: true),
            TestCaseData(id: "27b8f665-6e42-4181-9cd3-f2ce4f3f38ef",
             input: "arr = [1,2,3,5], k = 2",
             expected: "(fractions[k-1].n)/(fractions[k-1].d)", orderMatters: true),
            TestCaseData(id: "5a33e7d5-ffe9-48ef-b3d8-dbfbeb106ec6",
             input: "arr = [1,2,3,5], k = 4",
             expected: "(fractions[k-1].n)/(fractions[k-1].d)", orderMatters: true),
            TestCaseData(id: "bccb0186-e7e8-47fa-a701-035de569a05b",
             input: "arr = [1,2,3,5], k = 5",
             expected: "(fractions[k-1].n)/(fractions[k-1].d)", orderMatters: true),
            TestCaseData(id: "3a6628a9-faaa-495d-9ba9-a3ff5eff0d44",
             input: "arr = [1,2,3,5], k = 6",
             expected: "(fractions[k-1].n)/(fractions[k-1].d)", orderMatters: true),
            TestCaseData(id: "7ae76912-6f69-4edc-a230-946aae42b1f1",
             input: "arr = [1,2,3], k = 1",
             expected: "(fractions[k-1].n)/(fractions[k-1].d)", orderMatters: true),
            TestCaseData(id: "533a2a36-ff26-4060-9927-ce03ab0a5631",
             input: "arr = [1,2,3], k = 2",
             expected: "(fractions[k-1].n)/(fractions[k-1].d)", orderMatters: true),
            TestCaseData(id: "d2677fa8-19ce-4f99-bb74-dbcdcae74bc1",
             input: "arr = [1,2,3], k = 3",
             expected: "(fractions[k-1].n)/(fractions[k-1].d)", orderMatters: true),
            TestCaseData(id: "88492524-733b-424f-8dd7-b16d3f02e8ce",
             input: "arr = [1,2,3], k = 4",
             expected: "null", orderMatters: true),
            TestCaseData(id: "cd9316ae-9bbb-438f-aa3c-da37dcb37404",
             input: "arr = [1,2,3], k = 5",
             expected: "null", orderMatters: true),
            TestCaseData(id: "a2ae7e9b-16f9-410e-98d5-b53485b03714",
             input: "arr = [1,2,3,4,5,6,7,8,9,10], k = 1",
             expected: "(1)/(10)", orderMatters: true),
            TestCaseData(id: "f440f848-caf8-4181-9b17-a7011ef86577",
             input: "arr = [1,2,3,4,5], k = 1",
             expected: "(1)/(5)", orderMatters: true),
            TestCaseData(id: "58adf847-56c6-4441-9f91-bc49bbb8a418",
             input: "arr = [1,2,3,5], k = 3",
             expected: "[2,5]", orderMatters: true),
            TestCaseData(id: "82e18b6e-0aec-4a0e-834e-7a17334af99a",
             input: "arr = [1,7], k = 1",
             expected: "[1,7]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "k-th-smallest-prime-fraction"
            let topic = "two-pointers"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_arr = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_arr.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: arr array too large (\(p_arr.count))"
                )
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_arr.count >= 2 && p_arr.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= arr.length <= 1000"
                )
                return
            }
            guard p_arr.allSatisfy({ $0 >= 1 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= arr[i] <= 3 * 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.kthSmallestPrimeFraction(p_arr, p_k)
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

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
