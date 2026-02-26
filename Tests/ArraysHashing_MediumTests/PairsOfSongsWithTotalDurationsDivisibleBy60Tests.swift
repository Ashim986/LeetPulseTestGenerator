import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPairsOfSongsWithTotalDurationsDivisibleBy60 {
    private class Solution {
        func numPairsDivisibleBy60(_ time: [Int]) -> Int {
            var count = 0
            var remainderCounts: [Int: Int] = [:]
            for duration in time {
                let remainder = duration % 60
                let complement = (60 - remainder) % 60
                if let complementCount = remainderCounts[complement] {
                    count += complementCount
                }
                remainderCounts[remainder, default: 0] += 1
            }
            return count
        }
    }

    @Suite struct PairsOfSongsWithTotalDurationsDivisibleBy60Tests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bf6d37ca-a385-4f04-a99b-e7bcb44bc9cf",
             input: "time = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8147e1c2-3876-420d-b66b-a94c2a071b35",
             input: "time = [60]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f42a6570-5011-49d2-b8f2-1618f2ae6cd8",
             input: "time = [30, 30]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6ab91f84-dd05-4aa2-8914-b723e670c289",
             input: "time = [1, 59]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c8d9805e-a7cf-4775-b842-95ff9ff6b890",
             input: "time = [120, 60]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "350c96d8-55c4-45e8-a43b-9703e5f68206",
             input: "time = [60, 60, 60, 60]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "0d66f32e-06a6-40e4-a9bd-fc2a2be3fb15",
             input: "time = [30, 30, 30, 30]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "153953f3-f185-4d20-9148-fe42c9153f3f",
             input: "time = [1, 1, 1, 59, 59, 59]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "b02b8d85-aed1-4f93-95c3-dc62ea5e1b4f",
             input: "time = [120, 120, 120, 120]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "8c4d24f8-a209-47b4-8ac0-521fbe867ef2",
             input: "time = [-60, 60]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6949fcdc-5068-42ab-a730-8cf731fbd1ab",
             input: "time = [-30, 30]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dd873714-599a-4ce8-bdf9-230b9376d032",
             input: "time = [0, 60]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8d630f08-fffb-4772-a624-02dbd2721ffb",
             input: "time = [1, 2, 3, 59, 58, 57]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "b9701170-178a-4ed8-a52c-45c4c4d5b399",
             input: "time = [10, 10, 10, 50, 50, 50]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "6927194e-9e67-411d-b9e0-235035db7c24",
             input: "time = [60, 60, 60, 60, 60, 60]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "2bbfe4a4-1e5f-4b4f-b543-e0f24b43e5a6",
             input: "time = [1, 59, 1, 59, 1, 59]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "8309318d-1709-4655-bd15-c943256b7329",
             input: "time = [30, 30, 30, 30, 30, 30]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "0c0437b1-6ca7-45a3-9255-77d8878957ba",
             input: "time = [120, 120, 120, 120, 120, 120]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "9a8d729a-2149-44c9-9856-e7200c5fdce7",
             input: "time = [10, 50, 10, 50, 10, 50]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "90efed85-665e-4753-adc3-7f0c3db386c8",
             input: "time = [5, 55, 5, 55, 5, 55]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "90d404a8-94bb-4fc3-846b-310520848e0c",
             input: "time = [15, 45, 15, 45, 15, 45]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "abff3ac8-0a23-4a84-a664-01216457c44a",
             input: "time = [25, 35, 25, 35, 25, 35]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "83e9ecdf-9b1d-43c0-abcf-f06e0d746fb0",
             input: "time = [1, 59, 1, 59, 1, 59, 1, 59]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "3f1d6a68-4e8a-4dfd-bdae-c0ff2f800d7c",
             input: "time = [30, 30, 30, 30, 30, 30, 30, 30]",
             expected: "28", orderMatters: true),
            TestCaseData(id: "a9b9124d-30d4-4183-a80a-131c1ed35cb3",
             input: "time = [120, 120, 120, 120, 120, 120, 120, 120]",
             expected: "28", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "pairs-of-songs-with-total-durations-divisible-by-60"
            let topic = "arrays-hashing"
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

            guard let p_time = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_time.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: time array too large (\(p_time.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_time.count >= 1 && p_time.count <= 60000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= time.length <= 6 * 10^4"
                )
                return
            }
            guard p_time.allSatisfy({ $0 >= 1 && $0 <= 500 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= time[i] <= 500"
                )
                return
            }

            let solution = Solution()
            let result = solution.numPairsDivisibleBy60(p_time)
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
