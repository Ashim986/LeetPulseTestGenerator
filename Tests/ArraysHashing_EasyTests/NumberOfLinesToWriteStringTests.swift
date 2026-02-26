import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfLinesToWriteString {
    private class Solution {
        func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
            let a = Int(UnicodeScalar("a").value)
            var lines = 1
            var currentWidth = 0

            for scalar in s.unicodeScalars {
                let idx = Int(scalar.value) - a
                let w = (0..<widths.count).contains(idx) ? widths[idx] : 0
                if currentWidth + w > 100 {
                    lines += 1
                    currentWidth = w
                } else {
                    currentWidth += w
                }
            }

            return [lines, currentWidth]
        }
    }

    @Suite struct NumberOfLinesToWriteStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "001c1b29-f907-40c3-b582-8ea8992d0d66",
             input: "widths = [1,2,3,4,5,6,7,8,9,10], s = \"a\"",
             expected: "[1,1]", orderMatters: true),
            TestCaseData(id: "20af6a84-9e7f-47d9-a26b-55ddaec50636",
             input: "widths = [1,1,1,1,1,1,1,1,1,1], s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "[26,1]", orderMatters: true),
            TestCaseData(id: "7a42ecc1-18f2-4c73-9401-e5e4c9ef955f",
             input: "widths = [10,10,10,10,10,10,10,10,10,10], s = \"a\"",
             expected: "[1,10]", orderMatters: true),
            TestCaseData(id: "66491511-d83b-4154-927a-1e41a6fca020",
             input: "widths = [1,1,1,1,1,1,1,1,1,1], s = \"a\"",
             expected: "[1,1]", orderMatters: true),
            TestCaseData(id: "e50570d6-61c5-4ae1-9f46-47109fea5ff2",
             input: "widths = [10,20,30,40,50,60,70,80,90,100], s = \"a\"",
             expected: "[1,10]", orderMatters: true),
            TestCaseData(id: "1d8869d4-7d27-404d-a1f2-198912d93814",
             input: "widths = [1,2,3,4,5,6,7,8,9,10], s = \"aaaaaa\"",
             expected: "[1,6]", orderMatters: true),
            TestCaseData(id: "dda3024b-89bb-41cb-9ed9-073d5fcdfcc3",
             input: "widths = [1,1,1,1,1,1,1,1,1,1], s = \"aaaaaa\"",
             expected: "[1,6]", orderMatters: true),
            TestCaseData(id: "8a7175d3-aa13-4aa8-b55e-22989f81815d",
             input: "widths = [10,10,10,10,10,10,10,10,10,10], s = \"\"",
             expected: "[1,0]", orderMatters: true),
            TestCaseData(id: "81b720b9-5069-47ef-b44c-79cdc60a723b",
             input: "widths = [10,20,30,40,50,60,70,80,90,100], s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "[7,100]", orderMatters: true),
            TestCaseData(id: "8eb760d1-f6f2-4482-ad01-2937a45969d7",
             input: "widths = [1,2,3,4,5,6,7,8,9,10], s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "[1,55]", orderMatters: true),
            TestCaseData(id: "780c0bc1-89ed-4268-a653-169492613a5c",
             input: "widths = [1,2,3,4,5,6,7,8,9,10], s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "[2,10]", orderMatters: true),
            TestCaseData(id: "8b96a214-7a1c-4a30-a5ad-72f0940b1479",
             input: "widths = [10,10,10,10,10,10,10,10,10,10], s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "[2,100]", orderMatters: true),
            TestCaseData(id: "c1b60cc9-64b5-4e9c-b8bc-b8be5fc42229",
             input: "widths = [1,1,1,1,1,1,1,1,1,1], s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "[1,20]", orderMatters: true),
            TestCaseData(id: "0f1ca7e4-4b7d-4190-aa9c-58aa58868aff",
             input: "widths = [10,20,30,40,50,60,70,80,90,100], s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "[14,100]", orderMatters: true),
            TestCaseData(id: "acd9d58d-2593-4feb-9ab5-a504600af705",
             input: "widths = [1,2,3,4,5,6,7,8,9,10], s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "[2,65]", orderMatters: true),
            TestCaseData(id: "324c4e6b-9805-4a99-a0ce-739190c11cf2",
             input: "widths = [10,10,10,10,10,10,10,10,10,10], s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "[3,100]", orderMatters: true),
            TestCaseData(id: "9106aff0-cc61-4abe-a20d-8b173a04cadf",
             input: "widths = [1,1,1,1,1,1,1,1,1,1], s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "[1,30]", orderMatters: true),
            TestCaseData(id: "e931d68b-0a62-44b3-a320-284019c9857f",
             input: "widths = [10,20,30,40,50,60,70,80,90,100], s = \"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz\"",
             expected: "[21,100]", orderMatters: true),
            TestCaseData(id: "e27fedb8-6061-47bc-b726-5d30749b040c",
             input: "widths = [10,10,10,10,10,10,10,10,10,10], s = \"aaaaaa\"",
             expected: "[1,60]", orderMatters: true),
            TestCaseData(id: "9aa10d0d-01db-4088-97b2-a1d0ff91bc03",
             input: "widths = [10,20,30,40,50,60,70,80,90,100], s = \"aaaaaa\"",
             expected: "[1,60]", orderMatters: true),
            TestCaseData(id: "c20091aa-1fb0-4f1e-aaaf-1859b4fa78e3",
             input: "widths = [1,2,3,4,5,6,7,8,9,10], s = \"aaaaaaaaaaaaaaaaaa\"",
             expected: "[1,18]", orderMatters: true),
            TestCaseData(id: "a11e55b3-a457-4258-ac21-e9726fa33567",
             input: "widths = [10,10,10,10,10,10,10,10,10,10], s = \"aaaaaaaaaaaaaaaaaa\"",
             expected: "[2,80]", orderMatters: true),
            TestCaseData(id: "93cb1bfa-54c0-4130-b97e-3abf1d1ac941",
             input: "widths = [1,1,1,1,1,1,1,1,1,1], s = \"aaaaaaaaaaaaaaaaaa\"",
             expected: "[1,18]", orderMatters: true),
            TestCaseData(id: "53d2c64e-2ae2-4142-a0a4-4235c702b0d9",
             input: "widths = [10,20,30,40,50,60,70,80,90,100], s = \"aaaaaaaaaaaaaaaaaa\"",
             expected: "[2,80]", orderMatters: true),
            TestCaseData(id: "f7b478e2-af75-45f7-93ab-1ddab8fc6b1a",
             input: "widths = [1,2,3,4,5,6,7,8,9,10], s = \"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\"",
             expected: "[1,30]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-lines-to-write-string"
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

            guard let p_widths = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_widths.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: widths array too large (\(p_widths.count))"
                )
                return
            }
            let p_s = InputParser.parseString(params[1])
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
            guard p_widths.allSatisfy({ $0 >= 2 && $0 <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= widths[i] <= 10"
                )
                return
            }
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 1000"
                )
                return
            }
            guard p_widths.count == 26 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: widths.length == 26"
                )
                return
            }

            let solution = Solution()
            let result = solution.numberOfLines(p_widths, p_s)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
