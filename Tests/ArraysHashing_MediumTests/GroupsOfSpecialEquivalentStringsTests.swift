import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGroupsOfSpecialEquivalentStrings {
    private class Solution {
        func numSpecialEquivGroups(_ A: [String]) -> Int {
            var groups = Set<String>()
            for s in A {
                var signature = String()
                var evenChars = [Character]()
                var oddChars = [Character]()
                for (index, char) in s.enumerated() {
                    if index % 2 == 0 {
                        evenChars.append(char)
                    } else {
                        oddChars.append(char)
                    }
                }
                let sortedEven = String(evenChars.sorted())
                let sortedOdd = String(oddChars.sorted())
                signature = sortedEven + sortedOdd
                groups.insert(signature)
            }
            return groups.count
        }
    }

    @Suite struct GroupsOfSpecialEquivalentStringsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5a110a4c-1264-4cae-801c-3355a91e566d",
             input: "A = [\"aa\",\"bb\",\"ab\",\"ba\"]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "849d1007-51c2-4090-b723-8d13537af5d2",
             input: "A = [\"aaa\",\"bbb\",\"abab\",\"baba\"]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "44cdc955-5849-440f-94e4-0e076da8c031",
             input: "A = [\"a\",\"a\",\"a\",\"a\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bf58102b-370f-4be3-a5fd-a7e07277b0d2",
             input: "A = [\"b\",\"b\",\"b\",\"b\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0c85e8d2-4483-44ec-9841-474d9efe993d",
             input: "A = [\"a\",\"b\",\"c\",\"d\",\"e\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "35203dc9-3050-4d86-ad43-cf2acaac7711",
             input: "A = [\"aa\",\"bb\",\"cc\",\"dd\",\"ee\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "7e920768-732d-4e5e-817a-a13dd789f2c2",
             input: "A = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "10a400ca-5cbe-47e8-b277-d16e4729b85d",
             input: "A = [\"a\",\"aa\",\"aaa\",\"aaaa\",\"aaaaa\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "09fb8517-1bfd-45c4-968c-98cd09ad93ba",
             input: "A = [\"b\",\"bb\",\"bbb\",\"bbbb\",\"bbbbb\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5cf4a1c2-bbc8-4623-8152-f5ce72ac4774",
             input: "A = [\"ab\",\"abab\",\"ababab\",\"abababab\",\"ababababab\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a25a2dca-c912-416c-adbe-63d2e1f710e8",
             input: "A = [\"ba\",\"baba\",\"bababa\",\"babababa\",\"bababababa\"]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "271146f3-0e40-47f7-955a-a3254ec6442c",
             input: "A = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0eaede09-99e0-49cb-a09a-892419321e21",
             input: "A = [\"\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "97da8c34-93a9-4039-860d-ed1af8ecdcda",
             input: "A = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\",\"v\""
                + ",\"w\",\"x\",\"y\",\"z\"]",
             expected: "26", orderMatters: true),
            TestCaseData(id: "b30a891b-5164-4571-a30a-63e0017203cb",
             input: "A = [\"aa\",\"bb\",\"cc\",\"dd\",\"ee\",\"ff\",\"gg\",\"hh\",\"ii\",\"jj\",\"kk\",\"ll\",\"mm\",\"nn\",\"oo\",\"pp\",\"qq\",\"rr\",\"ss"
                + "\",\"tt\",\"uu\",\"vv\",\"ww\",\"xx\",\"yy\",\"zz\"]",
             expected: "26", orderMatters: true),
            TestCaseData(id: "01b88562-d5a1-424f-b051-08ce312a6be0",
             input: "A = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\",\"pqr\",\"stu\",\"vwx\",\"yz\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "1ec5c1bd-7e59-4c56-ab8f-22e013197184",
             input: "A = [\"a\",\"aa\",\"aaa\",\"aaaa\",\"aaaaa\",\"aaaaaa\",\"aaaaaaa\",\"aaaaaaaa\",\"aaaaaaaaa\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "480b0e12-b1e1-4f3b-93bd-176374d2caab",
             input: "A = [\"b\",\"bb\",\"bbb\",\"bbbb\",\"bbbbb\",\"bbbbbb\",\"bbbbbbb\",\"bbbbbbbb\",\"bbbbbbbbb\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "ffdc6da5-9bf2-4f8a-b2c5-2b642ce33234",
             input: "A = [\"ab\",\"abab\",\"ababab\",\"abababab\",\"ababababab\",\"abababababab\",\"ababababababab\",\"abababababababab\",\"ababababababababa"
                + "b\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "5824ca0b-5f76-4419-9ebf-5ac58baef67b",
             input: "A = [\"ba\",\"baba\",\"bababa\",\"babababa\",\"bababababa\",\"babababababa\",\"bababababababa\",\"babababababababa\",\"babababababababab"
                + "a\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "1a265f22-749e-41fd-8a9f-182b42b98850",
             input: "A = [\"abcde\",\"edcba\",\"abcde\",\"edcba\",\"abcde\",\"edcba\",\"abcde\",\"edcba\",\"abcde\",\"edcba\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3c698fe0-fe5f-4a22-8f6f-492ba2497bb8",
             input: "A = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\",\"v\""
                + ",\"w\",\"x\",\"y\",\"z\",\"aa\",\"bb\",\"cc\",\"dd\",\"ee\"]",
             expected: "31", orderMatters: true),
            TestCaseData(id: "95cbec9a-37d0-4beb-ac63-f100ab3c2b06",
             input: "A = [\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\",\"pqr\",\"stu\",\"vwx\",\"yz\",\"abc\",\"def\",\"ghi\",\"jkl\",\"mno\",\"pqr\",\"stu\",\"vw"
                + "x\",\"yz\"]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "665f5831-a31f-478b-8d91-04a6d43714b0",
             input: "A = [\"a\",\"aa\",\"aaa\",\"aaaa\",\"aaaaa\",\"aaaaaa\",\"aaaaaaa\",\"aaaaaaaa\",\"aaaaaaaaa\",\"aaaaaaaaaa\"]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "0a7d2c08-ee3d-46cb-b58c-a56c0f8de957",
             input: "A = [\"b\",\"bb\",\"bbb\",\"bbbb\",\"bbbbb\",\"bbbbbb\",\"bbbbbbb\",\"bbbbbbbb\",\"bbbbbbbbb\",\"bbbbbbbbbb\"]",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "groups-of-special-equivalent-strings"
            let topic = "arrays-hashing"
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

            guard let p_A = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.count >= 1 && p_A.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words.length <= 1000"
                )
                return
            }
            guard p_A.allSatisfy({ $0.count >= 1 && $0.count <= 20 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= words[i].length <= 20"
                )
                return
            }

            let solution = Solution()
            let result = solution.numSpecialEquivGroups(p_A)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
