import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFlipStringToMonotoneIncreasing {
    private class Solution {
        func minFlipsMonoIncr(_ s: String) -> Int {
            var zeros = 0
            var ones = 0
            for char in s {
                if char == "0" {
                    zeros = min(ones + 1, zeros)
                } else {
                    ones += 1
                }
            }
            return zeros
        }
    }

    @Suite struct FlipStringToMonotoneIncreasingTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "731f0dd7-7547-4a8c-863f-5c5c020edf93",
             input: "s = \"000000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cd8916c4-4f5f-4047-89c9-a88294d7d5cb",
             input: "s = \"111111\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "13cc4316-6116-4fb5-a248-987b8b9092f3",
             input: "s = \"0000000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "16c5c38b-89e5-4d3c-b5fb-2ff3215fa017",
             input: "s = \"1111111\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0382a22b-e37e-4744-8907-48285800a5fd",
             input: "s = \"00000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ff20cf2c-bff0-4032-9b06-11b14e81b2db",
             input: "s = \"11111\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c42058f8-00a1-458c-9874-11054b4632b4",
             input: "s = \"10010\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7f5c1053-7d23-47f5-a7b8-772384626929",
             input: "s = \"11000\"",
             expected: "2", orderMatters: true),
            TestCaseData(id: "fac93b56-31d2-494e-9f12-a8b7254ff652",
             input: "s = \"00000000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e70a78b9-85d5-4870-a1ef-2933fcd2beae",
             input: "s = \"\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8ed0ece0-7418-42f7-a529-def14a7bb4f6",
             input: "s = \"101010\"",
             expected: "3", orderMatters: true),
            TestCaseData(id: "4e06360b-032a-471d-9063-b14d38a92368",
             input: "s = \"110000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b9d150be-ea59-42d5-9a43-be69e057fc2f",
             input: "s = \"000110\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "57200f05-e818-4c85-ba6b-6a0c6b4c10f8",
             input: "s = \"111000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "928f74f3-5f78-49db-95ed-24a9d3bab8ad",
             input: "s = \"100001\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2cff9b2a-1235-4430-8404-ba52773d4c70",
             input: "s = \"110011\"",
             expected: "1", orderMatters: true),
            TestCaseData(id: "33e5be12-9e18-4ddb-aa7c-a88bf992d18c",
             input: "s = \"10101\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b1bf31a1-f566-4913-ab77-4a4638241681",
             input: "s = \"11011\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d724f9aa-a538-4f7a-a7d2-1fb51042fae4",
             input: "s = \"10000\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "89c057ad-d5a5-443e-b71e-92d8111d883b",
             input: "s = \"11110\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7614900b-8f09-41dd-9835-1ae8ed24fe4a",
             input: "s = \"10001\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d1ef2c74-23d1-4909-8406-a47749b55b57",
             input: "s = \"11010\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6d2552cc-67fe-466a-ad60-33dc29fdfaf8",
             input: "s = \"00001\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "32ad338e-90d7-4268-821e-05dcaf99e752",
             input: "s = \"11100\"",
             expected: "0", orderMatters: true),
            TestCaseData(id: "761199b3-6bba-4aa4-9716-8279ca11fcb4",
             input: "s = \"00010\"",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "flip-string-to-monotone-increasing"
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
            guard p_s.count >= 1 && p_s.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.minFlipsMonoIncr(p_s)
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
