import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryStringWithSubstringsRepresenting1ToN {
    private class Solution {
        func queryString(_ S: String, _ N: Int) -> Bool {
            for i in 1...N {
                let binaryString = String(i, radix: 2)
                if !S.contains(binaryString) {
                    return false
                }
            }
            return true
        }
    }

    @Suite struct BinaryStringWithSubstringsRepresenting1ToNTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "42c547c6-cf32-40d5-80d1-f13d21ef10ef",
             input: "S = \"\", N = 1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "26b176b4-bc6b-49c9-b7ce-7d8e41b31413",
             input: "S = \"1\", N = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d00cb2bf-66dc-4aea-8a29-e1997b282e88",
             input: "S = \"0\", N = 1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a92fdf90-c407-41e1-a67f-1ceb700621cd",
             input: "S = \"1010\", N = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6a608811-5f4b-441a-ae49-d3f72d7fcbab",
             input: "S = \"1111\", N = 4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d6a9f72e-afa1-4934-8791-8b96f16c30dd",
             input: "S = \"0000\", N = 4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "47118a73-bd7e-4aaf-8bcc-54ee80c166af",
             input: "S = \"1001\", N = 4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f6738c51-8313-4113-a80f-152a58956de9",
             input: "S = \"11111111\", N = 8",
             expected: "false", orderMatters: true),
            TestCaseData(id: "dd65476d-8d58-417a-9386-3b0bd4394610",
             input: "S = \"00000000\", N = 8",
             expected: "false", orderMatters: true),
            TestCaseData(id: "534a89d9-c651-45a7-90a3-237450a4c858",
             input: "S = \"11001100\", N = 6",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9c16f6ad-c1aa-4659-94e0-db9e09d4b412",
             input: "S = \"11110000\", N = 8",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6b074dd4-9c25-4fea-971c-7142ba894f43",
             input: "S = \"10000001\", N = 8",
             expected: "false", orderMatters: true),
            TestCaseData(id: "cd9ee4a2-620f-4f7b-a0e5-93f53c0a2f0d",
             input: "S = \"11111111\", N = 16",
             expected: "false", orderMatters: true),
            TestCaseData(id: "78030c39-3b46-485f-b7e8-58ac5915f7f1",
             input: "S = \"0000000000000000\", N = 16",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4aef630e-165f-4101-a494-acdc2ab23d89",
             input: "S = \"1100110011001100\", N = 12",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d5bfa703-9a97-4cdf-8c73-c70324c686c9",
             input: "S = \"1111000011110000\", N = 16",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5877e971-d4eb-4712-9a4c-5aebca2718fe",
             input: "S = \"1000000010000000\", N = 16",
             expected: "false", orderMatters: true),
            TestCaseData(id: "09614fb1-f3a4-475f-8fd1-82c891a12982",
             input: "S = \"1111111111111111\", N = 32",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0509e6cc-659e-48e8-90a9-d9d644eb8447",
             input: "S = \"0000000000000000\", N = 32",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2b05f6d0-af7d-445b-ac9e-9cb43c7b1482",
             input: "S = \"11001100110011001100\", N = 24",
             expected: "false", orderMatters: true),
            TestCaseData(id: "91897e3b-1be1-41a3-8d82-be46a26964a0",
             input: "S = \"11110000111100001111\", N = 16",
             expected: "false", orderMatters: true),
            TestCaseData(id: "54decf4a-d181-4c13-b4ef-dcfb08f6ca10",
             input: "S = \"10000000100000001000\", N = 32",
             expected: "false", orderMatters: true),
            TestCaseData(id: "62ab5caf-0a6e-4fa7-8eb0-a597236c2d79",
             input: "S = \"11111111111111111111\", N = 64",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d0830696-abfa-40a3-8711-fea41f2b8fca",
             input: "S = \"00000000000000000000\", N = 64",
             expected: "false", orderMatters: true),
            TestCaseData(id: "54531c12-c7ac-46c1-bd2f-7e0e42259349",
             input: "S = \"110011001100110011001100\", N = 48",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-string-with-substrings-representing-1-to-n"
            let topic = "bit-manipulation"
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

            let p_S = InputParser.parseString(params[0])
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
            guard let p_N = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_S.count >= 1 && p_S.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 1000"
                )
                return
            }
            guard p_N >= 1 && p_N <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.queryString(p_S, p_N)
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
