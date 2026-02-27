import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReverseWordsInAStringIii {
    private class Solution {
        func reverseWords(_ s: String) -> String {
            return s.components(separatedBy: " ").map {
                String($0.reversed())
            }
            .joined(separator: " ")
        }
    }

    @Suite struct ReverseWordsInAStringIiiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0a446d8b-7963-4b58-86d3-56103d6f44f0",
             input: "s = \"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "f5bc8383-190a-45e5-8753-82d272b9ef67",
             input: "s = \"ab\"",
             expected: "ba", orderMatters: true),
            TestCaseData(id: "9131c3c1-4d46-4219-a101-62e47fdc232c",
             input: "s = \"abc\"",
             expected: "cba", orderMatters: true),
            TestCaseData(id: "008e5a6b-dfcd-47b6-9d59-c43e0fa2d34d",
             input: "s = \"abcd\"",
             expected: "dcba", orderMatters: true),
            TestCaseData(id: "8155a6d6-86e4-45a4-b554-a58e88f45253",
             input: "s = \"abcde\"",
             expected: "edcba", orderMatters: true),
            TestCaseData(id: "896c9b37-8a7f-4a53-851e-74712caae04a",
             input: "s = \"abcdef\"",
             expected: "fedcba", orderMatters: true),
            TestCaseData(id: "597df92b-e50d-4838-be58-a3cb49e0625a",
             input: "s = \"abcdefg\"",
             expected: "gfedcba", orderMatters: true),
            TestCaseData(id: "a4abd866-fa61-45e4-97f8-9405befcf3d3",
             input: "s = \"abcdefgh\"",
             expected: "hgfedcba", orderMatters: true),
            TestCaseData(id: "19b28c00-28c4-4ff0-8e72-23177bca1822",
             input: "s = \"abcdefghi\"",
             expected: "ihgfedcba", orderMatters: true),
            TestCaseData(id: "f83b8a69-e30d-4c41-9405-e3e0cf4b4c4a",
             input: "s = \"j k l\"",
             expected: "j k l", orderMatters: true),
            TestCaseData(id: "362f2204-ea5a-49df-b181-75d4981980dc",
             input: "s = \"a b c d e f g h i j k l m n o p q r s t u v w x y z\"",
             expected: "a b c d e f g h i j k l m n o p q r s t u v w x y z", orderMatters: true),
            TestCaseData(id: "065ba5b1-29ee-4ddf-9752-1777ec9455e3",
             input: "s = \"123 456 789\"",
             expected: "321 654 987", orderMatters: true),
            TestCaseData(id: "4d928391-ec28-4b98-ba5a-ee3b10755eeb",
             input: "s = \"ABCDEFGHIJKLMNOPQRSTUVWXYZ\"",
             expected: "ZYXWVUTSRQPONMLKJIHGFEDCBA", orderMatters: true),
            TestCaseData(id: "25b04327-35df-4707-a972-91519682a073",
             input: "s = \"1234567890\"",
             expected: "0987654321", orderMatters: true),
            TestCaseData(id: "765e763d-3bdf-46bd-81de-b5a8a70aa034",
             input: "s = \"123 456 789 012 345 678 901\"",
             expected: "321 654 987 210 543 876 109", orderMatters: true),
            TestCaseData(id: "720b39a1-24e7-4e93-9e07-12920c5ed89b",
             input: "s = \"a a a a a a a a a a\"",
             expected: "a a a a a a a a a a", orderMatters: true),
            TestCaseData(id: "1e3f2855-d652-43ea-ba1b-4b22c72fa79d",
             input: "s = \"1 2 3 4 5 6 7 8 9 0\"",
             expected: "1 2 3 4 5 6 7 8 9 0", orderMatters: true),
            TestCaseData(id: "24dc4819-0512-44c1-82f0-fa2c1d2f6669",
             input: "s = \"a b c\"",
             expected: "\"a b c\"", orderMatters: true),
            TestCaseData(id: "09829042-5859-4379-9112-36c37c6ec86f",
             input: "s = \"jkl mno pqr\"",
             expected: "lkj onm rqp", orderMatters: true),
            TestCaseData(id: "d514da5b-0c05-43c2-b335-92d7389ecfce",
             input: "s = \"jkl mno pqr stu vwx yz\"",
             expected: "lkj onm rqp uts xwv zy", orderMatters: true),
            TestCaseData(id: "bd4cba8c-8148-43c4-a6ab-4daeeb1f59c5",
             input: "s = \"!@# $%^ &*()\"",
             expected: "#@! ^%$ )(*&", orderMatters: true),
            TestCaseData(id: "ef20dab8-6b07-46ee-85d3-562043df72f0",
             input: "s = \"~!@#$%^&*()_+\"",
             expected: "+_)(*&^%$#@!~", orderMatters: true),
            TestCaseData(id: "7e6aad52-b82f-402d-b7b9-a138e8987397",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "zyxwuvtsrqponmlkjihgfedcba", orderMatters: true),
            TestCaseData(id: "5725a807-f6bf-4e1b-82bf-f188c7554d53",
             input: "s = \"abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ\"",
             expected: "zyxwuvtsrqponmlkjihgfedcba ZYXWVUTSRQPONMLKJIHGFEDCBA", orderMatters: true),
            TestCaseData(id: "fa51f85c-ed0d-4dc5-9510-1f8c62f0efd8",
             input: "s = \"1234567890 ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz\"",
             expected: "0987654321 ZYXWVUTSRQPONMLKJIHGFEDCBA zyxwuvtsrqponmlkjihgfedcba", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reverse-words-in-a-string-iii"
            let topic = "two-pointers"
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
            guard p_s.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 5 * 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.reverseWords(p_s)
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
