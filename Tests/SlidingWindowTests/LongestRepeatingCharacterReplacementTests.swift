import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func characterReplacement(_ s: String, _ k: Int, trace: Trace) -> Int {
        let chars = Array(s)
        var freq: [Character: Int] = [:]
        var maxFreq = 0
        var left = 0

        for right in 0..<chars.count {
            freq[chars[right], default: 0] += 1
            maxFreq = max(maxFreq, freq[chars[right]]!)

            let freqSnapshot = freq.reduce(into: [String: Int]()) { $0[String($1.key)] = $1.value }
            // If invalid, slide window (don't shrink, just shift)
            if (right - left + 1) - maxFreq > k {
                trace.step("contract window: replacements exceeded k=\(k)", ["left": left, "right": right, "maxFreq": maxFreq, "windowSize": right - left + 1, "freq": freqSnapshot])
                freq[chars[left]]! -= 1
                left += 1
            }
            let updatedFreq = freq.reduce(into: [String: Int]()) { $0[String($1.key)] = $1.value }
            trace.step("expand window: right=\(right), ch='\(chars[right])'", ["left": left, "right": right, "char": String(chars[right]), "maxFreq": maxFreq, "windowSize": right - left + 1, "freq": updatedFreq])
        }

        // Final window size is our answer
        return chars.count - left
    }
}

@Suite struct LongestRepeatingCharacterReplacementTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "C771C538-98A0-4325-835F-2B8E6BC30A88"
        let rawInput = "ABAB\n2"
        let expectedOutput = "4"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "26D4ED74-654B-4F73-9E46-AB1BC5C10659"
        let rawInput = "AABABBA\n1"
        let expectedOutput = "4"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "BBDA1B00-8A57-425C-B1AD-DEEE4837B297"
        let rawInput = "0"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "5858BA82-0713-4E70-A576-4C1F88C23B9B"
        let rawInput = "AAAA\n2"
        let expectedOutput = "4"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "AC2A0393-A4B1-4560-9F9B-79495134D207"
        let rawInput = "ABC\n0"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "59AE8172-C920-4751-8365-C3AA4E336982"
        let rawInput = "A\n0"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "D93D485A-BC89-4934-B726-0FD8B21C032F"
        let rawInput = "ABABAB\n3"
        let expectedOutput = "6"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "4D7363F8-EB8C-4814-814C-D292CB19B095"
        let rawInput = "AAAAAAAAAA\n5"
        let expectedOutput = "10"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "4B7EB5BE-8FEA-45A4-B30A-02699C68AFE8"
        let rawInput = "AAB\n1"
        let expectedOutput = "3"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "42180F45-D785-4501-9781-469F778B3C68"
        let rawInput = "AA\n1"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "5CC4BB85-CD9A-40FC-A019-EFFC9271283F"
        let rawInput = "AB\n0"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "7CCD205E-9D47-496C-AECA-543887C0C6A4"
        let rawInput = "AAAAB\n2"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "F6E9D5B9-3415-4F94-8EAD-4A00736FB5E9"
        let rawInput = "AAB\n2"
        let expectedOutput = "3"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "622AADF4-6C41-4B86-B3CE-D206E3986495"
        let rawInput = "ABC\n1"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "F63E12A4-C9EB-469E-9E70-4E9F16AFDBD5"
        let rawInput = "AAABBBCCC\n3"
        let expectedOutput = "6"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "B88F1FE7-1FA3-4E5E-9F02-CBADC5A72DBF"
        let rawInput = "AAAAAAA\n2"
        let expectedOutput = "7"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "AE7C6F0C-D65C-4133-9661-E234E9E84CC0"
        let rawInput = "A\n2"
        let expectedOutput = "1"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "AAD74678-8B51-41D0-9901-95126F1EF117"
        let rawInput = "ABABAB\n2"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "4873FAC7-0C3C-4C2F-9C29-365D2D67D0C4"
        let rawInput = "AAAAA\n1"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "4E5B31A6-3CA2-4EBE-B90C-C3316D5F353A"
        let rawInput = "2"
        let expectedOutput = "0"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "DF4AA644-FB9D-49D9-85A3-A9E898506750"
        let rawInput = "AB\n1"
        let expectedOutput = "2"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "A834167B-56F2-4F1E-8285-E6B8A592CDFC"
        let rawInput = "ABBB\n2"
        let expectedOutput = "4"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "6BE5A1B7-5E4A-489A-8065-3B66E047F62E"
        let rawInput = "ABABABAB\n3"
        let expectedOutput = "7"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "6C9DCC81-66B2-488D-9828-6B546DAE765D"
        let rawInput = "ABCABC\n2"
        let expectedOutput = "4"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "longest-repeating-character-replacement"
        let topic = "sliding-window"
        let testId = "63BFCE2A-14AE-47F4-B701-393ED6B60019"
        let rawInput = "AAABBB\n2"
        let expectedOutput = "5"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_s = InputParser.parseString(params[0])
        guard p_s.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
            return
        }
        let p_k = InputParser.parseInt(params[1])

        // Constraint precondition checks
        guard p_s.count >= 1 && p_s.count <= 105 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 105")
            return
        }

        let solution = Solution()
        let trace = Trace()
        let result = solution.characterReplacement(p_s, p_k, trace: trace)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters, traceSteps: trace.serializedSteps())
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
