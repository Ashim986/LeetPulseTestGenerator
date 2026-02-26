import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCCapacityToShipPackagesWithinDDays {
    private class Solution {
        func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
            let total = weights.reduce(0, +)
            let maxWeight = weights.max().unsafelyUnwrapped
            var left = maxWeight
            var right = total
            while left < right {
                let mid = left + (right - left) / 2
                if canShip(weights, mid, D) {
                    right = mid
                }
                else {
                    left = mid + 1
                }
            }
            return left
        }
        func canShip(_ weights: [Int], _ capacity: Int, _ D: Int) -> Bool {
            var currentCapacity = 0
            var days = 1
            for weight in weights {
                if weight > capacity {
                    return false
                }
                if currentCapacity + weight > capacity {
                    days += 1
                    currentCapacity = 0
                }
                currentCapacity += weight
            }
            return days <= D
        }
    }

    @Suite struct CapacityToShipPackagesWithinDDaysTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a474bf96-f2a0-481c-a076-db26fe7a8700",
             input: "weights = [1], D = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "27c866f2-5d45-4bf3-88c9-2a3bba4fff1c",
             input: "weights = [], D = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "af01d364-1e67-4e2e-b7cd-d0073900d70c",
             input: "weights = [1,2,3], D = 1",
             expected: "6", orderMatters: true),
            TestCaseData(id: "cc51f283-c8a4-4d4d-841e-92750971aa7b",
             input: "weights = [5,5,5,5,5], D = 1",
             expected: "25", orderMatters: true),
            TestCaseData(id: "752a8009-5dc9-4ef3-b73f-ef125af41364",
             input: "weights = [1,1,1,1,1], D = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "62949c86-c5b0-455a-8a1a-9ad885ce7c23",
             input: "weights = [1,1,1,1,1,1,1,1,1,1], D = 1",
             expected: "10", orderMatters: true),
            TestCaseData(id: "329b0b70-e1b7-4e0d-96bd-8799ea889503",
             input: "weights = [100,100,100,100,100], D = 1",
             expected: "500", orderMatters: true),
            TestCaseData(id: "416702da-0825-4e39-bc48-cf49af962615",
             input: "weights = [1,2,3,4,5,6,7,8,9,10], D = 1",
             expected: "55", orderMatters: true),
            TestCaseData(id: "3b8b9760-2960-4d64-81df-7423d2b8ae24",
             input: "weights = [10,9,8,7,6,5,4,3,2,1], D = 1",
             expected: "55", orderMatters: true),
            TestCaseData(id: "7099fff5-2d29-4d64-990e-5eb9e9ec7c9f",
             input: "weights = [1,2,3], D = 3",
             expected: "6", orderMatters: true),
            TestCaseData(id: "42f170e2-475f-4506-9382-0bbbd23d6774",
             input: "weights = [10,10,10], D = 2",
             expected: "30", orderMatters: true),
            TestCaseData(id: "85e56d18-f3e3-4f8a-bd64-149dc03d99f6",
             input: "weights = [1,1,1,1,1], D = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "6189d363-d499-4990-a95c-d33f883d39a2",
             input: "weights = [1,2,3,4,5], D = 5",
             expected: "15", orderMatters: true),
            TestCaseData(id: "79d0d0af-73ec-4478-a522-729b99e67147",
             input: "weights = [5,4,3,2,1], D = 5",
             expected: "15", orderMatters: true),
            TestCaseData(id: "085d38b5-13ed-476b-a338-baa9d8792cc4",
             input: "weights = [10,20,30,40,50], D = 5",
             expected: "150", orderMatters: true),
            TestCaseData(id: "2c89fe66-a8a7-4bee-b603-6ab8756e9bd0",
             input: "weights = [50,40,30,20,10], D = 5",
             expected: "150", orderMatters: true),
            TestCaseData(id: "156e62b8-1d42-4996-9a80-5a8812280a4b",
             input: "weights = [1,2,3,4,5,6,7,8,9,10], D = 10",
             expected: "55", orderMatters: true),
            TestCaseData(id: "4f70b615-afb1-483b-9889-413daaea16df",
             input: "weights = [10,9,8,7,6,5,4,3,2,1], D = 10",
             expected: "55", orderMatters: true),
            TestCaseData(id: "25264a6b-bc6c-496c-8e7f-6b1bf0b1f38f",
             input: "weights = [1,1,1,1,1,1,1,1,1,1], D = 10",
             expected: "10", orderMatters: true),
            TestCaseData(id: "e8b08ba2-a72e-4a65-a33d-0bf3d2f3c741",
             input: "weights = [100,100,100,100,100], D = 5",
             expected: "500", orderMatters: true),
            TestCaseData(id: "3efbd320-f7df-42f5-9f9a-97e36e9ac5d0",
             input: "weights = [1,1,1,1,1,1,1,1,1,1], D = 5",
             expected: "10", orderMatters: true),
            TestCaseData(id: "4c6ce628-4dcc-4fa5-afe6-6d0aeb7083ba",
             input: "weights = [1,2,3,4,5,6,7,8,9,10], D = 2",
             expected: "55", orderMatters: true),
            TestCaseData(id: "ba6be251-2daf-4b24-a06a-e09fcebbd0b1",
             input: "weights = [10,9,8,7,6,5,4,3,2,1], D = 2",
             expected: "55", orderMatters: true),
            TestCaseData(id: "55e02796-fc79-424b-9434-8f15880c1c80",
             input: "weights = [1,2,3,4,5,6,7,8,9,10], D = 3",
             expected: "55", orderMatters: true),
            TestCaseData(id: "4e0ff137-90fb-4d14-b9ef-00a692302566",
             input: "weights = [10,9,8,7,6,5,4,3,2,1], D = 3",
             expected: "55", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "capacity-to-ship-packages-within-d-days"
            let topic = "binary-search"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_weights = InputParser.parseIntArray(params[0]) else {
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
            guard p_weights.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: weights array too large (\(p_weights.count))"
                )
                return
            }
            guard let p_D = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_weights.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= days <= weights.length <= 5 * 104"
                )
                return
            }
            guard p_weights.allSatisfy({ $0 >= 1 && $0 <= 500 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= weights[i] <= 500"
                )
                return
            }

            let solution = Solution()
            let result = solution.shipWithinDays(p_weights, p_D)
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
