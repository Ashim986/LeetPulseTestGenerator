import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPowerOfFour {
    private class Solution {
        func isPowerOfFour(_ n: Int) -> Bool {
          if n <= 0 {
            return false
          }
          let binary = String(n, radix: 2)
          let countOnes = binary.filter { $0 == "1" }.count
          let countZeros = binary.filter { $0 == "0" }.count
          if countOnes != 1 {
            return false
          }
          return countZeros % 2 == 0
        }
    }

    @Suite struct PowerOfFourTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "e5f05eff-510c-40fc-993d-428702742810",
             input: "n = 4",
             expected: "true", orderMatters: true),
            TestCaseData(id: "11313814-1178-4c04-8f66-9a3c7a566c71",
             input: "n = 64",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6dcd680b-5e95-44f2-a442-0cf1887b9105",
             input: "n = 256",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f5a3f27c-4e99-49e0-a549-f5cef8ee9dfe",
             input: "n = 1024",
             expected: "true", orderMatters: true),
            TestCaseData(id: "26da95ec-cb51-424b-a909-983d6459040f",
             input: "n = 0",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f81c8548-f429-4a1c-88b8-558db1bffa4d",
             input: "n = -4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "73e961ab-adce-414b-bf19-497d1a2588e5",
             input: "n = -16",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e2d85ea9-6ddf-41c3-96bd-b5762d6a2025",
             input: "n = -64",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5cd5058d-ff3a-47c9-bf17-6f8cffc3d7f7",
             input: "n = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a57c639d-ac2a-4dec-9586-f6547ae8d9e0",
             input: "n = 5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "db850753-d3b1-477b-9bac-bb2ced3babe1",
             input: "n = 6",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ac6ef2d6-398c-4ccc-b0b4-47870f7a0704",
             input: "n = 8",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8db8003f-4e6a-41fe-98fa-7425f4573748",
             input: "n = 9",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7fe08f31-e47b-451e-a08e-4d46c07beb6c",
             input: "n = 10",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ce04795c-20c2-4757-b2f8-848704f81dd8",
             input: "n = 12",
             expected: "false", orderMatters: true),
            TestCaseData(id: "986efff4-1079-4942-a090-15656f34b496",
             input: "n = 15",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1149c5a5-0009-43f7-a4b3-1d6667dc08cd",
             input: "n = 24",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7d63563a-b717-4dc2-8881-673aa33d963c",
             input: "n = 27",
             expected: "false", orderMatters: true),
            TestCaseData(id: "be827687-3fa7-4c52-81ae-34057044ea18",
             input: "n = 32",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b12c3b96-8d86-4ce0-8815-bd092479bc9a",
             input: "n = 40",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5d0a64c3-d748-43f9-b666-66ffe48136cd",
             input: "n = 48",
             expected: "false", orderMatters: true),
            TestCaseData(id: "013426eb-70cf-41c3-8f48-b3dddaf636ef",
             input: "n = 63",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3f0da6fa-7cc9-4267-8366-1ae9433058fd",
             input: "n = 80",
             expected: "false", orderMatters: true),
            TestCaseData(id: "34042916-c182-4be8-9872-8fe8bf150d76",
             input: "n = 96",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9b936f8f-f0e9-43f8-8266-b1146e89a23b",
             input: "n = 128",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "power-of-four"
            let topic = "math-geometry"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= -231 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= n <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.isPowerOfFour(p_n)
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
