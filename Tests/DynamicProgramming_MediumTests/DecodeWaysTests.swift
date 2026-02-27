import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDecodeWays {
    private class Solution {
        func numDecodings(_ s: String) -> Int {
            let chars = Array(s)
            let n = chars.count
            if chars[0] == "0" { return 0 }

            var prev2 = 1  // dp[i-2]
            var prev1 = 1  // dp[i-1]

            for i in 1..<n {
                var curr = 0
                let oneDigit = Int(String(chars[i])).unsafelyUnwrapped
                let twoDigit = Int(String(chars[i-1...i])).unsafelyUnwrapped

                if oneDigit >= 1 { curr += prev1 }
                if twoDigit >= 10 && twoDigit <= 26 { curr += prev2 }

                prev2 = prev1
                prev1 = curr
            }

            return prev1
        }
    }

    @Suite struct DecodeWaysTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "ad5cb3aa-4059-45b2-b6bd-dd5421e6e179",
             input: "s = \"123\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d1ed6f7c-988a-4643-90a2-9c8181d67dc8",
             input: "s = \"10\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f7e2181a-67e5-49a8-860b-cd266220a653",
             input: "s = \"27\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "588c273f-f682-4c91-aeac-057a5fc1c044",
             input: "s = \"0\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f7cbb5b9-a953-4b86-864b-e4f29b06ea13",
             input: "s = \"1\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3738b96c-1f00-422c-97a0-21071e5a73b6",
             input: "s = \"12\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d7ff498a-28f3-4ab6-85ff-546d222d9821",
             input: "s = \"1234\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1bec29b8-8fd6-4f3c-a32a-2071cb1a1a8e",
             input: "s = \"1111\"",
             expected: "5", orderMatters: true),
            TestCaseData(id: "15267b19-80b1-40ab-a0e5-ec7f6de55aa0",
             input: "s = \"100\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7216cb3c-e89e-4db5-a058-75e458901dea",
             input: "s = \"101\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2b6b8a2f-7969-4573-a0e4-008c9f64ce93",
             input: "s = \"1000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e9429ed9-5bec-4911-a9dd-6fdebed9fbbe",
             input: "s = \"12345\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ae466b0f-2d98-4da6-a877-9a1c829538c2",
             input: "s = \"10000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "92469091-9ad9-40b2-9cd6-32121497b4d4",
             input: "s = \"100000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8e27be84-9095-4b49-ba85-3fc4bb164db4",
             input: "s = \"1000000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1e14ab78-6ee0-4932-a5b2-26216221b4e8",
             input: "s = \"10000000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "aaad1ef4-fd2a-4e0f-947d-1a2124f6e5e6",
             input: "s = \"100000000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d92a7a2d-ed0c-46c7-9ced-f0377c76b483",
             input: "s = \"1234567890\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "864d2ea6-fcde-4b04-b34d-fd472134a04c",
             input: "s = \"1000000000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "36b7836a-cece-4d90-a996-e6c61d3cdde2",
             input: "s = \"12345678901\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8938d873-0c9c-4b26-bac4-499cf686ab87",
             input: "s = \"10000000000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6c188027-7909-4401-b952-ecb454de52a4",
             input: "s = \"123456789012\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9ec0b146-4dde-4672-9961-893bebeb5c9d",
             input: "s = \"\"",
             expected: "null", orderMatters: true),
            TestCaseData(id: "9ef8ec65-cac9-4d3e-9ff8-a4fa383aa63b",
             input: "s = \"11111\"",
             expected: "8", orderMatters: true),
            TestCaseData(id: "4224cbe7-0b45-4f61-b9c0-86bf9c7deb3f",
             input: "s = \"123456\"",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "decode-ways"
            let topic = "dynamic-programming"
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
            guard p_s.count >= 1 && p_s.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.numDecodings(p_s)
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
