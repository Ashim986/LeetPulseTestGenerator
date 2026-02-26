import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBuddyStrings {
    private class Solution {
        func buddyStrings(_ s: String, _ goal: String) -> Bool {
            if s.count != goal.count { return false }
            if s == goal {
                var seen = Set<Character>()
                for ch in s {
                    if seen.contains(ch) { return true }
                    seen.insert(ch)
                }
                return false
            }

            let sArr = Array(s)
            let gArr = Array(goal)
            var diff: [Int] = []
            for i in 0..<sArr.count {
                if sArr[i] != gArr[i] {
                    diff.append(i)
                    if diff.count > 2 { return false }
                }
            }
            guard diff.count == 2 else { return false }
            let i = diff[0]
            let j = diff[1]
            return sArr[i] == gArr[j] && sArr[j] == gArr[i]
        }
    }

    @Suite struct BuddyStringsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5ab75422-aaf4-4468-b637-4dd9b6fd88cf",
             input: "s = \"abc\", goal = \"abc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7072983d-1c9b-483c-b2b0-5c40f1bbdccf",
             input: "s = \"a\", goal = \"b\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "031a1fec-e028-496e-bffc-4c7277c73567",
             input: "s = \"aa\", goal = \"bb\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d73048e7-17cc-4f63-a0e4-b1b839cfb28b",
             input: "s = \"aaa\", goal = \"aaa\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7c758e61-d56f-40b5-9627-ea7e4ee55b40",
             input: "s = \"abcd\", goal = \"abcd\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b8655d92-5e0f-404c-91db-b508bf78cb22",
             input: "s = \"abcde\", goal = \"abcde\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "401f9a78-36dc-4722-b32c-212639c5b3d2",
             input: "s = \"abcdefgh\", goal = \"abcdefgh\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9225611c-0cd5-4e16-8525-a23a8c89c04b",
             input: "s = \"abcdefghi\", goal = \"abcdefghi\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3bc68830-343b-46d3-ac7a-c40c4722f3b0",
             input: "s = \"abcdefghij\", goal = \"abcdefghij\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "aec0b89e-f033-48f9-a261-1e84d9f93cc4",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", goal = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6fa915c8-530b-46a7-a06d-7c4150c24dd4",
             input: "s = \"abcdefghijklmnopqrstuvwxyzA\", goal = \"abcdefghijklmnopqrstuvwxyzA\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5fada6c1-859a-4f0b-a086-220df63aa196",
             input: "s = \"abcdefghijklmnopqrstuvwxyzAB\", goal = \"abcdefghijklmnopqrstuvwxyzAB\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f969c1a0-9c96-443f-83ee-dc15fa8b232e",
             input: "s = \"abcabc\", goal = \"abcabc\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "44008ddc-b54c-493e-8812-21611da33774",
             input: "s = \"aaaa\", goal = \"aaaa\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "833d5a4f-b25d-49aa-9387-330746a61ba7",
             input: "s = \"aaaa\", goal = \"aaab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e16fad03-0160-4bc3-8b3d-02665833bcff",
             input: "s = \"aaaa\", goal = \"abaa\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1d391656-c819-4cde-aa39-cb3ee1fbd5cd",
             input: "s = \"abc\", goal = \"bca\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ccf3dbee-e4d5-4935-8b4d-e60edb1e4651",
             input: "s = \"\", goal = \"\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0a34edf1-0bb7-46d7-b5f4-500ad08ab320",
             input: "s = \"a\", goal = \"a\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "36fa9fb4-a495-4c92-848f-75163c152129",
             input: "s = \"abcd\", goal = \"dcba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "48c6a93d-4aa8-429c-8d02-bb58ae356ab3",
             input: "s = \"abcde\", goal = \"edcba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7ac35ca1-f07c-4a84-a9a9-7ce20e11716e",
             input: "s = \"abcdefgh\", goal = \"hgfedcba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1a398ba2-b146-4463-8d1f-9b6d18e536b7",
             input: "s = \"abcdefghi\", goal = \"ihgfedcba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9ec29472-c42a-4097-ac94-c4e513317077",
             input: "s = \"abcdefghij\", goal = \"jihgfedcba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ce246565-9194-46ff-8ec1-8c55ac6ad1c1",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\", goal = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "buddy-strings"
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
            let p_goal = InputParser.parseString(params[1])
            guard p_goal.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: goal string too long (\(p_goal.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 20000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length, goal.length <= 2 * 10^4"
                )
                return
            }
            guard p_goal.count >= 1 && p_goal.count <= 20000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length, goal.length <= 2 * 10^4"
                )
                return
            }

            let solution = Solution()
            let result = solution.buddyStrings(p_s, p_goal)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
