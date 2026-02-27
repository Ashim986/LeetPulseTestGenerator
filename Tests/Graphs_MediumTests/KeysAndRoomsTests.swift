import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCKeysAndRooms {
    private class Solution {
        func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
            var visited = Set<Int>()
            var queue: [Int] = [0]
            while !queue.isEmpty {
                let roomIndex = queue.removeFirst()
                if !visited.contains(roomIndex) {
                    visited.insert(roomIndex)
                    for key in rooms[roomIndex] {
                        if !visited.contains(key) {
                            queue.append(key)
                        }
                    }
                }
            }
            return visited.count == rooms.count
        }
    }

    @Suite struct KeysAndRoomsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bee64758-6f64-4897-9068-22d97202690f",
             input: "rooms = [[]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0bebb9e9-5f7e-432f-9640-3148bbca0223",
             input: "rooms = [[0]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fa48348f-5961-40d1-b015-eaed64a8615c",
             input: "rooms = [[1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f7bb2c51-ea98-4269-9dde-d35566375641",
             input: "rooms = [[1], [0]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ea220337-7d10-406d-a465-c290e79ef806",
             input: "rooms = [[0], [0]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b0b7cf77-5dca-462b-b94a-7c81d252f8a7",
             input: "rooms = [[1, 2], [3, 4], [5, 6]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1a3f4d86-9cbe-42fe-b5d4-b806fe31b51a",
             input: "rooms = [[0, 1, 2, 3]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "80f828c6-70a4-4723-9f75-4a7c4bb7e5f4",
             input: "rooms = [[0, 1], [1, 2], [2, 0]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7b0e55e3-422d-4fe4-b227-c7b56dc454b3",
             input: "rooms = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f1591f5b-72c2-4385-af7f-76c1e318831a",
             input: "rooms = [[1], [1], [1], [1], [1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bc97ed9b-cc31-4e23-a900-6c8f0aa80c5a",
             input: "rooms = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "78671188-d975-4bf0-b17d-2cb7f580011e",
             input: "rooms = [[1], [1], [1], [1], [1], [1], [1], [1], [1], [1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "eaaf66f2-07e6-4d08-a4fb-392540463dd9",
             input: "rooms = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [10, 11, 12, 13, 14, 15, 16, 17, 18, 19], [20, 21, 22, 23, 24, 25, 26, 27, 28, 29]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "00d00c4c-4206-4533-9c16-e2290c8c2f90",
             input: "rooms = [[1], [1], [1], [1], [1], [1], [1], [1], [1], [1], [1], [1], [1], [1], [1], [1], [1], [1], [1], [1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "88b385ea-ff2e-4e38-abd5-98bda8d2ca6a",
             input: "rooms = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [10, 11, 12, 13, 14, 15, 16, 17, 18, 19], [20, 21, 22, 23, 24, 25, 26, 27, 28, 29], [30, 31, 32"
                + ", 33, 34, 35, 36, 37, 38, 39]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b23e6f06-9419-440b-8e59-ceb64b9095cc",
             input: "rooms = [[0], [1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e6a6d15f-89dc-479d-b4b6-0158db08d415",
             input: "rooms = [[0], [1], [2], [3]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f5ebc9ce-00f6-47f8-9c87-f98382b6ec9b",
             input: "rooms = [[1, 3], [3, 0, 1], [2, 0], [0]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1f747857-3ec0-491f-85ab-77325ed03c21",
             input: "rooms = [[0], [1], [2], [3], [4], [5], [6], [7], [8], [9]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "015528f1-bfbb-48e8-8ca4-bb5eee6dccae",
             input: "rooms = [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "86c9ef12-e3c5-442f-969d-b1c47dc906bb",
             input: "rooms = [[0], [0], [0], [0], [0]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7674f7a8-ac5e-438a-af84-ffb45da4a8f1",
             input: "rooms = [[0, 1], [0, 1], [0, 1], [0, 1], [0, 1]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d5a8e3c9-c92b-47a5-930b-07bcec715c3e",
             input: "rooms = [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6]]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4800377c-ad8f-4b23-b786-df741cbf4500",
             input: "rooms = [[0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19]]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9e8a7fd9-ff42-436d-8d37-7e4070967764",
             input: "rooms = [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "keys-and-rooms"
            let topic = "graphs"
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

            guard let p_rooms = InputParser.parse2DIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [[Int]]"
                )
                return
            }
            guard p_rooms.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: rooms 2D array too large (\(p_rooms.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_rooms.count >= 2 && p_rooms.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= n <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.canVisitAllRooms(p_rooms)
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
