import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNonOverlappingIntervals {
    private class Solution {
        func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
            guard intervals.count > 1 else { return 0 }

            // Sort by start time
            let sorted = intervals.sorted { $0[0] < $1[0] }

            var removals = 0
            var prevEnd = sorted[0][1]

            for i in 1..<sorted.count {
                if sorted[i][0] < prevEnd {
                    // Overlap - remove one (keep the one ending sooner)
                    removals += 1
                    prevEnd = min(prevEnd, sorted[i][1])
                } else {
                    prevEnd = sorted[i][1]
                }
            }

            return removals
        }
    }

    @Suite struct NonOverlappingIntervalsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "473455e6-de52-40b9-aa76-1ea42123cceb",
             input: "intervals = [[1,2],[3,4],[5,6]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2f90d066-1ba3-49fd-91b8-5fb1976c651c",
             input: "intervals = [[1,3],[2,4],[5,6]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4dafd193-778a-47cd-990b-2d5f9fabbffd",
             input: "intervals = [[1,2],[1,2],[1,2],[1,2]]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "27d39a94-326c-46dd-a297-c44884cdd788",
             input: "intervals = [[1,10],[2,3],[3,4],[5,6]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2c544987-cfcb-482a-9be2-e11a135fb8ad",
             input: "intervals = [[-1,0],[0,1],[1,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c2031770-d5bb-48c3-83ad-ea3c8dff77d9",
             input: "intervals = [[-10,-5],[-5,0],[0,5],[5,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "deedd848-19f6-46d3-9e96-7d6dc01d53dc",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "85176ec6-12fe-41a0-aece-edc53c272c5e",
             input: "intervals = [[1,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c205e738-d05c-4d0c-afea-3ddf070f7640",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "44f475a3-5eae-47f8-a419-6d2caefdb14b",
             input: "intervals = [[1,10],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b5820c03-04d3-42e7-bf16-04a755841c33",
             input: "intervals = [[10,20],[20,30],[30,40],[40,50],[50,60]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dffab122-1c94-432f-a808-e74ce5ffc24b",
             input: "intervals = [[10,20],[15,25],[20,30],[25,35],[30,40]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "951858bd-3301-4b12-9ab1-f64278bf63d0",
             input: "intervals = [[1,100],[2,3],[3,4],[5,6],[7,8],[9,10]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cd74a7df-04ed-46e0-8510-e89fe04a3752",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "552c56ab-d4b9-4079-9632-e73b3e87a8e4",
             input: "intervals = [[1,100],[2,3],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dc449399-6b8c-43a8-8454-71c116f01739",
             input: "intervals = [[1,2],[1,2],[1,2],[1,2],[1,2],[1,2],[1,2],[1,2],[1,2],[1,2]]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "7ef85cf7-83d1-4301-b8e4-c98771dfccfb",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20],[21,22]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "87d35cb7-8947-48a2-8b58-c433352befd4",
             input: "intervals = [[1,100],[2,3],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20],[21,22]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1d02ace5-ab86-46f0-a095-21087cedccdd",
             input: "intervals = [[-100,-1],[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ba404159-ffe5-4133-93ba-6e3c1de4f799",
             input: "intervals = [[-100,100],[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ccbecc89-cb4c-4d10-97bd-82b7f4bbd7cc",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20],[21,22],[23,24]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "62d1b8a8-6dfe-4ce6-aa09-24a03642c8ca",
             input: "intervals = [[1,100],[2,3],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20],[21,22],[23,24]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "252bcd9d-bb04-4c8a-902d-60258d627b54",
             input: "intervals = [[-1000,-1],[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "92d640da-fc35-4fdc-9409-35cd1b45e1ae",
             input: "intervals = [[-1000,1000],[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0be40597-6505-4b47-b343-201cbcc926ff",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20],[21,22],[23,24],[25,26]]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "non-overlapping-intervals"
            let topic = "intervals"
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

            guard let p_intervals = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_intervals.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: intervals 2D array too large (\(p_intervals.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_intervals.count >= 1 && p_intervals.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= intervals.length <= 105"
                )
                return
            }
            guard p_intervals.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: intervals[i].length == 2"
                )
                return
            }

            let solution = Solution()
            let result = solution.eraseOverlapIntervals(p_intervals)
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
