import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCShiftingLetters {
    private class Solution {
        func shiftingLetters(_ s: String, _ shifts: [Int]) -> String {
            var chars = Array(s)
            var totalShift = 0
            let a = Int(UnicodeScalar("a").value)

            for i in stride(from: chars.count - 1, through: 0, by: -1) {
                totalShift = (totalShift + shifts[i]) % 26
                let scalarValue = chars[i].unicodeScalars.first?.value ?? UnicodeScalar("a").value
                let offset = (Int(scalarValue) - a + totalShift) % 26
                chars[i] = Character(UnicodeScalar(a + offset).unsafelyUnwrapped)
            }

            return String(chars)
        }
    }

    @Suite struct ShiftingLettersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bc38a98e-7aa4-410d-9f77-caf7f210659b",
             input: "s = \"a\", shifts = [1]",
             expected: "b", orderMatters: true),
            TestCaseData(id: "8720e690-5132-434d-b45e-2ff1a6be0e97",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", shifts = [26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26]",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "45cbbce5-ba2b-4f0f-b0e0-5038f45553b9",
             input: "s = \"abc\", shifts = [0,0,0]",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "676e9257-3e77-4bf2-9a3c-afb9ebba238f",
             input: "s = \"abc\", shifts = [26,26,26]",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "4161688f-ef96-46e8-b58c-19003ead6d52",
             input: "s = \"abc\", shifts = [-26,-26,-26]",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "718579b1-8687-4809-8091-97b873775d09",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", shifts = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "e6d112df-ebc3-4ca0-90cc-362afcb6aae9",
             input: "s = \"a\", shifts = [26]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "be8ed356-c48b-471b-8fb3-d268294d3960",
             input: "s = \"a\", shifts = [27]",
             expected: "b", orderMatters: true),
            TestCaseData(id: "22da274e-5396-4458-8a7a-1d93fd6744d2",
             input: "s = \"a\", shifts = [-26]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "20ba2479-4b55-4145-a918-c78cbf93529c",
             input: "s = \"z\", shifts = [1]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "b6617061-111e-4a44-a038-51e3e46520ff",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", shifts = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]",
             expected: "nmnkhdyrludkzyamxurxzz", orderMatters: true),
            TestCaseData(id: "7044ee76-5b27-4c70-9105-105cf8a48efd",
             input: "s = \"abc\", shifts = [1,1,1]",
             expected: "ddd", orderMatters: true),
            TestCaseData(id: "a472a4ce-0c70-473e-81a2-5551284c5c7f",
             input: "s = \"abc\", shifts = [25,25,25]",
             expected: "zzz", orderMatters: true),
            TestCaseData(id: "11f877fa-42fc-4161-8562-463811dd0280",
             input: "s = \"abc\", shifts = [-1,-1,-1]",
             expected: "```", orderMatters: true),
            TestCaseData(id: "105d52d6-8b7b-47d9-b2f8-5fa6311ff9b8",
             input: "s = \"abc\", shifts = [27,27,27]",
             expected: "ddd", orderMatters: true),
            TestCaseData(id: "0d4999ab-5fd1-4b12-af96-3e7b5eef905c",
             input: "s = \"abc\", shifts = [100,100,100]",
             expected: "oty", orderMatters: true),
            TestCaseData(id: "6fd96e5c-cfbe-41d0-aa83-b162af4a0ed4",
             input: "s = \"a\", shifts = [1000]",
             expected: "m", orderMatters: true),
            TestCaseData(id: "5940ea82-5d5e-4c4a-b1da-270ac3b168ae",
             input: "s = \"a\", shifts = [-1000]",
             expected: "U", orderMatters: true),
            TestCaseData(id: "84c8dee0-879c-4492-8d64-e64f8888eb20",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", shifts = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "aaaaaaaaaaaaaaaaaaaaaaaaaa", orderMatters: true),
            TestCaseData(id: "b7c7921c-79b4-44ce-a4ef-aeb646fb8261",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", shifts = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]",
             expected: "aIKMOQSUWY[]_acgeikmoqsuwy", orderMatters: true),
            TestCaseData(id: "0e2cd7cc-b382-40c8-b576-643029d7d4a8",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", shifts = [26,-1,26,-1,26,-1,26,-1,26,-1,26,-1,26,-1,26,-1,26,-1,26,-1,26,-1,26,-1,26,-1]",
             expected: "aIKMOQSUWY[]_acgeikmoqsuwy", orderMatters: true),
            TestCaseData(id: "9d327dc4-60ba-490f-ad64-af89fcded547",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", shifts = [25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0]",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "b227e08a-f1e2-4590-9364-7de8aff05a7c",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", shifts = [100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,10"
                + "0,100,100,100]",
             expected: "opqrstuvwxyzabcdefghijklmn", orderMatters: true),
            TestCaseData(id: "c284afb0-97b0-4acc-acb4-2139acfceb25",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", shifts = [-100,-100,-100,-100,-100,-100,-100,-100,-100,-100,-100,-100,-100,-100,-100,-100,-100,-100,"
                + "-100,-100,-100,-100,-100,-100,-100,-100]",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "c36d1b29-96e9-45e8-8b45-309b83eae86e",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", shifts = [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,"
                + "1000,1000,1000,1000,1000,1000,1000,1000]",
             expected: "wrbgrwblqbgqlqbwlgrlqavql", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "shifting-letters"
            let topic = "arrays-hashing"
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

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }
            guard let p_shifts = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_shifts.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: shifts array too large (\(p_shifts.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 10^5"
                )
                return
            }
            guard p_shifts.allSatisfy({ $0 >= 0 && $0 <= 1000000000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= shifts[i] <= 10^9"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.shiftingLetters(p_s, p_shifts)
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
