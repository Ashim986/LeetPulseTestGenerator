import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReconstructOriginalDigitsFromEnglish {
    private class Solution {
        let digitToWord: [String: String] = ["0": "zero", "1": "one", "2": "two", "3": "three", "4": "four", "5": "five", "6": "six", "7": "seven", "8": "eight", "9": "nine"]
        let wordToDigit: [String: String] = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]

        func originalDigits(_ s: String) -> String {
            var count: [Character: Int] = [:]
            for char in s {
                if let value = count[char] {
                    count[char] = value + 1
                } else {
                    count[char] = 1
                }
            }

            var result: [Character] = []

            if let w = count["z"] {
                result.append(contentsOf: Array(repeating: "0", count: w))
                count["e"] = count["e"].unsafelyUnwrapped - w
                count["r"] = count["r"].unsafelyUnwrapped - w
                count["o"] = count["o"].unsafelyUnwrapped - w
            }
            if let w = count["w"] {
                result.append(contentsOf: Array(repeating: "2", count: w))
                count["t"] = count["t"].unsafelyUnwrapped - w
                count["w"] = count["w"].unsafelyUnwrapped - w
                count["o"] = count["o"].unsafelyUnwrapped - w
            }
            if let w = count["u"] {
                result.append(contentsOf: Array(repeating: "4", count: w))
                count["f"] = count["f"].unsafelyUnwrapped - w
                count["o"] = count["o"].unsafelyUnwrapped - w
                count["u"] = count["u"].unsafelyUnwrapped - w
                count["r"] = count["r"].unsafelyUnwrapped - w
            }
            if let w = count["x"] {
                result.append(contentsOf: Array(repeating: "6", count: w))
                count["s"] = count["s"].unsafelyUnwrapped - w
                count["i"] = count["i"].unsafelyUnwrapped - w
                count["x"] = count["x"].unsafelyUnwrapped - w
            }
            if let w = count["g"] {
                result.append(contentsOf: Array(repeating: "8", count: w))
                count["e"] = count["e"].unsafelyUnwrapped - w
                count["i"] = count["i"].unsafelyUnwrapped - w
                count["g"] = count["g"].unsafelyUnwrapped - w
                count["h"] = count["h"].unsafelyUnwrapped - w
                count["t"] = count["t"].unsafelyUnwrapped - w
            }
            if let w = count["o"] {
                var ones = count["o"] ?? 0
                if let z = count["z"] {
                    ones -= z
                }
                if let w = count["w"] {
                    ones -= w
                }
                if let u = count["u"] {
                    ones -= u
                }
                if let g = count["g"] {
                    ones -= g
                }
                result.append(contentsOf: Array(repeating: "1", count: ones))
            }
            if let w = count["h"] {
                var threes = count["h"] ?? 0
                if let w = count["w"] {
                    threes -= w
                }
                if let g = count["g"] {
                    threes -= g
                }
                result.append(contentsOf: Array(repeating: "3", count: threes))
            }
            if let w = count["f"] {
                var fives = count["f"] ?? 0
                if let u = count["u"] {
                    fives -= u
                }
                result.append(contentsOf: Array(repeating: "5", count: fives))
            }
            if let w = count["s"] {
                var sevens = count["s"] ?? 0
                if let x = count["x"] {
                    sevens -= x
                }
                result.append(contentsOf: Array(repeating: "7", count: sevens))
            }
            if let w = count["v"] {
                result.append(contentsOf: Array(repeating: "5", count: w))
            }
            if let w = count["i"] {
                var nines = count["i"] ?? 0
                if let s = count["s"] {
                    nines -= s
                }
                if let x = count["x"] {
                    nines -= x
                }
                if let g = count["g"] {
                    nines -= g
                }
                result.append(contentsOf: Array(repeating: "9", count: nines))
            }
            return String(result.sorted())
        }
    }

    @Suite struct ReconstructOriginalDigitsFromEnglishTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f00f849e-77b3-4858-92d1-6ddac96a1106",
             input: "s = \"zero\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8a73cb8b-d126-4b2b-941a-1e7a600a586d",
             input: "s = \"one\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c04b0489-dbd7-40dc-af7f-abfdb2246382",
             input: "s = \"two\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1409a1c9-d3ea-4952-8f3f-2619c801d790",
             input: "s = \"three\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ed9108e6-c351-4219-b94c-ca3886577aa5",
             input: "s = \"six\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "91e44238-a8c3-4e00-8e21-3304819df6ca",
             input: "s = \"nine\"",
             expected: "9", orderMatters: true),
            TestCaseData(id: "46e81848-1e4b-4b0d-91c4-058e3f007b2b",
             input: "s = \"onetwo\"",
             expected: "12", orderMatters: true),
            TestCaseData(id: "e58c424f-3375-46ca-9d61-dbddbe5bc3d4",
             input: "s = \"fivesix\"",
             expected: "56", orderMatters: true),
            TestCaseData(id: "60005ed6-cba6-415d-9d71-f83e8d09b182",
             input: "s = \"ninenine\"",
             expected: "99", orderMatters: true),
            TestCaseData(id: "baa633cd-a66d-4147-8fed-767e12c92b2f",
             input: "s = \"zeroone\"",
             expected: "01", orderMatters: true),
            TestCaseData(id: "043b1e3b-1b74-49e2-b47e-cf0e28aaabe1",
             input: "s = \"twotwo\"",
             expected: "22", orderMatters: true),
            TestCaseData(id: "9f7dd78e-9808-4065-bcca-1a6350bd62b3",
             input: "s = \"nineninenine\"",
             expected: "999", orderMatters: true),
            TestCaseData(id: "a8bed406-cbaa-4b97-89c4-cc19f1098874",
             input: "s = \"four\"",
             expected: "14", orderMatters: true),
            TestCaseData(id: "c4d380f2-3dd9-4caf-835d-5cdc5faa97ef",
             input: "s = \"five\"",
             expected: "59", orderMatters: true),
            TestCaseData(id: "ea51913e-0ad9-4924-b3ab-75e32c3e1c34",
             input: "s = \"seven\"",
             expected: "57", orderMatters: true),
            TestCaseData(id: "85af7643-8424-4112-a459-9be3184ea4bd",
             input: "s = \"eight\"",
             expected: "389", orderMatters: true),
            TestCaseData(id: "1ed39d1e-468e-47ca-87e2-7ab5ed95c6f2",
             input: "s = \"twofour\"",
             expected: "124", orderMatters: true),
            TestCaseData(id: "36017b49-a492-46e2-b0c3-46c67c2f55c6",
             input: "s = \"seveneight\"",
             expected: "3578", orderMatters: true),
            TestCaseData(id: "4e8e5fc4-68ac-4509-95e6-5dfe11ce3b46",
             input: "s = \"onetwothree\"",
             expected: "12", orderMatters: true),
            TestCaseData(id: "655c62c6-566f-431f-8f02-852c34fa778e",
             input: "s = \"fourfivesix\"",
             expected: "1456", orderMatters: true),
            TestCaseData(id: "c20631fd-2db4-4f78-9e30-1f81ff3756f0",
             input: "s = \"seveneightnine\"",
             expected: "35789", orderMatters: true),
            TestCaseData(id: "30fd2a54-4c0b-4cde-8ff5-a9112ebff14d",
             input: "s = \"threefour\"",
             expected: "134", orderMatters: true),
            TestCaseData(id: "26804c1b-0a0b-4eae-afe9-8084e85fc019",
             input: "s = \"fivefive\"",
             expected: "5599", orderMatters: true),
            TestCaseData(id: "852f4149-5ae7-488e-b7d1-c6af8b2d95ac",
             input: "s = \"sixsix\"",
             expected: "null", orderMatters: true),
            TestCaseData(id: "10c7c639-8c0b-4ea8-b9cd-da4078b3770f",
             input: "s = \"sevenseven\"",
             expected: "5577", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reconstruct-original-digits-from-english"
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

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.originalDigits(p_s)
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
