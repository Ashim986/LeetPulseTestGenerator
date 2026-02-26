import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRotateString {
    private class Solution {
        func rotateString(_ s: String, _ goal: String) -> Bool { return (goal + goal).contains(s) }
    }

    @Suite struct RotateStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3b6d1924-e498-464d-9cc8-c975d7bc594f",
             input: "s = 'a', goal = 'a'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b5366215-de96-4bf5-8b3f-e21526e8720b",
             input: "s = 'ab', goal = 'ba'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c0f12e4d-6015-4611-9ccc-a30f3f4837a7",
             input: "s = 'abc', goal = 'abc'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2d6adaf5-5f43-4b48-ad5c-47f340201041",
             input: "s = 'abc', goal = 'bca'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "afa80b95-ad15-45bb-9e0f-cbae6240e7af",
             input: "s = 'abc', goal = 'cab'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fb3b1796-722d-4f12-834d-7ee80d372ce7",
             input: "s = 'abcd', goal = 'dabc'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3e7485e1-17c0-4950-8c38-4635d85ebe97",
             input: "s = 'abcde', goal = 'eabcd'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "225208ec-1b2e-470a-9652-f1cf6bab01d0",
             input: "s = 'aaaaa', goal = 'aaaaa'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "13341826-5f22-4ccb-85c8-dfd8bb2cba5a",
             input: "s = 'abcde', goal = 'abcdf'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8dec1fe7-bef1-4bb9-a2ee-fa0fdff6d4c8",
             input: "s = 'abcdef', goal = 'defabc'",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f8390b09-6e87-481a-bcf1-3395b738240c",
             input: "s = 'abcdefg', goal = 'gfedcba'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a8034dce-039e-427b-88b9-9f83f18a7cda",
             input: "s = 'abcdefgh', goal = 'gfedcbah'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "426598ad-3cd3-4f0d-b45c-670c05c7f4a1",
             input: "s = 'a', goal = 'b'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3fe1294f-a8ae-4668-afaa-253d82a16d33",
             input: "s = 'ab', goal = 'ac'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bfe5b250-fd73-4239-8509-f61a55b670aa",
             input: "s = 'abc', goal = 'abcd'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ba317608-d234-42da-ac94-9165297e7ab8",
             input: "s = 'abcd', goal = 'abc'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ee779155-c1e7-4021-b85c-ecbaad9cb12c",
             input: "s = 'abcde', goal = 'abcdef'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "98f8b1ef-5092-4494-a561-79832c90acb2",
             input: "s = 'abcdef', goal = 'abcde'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "32741adc-e2df-496a-8888-130d67db97e4",
             input: "s = 'a', goal = ''",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ea7b0e31-cc04-43cc-a5fb-536f12f5ede9",
             input: "s = '', goal = 'a'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c23c0ba7-6a97-4348-bbc2-e6619f75f870",
             input: "s = 'ab', goal = 'abab'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6977752b-71da-423d-9d02-7bc769550563",
             input: "s = 'abab', goal = 'ab'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d234fa0c-b072-45cc-8137-b14e3b58a62b",
             input: "s = 'abc', goal = 'abcabc'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3b89f333-42b1-45bc-9acb-19139bd63411",
             input: "s = 'abcabc', goal = 'abc'",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5caabd77-a37c-44ff-96e2-68a80a071fe2",
             input: "s = 'abcd', goal = 'abcdabcd'",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "rotate-string"
            let topic = "misc"
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
            guard p_s.count >= 1 && p_s.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length, goal.length <= 100"
                )
                return
            }
            guard p_goal.count >= 1 && p_goal.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length, goal.length <= 100"
                )
                return
            }

            let solution = Solution()
            let result = solution.rotateString(p_s, p_goal)
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
