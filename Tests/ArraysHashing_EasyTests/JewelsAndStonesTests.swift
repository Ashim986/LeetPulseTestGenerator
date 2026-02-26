import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCJewelsAndStones {
    private class Solution {
        func numJewelsInStones(_ J: String, _ S: String) -> Int {
            let stoneFreq = Array(S).reduce(into: [Character:Int]()) {
                $0[$1, default:0] += 1
            }
            return Array(J).reduce(0) {
                $0 + (stoneFreq[$1] ?? 0)
            }
        }
    }

    @Suite struct JewelsAndStonesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "13f2b179-1ea1-4b20-acce-da4395bfce38",
             input: "J = 'a', S = 'a'",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8a625545-0690-4afb-8e20-900ef4b3837c",
             input: "J = 'A', S = 'A'",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7ed06893-d5d9-4867-a517-6f4efd0d244c",
             input: "J = '', S = 'a'",
             expected: "0", orderMatters: true),
            TestCaseData(id: "92d3b352-162b-417f-ad72-b181dfde276c",
             input: "J = 'a', S = ''",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fbc42f98-b33b-47cd-a93c-aff662de8e10",
             input: "J = '', S = ''",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ad0d9be9-504e-477f-b539-f6f30775aec3",
             input: "J = 'abc', S = 'abc'",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f018c11c-bd81-470e-b291-6bebda2d840d",
             input: "J = 'ABC', S = 'ABC'",
             expected: "3", orderMatters: true),
            TestCaseData(id: "719b19bf-55a1-45d1-a323-16c323c1cfba",
             input: "J = 'aA', S = 'a'",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e998ce5c-9ce2-4fb0-af17-ce57f837205d",
             input: "J = 'a', S = 'aA'",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1ddd0129-281a-44df-b090-4f5efe99e861",
             input: "J = 'ab', S = 'ba'",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2770cb91-8b28-4f81-8d4b-f48a123da007",
             input: "J = 'a', S = 'b'",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2e91e1c7-d1ee-42f1-b7d0-8d1f1415f20d",
             input: "J = 'aA', S = 'bB'",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9620e635-6177-483e-b22c-9785eb767987",
             input: "J = 'a', S = 'aaaa'",
             expected: "4", orderMatters: true),
            TestCaseData(id: "0cae740d-d2ca-43d4-b86d-4eff91e2d06c",
             input: "J = 'a', S = 'bbbb'",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4b8a40d9-ae82-4e9a-8a9f-7e6581015704",
             input: "J = 'abc', S = 'bca'",
             expected: "3", orderMatters: true),
            TestCaseData(id: "793a8a88-b7c0-49d9-8397-325214f14ecb",
             input: "J = 'abc', S = 'def'",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fc7d2d57-8dab-4f50-8c4e-49ac6fec3492",
             input: "J = 'aA', S = 'aAaA'",
             expected: "4", orderMatters: true),
            TestCaseData(id: "962374ed-d33a-4bf5-bd2c-f1a8c2ea1d86",
             input: "J = 'abc', S = 'abcabc'",
             expected: "6", orderMatters: true),
            TestCaseData(id: "aec4b938-5432-49d9-93c1-5dd5491f10df",
             input: "J = 'a', S = 'a' * 1000",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "7a9610a1-895e-4be0-9bff-7aa87cad3ba9",
             input: "J = 'a' * 1000, S = 'a'",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6c6c6461-81d5-499f-9700-6eab13cbaaed",
             input: "J = 'aA', S = 'aA' * 500",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "59e9dfd1-7be8-46ed-943f-31c5d8b0a014",
             input: "J = 'abc', S = 'def' * 1000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8bbce13b-a566-431a-886a-8fdda60492a2",
             input: "J = 'aA', S = 'bB' * 1000",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ab7256fb-e036-4f55-b32a-fcee2bc51944",
             input: "J = 'a', S = 'a' * 1000 + 'b' * 1000",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "3e8be24f-bcbb-469d-ad36-08ea3f9259f0",
             input: "J = 'aA', S = 'aA' * 1000 + 'bB' * 1000",
             expected: "2000", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "jewels-and-stones"
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

            let p_J = InputParser.parseString(params[0])
            guard p_J.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: J string too long (\(p_J.count))"
                )
                return
            }
            let p_S = InputParser.parseString(params[1])
            guard p_S.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: S string too long (\(p_S.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_J.count >= 1 && p_J.count <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= jewels.length, stones.length <= 50"
                )
                return
            }
            guard p_S.count >= 1 && p_S.count <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= jewels.length, stones.length <= 50"
                )
                return
            }

            let solution = Solution()
            let result = solution.numJewelsInStones(p_J, p_S)
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
