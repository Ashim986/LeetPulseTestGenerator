import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCShortestCompletingWord {
    private class Solution {
        func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
            func counts(_ s: String) -> [Int] {
                var result = Array(repeating: 0, count: 26)
                for ch in s.lowercased() {
                    guard let ascii = ch.asciiValue else { continue }
                    let idx = Int(ascii) - 97
                    if (0..<26).contains(idx) {
                        result[idx] += 1
                    }
                }
                return result
            }

            let need = counts(licensePlate.filter { $0.isLetter })
            var best = ""

            for word in words {
                let have = counts(word)
                var ok = true
                for i in 0..<26 where have[i] < need[i] {
                    ok = false
                    break
                }
                if ok, best.isEmpty || word.count < best.count {
                    best = word
                }
            }

            return best
        }
    }

    @Suite struct ShortestCompletingWordTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "914DCFE9-FE46-49EE-AB30-F78EE56D6588",
             input: "1s3 PSt\n['step','steps','stripe','stepple']",
             expected: "steps", orderMatters: true),
            TestCaseData(id: "9746FDED-688A-4267-8ADA-92AC536CFA85",
             input: "1s3 PSt\n['step','steps','stripe','stepple','step']",
             expected: "steps", orderMatters: true),
            TestCaseData(id: "FA9CA93A-FB2D-4A3F-9C82-665F2C7A48B3",
             input: "Ah71752\n['suggest','letter','of','husband','drop']",
             expected: "husband", orderMatters: true),
            TestCaseData(id: "9973E6E9-D21E-4F3F-9A63-C70F51CF93FC",
             input: "1s3\n['step']",
             expected: "step", orderMatters: true),
            TestCaseData(id: "7E761463-9722-453F-9EF3-A4B74470D451",
             input: "OgEu840r\n['OgEu840r']",
             expected: "OgEu840r", orderMatters: true),
            TestCaseData(id: "5759767E-6671-40A5-A3D2-2B7278F6A041",
             input: "12345\n['12345']",
             expected: "12345", orderMatters: true),
            TestCaseData(id: "7066482D-2464-4E65-B74F-1F8D4E11724E",
             input: "12345\n['1234','123456']",
             expected: "1234", orderMatters: true),
            TestCaseData(id: "049C4552-B6CC-4D64-A7AD-31F10AE2F798",
             input: "OgEu840r\n['OgEu840r','python']",
             expected: "OgEu840r", orderMatters: true),
            TestCaseData(id: "9CE41F88-5A83-428B-ADBD-4E813B224225",
             input: "['hello','hello','hello']",
             expected: "hello", orderMatters: true),
            TestCaseData(id: "159341BD-3214-4912-AC6D-F341B096A2D9",
             input: "Ah71752\n['suggest','letter','of','husband','drove','looks']",
             expected: "husband", orderMatters: true),
            TestCaseData(id: "7BC48E2B-FBAC-4E55-B569-9BB9A2F42F40",
             input: "4 4\n['a','b','c']",
             expected: "a", orderMatters: true),
            TestCaseData(id: "29C4AE68-B394-4651-AB56-F21FC24D64B6",
             input: "a\n['a','a']",
             expected: "a", orderMatters: true),
            TestCaseData(id: "C43FBED8-17E3-4CC0-87E5-9BAF7F976727",
             input: "4\n['a','b','c','a','b']",
             expected: "a", orderMatters: true),
            TestCaseData(id: "6063DF35-0225-439D-A826-90F795DBFACD",
             input: "a\n['a','b','a','c']",
             expected: "a", orderMatters: true),
            TestCaseData(id: "0EB121F0-1608-4726-BB5F-A151DC9A5C78",
             input: "a\n['a']",
             expected: "a", orderMatters: true),
            TestCaseData(id: "27CE882C-0C06-4FDF-A98F-BC6D690C0CD6",
             input: "1s3\n['step','steps','stripe','stepple']",
             expected: "step", orderMatters: true),
            TestCaseData(id: "92D127B8-180F-4F5B-9940-639C3EC750FB",
             input: "Ah71752\n['suggest','letter','of','husband','easy','education','drug','prevent','writer','old']",
             expected: "husband", orderMatters: true),
            TestCaseData(id: "F1A3EF1C-5BA5-4252-8C72-A6AE8CC8DA9B",
             input: "Gr8\n['great','rate','greate','gr8','greatly']",
             expected: "gr8", orderMatters: true),
            TestCaseData(id: "9A4BC5A9-FA08-4068-B4B9-FDA9C4A08641",
             input: "2s\n[' python ','steps','are','very', 'easy']",
             expected: "easy", orderMatters: true),
            TestCaseData(id: "17CD1DB0-6E48-4126-9FB0-FE7FC24364D9",
             input: "1s3\n['step','steps','stripe','stepple','step']",
             expected: "step", orderMatters: true),
            TestCaseData(id: "25A8D8F7-F0A3-46D2-9E90-0D0BE0DF2DE9",
             input: "4 4 5 5 \n['looks','pest','stew','show']",
             expected: "pest", orderMatters: true),
            TestCaseData(id: "75E34A07-DEF6-4CEA-972F-82F0331C7EC5",
             input: "O\n['one','two','three']",
             expected: "one", orderMatters: true),
            TestCaseData(id: "EA35A5FF-605E-489E-86AE-E1A20C108BCB",
             input: "4 4 5 5 \n['looks','pest','stew','show','four']",
             expected: "pest", orderMatters: true),
            TestCaseData(id: "7c2b1d5d-bc87-4fed-9718-88fc1eda10d6",
             input: "licensePlate = \"1s3 PSt\", words = [\"step\",\"steps\",\"stripe\",\"stepple\"]",
             expected: "\"steps\"", orderMatters: true),
            TestCaseData(id: "a3d4750c-5245-4342-9b12-e485240f1f84",
             input: "licensePlate = \"1s3 456\", words = [\"looks\",\"pest\",\"stew\",\"show\"]",
             expected: "\"pest\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "shortest-completing-word"
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

            let p_licensePlate = InputParser.parseString(params[0])
            guard p_licensePlate.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: licensePlate string too long (\(p_licensePlate.count))"
                )
                return
            }
            guard let p_words = InputParser.parseStringArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [String]"
                )
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: words array too large (\(p_words.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_licensePlate.count >= 1 && p_licensePlate.count <= 7 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= licensePlate.length <= 7"
                )
                return
            }
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 1000"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 15 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 15"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.shortestCompletingWord(p_licensePlate, p_words)
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
