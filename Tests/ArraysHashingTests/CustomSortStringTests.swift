import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func customSortString(_ S: String, _ T: String, trace: Trace) -> String {
        let SArray = Array(S)
        let TArray = Array(T)
        var TCount: [Character: Int] = [:]
        var result = ""
        for char in TArray {
            TCount[char, default: 0] += 1
        }
        let countSnapshot = TCount.reduce(into: [String: Int]()) { $0[String($1.key)] = $1.value }
        trace.step("count chars in T", ["TCount": countSnapshot, "S": String(S), "T": String(T)])
        for char in SArray {
            if let count = TCount[char] {
                result += String(repeating: char, count: count)
                TCount[char] = nil
                trace.step("ordered char=\(char)", ["char": String(char), "count": count, "result": result])
            }
        }
        let remainingSnapshot = TCount.reduce(into: [String: Int]()) { $0[String($1.key)] = $1.value }
        trace.step("remaining chars", ["remaining": remainingSnapshot, "resultBeforeRemaining": result])
        for (char, count) in TCount {
            result += String(repeating: char, count: count)
        }
        trace.step("final result", ["result": result])
        return result
    }
}

@Suite struct CustomSortStringTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "9520a87f-c9cd-4848-9801-8f8b81296915"
        let rawInput = "S = \"abc\", T = \"abc\""
        let expectedOutput = "abc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "d216ac75-4cf8-4d1e-862e-eb620ee0db7d"
        let rawInput = "S = \"\", T = \"abc\""
        let expectedOutput = "abc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "8c814a50-f532-49df-af4f-03e148e27f44"
        let rawInput = "S = \"a\", T = \"a\""
        let expectedOutput = "a"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "a6523ce0-4f45-4096-b3be-10b1aeafea48"
        let rawInput = "S = \"ab\", T = \"ba\""
        let expectedOutput = "ab"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "bbed1d07-8912-4cc6-ba1b-026221b23c8a"
        let rawInput = "S = \"abc\", T = \"bca\""
        let expectedOutput = "abc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "cc35e3cb-00a1-487b-909c-21e63e532677"
        let rawInput = "S = \"abcdefgh\", T = \"hgfedcba\""
        let expectedOutput = "abcdefgh"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "d0c551ca-3cd5-4b4f-b0b3-df5329604ce1"
        let rawInput = "S = \"abcdefgh\", T = \"abcdefgh\""
        let expectedOutput = "abcdefgh"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "4631b063-f36b-4a21-8977-0ad05f09efcf"
        let rawInput = "S = \"abcd\", T = \"dcba\""
        let expectedOutput = "abcd"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "172ccda9-2db6-47ff-94b1-7745e754fbdf"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghij\""
        let expectedOutput = "abcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "fb0643f0-b5ed-497b-be36-c383bb7c6de6"
        let rawInput = "S = \"abcdefghij\", T = \"jihgfedcba\""
        let expectedOutput = "abcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "02e8f178-6834-419b-99eb-11a80cda4ea9"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghijabcdefghij\""
        let expectedOutput = "abcdefghijabcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "5206a112-44a8-4346-abd7-fbe69c9733db"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghij\""
        let expectedOutput = "abcdefghijabcdefghijabcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "440d62c1-4af5-4184-85dd-15815571830a"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghij\""
        let expectedOutput = "abcdefghijabcdefghijabcdefghijabcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "b4022677-fbb8-4123-8914-8b1dc5ea39dd"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\""
        let expectedOutput = "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "d8c3df4e-3afa-4f0d-8180-b96c070043e6"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\""
        let expectedOutput = "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "cbd13087-1a4a-4978-ab75-cfb190dab0f8"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\""
        let expectedOutput = "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "691c9d24-5f99-4e08-a3e4-580e888c847e"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\""
        let expectedOutput = "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "bd4cffb7-8355-4848-bfdc-511eb4ba3b06"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\""
        let expectedOutput = "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "f6cc2765-f80f-424c-875d-a1de4e2901a5"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\""
        let expectedOutput = "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "25c08442-686c-45bc-9ffa-ff51a036b285"
        let rawInput = "S = \"abcdefghij\", T = \"abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij\""
        let expectedOutput = "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "c5cfcf6f-bcac-4953-afa1-f3bf40f73062"
        let rawInput = "S = \"abc\", T = \"aaa\""
        let expectedOutput = "aaa"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "db66197c-68ea-48bb-af9c-529efab72514"
        let rawInput = "S = \"abc\", T = \"cab\""
        let expectedOutput = "abc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "198a9d7d-09c9-4ee4-b3e9-a0ab3957dd69"
        let rawInput = "S = \"aabbcc\", T = \"abc\""
        let expectedOutput = "abc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "122e67bd-923f-4d9f-a01c-307fc412993a"
        let rawInput = "S = \"abc\", T = \"aabbcc\""
        let expectedOutput = "aabbcc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "custom-sort-string"
        let topic = "arrays-hashing"
        let testId = "24116398-eab4-4199-8130-2cb7191aa211"
        let rawInput = "S = \"abc\", T = \"abcabc\""
        let expectedOutput = "aabbcc"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_S = InputParser.parseString(params[0])
        guard p_S.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: S string too long (\(p_S.count))")
            return
        }
        let p_T = InputParser.parseString(params[1])
        guard p_T.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: T string too long (\(p_T.count))")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.customSortString(p_S, p_T, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
