import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCInsertInterval {
    private class Solution {
        func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
            if intervals.isEmpty {
                return [newInterval]
            }

            var result: [[Int]] = []
            var merged = newInterval
            var inserted = false

            for interval in intervals {
                if interval[1] < merged[0] {
                    // Current interval ends before merged starts
                    result.append(interval)
                } else if interval[0] > merged[1] {
                    // Current interval starts after merged ends
                    if !inserted {
                        result.append(merged)
                        inserted = true
                    }
                    result.append(interval)
                } else {
                    // Overlap - expand merged interval
                    merged[0] = min(merged[0], interval[0])
                    merged[1] = max(merged[1], interval[1])
                }
            }

            if !inserted {
                result.append(merged)
            }

            return result
        }
    }

    @Suite struct InsertIntervalTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "14eb6d7a-0c29-4236-9276-ab62c6fee433",
             input: "intervals = [[1,5],[10,15]], newInterval = [6,8]",
             expected: "[[1,5],[6,8],[10,15]]", orderMatters: true),
            TestCaseData(id: "58dbfcc0-21fc-4376-8c90-5d755302abd1",
             input: "intervals = [[1,1],[2,2],[3,3]], newInterval = [1,3]",
             expected: "[[1,3]]", orderMatters: true),
            TestCaseData(id: "73a12c9b-dd86-4e90-aaf7-a0b9059d14e0",
             input: "intervals = [[1,5],[10,15]], newInterval = [1,10]",
             expected: "[[1,15]]", orderMatters: true),
            TestCaseData(id: "428b1a3f-eba0-4c5e-845c-f6bf005a80d0",
             input: "intervals = [[1,5],[10,15]], newInterval = [20,25]",
             expected: "[[1,5],[10,15],[20,25]]", orderMatters: true),
            TestCaseData(id: "e051e754-8adf-4811-abd6-09867b57836a",
             input: "intervals = [[1,5],[10,15]], newInterval = [100,200]",
             expected: "[[1,5],[10,15],[100,200]]", orderMatters: true),
            TestCaseData(id: "147e76e1-bb0f-41c5-bf4b-57f316203d7f",
             input: "intervals = [[1,5],[10,15]], newInterval = [0,0]",
             expected: "[[0,0],[1,5],[10,15]]", orderMatters: true),
            TestCaseData(id: "e8d0e84f-e6ec-4044-bdc0-a228e9a4efb0",
             input: "intervals = [[1,5],[10,15]], newInterval = [1,1]",
             expected: "[[1,5],[10,15]]", orderMatters: true),
            TestCaseData(id: "b60b5d03-19ac-4b71-8d61-6d643a1a224c",
             input: "intervals = [[1,5],[10,15]], newInterval = [5,5]",
             expected: "[[1,5],[10,15]]", orderMatters: true),
            TestCaseData(id: "5e20bc69-c5ae-4635-b9cc-9d4de72b2772",
             input: "intervals = [[1,5],[10,15]], newInterval = [15,15]",
             expected: "[[1,5],[10,15]]", orderMatters: true),
            TestCaseData(id: "fd4d0b91-73b9-4c74-adbf-d642298d837e",
             input: "intervals = [[1,5],[10,15]], newInterval = [5,10]",
             expected: "[[1,15]]", orderMatters: true),
            TestCaseData(id: "08d60fd5-597e-4838-84c2-00d81989afd3",
             input: "intervals = [[1,5],[10,15]], newInterval = [10,20]",
             expected: "[[1,5],[10,20]]", orderMatters: true),
            TestCaseData(id: "5b06d9c5-dc1c-4385-a2c9-a795e6d26304",
             input: "intervals = [[1,5],[10,15]], newInterval = [0,20]",
             expected: "[[0,20]]", orderMatters: true),
            TestCaseData(id: "6df2098e-7608-41f4-aece-d7384206a56f",
             input: "intervals = [[1,5],[10,15]], newInterval = [1000,2000]",
             expected: "[[1,5],[10,15],[1000,2000]]", orderMatters: true),
            TestCaseData(id: "41eea1b1-6e2f-4426-8154-19cf4ef0ad0f",
             input: "intervals = [], newInterval = [1,5]",
             expected: "[[1,5]]", orderMatters: true),
            TestCaseData(id: "ee412afc-3b71-4672-9bd0-753125190bca",
             input: "intervals = [[1,5]], newInterval = [1,5]",
             expected: "[[1,5]]", orderMatters: true),
            TestCaseData(id: "508339ad-e1d6-4b34-8f32-a91c940a5f1c",
             input: "intervals = [[1,5]], newInterval = [6,10]",
             expected: "[[1,5],[6,10]]", orderMatters: true),
            TestCaseData(id: "a81684e3-6dbc-406f-957e-cd133c6befdb",
             input: "intervals = [[1,5]], newInterval = [0,0]",
             expected: "[[0,0],[1,5]]", orderMatters: true),
            TestCaseData(id: "3d41d88a-a869-45f5-b05a-242d2eab6ed4",
             input: "intervals = [[1,5]], newInterval = [100,200]",
             expected: "[[1,5],[100,200]]", orderMatters: true),
            TestCaseData(id: "5a0148db-16ed-463f-aaba-2e64b5ccc290",
             input: "intervals = [[1,5]], newInterval = [5,10]",
             expected: "[[1,10]]", orderMatters: true),
            TestCaseData(id: "6959dffb-0642-488d-a230-1a3dda056544",
             input: "intervals = [[1,5]], newInterval = [0,10]",
             expected: "[[0,10]]", orderMatters: true),
            TestCaseData(id: "721f60bc-93d8-422f-a57b-8f989caee77c",
             input: "intervals = [[1,3],[6,9]], newInterval = [2,5]",
             expected: "[[1,5],[6,9]]", orderMatters: true),
            TestCaseData(id: "32119ac3-3955-4bfd-9430-abdb09c8f9d7",
             input: "intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]",
             expected: "[[1,2],[3,10],[12,16]]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "insert-interval"
            let topic = "intervals"
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
            guard let p_newInterval = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_newInterval.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: newInterval array too large (\(p_newInterval.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_intervals.count >= 0 && p_intervals.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= intervals.length <= 104"
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
            guard p_newInterval.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: newInterval.length == 2"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.insert(p_intervals, p_newInterval)
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
