import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPermutationInString {
    private class Solution {
        func checkInclusion(_ s1: String, _ s2: String) -> Bool {
            let a = Array(s1)
            let b = Array(s2)
            if a.count > b.count { return false }

            var count1 = Array(repeating: 0, count: 26)
            var count2 = Array(repeating: 0, count: 26)

            for ch in a {
                let idx = Int(ch.asciiValue.unsafelyUnwrapped - 97)
                count1[idx] += 1
            }
            for i in 0..<a.count {
                let idx = Int(b[i].asciiValue.unsafelyUnwrapped - 97)
                count2[idx] += 1
            }

            var matches = 0
            for i in 0..<26 {
                if count1[i] == count2[i] { matches += 1 }
            }

            var left = 0
            for right in a.count..<b.count {
                if matches == 26 { return true }

                let rIndex = Int(b[right].asciiValue.unsafelyUnwrapped - 97)
                count2[rIndex] += 1
                if count2[rIndex] == count1[rIndex] { matches += 1 }
                else if count2[rIndex] == count1[rIndex] + 1 { matches -= 1 }

                let lIndex = Int(b[left].asciiValue.unsafelyUnwrapped - 97)
                count2[lIndex] -= 1
                if count2[lIndex] == count1[lIndex] { matches += 1 }
                else if count2[lIndex] == count1[lIndex] - 1 { matches -= 1 }

                left += 1
            }

            return matches == 26
        }
    }

    @Suite struct PermutationInStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "E85635DA-4BD1-4E8F-BB4B-A3D71B8015A4",
             input: "ab\neidbaooo",
             expected: "true", orderMatters: true),
            TestCaseData(id: "18E3A10A-D5B9-42A2-A1E8-80FC763E21D1",
             input: "ab\neidboaoo",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0EF81D59-E277-4324-8A82-CCDEEDAC9A44",
             input: "a\na",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5B8BF84E-759A-4ADB-8BDE-0781356B9936",
             input: "abc\ncab",
             expected: "true", orderMatters: true),
            TestCaseData(id: "13CD5680-4755-427E-A10C-DB374562F0E8",
             input: "abc\ncba",
             expected: "true", orderMatters: true),
            TestCaseData(id: "E363B8CA-29FD-4430-8587-AE071892C976",
             input: "abc\ndefabc",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3E92A8F3-5FDD-4E65-932B-9A813D6C8F30",
             input: "abcd\nefgh",
             expected: "false", orderMatters: true),
            TestCaseData(id: "203B03CB-D575-4CD8-BE92-D72C583E61DF",
             input: "abcdefgh\nhgfedcba",
             expected: "true", orderMatters: true),
            TestCaseData(id: "D0110CC8-CCCB-4ACE-9F14-25E5BC4691FE",
             input: "abcdefgh\nabcdeff",
             expected: "false", orderMatters: true),
            TestCaseData(id: "A3014604-05F6-4D8D-B8D0-EB97BD8E068E",
             input: "abcdefgh\nhgfedcbah",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7B1B5104-6307-4A46-B9C1-240FFBE17805",
             input: "abcdefghij\njihgfedcba",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2F55A705-6455-486D-A0E9-27CCFFF1424C",
             input: "abcdefghij\nhgfedcbaij",
             expected: "true", orderMatters: true),
            TestCaseData(id: "F0F6C1A3-2CDC-4781-A3B1-2819C548CBB8",
             input: "abcdefghij\nhgfedcbaix",
             expected: "false", orderMatters: true),
            TestCaseData(id: "CA5EB777-D73B-43E6-B36F-937566E45EAF",
             input: "abcdefghijk\nkjihgfedcba",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4AC9DFB8-74A5-426B-B9A3-82C687363692",
             input: "abcdefghijk\nabcdefghxj",
             expected: "false", orderMatters: true),
            TestCaseData(id: "372F9C1D-7D45-47D1-AD5D-C692F268E9CB",
             input: "abcdefghijkm\nkjihgfedcbax",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7903A0F2-3C5B-4469-9423-3CB8506DF6DC",
             input: "abcdefgh\naa",
             expected: "false", orderMatters: true),
            TestCaseData(id: "E49F694C-D6C9-4DCD-8447-99FCAC1B47F4",
             input: "aa\nabcdefgh",
             expected: "false", orderMatters: true),
            TestCaseData(id: "F49535B1-E0EB-4FAB-9877-1F529F679645",
             input: "abcdefabcdef\nabcdefabcdef",
             expected: "true", orderMatters: true),
            TestCaseData(id: "C08718CB-AEBB-4B77-92B8-1DD8E0673D73",
             input: "abcdefabcdef\nabcdefabcd",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0D7C2423-AEFE-4328-8D52-05E6611FE839",
             input: "abcdefghij\nabcdefgh",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3840B508-A139-4C56-ACA8-FCB49C3627DA",
             input: "abcdefghabcdefgh\nabcdefgh",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9E38971D-22E8-4E28-B77D-2EEC54C351EB",
             input: "eidbaooo",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0A1BAEE7-934F-43B3-B9AE-9725CECC18EF",
             input: "abc\ncbabad",
             expected: "true", orderMatters: true),
            TestCaseData(id: "DD3978F7-6D5B-42FE-A0AE-DB289677E42B",
             input: "abc\ncbbad",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "permutation-in-string"
            let topic = "sliding-window"
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

            let p_s1 = InputParser.parseString(params[0])
            guard p_s1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s1 string too long (\(p_s1.count))"
                )
                return
            }
            let p_s2 = InputParser.parseString(params[1])
            guard p_s2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s2 string too long (\(p_s2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s1.count >= 1 && p_s1.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 104"
                )
                return
            }
            guard p_s2.count >= 1 && p_s2.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s1.length, s2.length <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.checkInclusion(p_s1, p_s2)
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
