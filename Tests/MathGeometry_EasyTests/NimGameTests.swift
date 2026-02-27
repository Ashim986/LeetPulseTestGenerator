import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNimGame {
    private class Solution {
        func canWinNim(_ n: Int) -> Bool { return n % 4 != 0 }
    }

    @Suite struct NimGameTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "99c95419-ef68-44cb-87e9-2e8722e65688",
             input: "n = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0b6dc043-6b86-41b4-be7c-1bffbc62333f",
             input: "n = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e7fc1754-be22-475c-98c6-2cdf2158940f",
             input: "n = 3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8758512c-ef23-4184-9361-1b1125bb55e7",
             input: "n = 7",
             expected: "true", orderMatters: true),
            TestCaseData(id: "86538de1-40f9-4dd4-bc9f-d07f0f3cbc2f",
             input: "n = 9",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f8f52795-ab9a-48a6-9668-99fcb230ebee",
             input: "n = 10",
             expected: "true", orderMatters: true),
            TestCaseData(id: "46888db0-315c-48e2-bbb0-b8aa9cf9ac1a",
             input: "n = 11",
             expected: "true", orderMatters: true),
            TestCaseData(id: "de2d6282-d0bf-4734-9316-170e62366a22",
             input: "n = 12",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1ae6e524-5ae0-4045-a4b1-f2891b25e5d2",
             input: "n = 13",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6e65287e-1bae-42e0-85ee-280c2b8932c1",
             input: "n = 14",
             expected: "true", orderMatters: true),
            TestCaseData(id: "26edaffd-1b7c-4e36-8d69-a3ca01b9588c",
             input: "n = 15",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7dcb5ab6-3ffc-4634-9228-c41a66476062",
             input: "n = 17",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2bcf54f2-7d73-44bf-ad3b-460b0563e855",
             input: "n = 19",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ef50a68d-b16d-4a2e-b02d-72f9b6bfd8ea",
             input: "n = 21",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a6a51109-b49f-4deb-8b99-ea53fbca5d4c",
             input: "n = 22",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b88afcfc-2b50-4197-bc31-2a56b9fa45c4",
             input: "n = 23",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7c3df871-1e4b-4b73-92a7-7c4e94b4587a",
             input: "n = 24",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f78dfe30-76b5-4cfd-8e28-fe20be476120",
             input: "n = 25",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5e607715-3c59-4aaa-98c0-ef5e169a03c2",
             input: "n = 26",
             expected: "true", orderMatters: true),
            TestCaseData(id: "087cee5f-6b3e-45b9-9cca-1125ade5332d",
             input: "n = 27",
             expected: "true", orderMatters: true),
            TestCaseData(id: "23e78e75-a49e-460a-948a-feaef942c62d",
             input: "n = 29",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5f403b29-c6a5-4397-86a4-83ed1105f7cb",
             input: "n = 31",
             expected: "true", orderMatters: true),
            TestCaseData(id: "74cfb14b-2068-4f0a-8272-aca36ed3a139",
             input: "n = 33",
             expected: "true", orderMatters: true),
            TestCaseData(id: "87964dfa-09c5-45ec-b196-160cb7d9fa3a",
             input: "n = 34",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e19616b2-42b3-4685-a02b-19c282acaa42",
             input: "n = 35",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "nim-game"
            let topic = "math-geometry"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.canWinNim(p_n)
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
