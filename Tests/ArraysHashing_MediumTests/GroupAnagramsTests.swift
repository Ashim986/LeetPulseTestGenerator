import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGroupAnagrams {
    private class Solution {
        func groupAnagrams(_ strs: [String]) -> [[String]] {
            var groups: [String: [String]] = [:]
            for s in strs {
                let key = String(s.sorted())
                groups[key, default: []].append(s)
            }
            return Array(groups.values)
        }
    }

    @Suite struct GroupAnagramsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2D4F3DC0-F202-41C6-A135-0ADE7DDD1DEA",
             input: "[\"\"]",
             expected: "[[\"\"]]", orderMatters: false),
            TestCaseData(id: "6C8AFF60-A3F8-4C28-80E9-A73F0810BC42",
             input: "[\"a\"]",
             expected: "[[\"a\"]]", orderMatters: false),
            TestCaseData(id: "E8A6CBD9-E911-4204-ABDF-F3DB918982DC",
             input: "[\"\", \"\", \"\"]",
             expected: "[[\"\",\"\",\"\"]]", orderMatters: false),
            TestCaseData(id: "DA93C50F-E43B-459F-9F45-302FB4767D8D",
             input: "[\"abc\", \"bca\", \"cab\"]",
             expected: "[[\"abc\",\"bca\",\"cab\"]]", orderMatters: false),
            TestCaseData(id: "16F75F22-140B-4FA2-99EC-E99D6418BE21",
             input: "[\"anagram\", \"nagaram\", \"car\"]",
             expected: "[[\"anagram\",\"nagaram\"],[\"car\"]]", orderMatters: false),
            TestCaseData(id: "2cbc47d7-c2bd-445c-916a-ce790e8d18d4",
             input: "strs = [\"abc\", \"cba\", \"bca\", \"cab\"]",
             expected: "[[\"abc\", \"cba\", \"bca\", \"cab\"]]", orderMatters: false),
            TestCaseData(id: "a8b026cf-c891-4cb9-8229-8f11a2dd2fd6",
             input: "strs = []",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "e6720449-6148-4835-a6b5-40d12570c92b",
             input: "strs = [\"abc\"]",
             expected: "[[\"abc\"]]", orderMatters: false),
            TestCaseData(id: "5d6431ef-36e6-442c-9adf-d1bdfa36cb58",
             input: "strs = [\"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\"]",
             expected: "[[\"abc\"], [\"def\"], [\"ghi\"], [\"jkl\"], [\"mno\"], [\"pqr\"], [\"stu\"], [\"vwx\"], [\"yz\"]]", orderMatters: false),
            TestCaseData(id: "d540f84e-888c-4fc2-a4e9-12b3c6e401ac",
             input: "strs = [\"abc\", \"abc\", \"def\", \"def\", \"ghi\", \"ghi\"]",
             expected: "[[\"abc\", \"abc\"], [\"def\", \"def\"], [\"ghi\", \"ghi\"]]", orderMatters: false),
            TestCaseData(id: "f6c44417-6d75-4032-bcff-9709b70af686",
             input: "strs = [\"abc\", \"bca\", \"cab\", \"def\", \"dfe\", \"fed\"]",
             expected: "[[\"abc\", \"bca\", \"cab\"], [\"def\", \"dfe\", \"fed\"]]", orderMatters: false),
            TestCaseData(id: "03b921d0-21d2-4d80-a175-f9990a0cc3fe",
             input: "strs = [\"a\", \"a\", \"a\", \"a\", \"a\"]",
             expected: "[[\"a\", \"a\", \"a\", \"a\", \"a\"]]", orderMatters: false),
            TestCaseData(id: "97e5e0ea-6b74-4433-a197-3ea4be5bb6da",
             input: "strs = [\"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\", \"abc\"]",
             expected: "[[\"abc\", \"abc\"], [\"def\"], [\"ghi\"], [\"jkl\"], [\"mno\"], [\"pqr\"], [\"stu\"], [\"vwx\"], [\"yz\"]]", orderMatters: false),
            TestCaseData(id: "141b46b2-d080-46f9-a97e-764a0ec569dd",
             input: "strs = [\"abc\", \"def\", \"ghi\", \"jkl\", \"mno\", \"pqr\", \"stu\", \"vwx\", \"yz\", \"abc\", \"def\", \"ghi\"]",
             expected: "[[\"abc\", \"abc\"], [\"def\", \"def\"], [\"ghi\", \"ghi\"], [\"jkl\"], [\"mno\"], [\"pqr\"], [\"stu\"], [\"vwx\"], [\"yz\"]]", orderMatters: false),
            TestCaseData(id: "DB33DD3E-9188-4DC8-933D-82AFD1A827A8",
             input: "[\"eat\", \"tea\", \"tan\", \"ate\", \"nat\", \"bat\"]",
             expected: "[[\"bat\"],[\"ate\",\"eat\",\"tea\"],[\"nat\",\"tan\"]]", orderMatters: false),
            TestCaseData(id: "33B0B805-3886-4B40-9530-5FC4F11FB3C5",
             input: "[\"listen\", \"silent\", \"hello\", \"world\", \"listen\"]",
             expected: "[[\"hello\"],[\"listen\",\"listen\",\"silent\"],[\"world\"]]", orderMatters: false),
            TestCaseData(id: "AD3377F5-9F02-4A07-B616-4041C3710F00",
             input: "[\"rat\", \"car\", \"tar\", \"arc\", \"arts\", \"star\"]",
             expected: "[[\"arc\",\"car\"],[\"arts\",\"star\"],[\"rat\",\"tar\"]]", orderMatters: false),
            TestCaseData(id: "8768D79B-8EED-4DED-9C34-1A79EF8B2D66",
             input: "[\"a\", \"\", \"b\", \"a\", \"\", \"b\"]",
             expected: "[[\"\",\"\"],[\"a\",\"a\"],[\"b\",\"b\"]]", orderMatters: false),
            TestCaseData(id: "96177855-1880-4A5B-849F-7709E0BEC9B8",
             input: "[\"abc\",\"cba\",\"bac\",\"def\",\"fed\",\"ghi\"]",
             expected: "[[\"abc\",\"bac\",\"cba\"],[\"def\",\"fed\"],[\"ghi\"]]", orderMatters: false),
            TestCaseData(id: "35c93a22-8a9c-4c20-8d8a-ee4c2524c638",
             input: "strs = [\"abc\", \"bca\", \"cab\", \"abc\", \"bca\", \"cab\"]",
             expected: "[[\"abc\",\"bca\",\"cab\",\"abc\",\"bca\",\"cab\"]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "group-anagrams"
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

            guard let p_strs = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_strs.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: strs array too large (\(p_strs.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_strs.count >= 1 && p_strs.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= strs.length <= 10^4"
                )
                return
            }
            guard p_strs.allSatisfy({ $0.count >= 0 && $0.count <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= strs[i].length <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[String]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.groupAnagrams(p_strs)
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
