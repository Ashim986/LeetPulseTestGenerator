import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMergeIntervals {
    private class Solution {
        func merge(_ intervals: [[Int]]) -> [[Int]] {
            if intervals.isEmpty { return [] }
            let sorted = intervals.sorted { $0[0] < $1[0] }
            var result: [[Int]] = [sorted[0]]
            for interval in sorted.dropFirst() {
                if interval[0] <= result[result.count - 1][1] {
                    result[result.count - 1][1] = max(result[result.count - 1][1], interval[1])
                } else {
                    result.append(interval)
                }
            }
            return result
        }
    }

    @Suite struct MergeIntervalsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0404c95b-b406-42e8-abe6-c6868f5f4fe3",
             input: "intervals = [[1,1]]",
             expected: "[[1,1]]", orderMatters: true),
            TestCaseData(id: "e25e910f-42bc-4cf1-b679-02be724542cc",
             input: "intervals = [[1,2],[3,4]]",
             expected: "[[1,2],[3,4]]", orderMatters: true),
            TestCaseData(id: "d7b7817d-cd31-469c-8631-7c55c8918300",
             input: "intervals = [[1,5],[2,3]]",
             expected: "[[1,5]]", orderMatters: true),
            TestCaseData(id: "a0748472-87c8-460b-90a2-6d6f485407f4",
             input: "intervals = [[1,5],[6,8]]",
             expected: "[[1,5],[6,8]]", orderMatters: true),
            TestCaseData(id: "a695715d-84c6-4c36-98a4-9fda5270cdc5",
             input: "intervals = [[1,5],[1,5]]",
             expected: "[[1,5]]", orderMatters: true),
            TestCaseData(id: "5321d574-dc25-4e0f-8aa5-165f15908d2a",
             input: "intervals = [[5,5],[1,1]]",
             expected: "[[1,1],[5,5]]", orderMatters: true),
            TestCaseData(id: "ca97b76b-4106-4407-8a63-8d0700f72bf9",
             input: "intervals = [[10,20],[15,25]]",
             expected: "[[10,25]]", orderMatters: true),
            TestCaseData(id: "189d11db-2c61-4611-9f6a-75f03b3fb7b7",
             input: "intervals = [[10,20],[5,15]]",
             expected: "[[5,20]]", orderMatters: true),
            TestCaseData(id: "54a0036d-fbd2-44b6-bda0-592e0789c736",
             input: "intervals = [[1,10],[2,5],[8,12]]",
             expected: "[[1,12]]", orderMatters: true),
            TestCaseData(id: "722f7c76-0842-4b93-a482-bdd8094d84de",
             input: "intervals = [[1,10],[11,20],[21,30]]",
             expected: "[[1,10],[11,20],[21,30]]", orderMatters: true),
            TestCaseData(id: "5fe61e6b-da3b-4110-a74f-aa476eb5810b",
             input: "intervals = [[1,1],[1,1],[1,1]]",
             expected: "[[1,1]]", orderMatters: true),
            TestCaseData(id: "769ca2da-d48e-4ee0-8d91-b47b99a8c558",
             input: "intervals = [[1,5],[5,10]]",
             expected: "[[1,10]]", orderMatters: true),
            TestCaseData(id: "fb85f22b-f8ec-4956-8986-a0da9619ec31",
             input: "intervals = [[1,5],[10,15]]",
             expected: "[[1,5],[10,15]]", orderMatters: true),
            TestCaseData(id: "7d44d010-f6c1-427a-b010-3667ca480916",
             input: "intervals = [[100,200],[150,250]]",
             expected: "[[100,250]]", orderMatters: true),
            TestCaseData(id: "67368f2f-eb2d-4c41-b2af-db2fe1a024b0",
             input: "intervals = [[100,200],[250,350]]",
             expected: "[[100,200],[250,350]]", orderMatters: true),
            TestCaseData(id: "f78286f6-ab2d-4432-831c-b037f453f704",
             input: "intervals = [[1,1000],[2,500]]",
             expected: "[[1,1000]]", orderMatters: true),
            TestCaseData(id: "e38739b4-096e-42ea-a1da-d0776f372239",
             input: "intervals = [[1,1000],[1001,2000]]",
             expected: "[[1,1000],[1001,2000]]", orderMatters: true),
            TestCaseData(id: "3514c400-7a32-4657-8631-b9514f66c680",
             input: "intervals = [[0,0],[1,1]]",
             expected: "[[0,0],[1,1]]", orderMatters: true),
            TestCaseData(id: "1a6bf3b0-1106-475d-86b3-cc6d4a5aeedc",
             input: "intervals = [[0,10],[5,15],[20,25]]",
             expected: "[[0,15],[20,25]]", orderMatters: true),
            TestCaseData(id: "03caad02-d8b3-4b64-9c85-7ad1bc4cb5d3",
             input: "intervals = [[10,20],[15,25],[30,40]]",
             expected: "[[10,25],[30,40]]", orderMatters: true),
            TestCaseData(id: "d31f2faa-5e45-4ba6-9ad4-1b25608527dc",
             input: "intervals = [[10,20],[5,15],[0,30]]",
             expected: "[[0,30]]", orderMatters: true),
            TestCaseData(id: "0b5736f3-bed2-49da-92da-5dfa13c5f88f",
             input: "intervals = [[10,20],[5,15],[0,5]]",
             expected: "[[0,20]]", orderMatters: true),
            TestCaseData(id: "b5380d56-51ca-44c0-a3e8-67cc04bd07bb",
             input: "intervals = [[10,20],[5,10],[15,25]]",
             expected: "[[5,25]]", orderMatters: true),
            TestCaseData(id: "4215f3c2-9163-47bf-bac4-eab2f7d986dc",
             input: "intervals = [[1,5],[1,5],[1,5]]",
             expected: "[[1,5]]", orderMatters: true),
            TestCaseData(id: "5ea5a2da-ba37-4744-978f-e23fa53978e2",
             input: "intervals = [[1,10],[2,5],[3,7],[8,12]]",
             expected: "[[1,12]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "merge-intervals"
            let topic = "intervals"
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

            guard let p_intervals = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_intervals.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: intervals 2D array too large (\(p_intervals.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_intervals.count >= 1 && p_intervals.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= intervals.length <= 104"
                )
                return
            }
            guard p_intervals.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: intervals[i].length == 2"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.merge(p_intervals)
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

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
