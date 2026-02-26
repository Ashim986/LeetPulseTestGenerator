import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        var bankSet = Set(bank)
        if !bankSet.contains(end) { return -1 }
        var queue = [(start, 0)]
        var visited = Set([start])
        let genes: [Character] = ["A", "C", "G", "T"]

        while !queue.isEmpty {
            let (gene, steps) = queue.removeFirst()
            if gene == end { return steps }
            var chars = Array(gene)
            for i in 0..<chars.count {
                let original = chars[i]
                for g in genes {
                    chars[i] = g
                    let mutation = String(chars)
                    if bankSet.contains(mutation) && !visited.contains(mutation) {
                        visited.insert(mutation)
                        queue.append((mutation, steps + 1))
                    }
                }
                chars[i] = original
            }
        }
        return -1
    }
}

@Suite struct MinimumGeneticMutationTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "1437b17c-732c-48bc-bc13-97f9a390ddc1"
        let rawInput = "start = \"\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\"]"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "e8a0b37f-7bd3-4fd6-940f-7fa130a60cae"
        let rawInput = "start = \"AACCGGTT\", end = \"\", bank = [\"AACCGGTA\",\"AACCGCTA\"]"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_2() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "28b85d5b-6ca7-4ef2-8876-85057d9cf00a"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = []"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_3() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "ceb6ddfd-5770-4943-94f6-eb63dcff87fd"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGCTA\",\"AACCGCTA\"]"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_4() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "5b7d9414-69b9-4f7c-9346-81f0c971b013"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_5() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "e9464f60-810a-4501-a607-05a8ead84a41"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_6() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "e72a2914-336b-445a-8b0a-8b04e06aa027"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGCTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_7() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "922f35f5-6794-4d38-b705-efa588a54a8d"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\",\"AACCGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_8() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "fe0c27f9-fc16-43a8-95f6-b21d55223306"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGCTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_9() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "02d7b878-0a93-4fbc-a47a-445ca2b58b56"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_10() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "10fa66bc-e4fc-47d1-9fab-48d50f578b19"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_11() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "9cb80466-de86-4916-8ca2-9747fcdf3e04"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGCTA\",\"AACCGCTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_12() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "128f1315-971c-48fe-995a-d538accaefec"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_13() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "5faaec01-f0e5-4f30-831e-1b014845f0c6"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGCTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\"]"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_14() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "a9ccf60d-609e-406b-b563-21a1b99f374d"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGCTA\",\"AACCGCTA\",\"AACCGCTA\",\"AACCGCTA\"]"
        let expectedOutput = "-1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_15() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "9290788a-adf2-456f-9e04-30f94285cc80"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_16() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "c38ceec3-8ffc-4229-8bdd-468685becf53"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_17() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "593fea21-3cb1-4a87-b8ae-aff44ce74b21"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGCTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_18() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "1e7a878f-2a8c-4d9b-af63-9935c4880c86"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_19() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "a46db1a3-df44-4c4d-9475-e54a8d8ee37f"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_20() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "d9a424e7-505f-4961-816d-b22351869d7a"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_21() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "50e07521-a3b6-42b2-a5e7-a1058be7ca0c"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_22() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "9bdaab4b-ea1e-48b7-8768-aeb8e52d749d"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_23() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "e5780b87-db1b-4275-a7d5-a2cf52e81afa"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_24() async {
        let slug = "minimum-genetic-mutation"
        let topic = "graphs"
        let testId = "e0fe7429-81f2-4a1a-a76d-0f07dff9e620"
        let rawInput = "start = \"AACCGGTT\", end = \"AAACGGTA\", bank = [\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AACCGGTA\",\"AACCGCTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\",\"AAACGGTA\"]"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 3 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 3, got \(params.count)")
            return
        }

        let p_start = InputParser.parseString(params[0])
        guard p_start.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: start string too long (\(p_start.count))")
            return
        }
        let p_end = InputParser.parseString(params[1])
        guard p_end.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: end string too long (\(p_end.count))")
            return
        }
        guard let p_bank = InputParser.parseStringArray(params[2]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 2 as [String]: '\(params[2])'")
            return
        }
        guard p_bank.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: bank array too large (\(p_bank.count))")
            return
        }

        // Constraint precondition checks
        guard p_bank.count >= 0 && p_bank.count <= 10 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= bank.length <= 10")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.minMutation(p_start, p_end, p_bank)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
