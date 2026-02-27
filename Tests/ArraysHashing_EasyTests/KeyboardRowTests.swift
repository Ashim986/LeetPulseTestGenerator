import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCKeyboardRow {
    private class Solution {
        func findWords(_ words: [String]) -> [String] {
            let rows = [Set("qwertyuiop"), Set("asdfghjkl"), Set("zxcvbnm")]
            var result: [String] = []
            for word in words {
                let lowerWord = word.lowercased()
                let wordSet = Set(lowerWord)
                for row in rows {
                    if row.isSuperset(of: wordSet) {
                        result.append(word)
                        break
                    }
                }
            }
            return result
        }
    }

    @Suite struct KeyboardRowTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9ffc1fb7-964a-465b-89be-67b2bb8a5f8c",
             input: "words = [\"a\", \"b\", \"c\"]",
             expected: "[\"a\", \"b\", \"c\"]", orderMatters: true),
            TestCaseData(id: "9effc1c9-4b4f-4b8e-b1bb-68b090e93cc4",
             input: "words = [\"qwe\", \"asd\", \"zxc\"]",
             expected: "[\"qwe\", \"asd\", \"zxc\"]", orderMatters: true),
            TestCaseData(id: "dfef0a63-fd36-44bc-9eb0-c4d512812068",
             input: "words = [\"QWERTYUIOP\", \"ASDFGHJKL\", \"ZXCVBNM\"]",
             expected: "[\"QWERTYUIOP\", \"ASDFGHJKL\", \"ZXCVBNM\"]", orderMatters: true),
            TestCaseData(id: "f92b1347-011b-4615-953d-d64d98e67627",
             input: "words = [\"qwerty\", \"asdfg\", \"zxcvb\"]",
             expected: "[\"qwerty\", \"asdfg\", \"zxcvb\"]", orderMatters: true),
            TestCaseData(id: "4399a5c3-f2db-4a08-85f6-9b823a9ec75e",
             input: "words = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", "
                + "\"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\"]",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \""
                + "t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\"]", orderMatters: true),
            TestCaseData(id: "fd46218d-b42c-4a1a-963f-34e7ce4e4cce",
             input: "words = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "9cdb764e-3f52-41f0-9fd0-a4f722638524",
             input: "words = [\"a\"]",
             expected: "[\"a\"]", orderMatters: true),
            TestCaseData(id: "cfd43211-d165-43a2-95d5-b781d7362888",
             input: "words = [\"ab\"]",
             expected: "[\"ab\"]", orderMatters: true),
            TestCaseData(id: "4654a674-5599-482f-aff6-1969894e422a",
             input: "words = [\"a\", \"a\", \"a\", \"a\", \"a\"]",
             expected: "[\"a\", \"a\", \"a\", \"a\", \"a\"]", orderMatters: true),
            TestCaseData(id: "1441981d-ab05-4672-87cf-9ee3fecec040",
             input: "words = [\"ab\", \"ab\", \"ab\", \"ab\", \"ab\"]",
             expected: "[\"ab\", \"ab\", \"ab\", \"ab\", \"ab\"]", orderMatters: true),
            TestCaseData(id: "4bc319be-3e98-434d-9796-7462836834e9",
             input: "words = [\"abc\", \"abc\", \"abc\", \"abc\", \"abc\"]",
             expected: "[\"abc\", \"abc\", \"abc\", \"abc\", \"abc\"]", orderMatters: true),
            TestCaseData(id: "5141a91a-0e49-4929-a993-876d47afc60f",
             input: "words = [\"abcd\", \"abcd\", \"abcd\", \"abcd\", \"abcd\"]",
             expected: "[\"abcd\", \"abcd\", \"abcd\", \"abcd\", \"abcd\"]", orderMatters: true),
            TestCaseData(id: "700b75f4-8026-4195-9ec9-abe1a00b7a4f",
             input: "words = [\"z\", \"z\", \"z\", \"z\", \"z\"]",
             expected: "[\"z\", \"z\", \"z\", \"z\", \"z\"]", orderMatters: true),
            TestCaseData(id: "d7dfc056-bd8d-49ad-9644-dbce94e6b0c6",
             input: "words = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", "
                + "\"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\", \"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l"
                + "\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\"]",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \""
                + "t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\", \"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\""
                + ", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\"]", orderMatters: true),
            TestCaseData(id: "66b9b402-54f7-4bfe-ade2-20e132755b2d",
             input: "words = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", "
                + "\"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\", \"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\", \"K\", \"L"
                + "\", \"M\", \"N\", \"O\", \"P\", \"Q\", \"R\", \"S\", \"T\", \"U\", \"V\", \"W\", \"X\", \"Y\", \"Z\"]",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \""
                + "t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\", \"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\", \"K\", \"L\", \"M\""
                + ", \"N\", \"O\", \"P\", \"Q\", \"R\", \"S\", \"T\", \"U\", \"V\", \"W\", \"X\", \"Y\", \"Z\"]", orderMatters: true),
            TestCaseData(id: "caf9d7d7-c93a-478c-a377-d631e8fdc4a7",
             input: "words = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", "
                + "\"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\", \"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"0\"]",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \""
                + "t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\"]", orderMatters: true),
            TestCaseData(id: "822932b8-d63f-4e7e-96d7-9d7e94a08b10",
             input: "words = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", "
                + "\"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\", \"!\", \"@\", \"#\", \"$\", \"%\", \"^\", \"&\", \"*\", \"(\"]",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \""
                + "t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\"]", orderMatters: true),
            TestCaseData(id: "d878277c-afdf-4a17-82aa-cc29cc93129a",
             input: "words = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", "
                + "\"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\", \" \"]",
             expected: "[\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \""
                + "t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\"]", orderMatters: true),
            TestCaseData(id: "00875208-5c15-4610-bd79-b8d9216a1431",
             input: "words = [\"abc\", \"bcd\", \"cde\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "7be81db5-522e-4832-878c-316735d04564",
             input: "words = [\"hello\", \"world\", \"python\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "3a1d0fcb-bd77-420d-bb23-626ac0db057c",
             input: "words = [\"apple\", \"banana\", \"cherry\"]",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "539162b7-632b-43fe-a755-023f6ab87128",
             input: "words = [\"abcde\", \"fghij\", \"klmno\"]",
             expected: "[\"fghij\"]", orderMatters: true),
            TestCaseData(id: "eb5bb1f9-4f29-45ce-bea7-1647acfd4bba",
             input: "words = [\"abc\", \"def\", \"ghi\"]",
             expected: "[\"abc\"]", orderMatters: true),
            TestCaseData(id: "387a05e4-224f-4b6e-aa13-9ba82982fef7",
             input: "words = [\"abcd\", \"efgh\", \"ijkl\", \"mnop\"]",
             expected: "[\"abcd\"]", orderMatters: true),
            TestCaseData(id: "aeba9d9c-404b-4772-b5de-7e2e6ee9061d",
             input: "words = [\"abcde\", \"fghij\", \"klmno\", \"pqrst\", \"uvwxy\", \"z\"]",
             expected: "[\"z\"]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "keyboard-row"
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
            guard p_words.count >= 1 && p_words.count <= 20 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 20"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [String]?
            let didCrash = withCrashGuard {
                resultHolder = solution.findWords(p_words)
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
