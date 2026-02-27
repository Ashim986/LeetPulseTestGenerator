import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCVowelSpellchecker {
    private class Solution {
        func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
            var exact = Set<String>()
            var capMap: [String: String] = [:]
            var vowelMap: [String: String] = [:]

            func devowel(_ s: String) -> String {
                let vowels = Set(["a", "e", "i", "o", "u"])
                return String(s.lowercased().map { ch in
                    let lower = String(ch)
                    return vowels.contains(lower) ? "*" : lower
                }.joined())
            }

            for word in wordlist {
                exact.insert(word)
                let lower = word.lowercased()
                if capMap[lower] == nil {
                    capMap[lower] = word
                }
                let dv = devowel(word)
                if vowelMap[dv] == nil {
                    vowelMap[dv] = word
                }
            }

            var result: [String] = []
            result.reserveCapacity(queries.count)
            for query in queries {
                if exact.contains(query) {
                    result.append(query)
                    continue
                }
                let lower = query.lowercased()
                if let cap = capMap[lower] {
                    result.append(cap)
                    continue
                }
                let dv = devowel(query)
                if let v = vowelMap[dv] {
                    result.append(v)
                    continue
                }
                result.append("")
            }
            return result
        }
    }

    @Suite struct VowelSpellcheckerTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9ca1756f-6bf1-43a0-ac02-7b0db66c278d",
             input: "wordlist = [\"a\"], queries = [\"a\"]",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "4a465416-a96f-4f38-b9a7-b573fee6c143",
             input: "wordlist = [\"apple\", \"banana\"], queries = [\"apple\", \"banana\"]",
             expected: "[\"apple\", \"banana\"]", orderMatters: true),
            TestCaseData(id: "6e5fd3f0-6875-4bc0-9f9f-c351c88a9864",
             input: "wordlist = [\"apple\"], queries = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "9b10deff-4604-49d5-be58-b022768e96e8",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "92caec7e-70a5-4069-b1a3-1755cae53a06",
             input: "wordlist = [], queries = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "76c5bca8-00f7-4dca-a9e5-e7cffa7a4fb0",
             input: "wordlist = [\"a\", \"b\", \"c\"], queries = [\"a\", \"b\", \"c\"]",
             expected: "[\"a\", \"b\", \"c\"]", orderMatters: true),
            TestCaseData(id: "d2d890cd-f060-4e34-8f61-b8d1a75f2d1f",
             input: "wordlist = [\"a\"], queries = [\"b\"]",
             expected: "[\"\"]", orderMatters: true),
            TestCaseData(id: "6dee61e3-61e7-4fc3-a53e-29a78a5b6d08",
             input: "wordlist = [\"apple\", \"banana\"], queries = [\"appel\", \"banan\"]",
             expected: "[\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "edf23cb8-eebc-478d-9be4-2fbf8a52578a",
             input: "wordlist = [\"apple\", \"banana\"], queries = [\"appel\", \"banan\", \"orange\"]",
             expected: "[\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "b0b84578-7ca7-4fa7-974c-f2d2dd1b7e06",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\"]",
             expected: "[\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "93316c9d-1d4d-4765-9b0f-301395237303",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\"]",
             expected: "[\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "bf2f86b7-1cb0-45d8-b522-76fe9eb8b233",
             input: "wordlist = [], queries = [\"apple\"]",
             expected: "[\"\"]", orderMatters: true),
            TestCaseData(id: "5aca005e-0376-40f3-922d-1cf4d2de8a11",
             input: "wordlist = [\"a\", \"b\", \"c\"], queries = [\"a\", \"b\", \"d\"]",
             expected: "[\"a\",\"b\",\"\"]", orderMatters: true),
            TestCaseData(id: "b2020c9e-3307-48eb-9263-0789c8b30902",
             input: "wordlist = [\"a\", \"b\", \"c\"], queries = [\"d\", \"e\", \"f\"]",
             expected: "[\"\",\"a\",\"\"]", orderMatters: true),
            TestCaseData(id: "0357ace7-8911-465f-9e83-5910cc3cf8f0",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "bc69c650-7009-482a-86ad-697699b63ed2",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\", \"pineapple\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "5e4f8bcf-1565-4a74-b5a5-89bdfb728996",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\", \"pineapple\", \"waterm"
                + "elon\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "64bc6623-23e7-42ef-8e42-b2f9833fc87e",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\", \"pineapple\", \"waterm"
                + "elon\", \"strawberry\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "24eba764-71a8-4214-a80c-2f6d3022a2dd",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\", \"pineapple\", \"waterm"
                + "elon\", \"strawberry\", \"blueberry\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "346e3d7e-fda2-4052-b119-f82e6aa4117d",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\", \"pineapple\", \"waterm"
                + "elon\", \"strawberry\", \"blueberry\", \"raspberry\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "e288eb2b-0cfa-4f41-a74c-8d1e8ed0eb70",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\", \"pineapple\", \"waterm"
                + "elon\", \"strawberry\", \"blueberry\", \"raspberry\", \"blackberry\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "c8b5cac0-7a9b-46f4-840e-c6843eb7ad59",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\", \"pineapple\", \"waterm"
                + "elon\", \"strawberry\", \"blueberry\", \"raspberry\", \"blackberry\", \"cranberry\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "a7ffb297-be85-47f0-bc8a-730ef740626e",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\", \"pineapple\", \"waterm"
                + "elon\", \"strawberry\", \"blueberry\", \"raspberry\", \"blackberry\", \"cranberry\", \"gooseberry\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "c5f97c56-492b-4575-94af-c7cbfb48bdbc",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\", \"pineapple\", \"waterm"
                + "elon\", \"strawberry\", \"blueberry\", \"raspberry\", \"blackberry\", \"cranberry\", \"gooseberry\", \"elderberry\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]", orderMatters: true),
            TestCaseData(id: "af468f5a-3736-48c5-9681-ee50ba33f6ed",
             input: "wordlist = [\"apple\", \"banana\", \"orange\"], queries = [\"appel\", \"banan\", \"orng\", \"grape\", \"mango\", \"pineapple\", \"waterm"
                + "elon\", \"strawberry\", \"blueberry\", \"raspberry\", \"blackberry\", \"cranberry\", \"gooseberry\", \"elderberry\", \"loganberry\"]",
             expected: "[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "vowel-spellchecker"
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

            guard let p_wordlist = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_wordlist.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: wordlist array too large (\(p_wordlist.count))"
                )
                return
            }
            guard let p_queries = InputParser.parseStringArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [String]"
                )
                return
            }
            guard p_queries.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: queries array too large (\(p_queries.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_wordlist.count >= 1 && p_wordlist.count <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= wordlist.length, queries.length <= 5000"
                )
                return
            }
            guard p_queries.count >= 1 && p_queries.count <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= wordlist.length, queries.length <= 5000"
                )
                return
            }
            guard p_wordlist.allSatisfy({ $0.count >= 1 && $0.count <= 7 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= wordlist[i].length, queries[i].length <= 7"
                )
                return
            }
            guard p_queries.allSatisfy({ $0.count >= 1 && $0.count <= 7 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= wordlist[i].length, queries[i].length <= 7"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [String]?
            let didCrash = withCrashGuard {
                resultHolder = solution.spellchecker(p_wordlist, p_queries)
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

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [String]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
