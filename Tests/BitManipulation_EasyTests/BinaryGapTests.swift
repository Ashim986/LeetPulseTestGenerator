import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryGap {
    private class Solution {
        func binaryGap(N: Int) -> Int {
            var n = N
            var maxGap = 0
            var prevOne = -1
            var position = 0
            while n > 0 {
                if n % 2 == 1 {
                    if prevOne != -1 {
                        maxGap = max(maxGap, position - prevOne)
                    }
                    prevOne = position
                }
                n /= 2
                position += 1
            }
            return maxGap
        }
    }

    @Suite struct BinaryGapTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "59657654-76d0-4533-a84e-1be812f131ee",
             input: "N = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "81d8b097-28c6-47d7-a80d-9c2b464adbe4",
             input: "N = 2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f4ab2e03-3c8a-488c-a2ee-170ff40b0417",
             input: "N = 4",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ccab1b96-659e-4e02-8f05-14523902b76f",
             input: "N = 7",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5734217b-4d12-4da9-b0ed-e56f091ef68b",
             input: "N = 8",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a41f6ef1-76b2-4fb3-9fcd-cbb036996132",
             input: "N = 15",
             expected: "1", orderMatters: true),
            TestCaseData(id: "43cc10c4-3fa7-4524-8d40-a2bfbba45632",
             input: "N = 16",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f25e7947-8825-44f1-83d9-b54d45ba566b",
             input: "N = 21",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e51f38fe-ccd4-441b-aae9-6b91179b1a70",
             input: "N = 25",
             expected: "3", orderMatters: true),
            TestCaseData(id: "4c2b06d0-2307-42e6-a7db-218c6e0ade44",
             input: "N = 29",
             expected: "2", orderMatters: true),
            TestCaseData(id: "2be2c785-c5bf-4ba0-98a1-717569cc9290",
             input: "N = 30",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cdd2692a-e981-423e-b9e3-46bdfd6b6343",
             input: "N = 32",
             expected: "0", orderMatters: true),
            TestCaseData(id: "31e3d232-3e60-48c8-8fef-e8a33b272ad8",
             input: "N = 43",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7da0fc7e-bea6-4790-a069-d69d1d5c0a4f",
             input: "N = 45",
             expected: "2", orderMatters: true),
            TestCaseData(id: "163fd73b-6484-4ad9-8c30-e7b5416245f1",
             input: "N = 47",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c7c0e9e6-83e7-446f-b9aa-8c13e99ebc74",
             input: "N = 60",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f69f4f77-2ec1-4fce-a224-6aab14eb8096",
             input: "N = 63",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a6c66417-07b5-4022-a78c-63340d961ed6",
             input: "N = 64",
             expected: "0", orderMatters: true),
            TestCaseData(id: "11639442-ba18-443a-8939-b98ae926ec9b",
             input: "N = 3",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bbbde669-f38b-4379-85b3-fed8d3abba84",
             input: "N = 9",
             expected: "3", orderMatters: true),
            TestCaseData(id: "bce2d548-e525-4b5f-93f6-616d43fb4df8",
             input: "N = 17",
             expected: "4", orderMatters: true),
            TestCaseData(id: "cf37020e-66d2-4b61-baf6-0e4edf238b16",
             input: "N = 19",
             expected: "3", orderMatters: true),
            TestCaseData(id: "94057fb9-f5b8-4ca6-b985-c38b956013be",
             input: "N = 20",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5bb6ce1b-a494-499a-a599-85750fb196ca",
             input: "N = 23",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b556300f-a598-427c-abbf-5cc75bf08a67",
             input: "N = 31",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-gap"
            let topic = "bit-manipulation"
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
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.binaryGap(N: p_N)
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
