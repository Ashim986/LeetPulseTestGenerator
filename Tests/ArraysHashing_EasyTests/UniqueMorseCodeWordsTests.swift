import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUniqueMorseCodeWords {
    private class Solution {
        let morseCodes: [Character: String] = [
            "a": ".-",
                "b": "-...",
                "c": "-.-.",
                "d": "-..",
                "e": ".",
                "f": "..-.",
                "g": "--.",
                "h": "....",
                "i": "..",
                "j": ".---",
                "k": "-.-",
                "l": ".-..",
                "m": "--",
                "n": "-.",
                "o": "---",
                "p": ".--.",
                "q": "--.-",
                "r": ".-.",
                "s": "...",
                "t": "-",
                "u": "..-",
                "v": "...-",
                "w": ".--",
                "x": "-..-",
                "y": "-.--",
                "z": "--.."
        ]

        func uniqueMorseRepresentations(_ words: [String]) -> Int {
            var uniqueCodes: Set<String> = []

            for word in words {
                let code = String(word.map { morseCodes[$0] ?? "" }.joined())
                uniqueCodes.insert(code)
            }

            return uniqueCodes.count
        }
    }

    @Suite struct UniqueMorseCodeWordsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6ac04bd1-b737-465a-afe5-7d9676203bbe",
             input: "words = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "82e50836-4d36-4ef6-8ff5-42f80461c508",
             input: "words = [\"a\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "95542172-2328-4957-81b8-e79dbe859aa6",
             input: "words = [\"a\", \"b\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d98efb4f-376b-4710-97be-139d25ba53a3",
             input: "words = [\"a\", \"a\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "81d20010-32f1-4dd6-a468-d6639252d6c7",
             input: "words = [\"ab\", \"ba\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "014ae4b1-ccbe-4d43-bded-590ceac02652",
             input: "words = [\"abc\", \"bca\", \"cab\"]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "7aabe1dd-557d-4e05-84ea-4c930baf0fbc",
             input: "words = [\"abc\", \"abc\", \"abc\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e9afa7f4-59d4-4774-b7de-b7479a525185",
             input: "words = [\"abcd\", \"dcba\", \"cbad\", \"dabc\"]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "a9af89f9-22c4-4af2-a2cc-6f099a2ee37e",
             input: "words = [\"abcde\", \"edcba\", \"cbade\", \"deabc\", \"ebacd\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "369df728-29d3-42bf-b744-44c90958c4e9",
             input: "words = [\"abcdefghijklmnopqrstuvwxyz\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "123bbd35-7e14-4780-98a7-e4f98321826d",
             input: "words = [\"abcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyz\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ac55b10b-f081-4614-b0c4-060ce2b0d13b",
             input: "words = [\"abcdefghijklmnopqrstuvwxyz\", \"zyxwvutsrqponmlkjihgfedcba\"]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "01ed93ca-8677-40c4-a330-01a064ebb99d",
             input: "words = [\"a\", \"aa\", \"aaa\", \"aaaa\", \"aaaaa\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "93f8a90e-b57a-4073-9892-f4d43c243bb9",
             input: "words = [\"b\", \"bb\", \"bbb\", \"bbbb\", \"bbbbb\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "8855a112-629a-44b7-b824-466c2fb9fde4",
             input: "words = [\"c\", \"cc\", \"ccc\", \"cccc\", \"ccccc\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b922ed0c-5184-48f9-abec-c2c00029084d",
             input: "words = [\"d\", \"dd\", \"ddd\", \"dddd\", \"ddddd\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "04f1becd-b99c-43c6-8437-13757ee1a4a3",
             input: "words = [\"e\", \"ee\", \"eee\", \"eeee\", \"eeeee\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "d70263dd-a35a-47f8-8709-8b73a979c24a",
             input: "words = [\"f\", \"ff\", \"fff\", \"ffff\", \"fffff\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ea85aa82-7f8a-4308-a8b2-47d3997c3378",
             input: "words = [\"g\", \"gg\", \"ggg\", \"gggg\", \"ggggg\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "bc95b578-2df0-4bbc-b4ee-ce84f68c67e7",
             input: "words = [\"h\", \"hh\", \"hhh\", \"hhhh\", \"hhhhh\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ce5ea43a-8d5a-44c2-884b-f12fe3579721",
             input: "words = [\"i\", \"ii\", \"iii\", \"iiii\", \"iiiii\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "9c7b3e0b-b668-4ea8-869e-507be1026252",
             input: "words = [\"j\", \"jj\", \"jjj\", \"jjjj\", \"jjjjj\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "732ae4ae-72ba-4a5c-baea-8a5ce91bdeec",
             input: "words = [\"k\", \"kk\", \"kkk\", \"kkkk\", \"kkkkk\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ef48cb2f-685f-4105-b416-4784fc9f4f9d",
             input: "words = [\"l\", \"ll\", \"lll\", \"llll\", \"lllll\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5411c5db-327a-45b2-b6bf-eae110e9aa5c",
             input: "words = [\"m\", \"mm\", \"mmm\", \"mmmm\", \"mmmmm\"]",
             expected: "5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "unique-morse-code-words"
            let topic = "arrays-hashing"
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

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
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
            guard p_words.count >= 1 && p_words.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 100"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 12 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 12"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.uniqueMorseRepresentations(p_words)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
