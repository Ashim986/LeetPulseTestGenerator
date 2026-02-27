import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTeemoAttacking {
    private class Solution {
        func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
            if timeSeries.count == 0 {
                return 0
            }
            var result = 0
            for i in 0...timeSeries.count-2 {
                if timeSeries[i+1]-timeSeries[i] >= duration {
                    result += duration
                } else {
                    result += timeSeries[i+1] - timeSeries[i]
                }
            }
            return result + duration
        }
    }

    @Suite struct TeemoAttackingTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "89264522-39dd-4a89-b2f2-9d80e3c3e488",
             input: "timeSeries = [1], duration = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "61512970-43e1-4a70-bc15-32140034c4cb",
             input: "timeSeries = [], duration = 2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cdd61b00-0d9d-46d4-b179-f3066037804c",
             input: "timeSeries = [1,2,3], duration = 1",
             expected: "3", orderMatters: true),
            TestCaseData(id: "13c7883b-8cc1-4848-a0a0-4ee7dad1f77b",
             input: "timeSeries = [1,1,1], duration = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5d7f4962-6cec-46c6-857d-317b33830a7e",
             input: "timeSeries = [1,4,7], duration = 2",
             expected: "6", orderMatters: true),
            TestCaseData(id: "600f381c-801a-49b9-aaef-81e313c0887b",
             input: "timeSeries = [1,2,3,4,5], duration = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c09fe319-1aad-4156-88bb-c57355670d86",
             input: "timeSeries = [1,100], duration = 2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "425b1d12-56b5-427d-a5f2-a9c048e4cdcc",
             input: "timeSeries = [1,2,3,4,5,6,7,8,9,10], duration = 1",
             expected: "10", orderMatters: true),
            TestCaseData(id: "0357c0ab-e49a-4b48-b17c-2910f63b2254",
             input: "timeSeries = [1,1,1,1,1], duration = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5af2e5f8-c8d1-4dbf-9fdf-6f60c7ab3176",
             input: "timeSeries = [1,2,3,4,5], duration = 10",
             expected: "14", orderMatters: true),
            TestCaseData(id: "22c11ddb-048f-47d6-92e3-a587c57664cb",
             input: "timeSeries = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], duration = 1",
             expected: "15", orderMatters: true),
            TestCaseData(id: "fe74b58e-d728-4d26-9265-9c22762970e8",
             input: "timeSeries = [1,10000], duration = 2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "cda8f460-84ca-4fac-a95a-1f5aa9500159",
             input: "timeSeries = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], duration = 1",
             expected: "20", orderMatters: true),
            TestCaseData(id: "30f78181-1f3b-4666-af4a-f26ff1c6f8de",
             input: "timeSeries = [1,1,1,1,1,1,1,1,1,1], duration = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7f95e9ac-8672-499c-b00f-75e235addaa4",
             input: "timeSeries = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25], duration = 1",
             expected: "25", orderMatters: true),
            TestCaseData(id: "45e1c645-27da-4e91-aa08-3c1fe90a3699",
             input: "timeSeries = [1,1000000], duration = 2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "f1a38795-c6d3-459c-ac21-894a4ef98dae",
             input: "timeSeries = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30], duration = 1",
             expected: "30", orderMatters: true),
            TestCaseData(id: "dda0c524-75ce-4e61-b03f-3bec887d916d",
             input: "timeSeries = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], duration = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7646627e-f1f6-45e3-ac66-433dbcc7011c",
             input: "timeSeries = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35], duration = 1",
             expected: "35", orderMatters: true),
            TestCaseData(id: "447af090-29d5-4a50-84f1-3bd3624fd571",
             input: "timeSeries = [1,1000000000], duration = 2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "58fb3a41-9297-420f-b9b6-ac9fa5e9ed18",
             input: "timeSeries = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40], duration "
                + "= 1",
             expected: "40", orderMatters: true),
            TestCaseData(id: "7ce7ff0e-3b1d-414f-9b99-2e7a0ce69547",
             input: "timeSeries = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], duration = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "427e8134-8d3c-4dc3-84ca-e2b59b80cfe8",
             input: "timeSeries = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44"
                + ",45], duration = 1",
             expected: "45", orderMatters: true),
            TestCaseData(id: "b24fd89b-edc4-4408-89f0-68ecc895d153",
             input: "timeSeries = [1,2,3,4,5,6], duration = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "62200ffe-27b5-447a-8f98-474101552b08",
             input: "timeSeries = [-1,0,1], duration = 2",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "teemo-attacking"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_timeSeries = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_timeSeries.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: timeSeries array too large (\(p_timeSeries.count))"
                )
                return
            }
            guard let p_duration = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_timeSeries.count >= 1 && p_timeSeries.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= timeSeries.length <= 10^4"
                )
                return
            }
            guard p_timeSeries.allSatisfy({ $0 >= 0 && $0 <= 10000000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= timeSeries[i], duration <= 10^7"
                )
                return
            }
            guard p_duration >= 0 && p_duration <= 10000000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= timeSeries[i], duration <= 10^7"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findPoisonedDuration(p_timeSeries, p_duration)
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
