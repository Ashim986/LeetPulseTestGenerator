import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongPressedName {
    private class Solution {
        func isLongPressedName(_ name: String, _ typed: String) -> Bool {
            var p1 = 0
            var p2 = 0
            while p2 < typed.count {
                if p1 < name.count && name[name.index(name.startIndex, offsetBy: p1)] == typed[typed.index(typed.startIndex, offsetBy: p2)] {
                    p1 += 1
                } else if p1 == 0 || typed[typed.index(typed.startIndex, offsetBy: p2)] != name[name.index(name.startIndex, offsetBy: p1 - 1)] {
                    return false
                }
                p2 += 1
            }
            return p1 == name.count
        }
    }

    @Suite struct LongPressedNameTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6d4f4ccd-c240-4b14-9958-1adc5bccb4d6",
             input: "name = 'a', typed = 'a'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "29326d46-1101-4019-a21e-b82181b54d72",
             input: "name = '', typed = ''",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0546cb36-05ce-4fc8-a4ea-9ef3c8f800de",
             input: "name = 'abc', typed = 'abc'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cf2f14d6-d355-46b3-ab66-9797b0d78800",
             input: "name = 'abc', typed = 'abcd'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4211aae9-0568-43a8-b43b-02ad4b326e27",
             input: "name = 'a', typed = 'aa'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5f8dcb18-6ed2-4ab8-af63-b0e40e8d8433",
             input: "name = 'ab', typed = 'aab'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2e7dbb08-0ee3-44fb-91e2-5dd2c12c0462",
             input: "name = 'ab', typed = 'aba'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2e6d6b81-a5ae-4698-a8ee-e7213b36db7d",
             input: "name = 'abc', typed = 'abbc'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "28b90957-7c34-49d2-9019-d2e5bcb7a4bf",
             input: "name = 'abcd', typed = 'abbbcd'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ee8efb8a-28f6-4695-a7fd-e291c712154e",
             input: "name = 'abc', typed = 'abcc'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "010c5f0d-4b88-4de2-94f8-753daea4fe21",
             input: "name = 'a', typed = 'b'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e7c7d1a9-fa83-47eb-80e6-4d9173edb3d5",
             input: "name = 'ab', typed = 'ba'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5eb0d079-3d10-483d-b836-15a24afce99b",
             input: "name = 'abc', typed = 'bca'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "fc30ad3d-de41-4cd6-8d82-3f7cc92ea2fc",
             input: "name = 'abcd', typed = 'dcba'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "409aa5b2-9bb6-4e0c-9109-82fa7d1feb2f",
             input: "name = 'a', typed = 'aaa'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0b1eaf41-bf9a-4563-a56f-85a1a14a5e49",
             input: "name = 'ab', typed = 'aabbb'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c2ba8945-f7e5-42f3-9c6f-7cee4667d92f",
             input: "name = 'abc', typed = 'aabbbccc'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "690a4811-f55c-4cc0-97eb-cbfd1a81704c",
             input: "name = 'abc', typed = 'abcccc'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2042fc3b-5592-4a18-9853-fe38df184d6a",
             input: "name = 'a', typed = 'aaaa'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "912a51ba-2e36-414c-a8d8-f1b26be09d7d",
             input: "name = 'ab', typed = 'abab'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "15789143-5aa8-47fe-be84-b18db6f21240",
             input: "name = 'abc', typed = 'abcabc'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "635b0cb5-954f-41d1-92d4-82c37827feeb",
             input: "name = 'abcd', typed = 'abcdabcd'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b0b1d60a-d0c8-4e55-8a02-4e9376951697",
             input: "name = 'abc', typed = 'ababab'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8821fc86-aa55-47dd-844a-06bf839aca34",
             input: "name = 'a', typed = 'aaaaa'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4bbcb690-bf22-4d74-9fd6-a8005b55a58f",
             input: "name = 'ab', typed = 'aaaaab'",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "long-pressed-name"
            let topic = "two-pointers"
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

            let p_name = InputParser.parseString(params[0])
            guard p_name.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: name string too long (\(p_name.count))"
                )
                return
            }
            let p_typed = InputParser.parseString(params[1])
            guard p_typed.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: typed string too long (\(p_typed.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_name.count >= 1 && p_name.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000"
                )
                return
            }
            guard p_typed.count >= 1 && p_typed.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= name.length, typed.length <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isLongPressedName(p_name, p_typed)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
