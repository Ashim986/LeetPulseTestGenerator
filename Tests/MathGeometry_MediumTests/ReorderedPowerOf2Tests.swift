import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReorderedPowerOf2 {
    private class Solution {
        func reorderedPowerOf2(_ N: Int) -> Bool {
            let numStr = String(N)
            let count = numStr.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
            for i in 0...30 {
                let powerOfTwo = 2 << i
                let powerOfTwoStr = String(powerOfTwo)
                let powerOfTwoCount = powerOfTwoStr.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
                if count == powerOfTwoCount {
                    return true
                }
            }
            return false
        }
    }

    @Suite struct ReorderedPowerOf2Tests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6dee0cc6-1a4e-4420-8597-90af1542b74f",
             input: "N = 0",
             expected: "false", orderMatters: false),
            TestCaseData(id: "22739323-c413-4b70-be29-39967f6e19dd",
             input: "N = -1",
             expected: "false", orderMatters: false),
            TestCaseData(id: "fe89041a-1dd2-49bd-8798-cff8e1ad1558",
             input: "N = 2",
             expected: "true", orderMatters: false),
            TestCaseData(id: "9b60749f-1b1b-4dd3-8bce-a6f11deebed8",
             input: "N = 4",
             expected: "true", orderMatters: false),
            TestCaseData(id: "8632d368-aa55-41e1-a552-dca51118351e",
             input: "N = 8",
             expected: "true", orderMatters: false),
            TestCaseData(id: "b904fc14-28b2-42c9-9508-f37b3cf56206",
             input: "N = 16",
             expected: "true", orderMatters: false),
            TestCaseData(id: "00fd7abb-33e6-4905-9b91-70beebad6b7b",
             input: "N = 32",
             expected: "true", orderMatters: false),
            TestCaseData(id: "b7108032-b9e1-455a-95a4-a0d8c6e71fcc",
             input: "N = 64",
             expected: "true", orderMatters: false),
            TestCaseData(id: "c46a96db-099a-4fbf-9fb4-cee20ff3c94d",
             input: "N = 128",
             expected: "true", orderMatters: false),
            TestCaseData(id: "763c8195-ceed-4a94-8a92-6cbb4eeb1eca",
             input: "N = 256",
             expected: "true", orderMatters: false),
            TestCaseData(id: "99d62f83-8141-4c67-a71a-238a81411719",
             input: "N = 512",
             expected: "true", orderMatters: false),
            TestCaseData(id: "c1aa8eb1-e25c-4259-9ad5-116bc693bc45",
             input: "N = 1024",
             expected: "true", orderMatters: false),
            TestCaseData(id: "14b73820-5baf-483c-af6e-c43ab3f969f1",
             input: "N = 2048",
             expected: "true", orderMatters: false),
            TestCaseData(id: "c719e778-9314-494b-96b2-3c9bd9cc4fd8",
             input: "N = 4096",
             expected: "true", orderMatters: false),
            TestCaseData(id: "10295377-a700-4471-b5b3-3d0deb61414b",
             input: "N = 8192",
             expected: "true", orderMatters: false),
            TestCaseData(id: "e574b3bb-8668-40f9-97f7-53a1e91ecc0d",
             input: "N = 16384",
             expected: "true", orderMatters: false),
            TestCaseData(id: "876bcf45-c5cd-426d-b29d-9bea7aa1819e",
             input: "N = 32768",
             expected: "true", orderMatters: false),
            TestCaseData(id: "075c7d07-65b1-4228-ba87-366f1e90e9f6",
             input: "N = 65536",
             expected: "true", orderMatters: false),
            TestCaseData(id: "bfb5dc16-65c7-4a1b-a88a-84d45de937ad",
             input: "N = 131072",
             expected: "true", orderMatters: false),
            TestCaseData(id: "57438b40-1d4b-402e-ad11-5c01d39d0da1",
             input: "N = 262144",
             expected: "true", orderMatters: false),
            TestCaseData(id: "80e7df2a-7b1d-4986-9d81-a21410af5e11",
             input: "N = 524288",
             expected: "true", orderMatters: false),
            TestCaseData(id: "b23258ab-6ae4-486e-9eff-5e30850ff7bd",
             input: "N = 1048576",
             expected: "true", orderMatters: false),
            TestCaseData(id: "206adc51-1407-4b42-8bda-e7d80fbf6d8a",
             input: "N = 2097152",
             expected: "true", orderMatters: false),
            TestCaseData(id: "84c18a8a-fbdb-4957-80c6-339b54ac9764",
             input: "N = 4194304",
             expected: "true", orderMatters: false),
            TestCaseData(id: "a951a24f-a515-4601-a40a-53f0a49bfffa",
             input: "N = 8388608",
             expected: "true", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reordered-power-of-2"
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

            guard let p_N = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_N >= 1 && p_N <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.reorderedPowerOf2(p_N)
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
