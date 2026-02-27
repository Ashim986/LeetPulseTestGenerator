import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMeetingRoomsIi {
    private class Solution {
        func minMeetingRooms(_ intervals: [[Int]]) -> Int {
            guard !intervals.isEmpty else { return 0 }

            let sorted = intervals.sorted { $0[0] < $1[0] }
            var endTimes: [Int] = []  // Simulating min-heap

            for interval in sorted {
                // Remove ended meetings
                if let minEnd = endTimes.min(), minEnd <= interval[0] {
                    if let idx = endTimes.firstIndex(of: minEnd) {
                        endTimes.remove(at: idx)
                    }
                }
                endTimes.append(interval[1])
            }

            return endTimes.count
        }
    }

    @Suite struct MeetingRoomsIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a6532547-0c37-40e6-8d10-3f25d467496b",
             input: "intervals = [[1,2],[3,4]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1f33d88e-d527-4454-865a-08990f06a783",
             input: "intervals = [[1,2],[1,2]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c256b1b9-6989-46d7-847b-77d99fe90f74",
             input: "intervals = [[1,2]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "97874942-b98c-407b-8f37-f874ea45738e",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3cc0cec0-dd01-4e4c-ae92-37d1da7ec944",
             input: "intervals = [[10,20],[15,25],[20,30]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f5e1d4ff-d051-4a53-ab9d-5110d19cd5e6",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "21a31aae-192e-402d-847f-2f7b52ee5cdf",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "196976cb-76d3-4067-98da-76e8c52cd70b",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20],[21,22],[23,24]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c0f4a369-3464-43c0-b8fb-ab69164a112e",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20],[21,22],[23,24],[25,26],[27,28]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4b5dcdf6-b255-4f88-b814-c65f2560980a",
             input: "intervals = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20],[21,22],[23,24],[25,26],[27,28],[29,30]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b253de4d-aecf-4cb7-b12f-0e2f159355e8",
             input: "intervals = [[1,10],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f1a86ae1-944a-4234-8f14-bdc4f71a44c7",
             input: "intervals = [[1,1000],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c6c4ae48-b5df-4bfc-8a81-9b7960ff9909",
             input: "intervals = [[1,10],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9f2f5d88-5b8d-4e5c-8f9c-0c42603bb967",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fe357640-39e2-4252-9575-fa1a65a86700",
             input: "intervals = [[1,100],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "cb05b6ee-6e77-4915-bb12-dcca69cb3c83",
             input: "intervals = [[1,10],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "69b0ad18-22c2-42e8-92f8-68d89cd5573d",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6c8073bd-9139-42f3-8a49-a1b3390caac7",
             input: "intervals = [[1,1000],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c23282dc-77b2-491d-a9db-83d8b3da0e85",
             input: "intervals = [[1,10],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4728c808-ebee-4f39-8ad8-13dbbf2a5ddc",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "867d66fd-030b-46d1-a04d-3df6043b6a43",
             input: "intervals = [[1,1000],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "277b682a-d829-425b-b6d6-ce5712361db1",
             input: "intervals = [[1,10],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "653eb106-c9b9-46a1-88ba-6db894ca07a6",
             input: "intervals = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,18]]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a251e3a7-7441-4b4b-aea9-d2083c6eed40",
             input: "intervals = [[1,1000],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,18]]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7aab452e-85f9-400a-9f71-f1ca9b2bb9ff",
             input: "intervals = [[1,10],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,18],[18"
                + ",19]]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "meeting-rooms-ii"
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

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.minMeetingRooms(p_intervals)
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
