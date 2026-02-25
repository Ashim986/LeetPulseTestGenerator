import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func isNStraightHand(_ deck: [Int], _ handSize: Int) -> Bool {
        if deck.count % handSize != 0 {
            return false
        }
        var count: [Int: Int] = [:]
        for num in deck {
            if let value = count[num] {
                count[num] = value + 1
            } else {
                count[num] = 1
            }
        }
        let sortedKeys = Array(count.keys).sorted()
        var prev = sortedKeys[0]
        var groupSize = count[prev]!
        for key in sortedKeys[1...] {
            if key - prev != 1 {
                return false
            }
            if count[key]! < groupSize {
                return false
            }
            prev = key
            groupSize = count[key]!
        }
        return true
    }
}

@Suite struct XOfAKindInADeckOfCardsTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "aeb14bb5-dc8f-4647-96dd-4d2e334215b3"
        let rawInput = "deck = [1,2,3,4,5], handSize = 5"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "e8581af1-0a56-452e-8ecd-a12c75014d76"
        let rawInput = "deck = [1,2,3,4,5,6,7,8,9], handSize = 3"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "0f208f7e-8237-440a-acdb-ab687b211096"
        let rawInput = "deck = [1,2,3,4,5,6,7,8,9,10], handSize = 2"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "6a7d984f-826c-4074-bde4-9d7cea808078"
        let rawInput = "deck = [1,2,3,4,5,6,7,8,9,10,11,12], handSize = 3"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "6974a263-aeac-4222-82fa-1bba31345739"
        let rawInput = "deck = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], handSize = 5"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "1a9ff605-1797-4043-ae31-fd96519472e0"
        let rawInput = "deck = [1], handSize = 1"
        let expectedOutput = "true"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "c96d2548-02e9-4ade-b103-2436405e3a33"
        let rawInput = "deck = [1,2,3], handSize = 1"
        let expectedOutput = "true"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "a77079fa-8d10-469e-9bef-443f088f47f4"
        let rawInput = "deck = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], handSize = 5"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "ac901b7b-c39d-4378-9aa5-abd073bf9a7b"
        let rawInput = "deck = [1,2,3,4,5,6], handSize = 3"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "38643eb9-de04-4e47-84a7-7d5f3cc07490"
        let rawInput = "deck = [1,1,1,2,2,2,3,3,3], handSize = 3"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "72077b55-5e1b-4412-8f13-720c2a55ce63"
        let rawInput = "deck = [1,1,1,1,1,2,2,2,2,2], handSize = 5"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "f1fdf656-fa1a-47b4-9e6a-33facb1e4276"
        let rawInput = "deck = [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5], handSize = 3"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "851a28a7-5b08-431d-8133-63aa5b38df0f"
        let rawInput = "deck = [1,1,1,1,2,2,2,2,3,3,3,3], handSize = 4"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "70875011-3792-4d72-bf90-a6a113c9c6da"
        let rawInput = "deck = [1,1,1,1,1,1,1,1,1,1], handSize = 10"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "68c797ff-843f-400e-acdc-2597b104d490"
        let rawInput = "deck = [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6], handSize = 3"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "af56856d-77e8-4026-81de-945ab0e49a41"
        let rawInput = "deck = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], handSize = 15"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "bf7f8830-06eb-4052-8fa1-f8546cfad28c"
        let rawInput = "deck = [], handSize = 3"
        let expectedOutput = "true"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "49b8486b-a330-4a43-b211-3bb2ce974617"
        let rawInput = "deck = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], handSize = 20"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "c5c18320-2b71-452b-b082-2da9639565c2"
        let rawInput = "deck = [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7,7,7], handSize = 3"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "4c0c6548-ed6c-4522-b896-17f9e80cbb7a"
        let rawInput = "deck = [1,2,3,4,4,3,2,1]"
        let expectedOutput = "true"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "x-of-a-kind-in-a-deck-of-cards"
        let topic = "math-geometry"
        let testId = "5e48ed47-2ee8-4397-b518-cf56a80368b1"
        let rawInput = "deck = [1,1,1,2,2,2,3,3]"
        let expectedOutput = "false"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deck = InputParser.parseIntArray(params[0])
        guard p_deck.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deck array too large (\(p_deck.count))")
            return
        }
        let p_handSize = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_deck.count >= 1 && p_deck.count <= 104 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deck.length <= 104")
            return
        }

        let solution = Solution()
        let result = solution.isNStraightHand(p_deck, p_handSize)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
