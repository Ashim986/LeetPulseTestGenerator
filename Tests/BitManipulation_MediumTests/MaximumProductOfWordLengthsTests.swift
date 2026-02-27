import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumProductOfWordLengths {
    private class Solution {
        func maxProduct(words: [String]) -> Int {
            let n = words.count
            var masks = [Int]()
            var maxProduct = 0
            for word in words {
                var mask = 0
                for char in word {
                    let bit = 1 << (UnicodeScalar(String(char)).unsafelyUnwrapped.value - 97)
                    mask |= Int(bit)
                }
                masks.append(mask)
            }
            for i in 0..<n {
                for j in (i+1)..<n {
                    if (masks[i] & masks[j]) == 0 {
                        maxProduct = max(maxProduct, words[i].count * words[j].count)
                    }
                }
            }
            return maxProduct
        }
    }

    @Suite struct MaximumProductOfWordLengthsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "826aa289-ef70-47ff-8cf1-f473d48e60a5",
             input: "words = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5e596a84-dfc5-4c32-afc6-9451a2803dac",
             input: "words = [\"a\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "94885ba2-154a-4234-9d85-289412e51b80",
             input: "words = [\"abc\", \"def\", \"ghi\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "d1d3802d-a523-4917-87c7-0522dc6d375c",
             input: "words = [\"abc\", \"def\", \"abc\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "c6bfdb34-4056-43cb-acfc-660b8e18282f",
             input: "words = [\"\", \"a\", \"aa\", \"aaa\", \"aaaa\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "62338cc1-2bb4-4c27-8950-273ee1fbda6f",
             input: "words = [\"a\", \"a\", \"a\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "069364c1-2426-4459-9d01-0dcac589c353",
             input: "words = [\"abcdefghijklmnopqrstuvwxyz\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dbb2f7f7-ce37-4a8a-961e-a0d84395494e",
             input: "words = [\"aa\", \"aa\", \"aa\", \"aa\", \"aa\", \"aa\", \"aa\", \"aa\", \"aa\", \"aa\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6180af19-da8f-4483-ae58-ed2c07595e00",
             input: "words = [\"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\", \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "120fff98-9103-4642-978e-fdba7f61b4a8",
             input: "words = [\"apple\",\"banana\",\"orange\",\"grape\",\"mango\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "45b70e7b-c65d-40c4-aa73-41c85b8409df",
             input: "words = [\"a\", \"b\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "22d8d1f2-5f40-4181-b122-f76b9f27462a",
             input: "words = [\"a\", \"aa\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a82fccaa-0884-4b7f-a2c2-788a8f957971",
             input: "words = [\"a\", \"b\", \"c\", \"d\", \"e\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ec995813-25d3-4872-9a89-468169f792bb",
             input: "words = [\"abc\", \"abcd\", \"abcde\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5a39c027-348a-4a90-89d0-330fbec154ae",
             input: "words = [\"abc\", \"def\", \"ghi\", \"jkl\", \"mno\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "1b30a882-6c7e-4c2c-9f7e-5d7aab7f5f25",
             input: "words = [\"a\", \"aa\", \"aaa\", \"aaaa\", \"aaaaa\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e0cb2c86-6183-4dad-bd97-6288231e420e",
             input: "words = [\"abc\", \"abc\", \"abc\", \"abc\", \"abc\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "45bc0d61-3464-460a-8974-1391e466ac49",
             input: "words = [\"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "d702d579-eda6-4566-9600-1d99645538da",
             input: "words = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f34f354e-458b-4c2e-9607-7636c1edb5b9",
             input: "words = [\"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\", \"abc\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "3d11a7ec-72a8-4f55-8e3e-fcffcd4d4e6d",
             input: "words = [\"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\", \"abc\", \"def\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "20aa677d-ec59-43c5-8a30-2b1b75d3b552",
             input: "words = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", "
                + "\"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "37e5c742-fecd-4fc3-b276-44290a14b187",
             input: "words = [\"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\", \"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \""
                + "pqr\", \"stu\", \"vwx\", \"yz\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "7dea36b5-a5d2-4676-b4ee-61b1b5082e28",
             input: "words = [\"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\", \"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \""
                + "pqr\", \"stu\", \"vwx\", \"yz\", \"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "94809ea7-86c7-4f6f-9656-a10231926237",
             input: "words = [\"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\", \"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \""
                + "pqr\", \"stu\", \"vwx\", \"yz\", \"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\", \"abc\", \"def\", \"ghi"
                + "\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\"]",
             expected: "9", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-product-of-word-lengths"
            let topic = "bit-manipulation"
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
            guard p_words.count >= 2 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= words.length <= 1000"
                )
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxProduct(words: p_words)
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
