import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
      let paragraph = paragraph.lowercased().replacingOccurrences(of: "$|", with: "", options: .regularExpression)
      let words = paragraph.components(separatedBy: " ")
      var wordCount: [String: Int] = [:]
      let bannedSet = Set(banned.map { $0.lowercased() })
      for word in words {
        if !bannedSet.contains(word) {
          wordCount[word] = (wordCount[word] ?? 0) + 1
        }
      }
      let sortedWords = wordCount.sorted(by: { $0.value > $1.value })
      return sortedWords.first!.key
    }
}

@Suite struct MostCommonWordTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "c931c94e-cb58-467c-af8a-37b742fed351"
        let rawInput = "paragraph = \"a\", banned = []"
        let expectedOutput = "a"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "5190259d-7442-44ed-9e44-17face22f98b"
        let rawInput = "paragraph = \"a, b, c, d, e, f, g\", banned = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\"]"
        let expectedOutput = "g"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "fae46b55-415c-47b0-8178-5c53c06e02a3"
        let rawInput = "paragraph = \"a, b, c, d, e, f, g, h\", banned = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\"]"
        let expectedOutput = "h"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "bb0f264a-d128-4998-9c1d-012a026ae271"
        let rawInput = "paragraph = \"a, b, c, d, e, f, g, h, i\", banned = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\"]"
        let expectedOutput = "i"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "56b6a53b-01be-499b-8e5b-f26c5c9a04ba"
        let rawInput = "paragraph = \"a, a, a, a, b, b, b, c, c, c\", banned = []"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "8656eef9-2ae5-4c21-9c65-a3a30e395814"
        let rawInput = "paragraph = \"a, b, c\", banned = []"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "3451fd41-764e-4b5e-a0b2-821a141ab4b3"
        let rawInput = "paragraph = \"a, a, b, b\", banned = []"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "71778dc9-3281-46d3-bcac-32e24663119d"
        let rawInput = "paragraph = \"a, a, a, b, b, b\", banned = [\"a\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "2e3fdb7d-8583-4912-83eb-cbf2600a0084"
        let rawInput = "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = []"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "a76b35e4-9345-40bf-8b64-692f3158d107"
        let rawInput = "paragraph = \"a, a, a, a, a, a, a, a, a, a\", banned = []"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "c2b7eeeb-d056-4ca8-82a4-d68bc17a862b"
        let rawInput = "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = [\"a\", \"b\", \"c\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "bc46f9e4-58f3-4129-b743-91ce25e53221"
        let rawInput = "paragraph = \"a, a, b, b, c, c\", banned = [\"a\", \"b\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "eedc81bb-0547-47f6-95c1-7300ca72afd1"
        let rawInput = "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "c69a1f8b-c6d8-41a8-88ad-5cccdb97cfe3"
        let rawInput = "paragraph = \"a, a, b, b, c, c\", banned = [\"c\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "8c3f8aad-7299-44e7-996a-764278da4beb"
        let rawInput = "paragraph = \"a, a, a, b, b, b\", banned = [\"b\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "cbb9f10e-f2c7-41ea-b8ac-3f4f6ec7ed22"
        let rawInput = "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = [\"j\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "8370797d-7c9f-47e5-8c5d-cf328d63b741"
        let rawInput = "paragraph = \"a, a, b, b, c, c\", banned = [\"a\", \"c\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "affe818d-7be4-4bc0-ab90-937ac4bd7682"
        let rawInput = "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = [\"a\", \"j\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "40348286-8592-4a25-b62b-fcba5079cfad"
        let rawInput = "paragraph = \"a, b, c, d, e, f, g, h, i, j\", banned = [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"k\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "39479378-c7e7-47b8-8516-ee22401c4f8e"
        let rawInput = "paragraph = \"a, a, a, b, b\", banned = []"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "da5a3df4-862d-4509-84d7-49bf78595a5d"
        let rawInput = "paragraph = \"a, a, b, b\", banned = [\"a\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "063d1bed-9c93-41eb-aee4-1ceb2790263c"
        let rawInput = "paragraph = \"a, b, c\", banned = [\"a\", \"b\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "3229e6dc-2a12-4a84-8757-ac2e81ed2906"
        let rawInput = "paragraph = \"a, b, c, d, e, f\", banned = []"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "862cbbb4-10e7-4e82-98a9-b2ee199e1005"
        let rawInput = "paragraph = \"a, a, a, a, b, b\", banned = [\"a\"]"
        let expectedOutput = "a,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "most-common-word"
        let topic = "arrays-hashing"
        let testId = "ffd1d3e7-d115-478d-8e52-8bcf575f9f7b"
        let rawInput = "paragraph = \"a, a, b, b, c, c, d, d\", banned = [\"a\", \"b\", \"c\"]"
        let expectedOutput = "d,"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
            return
        }

        let p_paragraph = InputParser.parseString(params[0])
        guard p_paragraph.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: paragraph string too long (\(p_paragraph.count))")
            return
        }
        let p_banned = InputParser.parseStringArray(params[1])
        guard p_banned.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: banned array too large (\(p_banned.count))")
            return
        }

        // Constraint precondition checks
        guard p_paragraph.count >= 1 && p_paragraph.count <= 1000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= paragraph.length <= 1000")
            return
        }
        guard p_banned.count >= 0 && p_banned.count <= 100 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Constraint violation: 0 <= banned.length <= 100")
            return
        }

        let solution = Solution()
        let result = solution.mostCommonWord(p_paragraph, p_banned)
        let computedOutput = OutputSerializer.serialize(result)

        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
