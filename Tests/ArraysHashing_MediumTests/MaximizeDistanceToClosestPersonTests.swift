import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximizeDistanceToClosestPerson {
    private class Solution {
        func maxDistToClosest(_ seats: [Int]) -> Int {
            var occupiedSeats: [Int] = []

            for i in 0..<seats.count {
                if seats[i] == 1 {
                    occupiedSeats.append(i)
                }
            }

            var maxDist = 0

            if !occupiedSeats.isEmpty {
                maxDist = max(maxDist, occupiedSeats[0])
                maxDist = max(maxDist, seats.count - 1 - occupiedSeats[occupiedSeats.count - 1])
            }

            for i in 1..<occupiedSeats.count {
                maxDist = max(maxDist, (occupiedSeats[i] - occupiedSeats[i-1]) / 2)
            }

            return maxDist
        }
    }

    @Suite struct MaximizeDistanceToClosestPersonTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5ee5e63b-7388-49a7-b445-8ceb5c5ccf41",
             input: "seats = [1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "355dbb22-2fbe-4604-aabe-fb1008ca7d64",
             input: "seats = [0,1,0,1,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fcdcae90-a01e-4be0-ab6b-717c9ba53056",
             input: "seats = [1,0,1,0,1,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6fa87a96-f60c-4e9d-bd07-714226843162",
             input: "seats = [0,0,0,1,0,0,0]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1d2d5e3e-fbb2-463b-a84b-eb181c969564",
             input: "seats = [1,0,0,0,0,0,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "46069d85-1c90-4302-9b3a-623555f6bf5a",
             input: "seats = [1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5ce15900-d850-49b4-837b-e2ed9c005bd2",
             input: "seats = [0,1,0,1,0,1,0,1,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1e14754c-e665-46c8-916f-2c7426f721b0",
             input: "seats = [1,0,1,0,1,0,1,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d1d225eb-2908-429e-85b5-9d071989bebe",
             input: "seats = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7fc2d3c1-0725-422d-a154-b114009da957",
             input: "seats = [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0439bd15-6d8c-4e3b-9bab-694d76b7e949",
             input: "seats = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "81c8c8fe-a545-4274-9b9c-6624b446bbc7",
             input: "seats = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8a3ff641-6351-4963-b254-e9018565bb65",
             input: "seats = [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7f706f85-2829-458d-8978-0ba746620cb4",
             input: "seats = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4c1988d3-b626-460c-8132-040a196b0832",
             input: "seats = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ccc98f0b-ff10-4928-8f6c-b3da3c4bcfe4",
             input: "seats = [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1ea298dd-879f-4e8b-8968-d6d1789c906f",
             input: "seats = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ef0ffd06-2af1-4605-89c5-33035842432a",
             input: "seats = [0,0,0,0,0,0,0]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "ee58788f-d4ea-442b-8c6d-d8fa0f313b8a",
             input: "seats = [0,0,0,0,1,0,0]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "b6f466cc-9e5c-4b50-9304-a54f64deeb86",
             input: "seats = [0,1,0,0,0,0,0]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ecc316b9-f035-4a58-8ce1-3d0f01f836e3",
             input: "seats = [0,0,0,0,0,1,0]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "dc2ac000-e1a8-43ea-9989-84806f62e57f",
             input: "seats = [1,0,0,0,0,0,0]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "818f02df-15b1-4398-b827-5fca0c5a7259",
             input: "seats = [0,0,0,0,0,0,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "09828842-bd40-4e3d-8725-e2c19595d8f9",
             input: "seats = [0,0,0,0,0,0,0,0,0,0]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "eddac7ea-0010-4cd3-8ad8-3027d4ddfd23",
             input: "seats = [0,0,0,0,0,0,0,0,0,1]",
             expected: "9", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximize-distance-to-closest-person"
            let topic = "arrays-hashing"
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

            guard let p_seats = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_seats.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: seats array too large (\(p_seats.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_seats.count >= 2 && p_seats.count <= 20000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= seats.length <= 2 * 10^4"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxDistToClosest(p_seats)
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
