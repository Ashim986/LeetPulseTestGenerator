import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPalindromePartitioning {
    private class Solution {
        func partition(_ s: String) -> [[String]] {
            let chars = Array(s)
            var result: [[String]] = []
            var current: [String] = []

            func isPalindrome(_ start: Int, _ end: Int) -> Bool {
                var l = start, r = end
                while l < r {
                    if chars[l] != chars[r] { return false }
                    l += 1; r -= 1
                }
                return true
            }

            func backtrack(_ start: Int) {
                if start == chars.count {
                    result.append(current)
                    return
                }
                for end in start..<chars.count {
                    if isPalindrome(start, end) {
                        current.append(String(chars[start...end]))
                        backtrack(end + 1)
                        current.removeLast()
                    }
                }
            }

            backtrack(0)
            return result
        }
    }

    @Suite struct PalindromePartitioningTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0cb9f07e-2c7f-437d-8bcb-93c8794f4000",
             input: "s = \"a\"",
             expected: "[[\"a\"]]", orderMatters: true),
            TestCaseData(id: "01031bdb-33f9-4dc9-987f-f422e1f2c4f4",
             input: "s = \"aa\"",
             expected: "[[\"a\",\"a\"],[\"aa\"]]", orderMatters: true),
            TestCaseData(id: "9ea07a6a-f574-4398-a035-c41b3163c4c9",
             input: "s = \"ab\"",
             expected: "[[\"a\",\"b\"]]", orderMatters: true),
            TestCaseData(id: "92851dee-baf5-43bc-801a-ad4cef310599",
             input: "s = \"aba\"",
             expected: "[[\"a\",\"b\",\"a\"],[\"aba\"]]", orderMatters: true),
            TestCaseData(id: "8d76f2e9-a3da-4795-a1ec-2816a4489ab7",
             input: "s = \"abc\"",
             expected: "[[\"a\",\"b\",\"c\"]]", orderMatters: true),
            TestCaseData(id: "a1877998-6bbc-4d54-bab3-679fb65f7860",
             input: "s = \"abcd\"",
             expected: "[[\"a\",\"b\",\"c\",\"d\"]]", orderMatters: true),
            TestCaseData(id: "701fd8d2-b39d-44b0-a179-aec816e5d4d3",
             input: "s = \"abcba\"",
             expected: "[[\"a\",\"b\",\"c\",\"b\",\"a\"],[\"a\",\"bcb\",\"a\"],[\"abcba\"]]", orderMatters: true),
            TestCaseData(id: "00d1b57d-a390-481c-a5be-4f07e9bab0ab",
             input: "s = \"racecar\"",
             expected: "[[\"r\",\"a\",\"c\",\"e\",\"c\",\"a\",\"r\"],[\"r\",\"a\",\"cec\",\"a\",\"r\"],[\"r\",\"aceca\",\"r\"],[\"racecar\"]]", orderMatters: true),
            TestCaseData(id: "5c6a21f5-8027-4411-ba81-ba1dd901ff10",
             input: "s = \"radar\"",
             expected: "[[\"r\",\"a\",\"d\",\"a\",\"r\"],[\"r\",\"ada\",\"r\"],[\"radar\"]]", orderMatters: true),
            TestCaseData(id: "339768f0-4eee-42d3-a8f0-f2639abe172b",
             input: "s = \"madam\"",
             expected: "[[\"m\",\"a\",\"d\",\"a\",\"m\"],[\"m\",\"ada\",\"m\"],[\"madam\"]]", orderMatters: true),
            TestCaseData(id: "7c102e07-c36e-459c-994d-f68aca626279",
             input: "s = \"pop\"",
             expected: "[[\"p\",\"o\",\"p\"],[\"pop\"]]", orderMatters: true),
            TestCaseData(id: "6b195ae4-0fb2-4fb2-9a14-3bddfac1e430",
             input: "s = \"abccba\"",
             expected: "[[\"a\",\"b\",\"c\",\"c\",\"b\",\"a\"],[\"a\",\"b\",\"cc\",\"b\",\"a\"],[\"a\",\"bccb\",\"a\"],[\"abccba\"]]", orderMatters: true),
            TestCaseData(id: "b11decc2-f05d-4b22-a4f3-251d8585781e",
             input: "s = \"deified\"",
             expected: "[[\"d\",\"e\",\"i\",\"f\",\"i\",\"e\",\"d\"],[\"d\",\"e\",\"ifi\",\"e\",\"d\"],[\"d\",\"eifie\",\"d\"],[\"deified\"]]", orderMatters: true),
            TestCaseData(id: "e92b7639-1c6a-4d73-a02e-5813987a8732",
             input: "s = \"level\"",
             expected: "[[\"l\",\"e\",\"v\",\"e\",\"l\"],[\"l\",\"eve\",\"l\"],[\"level\"]]", orderMatters: true),
            TestCaseData(id: "a0338694-da48-4e09-bbd3-5a65adfa8b11",
             input: "s = \"refer\"",
             expected: "[[\"r\",\"e\",\"f\",\"e\",\"r\"],[\"r\",\"efe\",\"r\"],[\"refer\"]]", orderMatters: true),
            TestCaseData(id: "78c7b7d8-f2e9-43a1-a7b2-109d16a8c0fa",
             input: "s = \"noon\"",
             expected: "[[\"n\",\"o\",\"o\",\"n\"],[\"n\",\"oo\",\"n\"],[\"noon\"]]", orderMatters: true),
            TestCaseData(id: "81148afe-4f98-4c65-81e4-0425e639d7cc",
             input: "s = \" Stats\"",
             expected: "[[\" \",\"S\",\"t\",\"a\",\"t\",\"s\"],[\" \",\"S\",\"tat\",\"s\"]]", orderMatters: true),
            TestCaseData(id: "94c20449-ca51-4774-8270-b7b5a5fbe876",
             input: "s = \"Kayak\"",
             expected: "[[\"K\",\"a\",\"y\",\"a\",\"k\"],[\"K\",\"aya\",\"k\"]]", orderMatters: true),
            TestCaseData(id: "a6a33b5f-6ce6-4d53-a8c4-9023156c4a06",
             input: "s = \"12321\"",
             expected: "[[\"1\",\"2\",\"3\",\"2\",\"1\"],[\"1\",\"232\",\"1\"],[\"12321\"]]", orderMatters: true),
            TestCaseData(id: "854c2ba3-3168-44dd-b770-d23a2faeeddc",
             input: "s = \"123456\"",
             expected: "[[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]]}]", orderMatters: true),
            TestCaseData(id: "4b105ee3-6364-4c53-aa07-d4c4513e7ab4",
             input: "s = \"aab\"",
             expected: "[[\"a\",\"a\",\"b\"],[\"aa\",\"b\"]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "palindrome-partitioning"
            let topic = "backtracking"
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
            guard p_s.count >= 1 && p_s.count <= 16 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 16"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[String]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.partition(p_s)
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

            guard let expectedArrays = InputParser.parse2DStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[String]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                let sortOuter: ([[String]]) -> [[String]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
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
