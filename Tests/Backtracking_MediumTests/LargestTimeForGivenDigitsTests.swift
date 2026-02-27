import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLargestTimeForGivenDigits {
    private class Solution {
        func largestTimeFromDigits(A: [Int]) -> String {
            let sortedA = A.sorted() { $0 > $1 }
            for h1 in 0..<4 {
                for h2 in 0..<4 {
                    if h1 == h2 { continue }
                    for m1 in 0..<4 {
                        if m1 == h1 || m1 == h2 { continue }
                        for m2 in 0..<4 {
                            if m2 == h1 || m2 == h2 || m2 == m1 { continue }
                            let hours = sortedA[h1] * 10 + sortedA[h2]
                            let minutes = sortedA[m1] * 10 + sortedA[m2]
                            if hours < 24 && minutes < 60 {
                                return String(format: "%02d:%02d", hours, minutes)
                            }
                        }
                    }
                }
            }
            return ""
        }
    }

    @Suite struct LargestTimeForGivenDigitsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "50632828-ccba-473a-b00c-6ef57e408586",
             input: "A = [5,5,5,1]",
             expected: "15:55", orderMatters: true),
            TestCaseData(id: "eb8ba9ae-b8f7-4479-920c-26f66f590027",
             input: "A = [1,5,5,5]",
             expected: "15:55", orderMatters: true),
            TestCaseData(id: "ae0da42a-67fd-46ae-9800-a566bc0e19f7",
             input: "A = [0,0,1,1]",
             expected: "11:00", orderMatters: true),
            TestCaseData(id: "3c74725c-0f1d-4d4e-ad5a-bea44f25d1d5",
             input: "A = [1,1,0,0]",
             expected: "11:00", orderMatters: true),
            TestCaseData(id: "49d0c5b3-f9e0-49fd-bc38-17f0b7d76cb2",
             input: "A = [0,0,0,1]",
             expected: "10:00", orderMatters: true),
            TestCaseData(id: "322999ee-66c6-43eb-bc5c-7367e8b9a323",
             input: "A = [1,0,0,0]",
             expected: "10:00", orderMatters: true),
            TestCaseData(id: "04ddd58e-88f0-4232-b57c-c3cf342dbb8c",
             input: "A = [0,0,1,0]",
             expected: "10:00", orderMatters: true),
            TestCaseData(id: "88ee9f9c-de95-4c91-a7f4-7eab15d93d04",
             input: "A = [0,1,0,0]",
             expected: "10:00", orderMatters: true),
            TestCaseData(id: "b2961f4a-662c-466f-acd7-935bde0c339d",
             input: "A = [0,0,0,9]",
             expected: "09:00", orderMatters: true),
            TestCaseData(id: "d00a4266-7a9f-487e-95a8-dfbf4dfa114b",
             input: "A = [9,0,0,0]",
             expected: "09:00", orderMatters: true),
            TestCaseData(id: "3493c31b-6544-47b9-ab07-75ef74c41949",
             input: "A = [0,4,0,0]",
             expected: "04:00", orderMatters: true),
            TestCaseData(id: "382d1890-8ad6-49c4-81df-6e424d30ceaa",
             input: "A = [0,1,2,3]",
             expected: "23:10", orderMatters: true),
            TestCaseData(id: "1331f6cb-3238-473b-923d-6b8635e32074",
             input: "A = [3,2,1,0]",
             expected: "23:10", orderMatters: true),
            TestCaseData(id: "84bb4d97-3b8f-41f5-acb5-6f36c3a5a28c",
             input: "A = [2,2,0,0]",
             expected: "22:00", orderMatters: true),
            TestCaseData(id: "912ab769-08ca-40b3-adab-0f81ea016e33",
             input: "A = [0,0,2,2]",
             expected: "22:00", orderMatters: true),
            TestCaseData(id: "56729d48-1d5f-42aa-b9f5-85a7d47f8d19",
             input: "A = [0,1,2,4]",
             expected: "21:40", orderMatters: true),
            TestCaseData(id: "30dd7c31-449c-487e-bf8d-6f48091f0f23",
             input: "A = [4,2,1,0]",
             expected: "21:40", orderMatters: true),
            TestCaseData(id: "fd0d921b-8954-42bd-ad71-54d6db0867b9",
             input: "A = [5,4,3,2]",
             expected: "23:54", orderMatters: true),
            TestCaseData(id: "f748177b-2fad-437d-99c1-ea4ea851b7c8",
             input: "A = [2,3,4,5]",
             expected: "23:54", orderMatters: true),
            TestCaseData(id: "53c6f574-3e0a-4bed-9c7c-4244a29fd483",
             input: "A = [1,2,3,5]",
             expected: "23:51", orderMatters: true),
            TestCaseData(id: "18502b5c-a7ab-4bd8-8a88-e490414965f4",
             input: "A = [5,3,2,1]",
             expected: "23:51", orderMatters: true),
            TestCaseData(id: "3bbbdd86-d5d1-4707-8065-4b6620faf999",
             input: "arr = [1,2,3,4]",
             expected: "\"23:41\"", orderMatters: true),
            TestCaseData(id: "7298e494-1d65-4fc3-b0e7-ae772dee246b",
             input: "arr = [5,5,5,5]",
             expected: "\"\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "largest-time-for-given-digits"
            let topic = "backtracking"
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

            guard let p_A = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.allSatisfy({ $0 >= 0 && $0 <= 9 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= arr[i] <= 9"
                )
                return
            }
            guard p_A.count == 4 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: arr.length == 4"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.largestTimeFromDigits(A: p_A)
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
