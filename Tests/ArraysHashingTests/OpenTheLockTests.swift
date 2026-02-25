import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let dead = Set(deadends)
        if dead.contains("0000") { return -1 }
        if target == "0000" { return 0 }

        func neighbors(_ state: String) -> [String] {
            let chars = Array(state)
            var result: [String] = []
            result.reserveCapacity(8)
            for i in 0..<4 {
                guard let digit = chars[i].wholeNumberValue else { continue }
                for delta in [-1, 1] {
                    let nextDigit = (digit + delta + 10) % 10
                    var next = chars
                    next[i] = Character(String(nextDigit))
                    result.append(String(next))
                }
            }
            return result
        }

        var queue: [String] = ["0000"]
        var visited: Set<String> = ["0000"]
        var steps = 0

        while !queue.isEmpty {
            steps += 1
            var nextQueue: [String] = []
            for state in queue {
                for next in neighbors(state) {
                    if dead.contains(next) { continue }
                    if visited.contains(next) { continue }
                    if next == target { return steps }
                    visited.insert(next)
                    nextQueue.append(next)
                }
            }
            queue = nextQueue
        }

        return -1
    }
}

@Suite struct OpenTheLockTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "a840cff8-a8d6-4be4-9dde-5f722cd66afb"
        let rawInput = "deadends = [], target = \"0000\""
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "0e41d010-ca43-4031-9b7b-1d967f7b8d87"
        let rawInput = "deadends = [\"0000\"], target = \"9999\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "0e472fa7-dc37-4884-8e0a-131ca2a78656"
        let rawInput = "deadends = [\"0000\",\"0001\"], target = \"9999\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "195bcd2a-0729-42e7-bc04-5c18b56e49ff"
        let rawInput = "deadends = [\"0000\",\"0001\",\"0002\"], target = \"9999\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "2ef5a1b4-e2a8-4cba-bf86-42d443bcdbf2"
        let rawInput = "deadends = [\"0000\"], target = \"8888\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "45d18cc3-3673-4453-9e20-5eb72250d948"
        let rawInput = "deadends = [\"8888\"], target = \"0000\""
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "806a14d2-8704-4722-bafd-4bb86b59a31d"
        let rawInput = "deadends = [\"0000\"], target = \"0000\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "ece14cda-469b-4f38-9c62-f99891a428bd"
        let rawInput = "deadends = [\"0000\"], target = \"0001\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "e7cbf7a9-6fda-49cc-9c41-bbcdd4560587"
        let rawInput = "deadends = [\"0000\"], target = \"0009\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "934223bf-a789-4487-9d6e-49b57e4d293d"
        let rawInput = "deadends = [\"0000\"], target = \"0010\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "ac0b6839-5699-489d-9a5f-dc308bae023f"
        let rawInput = "deadends = [\"0000\"], target = \"0099\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "9d163fdf-bdba-450e-a985-2cffeaea6a1e"
        let rawInput = "deadends = [\"0000\"], target = \"0100\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "a9b0bb8f-9e22-4bf0-a624-c290eb07f15d"
        let rawInput = "deadends = [\"0000\"], target = \"0999\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "7d173e99-abc4-402a-93be-60b0ee77a648"
        let rawInput = "deadends = [\"0000\"], target = \"1000\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "6dfa1891-032d-4638-a326-bc1c5edfa891"
        let rawInput = "deadends = [\"0000\",\"0001\"], target = \"0002\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "3f921946-2f6a-4396-99c8-bbf5d3b92b4c"
        let rawInput = "deadends = [\"0000\",\"0001\"], target = \"0009\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "6cdfef0e-979c-4d2c-bca8-14c280c92e4c"
        let rawInput = "deadends = [\"0000\",\"0001\"], target = \"0010\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "289400bf-4c88-49a4-a420-3cd4f3acc6f4"
        let rawInput = "deadends = [\"0000\",\"0001\"], target = \"0099\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "4e9d1770-44cd-4909-9372-0cecbe9baba7"
        let rawInput = "deadends = [\"0000\",\"0001\"], target = \"0100\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "47639099-0fbb-46c2-9f76-3732d413e95a"
        let rawInput = "deadends = [\"0000\",\"0001\"], target = \"0999\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "843a6f7c-c6b4-4e84-a2dc-cda2bab01733"
        let rawInput = "deadends = [\"0000\",\"0001\"], target = \"1000\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "2c3010a7-a516-42d3-9572-125555476830"
        let rawInput = "deadends = [\"0000\",\"0001\",\"0002\"], target = \"0003\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "0aeda4c2-59db-4545-8046-5d46e72f0911"
        let rawInput = "deadends = [\"0000\",\"0001\",\"0002\"], target = \"0009\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "8b8314f0-2bf6-405c-bd8f-78667ab80348"
        let rawInput = "deadends = [\"0000\",\"0001\",\"0002\"], target = \"0010\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "open-the-lock"
        let topic = "arrays-hashing"
        let testId = "fbffb8ac-da30-47b4-b225-2e51978f749d"
        let rawInput = "deadends = [\"0000\",\"0001\",\"0002\"], target = \"0099\""
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_deadends = InputParser.parseStringArray(params[0])
        guard p_deadends.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: deadends array too large (\(p_deadends.count))")
            return
        }
        let p_target = InputParser.parseString(params[1])
        guard p_target.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target string too long (\(p_target.count))")
            return
        }

        // Constraint precondition checks
        guard p_deadends.count >= 1 && p_deadends.count <= 500 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= deadends.length <= 500")
            return
        }
        guard p_target.count == 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: target.length == 4")
            return
        }

        let solution = Solution()
        let result = solution.openLock(p_deadends, p_target)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
