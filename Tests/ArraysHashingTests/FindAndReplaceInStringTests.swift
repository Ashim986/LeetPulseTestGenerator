import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func findAndReplaceString(
        _ s: String,
        _ indices: [Int],
        _ sources: [String],
        _ targets: [String]
    ) -> String {
        let chars = Array(s)
        var match = Array(repeating: -1, count: chars.count)

        for i in 0..<indices.count {
            let start = indices[i]
            let src = Array(sources[i])
            guard start >= 0, start + src.count <= chars.count else { continue }
            if Array(chars[start..<start + src.count]) == src {
                match[start] = i
            }
        }

        var index = 0
        var result = ""
        while index < chars.count {
            let i = match[index]
            if i != -1 {
                result += targets[i]
                index += sources[i].count
            } else {
                result.append(chars[index])
                index += 1
            }
        }
        return result
    }
}

@Suite struct FindAndReplaceInStringTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "ca443728-00d5-4a31-8d44-3d60e4d3f1da"
        let rawInput = "s = \"abc\", indices = [1], sources = [\"b\"], targets = [\"d\"]"
        let expectedOutput = "adc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "6eee07f2-f7a0-4af6-9de2-5add8734ec31"
        let rawInput = "s = \"abc\", indices = [0], sources = [\"a\"], targets = [\"x\"]"
        let expectedOutput = "xbc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "7b865fc5-a1b6-45c1-9486-1aabe487fd5f"
        let rawInput = "s = \"abc\", indices = [], sources = [], targets = []"
        let expectedOutput = "abc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "76a17c7b-7b78-48ca-a002-ffe24b28c468"
        let rawInput = "s = \"abc\", indices = [1, 2], sources = [\"b\", \"c\"], targets = [\"d\", \"e\"]"
        let expectedOutput = "ade"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "3c5493fc-3dc2-4bdf-aa2f-ac148c5d2522"
        let rawInput = "s = \"abc\", indices = [0, 1], sources = [\"a\", \"b\"], targets = [\"x\", \"y\"]"
        let expectedOutput = "xyc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "e78443d0-6865-4984-b8f5-e4ce3dc937cf"
        let rawInput = "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"c\"], targets = [\"x\", \"y\", \"z\"]"
        let expectedOutput = "xyz"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "3ab9ec7f-4e29-467a-958e-7d22470eac07"
        let rawInput = "s = \"abc\", indices = [0, 0], sources = [\"a\", \"a\"], targets = [\"x\", \"y\"]"
        let expectedOutput = "ybc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "16f7a245-adf7-4c65-b965-82c69f1ddb2e"
        let rawInput = "s = \"abc\", indices = [0, 2], sources = [\"a\", \"c\"], targets = [\"x\", \"y\"]"
        let expectedOutput = "xby"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "0882fd4b-b5b1-44a0-93aa-19b54d708eda"
        let rawInput = "s = \"abc\", indices = [0, 0, 0], sources = [\"a\", \"a\", \"a\"], targets = [\"x\", \"y\", \"z\"]"
        let expectedOutput = "zbc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "9a38c3f3-9270-4070-aa3b-b2d251ab5632"
        let rawInput = "s = \"abc\", indices = [1, 1, 1], sources = [\"b\", \"b\", \"b\"], targets = [\"d\", \"e\", \"f\"]"
        let expectedOutput = "afc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "624b34d0-a4d8-4f9f-b01a-7b93ad59030f"
        let rawInput = "s = \"abc\", indices = [0, 0, 0], sources = [\"abc\", \"abc\", \"abc\"], targets = [\"x\", \"y\", \"z\"]"
        let expectedOutput = "z"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "1ebb1669-1195-4fe0-a1f0-e1f5a2270dca"
        let rawInput = "s = \"abc\", indices = [0], sources = [\"abc\"], targets = [\"xyz\"]"
        let expectedOutput = "xyz"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "6d2b0af4-90ab-4be5-b91e-3e6e4585ad7e"
        let rawInput = "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"c\"], targets = [\"x\", \"\", \"z\"]"
        let expectedOutput = "xz"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "57ae86f0-7b21-4694-94e9-ba3551485504"
        let rawInput = "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"c\"], targets = [\"\", \"y\", \"z\"]"
        let expectedOutput = "yz"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "959cf738-0b02-466d-adfa-85fe4f74a54e"
        let rawInput = "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"c\"], targets = [\"x\", \"y\", \"\"]"
        let expectedOutput = "xy"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "3d919264-0613-4d86-8868-b1076a6c95b2"
        let rawInput = "s = \"abc\", indices = [1], sources = [\"b\"], targets = [\"bb\"]"
        let expectedOutput = "abbc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "74ac3cf9-fc0b-4dbb-80a0-816faf1da016"
        let rawInput = "s = \"abc\", indices = [1, 1], sources = [\"b\", \"b\"], targets = [\"d\", \"e\"]"
        let expectedOutput = "aec"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "cbfe7707-2bb9-46c2-b227-2b44bec0d863"
        let rawInput = "s = \"abc\", indices = [0, 1, 2], sources = [\"ab\", \"bc\", \"ca\"], targets = [\"x\", \"y\", \"z\"]"
        let expectedOutput = "xc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "0203226a-065d-4a87-b035-cd5d3f9dad91"
        let rawInput = "s = \"abc\", indices = [0, 0, 0], sources = [\"ab\", \"ab\", \"ab\"], targets = [\"x\", \"y\", \"z\"]"
        let expectedOutput = "zc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "36f6534c-006c-491f-8d94-9aa98e0fe042"
        let rawInput = "s = \"abc\", indices = [0, 1, 2], sources = [\"abc\", \"abc\", \"abc\"], targets = [\"x\", \"y\", \"z\"]"
        let expectedOutput = "x"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "98e6ffa7-227e-4c3d-b44a-1305d8e2191c"
        let rawInput = "s = \"abc\", indices = [0, 1], sources = [\"abc\", \"abc\"], targets = [\"x\", \"y\"]"
        let expectedOutput = "x"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "47374d06-ed5e-4be0-b26d-d2c7ebf1e76d"
        let rawInput = "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"abc\"], targets = [\"x\", \"y\", \"z\"]"
        let expectedOutput = "xyc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "980b5729-1feb-40fe-a3b2-e15876684576"
        let rawInput = "s = \"abc\", indices = [0, 1, 2], sources = [\"abc\", \"b\", \"c\"], targets = [\"x\", \"y\", \"z\"]"
        let expectedOutput = "x"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "298c66ba-b50d-4f88-b786-540a9f8f6cce"
        let rawInput = "s = \"abc\", indices = [0, 1, 2], sources = [\"\", \"\", \"\"], targets = [\"x\", \"y\", \"z\"]"
        let expectedOutput = "INFINITE_LOOP"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "find-and-replace-in-string"
        let topic = "arrays-hashing"
        let testId = "e0cfbad9-f01a-4d81-9d6d-eb266eff1cf8"
        let rawInput = "s = \"abc\", indices = [0, 1, 2], sources = [\"a\", \"b\", \"\"], targets = [\"x\", \"y\", \"z\"]"
        let expectedOutput = "INFINITE_LOOP"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 4 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 4, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_indices = InputParser.parseIntArray(params[1])
        guard p_indices.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: indices array too large (\(p_indices.count))")
            return
        }
        let p_sources = InputParser.parseStringArray(params[2])
        guard p_sources.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: sources array too large (\(p_sources.count))")
            return
        }
        let p_targets = InputParser.parseStringArray(params[3])
        guard p_targets.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: targets array too large (\(p_targets.count))")
            return
        }

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 1000")
            return
        }

        let solution = Solution()
        let result = solution.findAndReplaceString(p_s, p_indices, p_sources, p_targets)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
