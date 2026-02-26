import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    func wordFrequency(_ text: String) -> [String: Int] {
        var wordCounts: [String: Int] = [:]
        let words = text.components(separatedBy: .whitespaces)
        for word in words {
            let lowerCaseWord = word.lowercased()
            wordCounts[lowerCaseWord, default: 0] += 1
        }
        return wordCounts
    }
}

@Suite struct WordFrequencyTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "929a062c-b348-40e3-8047-2d5b556e65bf"
        let rawInput = "text = \"a\""
        let expectedOutput = "{\"a\": 1}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_1() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "e4f4a9cf-30e7-4548-981e-28e8e0110b2b"
        let rawInput = "text = \"abc def ghi\""
        let expectedOutput = "{\"abc\": 1, \"def\": 1, \"ghi\": 1}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_2() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "c7aacd8f-5293-469a-bd18-6bfac516178f"
        let rawInput = "text = \"hello world hello world\""
        let expectedOutput = "{\"hello\": 2, \"world\": 2}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_3() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "89b3c657-332f-4c45-8ea6-409be1e8c2a8"
        let rawInput = "text = \"a a a a a\""
        let expectedOutput = "{\"a\": 5}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_4() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "8783f404-e909-4ce1-b9f0-a43b3c5aa4b4"
        let rawInput = "text = \"123 456 789\""
        let expectedOutput = "{\"123\": 1, \"456\": 1, \"789\": 1}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_5() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "8bbadde7-1e5e-485f-b435-dd676b715cfb"
        let rawInput = "text = \"abc abc abc abc abc abc abc abc abc abc\""
        let expectedOutput = "{\"abc\": 10}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_6() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "b07718ca-e741-43f1-8ab6-d784daf4d7f3"
        let rawInput = "text = \"a b c d e f g h i j k l m n o p q r s t u v w x y z\""
        let expectedOutput = "{\"a\": 1, \"b\": 1, \"c\": 1, \"d\": 1, \"e\": 1, \"f\": 1, \"g\": 1, \"h\": 1, \"i\": 1, \"j\": 1, \"k\": 1, \"l\": 1, \"m\": 1, \"n\": 1, \"o\": 1, \"p\": 1, \"q\": 1, \"r\": 1, \"s\": 1, \"t\": 1, \"u\": 1, \"v\": 1, \"w\": 1, \"x\": 1, \"y\": 1, \"z\": 1}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_7() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "65f91b1e-2aff-4b68-990b-9f9562f9d841"
        let rawInput = "text = \"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z\""
        let expectedOutput = "{\"a\": 1, \"b\": 1, \"c\": 1, \"d\": 1, \"e\": 1, \"f\": 1, \"g\": 1, \"h\": 1, \"i\": 1, \"j\": 1, \"k\": 1, \"l\": 1, \"m\": 1, \"n\": 1, \"o\": 1, \"p\": 1, \"q\": 1, \"r\": 1, \"s\": 1, \"t\": 1, \"u\": 1, \"v\": 1, \"w\": 1, \"x\": 1, \"y\": 1, \"z\": 1}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_8() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "97db4123-03c6-4fcd-930a-77ede346f06d"
        let rawInput = "text = \"a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z\""
        let expectedOutput = "{\"a\": 2, \"b\": 2, \"c\": 2, \"d\": 2, \"e\": 2, \"f\": 2, \"g\": 2, \"h\": 2, \"i\": 2, \"j\": 2, \"k\": 2, \"l\": 2, \"m\": 2, \"n\": 2, \"o\": 2, \"p\": 2, \"q\": 2, \"r\": 2, \"s\": 2, \"t\": 2, \"u\": 2, \"v\": 2, \"w\": 2, \"x\": 2, \"y\": 2, \"z\": 2}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_9() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "103b8f96-84bc-4026-972c-64168351996f"
        let rawInput = "text = \"hello world hello world hello world hello world hello world\""
        let expectedOutput = "{\"hello\": 5, \"world\": 5}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_10() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "79207355-d6c7-4c48-84d1-88256d4636f4"
        let rawInput = "text = \"hello world hello world hello world hello world hello world hello world\""
        let expectedOutput = "{\"hello\": 6, \"world\": 6}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_11() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "7c8f61de-b66e-48c2-a7a3-061783a8c8fd"
        let rawInput = "text = \"a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z\""
        let expectedOutput = "{\"a\": 3, \"b\": 3, \"c\": 3, \"d\": 3, \"e\": 3, \"f\": 3, \"g\": 3, \"h\": 3, \"i\": 3, \"j\": 3, \"k\": 3, \"l\": 3, \"m\": 3, \"n\": 3, \"o\": 3, \"p\": 3, \"q\": 3, \"r\": 3, \"s\": 3, \"t\": 3, \"u\": 3, \"v\": 3, \"w\": 3, \"x\": 3, \"y\": 3, \"z\": 3}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_12() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "5df9c8eb-46a7-40dc-8777-059cd2fcd610"
        let rawInput = "text = \"hello world hello world hello world hello world hello world hello world hello world\""
        let expectedOutput = "{\"hello\": 7, \"world\": 7}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_13() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "387257d0-384b-4892-931a-0a0f1edb6d4d"
        let rawInput = "text = \"a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z\""
        let expectedOutput = "{\"a\": 4, \"b\": 4, \"c\": 4, \"d\": 4, \"e\": 4, \"f\": 4, \"g\": 4, \"h\": 4, \"i\": 4, \"j\": 4, \"k\": 4, \"l\": 4, \"m\": 4, \"n\": 4, \"o\": 4, \"p\": 4, \"q\": 4, \"r\": 4, \"s\": 4, \"t\": 4, \"u\": 4, \"v\": 4, \"w\": 4, \"x\": 4, \"y\": 4, \"z\": 4}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_14() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "d3bbf749-8214-4018-8789-1613c78b2031"
        let rawInput = "text = \"hello world hello world hello world hello world hello world hello world hello world hello world\""
        let expectedOutput = "{\"hello\": 8, \"world\": 8}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_15() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "6abb07d1-ecb5-407b-8151-0dae20bee85e"
        let rawInput = "text = \"\""
        let expectedOutput = "{\"\":1}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_16() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "f4f4d73e-7406-4bc5-9f75-ad09be0ddb2a"
        let rawInput = "text = \"the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog\""
        let expectedOutput = "{\"brown\":2,\"dog\":2,\"fox\":2,\"jumps\":2,\"lazy\":2,\"over\":2,\"quick\":2,\"the\":4}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_17() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "9b9a9d10-e61f-4bf2-95e3-194595500078"
        let rawInput = "text = \"hello world! hello world? hello world.\""
        let expectedOutput = "{\"hello\":3,\"world!\":1,\"world.\":1,\"world?\":1}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_18() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "f2b18512-eac4-49c0-9d78-8688f96f84ab"
        let rawInput = "text = \"the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog\""
        let expectedOutput = "{\"brown\":3,\"dog\":3,\"fox\":3,\"jumps\":3,\"lazy\":3,\"over\":3,\"quick\":3,\"the\":6}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_19() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "86bf738c-a730-4856-998b-21a820f285f5"
        let rawInput = "text = \"a a a a a a a a a a a a a a a a a a a a a\""
        let expectedOutput = "{\"a\":21}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_20() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "e1b7fa71-330f-4937-a3e1-54beb857535c"
        let rawInput = "text = \"the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog\""
        let expectedOutput = "{\"brown\":4,\"dog\":4,\"fox\":4,\"jumps\":4,\"lazy\":4,\"over\":4,\"quick\":4,\"the\":8}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_21() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "aff75bf5-bc8e-4e95-81d9-7c4db4f5f4bb"
        let rawInput = "text = \"hello world! hello world? hello world. hello world; hello world:\""
        let expectedOutput = "{\"hello\":5,\"world!\":1,\"world.\":1,\"world:\":1,\"world;\":1,\"world?\":1}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_22() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "8ece556d-61a7-4ff5-bb5e-29708b6171d1"
        let rawInput = "text = \"a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0\""
        let expectedOutput = "{\"0\":1,\"1\":1,\"2\":1,\"3\":1,\"4\":1,\"5\":1,\"6\":1,\"7\":1,\"8\":1,\"9\":1,\"a\":1,\"b\":1,\"c\":1,\"d\":1,\"e\":1,\"f\":1,\"g\":1,\"h\":1,\"i\":1,\"j\":1,\"k\":1,\"l\":1,\"m\":1,\"n\":1,\"o\":1,\"p\":1,\"q\":1,\"r\":1,\"s\":1,\"t\":1,\"u\":1,\"v\":1,\"w\":1,\"x\":1,\"y\":1,\"z\":1}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_23() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "ea1ed028-98a8-456b-9f4f-7aed3a5aa6cd"
        let rawInput = "text = \"a a a a a a a a a a a a a a a a a a a a a a a a a a a\""
        let expectedOutput = "{\"a\":27}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

    @Test func test_24() async {
        let slug = "word-frequency"
        let topic = "misc"
        let testId = "07659316-4256-403b-bc3e-840f47a0f9cb"
        let rawInput = "text = \"the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog\""
        let expectedOutput = "{\"brown\":5,\"dog\":5,\"fox\":5,\"jumps\":5,\"lazy\":5,\"over\":5,\"quick\":5,\"the\":10}"
        let orderMatters = true

        let params = InputParser.stripParamNames(rawInput)

        guard params.count == 1 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
            return
        }

        let p_text = InputParser.parseString(params[0])
        guard p_text.count <= 100_000 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Constraint violation: text string too long (\(p_text.count))")
            return
        }

        // Solution execution with runtime error handling
        do {
            let solution = Solution()
            let result = solution.wordFrequency(p_text)
            let computedOutput = "\(result)"

            // WARNING: No type-specific comparison for return type '[String: Int]', using string equality
            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
            #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
        } catch {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
            #expect(Bool(false), "Test \(testId): runtime error: \(error)")
        }
    }

}
