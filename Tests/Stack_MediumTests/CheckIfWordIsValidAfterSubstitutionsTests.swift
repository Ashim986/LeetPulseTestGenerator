import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCheckIfWordIsValidAfterSubstitutions {
    private class Solution {
        func isValid(word: String) -> Bool {
          let pattern = "ab"
          var stack: [Character] = []
          for char in word {
            if char == "b" && !stack.isEmpty && stack.last == "a" {
              stack.popLast()
            } else {
              stack.append(char)
            }
          }
          return stack.count == 0 || (stack.count == 1 && stack[0] == "c")
        }
    }

    @Suite struct CheckIfWordIsValidAfterSubstitutionsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ca50a949-86c3-4384-9904-9b346f9a7b8f",
             input: "word = \"abcabc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d051577e-f21f-4794-8851-11e5eefb101f",
             input: "word = \"aabbcc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "436c95d9-b73e-46c1-908b-290a592235cd",
             input: "word = \"abcabcabc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ece13396-63bf-4804-bab5-c78c41651ee4",
             input: "word = \"abcabcabcabc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0203526b-0ad6-45cf-82af-beb385d2f8cb",
             input: "word = \"aabbccdd\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7fdb1cc0-060b-42d7-885e-f59785eb3012",
             input: "word = \"abcabcabcabcabc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3f42a710-d792-46e7-b80e-6e48b826af0b",
             input: "word = \"abcabcabcabcabcabc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f3d7102f-efb7-46f8-90d7-89df6eac1c7b",
             input: "word = \"aabbccddeeff\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "531c2e98-ea13-439a-96dc-df45de852a8f",
             input: "word = \"abcabcabcabcabcabcabc\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "eaa598fa-1e4a-4d86-8a68-4e3f3d73a10e",
             input: "word = \"aba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ca3accc7-acc9-4378-99e1-04eaf56d75fa",
             input: "word = \"ab\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8b0a4c6b-829a-4b49-939d-e5a397121110",
             input: "word = \"a\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e25f6753-b1a8-4ac2-a6cf-8a74a84db4b3",
             input: "word = \"\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d9732a43-5299-4843-94fb-eb6ffd6ec2a5",
             input: "word = \"abab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "adf8913d-33a6-4e5f-91bf-1ddb59dcecc2",
             input: "word = \"aaaa\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b18b078b-617b-4cda-8077-db5f3f133905",
             input: "word = \"abba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4e925ae5-6bc3-4c71-94e0-180df8558163",
             input: "word = \"abcba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "dc53cf5f-dc3d-4b38-a126-2edb2eeedd9c",
             input: "word = \"abccba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "87c01912-6f0d-4f6e-9df1-fb993375f8e8",
             input: "word = \"aaaaaa\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "85f75ab9-936c-4ab4-87b4-05f3670e148d",
             input: "word = \"ababab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2936a34d-76c6-4f37-a609-b0fa9ac353b9",
             input: "word = \"abababab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "34478c3c-586a-421f-96e0-4dd614d5d150",
             input: "word = \"ababababab\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5dc064f9-e64c-4b27-b73e-5382461ff58b",
             input: "word = \"abccbaabccba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "46de79de-eaed-4653-9f7e-b56412e2c817",
             input: "word = \"abcbaabcba\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "48598bbc-7c6a-4c80-b708-c3a71be08cf0",
             input: "word = \"abababababab\"",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "check-if-word-is-valid-after-substitutions"
            let topic = "stack"
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

            let p_word = InputParser.parseString(params[0])
            guard p_word.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: word string too long (\(p_word.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_word.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 2 * 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.isValid(word: p_word)
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
