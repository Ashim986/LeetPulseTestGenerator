import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFirstUniqueCharacterInAString {
    private class Solution {
        func firstUniqChar(_ s: String) -> Int {
          var charCount: [Character: Int] = [:]
          for char in s {
            if let count = charCount[char] {
              charCount[char] = count + 1
            } else {
              charCount[char] = 1
            }
          }
          for (index, char) in s.enumerated() {
            if charCount[char].unsafelyUnwrapped == 1 {
              return index
            }
          }
          return -1
        }
    }

    @Suite struct FirstUniqueCharacterInAStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "338FA149-2098-4F6D-99FC-2E3B4C884912",
             input: "leetcode",
             expected: "0", orderMatters: true),
            TestCaseData(id: "84D76D8A-922C-46AC-A171-853C277C6386",
             input: "loveleetcode",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5CF93490-FA13-4032-99D6-4D4D569102EE",
             input: "a",
             expected: "0", orderMatters: true),
            TestCaseData(id: "654E80B9-BC11-440C-917E-11E07E5EF10D",
             input: "aa",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "0EFF5E4B-DEAE-44D2-82CD-FCAD6ACE8835",
             input: "abaccdeff",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3F8A7C3E-71CD-4CB7-AF43-D374142EFF6F",
             input: "abcdefghijklmnopqrstuvwxyz",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5F360557-6D1C-4688-9BEE-E5015C29E029",
             input: "abcabcab",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "DCAE1A4C-39A0-4C3B-9DC4-9920C2B749C4",
             input: "abababab",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "F53CA2AC-35C1-45E7-87EE-D88E374952AA",
             input: "aabbccddeeff",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "926B251F-C47B-4D5D-8A07-F51AF7262A06",
             input: "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "F4D3586F-F03B-436F-A020-684A92E8D057",
             input: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3EFC877C-FE99-456D-86F9-ADD164B9752B",
             input: "aA",
             expected: "0", orderMatters: true),
            TestCaseData(id: "D77F804B-D99E-4B73-9AB1-CE3D42CBFF81",
             input: "123",
             expected: "0", orderMatters: true),
            TestCaseData(id: "11CF41C3-6C34-4F9F-AA3C-F2C8537ABD29",
             input: "123123",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "82E097A4-4C51-47CF-B87B-2A9E890FE340",
             input: "!@#",
             expected: "0", orderMatters: true),
            TestCaseData(id: "62B6DE9E-2638-4420-99FF-D62316120A43",
             input: "!@#!@#",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "3753D827-FC28-44B1-95EF-B309FAEB3C0C",
             input: "a   a",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "0528CE78-FB61-48AE-8A65-EC4FCA37C089",
             input: "abc",
             expected: "0", orderMatters: true),
            TestCaseData(id: "C3384D6E-AABF-4A90-BD8D-7AD87BFE0D4C",
             input: "abcabc",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "CDE7D357-4CFE-4444-B59A-387EBA048000",
             input: "aabbcc",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "EA449FA6-AC3A-441D-A196-6E53297158C0",
             input: "ab",
             expected: "0", orderMatters: true),
            TestCaseData(id: "D479736E-7CBB-4178-900A-B4C7A7C0EF6C",
             input: "aabbccdd",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "C35D48E0-8ABC-42C8-9B7A-7670B58CDE39",
             input: "abcdefgh",
             expected: "0", orderMatters: true),
            TestCaseData(id: "60737BED-B932-43CD-8766-BA20FE12450E",
             input: "abcdabcd",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "950F3F58-C7ED-4F79-A3B2-92BA04923BA6",
             input: "aaa",
             expected: "-1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "first-unique-character-in-a-string"
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
            guard p_s.count >= 1 && p_s.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 10^5"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.firstUniqChar(p_s)
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
