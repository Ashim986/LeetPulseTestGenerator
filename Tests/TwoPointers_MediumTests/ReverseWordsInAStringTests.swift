import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseWordsInAString {
    private class Solution {
        func reverseWords(_ s: String) -> String {
            var chars = Array(s)
            var start = 0
            for i in 0..<chars.count {
                if chars[i] == " " {
                    reverse(&chars, start: start, end: i - 1)
                    start = i + 1
                }
            }
            reverse(&chars, start: start, end: chars.count - 1)
            reverse(&chars, start: 0, end: chars.count - 1)
            return String(chars).trimmingCharacters(in: .whitespaces)
        }
        func reverse(_ chars: inout [Character], start: Int, end: Int) {
            var left = start
            var right = end
            while left < right {
                (chars[left], chars[right]) = (chars[right], chars[left])
                left += 1
                right -= 1
            }
        }
    }

    @Suite struct ReverseWordsInAStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "cb575a35-b1fa-49a5-a4e3-aece4aa72ee6",
             input: "s = \"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "68be6ebc-d695-4a63-9324-2023eaf657a7",
             input: "s = \"ab\"",
             expected: "ab", orderMatters: true),
            TestCaseData(id: "262c757c-7bbb-4fef-8796-bc4044886d53",
             input: "s = \"a b\"",
             expected: "b a", orderMatters: true),
            TestCaseData(id: "0ce74ad4-bc6a-4674-bcd3-81fca519f482",
             input: "s = \"   a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "19ac8c6c-fbe0-487f-a917-1fb7a6900e41",
             input: "s = \"a   \"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "a50ee3c7-1ad5-4815-b8ae-3d24b53412c4",
             input: "s = \"a b c\"",
             expected: "c b a", orderMatters: true),
            TestCaseData(id: "9036b39c-1de9-48b4-b54b-e6f0436dc514",
             input: "s = \"a b c d\"",
             expected: "d c b a", orderMatters: true),
            TestCaseData(id: "9bb3244c-31b7-4661-b3ea-d521994457c0",
             input: "s = \"hello world! this is a test\"",
             expected: "test a is this world! hello", orderMatters: true),
            TestCaseData(id: "7bb1df7a-74cd-47ee-833c-82760ad1a211",
             input: "s = \"a a a a a\"",
             expected: "a a a a a", orderMatters: true),
            TestCaseData(id: "e48d55bd-654a-4794-85f5-515fd4beafd2",
             input: "s = \"1 2 3 4 5\"",
             expected: "5 4 3 2 1", orderMatters: true),
            TestCaseData(id: "3bf9c955-0e54-41a5-8ad8-2b9cb2fe89e4",
             input: "s = \"-1 -2 -3 -4 -5\"",
             expected: "-5 -4 -3 -2 -1", orderMatters: true),
            TestCaseData(id: "ed9a9b80-7bc7-4e72-b0fa-ba3a406462d3",
             input: "s = \"a b c d e f g h i j k l m n o p q r s t u v w x y z\"",
             expected: "z y x w v u t s r q p o n m l k j i h g f e d c b a", orderMatters: true),
            TestCaseData(id: "2b7001db-42cc-4285-b291-b4d04ace074f",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "133e5966-ba2a-41f4-94e8-e28e49950509",
             input: "s = \"1234567890\"",
             expected: "1234567890", orderMatters: true),
            TestCaseData(id: "b215c20e-bbb2-4eb9-aa4c-083e612ea51c",
             input: "s = \"!@#$%^&*()_+\"",
             expected: "!@#$%^&*()_+", orderMatters: true),
            TestCaseData(id: "52a6b28c-ce8a-4c66-a4c4-ff42b7565cda",
             input: "s = \"a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0\"",
             expected: "0 9 8 7 6 5 4 3 2 1 z y x w v u t s r q p o n m l k j i h g f e d c b a", orderMatters: true),
            TestCaseData(id: "467b654d-5bf0-430a-9457-c02cf2eaae5c",
             input: "s = \"hello world hello\"",
             expected: "hello world hello", orderMatters: true),
            TestCaseData(id: "69d35b68-f222-46ca-b5e5-c0cbfb340cd5",
             input: "s = \"1 2 3 4 5 6 7 8 9 10\"",
             expected: "10 9 8 7 6 5 4 3 2 1", orderMatters: true),
            TestCaseData(id: "297f857d-44ad-4cb5-a83f-0cb45c298002",
             input: "s = \"abc def ghi jkl mno pqr stu vwx yz\"",
             expected: "yz vwx stu pqr mno jkl ghi def abc", orderMatters: true),
            TestCaseData(id: "38470fc7-9351-42d5-80b4-a4c13c0317aa",
             input: "s = \"\"",
             expected: "\"\"", orderMatters: true),
            TestCaseData(id: "2c028a3f-4ce8-4b07-aa90-02e515ae960f",
             input: "s = \"~`!@#$%^&*()_+-={}:<>?/.,;[]\\\"'\"",
             expected: "~`!@#$%^&*()_+-={}:<>?/.,;[]\"'", orderMatters: true),
            TestCaseData(id: "4f9f1cec-b958-400d-846f-033875d22297",
             input: "s = \"a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 !@#$%^&*()_+\"",
             expected: "!@#$%^&*()_+ 0 9 8 7 6 5 4 3 2 1 z y x w v u t s r q p o n m l k j i h g f e d c b a", orderMatters: true),
            TestCaseData(id: "0460f64c-6e28-4d61-9adb-9045a3ca6170",
             input: "s = \"a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 !@#$%^&*()_+ ~`\"",
             expected: "~` !@#$%^&*()_+ 0 9 8 7 6 5 4 3 2 1 z y x w v u t s r q p o n m l k j i h g f e d c b a", orderMatters: true),
            TestCaseData(id: "96af6eb1-2ce8-4476-8e72-15a1d640afcc",
             input: "s = \"a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 !@#$%^&*()_+ ~`!@#$%^&*()_+\"",
             expected: "~`!@#$%^&*()_+ !@#$%^&*()_+ 0 9 8 7 6 5 4 3 2 1 z y x w v u t s r q p o n m l k j i h g f e d c b a", orderMatters: true),
            TestCaseData(id: "cb19ab54-1d77-491f-9426-d224599094d1",
             input: "s = \"a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 !@#$%^&*()_+ ~`!@#$%^&*()_+ ~`\"",
             expected: "~` !@#$%^&*()_+ ~`!@#$%^&*()_+ 0 9 8 7 6 5 4 3 2 1 z y x w v u t s r q p o n m l k j i h g f e d c b a", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-words-in-a-string"
            let topic = "two-pointers"
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

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.reverseWords(p_s)
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
