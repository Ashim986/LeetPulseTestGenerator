import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBullsAndCows {
    private class Solution {
        func getHint(_ secret: String, _ guess: String) -> String {
            let s = Array(secret)
            let g = Array(guess)
            var bulls = 0
            var cows = 0
            var counts = Array(repeating: 0, count: 10)

            for i in 0..<s.count {
                if s[i] == g[i] {
                    bulls += 1
                    continue
                }

                let sDigit = s[i].wholeNumberValue ?? 0
                let gDigit = g[i].wholeNumberValue ?? 0

                if counts[sDigit] < 0 { cows += 1 }
                if counts[gDigit] > 0 { cows += 1 }

                counts[sDigit] += 1
                counts[gDigit] -= 1
            }

            return "\(bulls)A\(cows)B"
        }
    }

    @Suite struct BullsAndCowsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bdec41f0-fec1-4cff-9dfc-34f703ca3b6a",
             input: "secret = \"1234\", guess = \"1234\"",
             expected: "4A0B", orderMatters: true),
            TestCaseData(id: "231c6042-1ab4-462e-acd3-fd45085609b0",
             input: "secret = \"1234\", guess = \"4321\"",
             expected: "0A4B", orderMatters: true),
            TestCaseData(id: "78b62164-85b3-441a-8fb0-f54fba2afff2",
             input: "secret = \"1234\", guess = \"1111\"",
             expected: "1A0B", orderMatters: true),
            TestCaseData(id: "30f3acb0-3602-48ec-a401-5b4dce6cd89d",
             input: "secret = \"\", guess = \"1234\"",
             expected: "0A0B", orderMatters: true),
            TestCaseData(id: "9b43f1da-38b6-450f-8858-57373d3fb12f",
             input: "secret = \"1\", guess = \"1\"",
             expected: "1A0B", orderMatters: true),
            TestCaseData(id: "cc73ee35-63f2-48c8-ab2e-35b7d5c761da",
             input: "secret = \"1\", guess = \"2\"",
             expected: "0A0B", orderMatters: true),
            TestCaseData(id: "52851808-28d8-44fb-b708-31a85514dab2",
             input: "secret = \"123456\", guess = \"123456\"",
             expected: "6A0B", orderMatters: true),
            TestCaseData(id: "f5816d45-68d4-4392-ab42-0ea3dbabb811",
             input: "secret = \"123456\", guess = \"654321\"",
             expected: "0A6B", orderMatters: true),
            TestCaseData(id: "0b18b67d-5bf9-4ec7-a574-0c5b0364b897",
             input: "secret = \"123456\", guess = \"111111\"",
             expected: "1A0B", orderMatters: true),
            TestCaseData(id: "d4b2ee59-73e2-4c1a-af05-a63afd0c8e21",
             input: "secret = \"\", guess = \"123456\"",
             expected: "0A0B", orderMatters: true),
            TestCaseData(id: "549fd701-db3a-4400-a10c-4b2ffdf9c50d",
             input: "secret = \"1234567890\", guess = \"1234567890\"",
             expected: "10A0B", orderMatters: true),
            TestCaseData(id: "a5e25d36-5278-4422-a658-2ad386ffc9d3",
             input: "secret = \"1234567890\", guess = \"0987654321\"",
             expected: "0A10B", orderMatters: true),
            TestCaseData(id: "80012944-163f-472a-8498-55e14cd82609",
             input: "secret = \"\", guess = \"\"",
             expected: "0A0B", orderMatters: true),
            TestCaseData(id: "355610c6-593f-448b-92dc-b7bdb323e916",
             input: "secret = \"1111\", guess = \"1111\"",
             expected: "4A0B", orderMatters: true),
            TestCaseData(id: "b8442c4f-4c9e-4e11-b208-e97a047b575c",
             input: "secret = \"12345678\", guess = \"87654321\"",
             expected: "0A8B", orderMatters: true),
            TestCaseData(id: "ad664c95-e3f2-4e9c-9ee8-783b061a564c",
             input: "secret = \"10000\", guess = \"10000\"",
             expected: "5A0B", orderMatters: true),
            TestCaseData(id: "afc01ee1-86ba-4eed-a353-a2e552c4daca",
             input: "secret = \"12345\", guess = \"54321\"",
             expected: "0A5B", orderMatters: true),
            TestCaseData(id: "3c605137-c1c2-4d69-8ffe-da49e3b9d472",
             input: "secret = \"98765\", guess = \"98765\"",
             expected: "5A0B", orderMatters: true),
            TestCaseData(id: "e3d080ed-871a-4392-9401-f3cae707107a",
             input: "secret = \"9876\", guess = \"9876\"",
             expected: "4A0B", orderMatters: true),
            TestCaseData(id: "1d031681-b41a-4b18-a194-06d125b020da",
             input: "secret = \"1234\", guess = \"2222\"",
             expected: "1A0B", orderMatters: true),
            TestCaseData(id: "b9b3fe48-ebe3-47ec-87e0-88c7e7b02a8e",
             input: "secret = \"1234\", guess = \"12345\"",
             expected: "4A0B", orderMatters: true),
            TestCaseData(id: "e1a2f189-9720-4ad5-bdeb-9406a37997d2",
             input: "secret = \"1234\", guess = \"4444\"",
             expected: "1A0B", orderMatters: true),
            TestCaseData(id: "61de21a2-0bc0-484d-a4be-ec888d597699",
             input: "secret = \"123456\", guess = \"222222\"",
             expected: "1A0B", orderMatters: true),
            TestCaseData(id: "dfbef2e4-b46a-49ad-852a-10ac166cbe82",
             input: "secret = \"1807\", guess = \"7810\"",
             expected: "\"1A3B\"", orderMatters: true),
            TestCaseData(id: "5d9e6f97-655c-44a1-a3a1-04549b1e092f",
             input: "secret = \"1123\", guess = \"0111\"",
             expected: "\"1A1B\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "bulls-and-cows"
            let topic = "arrays-hashing"
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

            let p_secret = InputParser.parseString(params[0])
            guard p_secret.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: secret string too long (\(p_secret.count))"
                )
                return
            }
            let p_guess = InputParser.parseString(params[1])
            guard p_guess.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: guess string too long (\(p_guess.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_secret.count >= 1 && p_secret.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= secret.length, guess.length <= 1000"
                )
                return
            }
            guard p_guess.count >= 1 && p_guess.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= secret.length, guess.length <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.getHint(p_secret, p_guess)
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
