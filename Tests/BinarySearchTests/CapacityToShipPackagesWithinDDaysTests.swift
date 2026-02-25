import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
        let total = weights.reduce(0, +)
        let maxWeight = weights.max()!
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

    @Test func test_0() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "a474bf96-f2a0-481c-a076-db26fe7a8700"
        let rawInput = "weights = [1], D = 1"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "27c866f2-5d45-4bf3-88c9-2a3bba4fff1c"
        let rawInput = "weights = [], D = 1"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "af01d364-1e67-4e2e-b7cd-d0073900d70c"
        let rawInput = "weights = [1,2,3], D = 1"
        let expectedOutput = "6"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "cc51f283-c8a4-4d4d-841e-92750971aa7b"
        let rawInput = "weights = [5,5,5,5,5], D = 1"
        let expectedOutput = "25"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "752a8009-5dc9-4ef3-b73f-ef125af41364"
        let rawInput = "weights = [1,1,1,1,1], D = 1"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "62949c86-c5b0-455a-8a1a-9ad885ce7c23"
        let rawInput = "weights = [1,1,1,1,1,1,1,1,1,1], D = 1"
        let expectedOutput = "10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "329b0b70-e1b7-4e0d-96bd-8799ea889503"
        let rawInput = "weights = [100,100,100,100,100], D = 1"
        let expectedOutput = "500"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "416702da-0825-4e39-bc48-cf49af962615"
        let rawInput = "weights = [1,2,3,4,5,6,7,8,9,10], D = 1"
        let expectedOutput = "55"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "3b8b9760-2960-4d64-81df-7423d2b8ae24"
        let rawInput = "weights = [10,9,8,7,6,5,4,3,2,1], D = 1"
        let expectedOutput = "55"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "7099fff5-2d29-4d64-990e-5eb9e9ec7c9f"
        let rawInput = "weights = [1,2,3], D = 3"
        let expectedOutput = "6"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "42f170e2-475f-4506-9382-0bbbd23d6774"
        let rawInput = "weights = [10,10,10], D = 2"
        let expectedOutput = "30"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "85e56d18-f3e3-4f8a-bd64-149dc03d99f6"
        let rawInput = "weights = [1,1,1,1,1], D = 5"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "6189d363-d499-4990-a95c-d33f883d39a2"
        let rawInput = "weights = [1,2,3,4,5], D = 5"
        let expectedOutput = "15"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "79d0d0af-73ec-4478-a522-729b99e67147"
        let rawInput = "weights = [5,4,3,2,1], D = 5"
        let expectedOutput = "15"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "085d38b5-13ed-476b-a338-baa9d8792cc4"
        let rawInput = "weights = [10,20,30,40,50], D = 5"
        let expectedOutput = "150"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "2c89fe66-a8a7-4bee-b603-6ab8756e9bd0"
        let rawInput = "weights = [50,40,30,20,10], D = 5"
        let expectedOutput = "150"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "156e62b8-1d42-4996-9a80-5a8812280a4b"
        let rawInput = "weights = [1,2,3,4,5,6,7,8,9,10], D = 10"
        let expectedOutput = "55"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "4f70b615-afb1-483b-9889-413daaea16df"
        let rawInput = "weights = [10,9,8,7,6,5,4,3,2,1], D = 10"
        let expectedOutput = "55"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "25264a6b-bc6c-496c-8e7f-6b1bf0b1f38f"
        let rawInput = "weights = [1,1,1,1,1,1,1,1,1,1], D = 10"
        let expectedOutput = "10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "e8b08ba2-a72e-4a65-a33d-0bf3d2f3c741"
        let rawInput = "weights = [100,100,100,100,100], D = 5"
        let expectedOutput = "500"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "3efbd320-f7df-42f5-9f9a-97e36e9ac5d0"
        let rawInput = "weights = [1,1,1,1,1,1,1,1,1,1], D = 5"
        let expectedOutput = "10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "4c6ce628-4dcc-4fa5-afe6-6d0aeb7083ba"
        let rawInput = "weights = [1,2,3,4,5,6,7,8,9,10], D = 2"
        let expectedOutput = "55"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "ba6be251-2daf-4b24-a06a-e09fcebbd0b1"
        let rawInput = "weights = [10,9,8,7,6,5,4,3,2,1], D = 2"
        let expectedOutput = "55"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "55e02796-fc79-424b-9434-8f15880c1c80"
        let rawInput = "weights = [1,2,3,4,5,6,7,8,9,10], D = 3"
        let expectedOutput = "55"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "capacity-to-ship-packages-within-d-days"
        let topic = "binary-search"
        let testId = "4e0ff137-90fb-4d14-b9ef-00a692302566"
        let rawInput = "weights = [10,9,8,7,6,5,4,3,2,1], D = 3"
        let expectedOutput = "55"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_weights = InputParser.parseIntArray(params[0])
        guard p_weights.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: weights array too large (\(p_weights.count))")
            return
        }
        let p_D = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_weights.allSatisfy { $0 >= 1 && $0 <= 500 } else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= weights[i] <= 500")
            return
        }

        let solution = Solution()
        let result = solution.shipWithinDays(p_weights, p_D)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
