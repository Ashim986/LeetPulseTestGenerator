import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRepeatedStringMatch {
    private class Solution {
        func repeatedStringMatch(_ a: String, _ b: String) -> Int {
            let bLength = b.count
            let aLength = a.count
            let minRepeats = Int(ceil(Double(bLength) / Double(aLength)))
            let maxRepeats = minRepeats + 2

            for repeats in minRepeats...maxRepeats {
                var repeatedA = String(repeating: a, count: repeats)
                if repeatedA.contains(b) {
                    return repeats
                }
            }

            return -1
        }
    }

    @Suite struct RepeatedStringMatchTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8f0b6e7b-4f70-4ff7-a510-a16a7c3951da",
             input: "a = \"a\", b = \"aa\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d7eaa56c-0f01-4f49-a188-0826722ea3cc",
             input: "a = \"a\", b = \"a\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "028345f7-82ff-4f25-bd4e-91524a6b0276",
             input: "a = \"abc\", b = \"abc\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "51dc1036-b27b-4712-ae66-21dd73420a18",
             input: "a = \"abc\", b = \"def\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "349fe761-9076-4b09-944b-21d03aa06486",
             input: "a = \"abc\", b = \"abcabcabcabcabc\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "fb301dd2-b93e-44ad-a777-c1763e9bc52e",
             input: "a = \"a\", b = \"aaaaaaaa\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "46316027-2618-48ce-83c8-6bbe43c9adeb",
             input: "a = \"ab\", b = \"abababab\"",
             expected: "4", orderMatters: true),
            TestCaseData(id: "b06c1614-04d9-47d6-9808-d3c61ab53069",
             input: "a = \"a\", b = \"b\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "e0167889-07eb-4589-b58a-873b9a788653",
             input: "a = \"abc\", b = \"abcabcab\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2e87e2d8-1e00-4ef3-96e3-3ebbe563966d",
             input: "a = \"abc\", b = \"ababcabc\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ce96a67d-edec-496e-9c8d-8f821b448290",
             input: "a = \"abc\", b = \"abcababc\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "7ed1b5e0-5b7c-4465-8b2e-63df70c3df4d",
             input: "a = \"abc\", b = \"abcabcabcabcabcabc\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "9866b800-8d77-4240-b353-a7e7f64b753a",
             input: "a = \"ab\", b = \"abababababab\"",
             expected: "6", orderMatters: true),
            TestCaseData(id: "541abd11-dd54-45b6-88d0-d890a8b17686",
             input: "a = \"abc\", b = \"abcabcabcabcabcabcabc\"",
             expected: "7", orderMatters: true),
            TestCaseData(id: "a4bffe72-e11a-47a6-8c2b-b6a2b92f815b",
             input: "a = \"abc\", b = \"d\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "b1bc9169-6349-4871-ac85-9641d5f1cc56",
             input: "a = \"abc\", b = \"e\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "680386e3-dd1c-4dba-9cc3-fde3c942a7da",
             input: "a = \"abc\", b = \"f\"",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "5e6707d1-9a5b-4dac-9473-da13cc0d2729",
             input: "a = \"abc\", b = \"abcabcabcabcabcabcabcabc\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "6163e658-d0b7-4a25-9786-662355d3d344",
             input: "a = \"ab\", b = \"abababababababab\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "e3669b6f-000c-4e71-80c5-f808557fbc76",
             input: "a = \"abc\", b = \"abcabcabcabcabcabcabcabcabc\"",
             expected: "9", orderMatters: true),
            TestCaseData(id: "a8e59202-6641-40fa-bf0d-2fafd9c47985",
             input: "a = \"abc\", b = \"abcabcabcabcabcabcabcabcabcabc\"",
             expected: "10", orderMatters: true),
            TestCaseData(id: "ea72a2d4-5375-4778-b971-bce8cbfa3aa0",
             input: "a = \"abc\", b = \"abcabcabcabcabcabcabcabcabcabcabc\"",
             expected: "11", orderMatters: true),
            TestCaseData(id: "69c92e3e-2956-466d-8540-2b3e6bc71970",
             input: "a = \"abc\", b = \"abcabcabcabcabcabcabcabcabcabcabcabc\"",
             expected: "12", orderMatters: true),
            TestCaseData(id: "4af7da9e-e385-4a4c-ad35-e95950e3894d",
             input: "a = \"abc\", b = \"abcabcabcabcabcabcabcabcabcabcabcabcabc\"",
             expected: "13", orderMatters: true),
            TestCaseData(id: "eee280a2-ad88-4497-bec9-e9bc1ac5aa9e",
             input: "a = \"abc\", b = \"abcabcabcabcabcabcabcabcabcabcabcabcabcabc\"",
             expected: "14", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "repeated-string-match"
            let topic = "misc"
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

            let p_a = InputParser.parseString(params[0])
            guard p_a.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: a string too long (\(p_a.count))"
                )
                return
            }
            let p_b = InputParser.parseString(params[1])
            guard p_b.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: b string too long (\(p_b.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_a.count >= 1 && p_a.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= a.length, b.length <= 104"
                )
                return
            }
            guard p_b.count >= 1 && p_b.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= a.length, b.length <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.repeatedStringMatch(p_a, p_b)
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
