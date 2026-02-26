import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_reverse_string_ii {
    private class Solution {
        func reverseStr(_ s: String, _ k: Int) -> String { 
            var result = String() 
            let chars = Array(s) 
            for i in stride(from: 0, to: chars.count, by: k) { 
                let end = min(i+k, chars.count) 
                let subArray = Array(chars[i..<end]) 
                let reversedSubArray = subArray.reversed() 
                result.append(String(reversedSubArray)) 
                if end < chars.count { 
                    result.append(String(chars[end..<min(end+k, chars.count)])) 
                } 
            } 
            return result 
        }
    }

    @Suite struct ReverseStringIiTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "3a5c96ab-a8ea-4403-b1ae-f017b71a1ce9"
            let rawInput = "s = \"a\", k = 1"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_1() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "a58b7072-fe4c-4217-b0eb-928947ec37b9"
            let rawInput = "s = \"ab\", k = 1"
            let expectedOutput = "ab"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_2() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "0aa508f1-3c8b-4e0e-ae76-3a340bd6c2a6"
            let rawInput = "s = \"abc\", k = 2"
            let expectedOutput = "bac"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_3() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "169b8fdd-5e50-42a9-bfd4-3d81ddbdec4a"
            let rawInput = "s = \"abcd\", k = 3"
            let expectedOutput = "cbad"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_4() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "61ec1c36-e028-474c-8e7e-dc127acc80c7"
            let rawInput = "s = \"abcde\", k = 4"
            let expectedOutput = "dcbae"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_5() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "ea9f7caa-cf3b-460c-ac30-57c63f242f50"
            let rawInput = "s = \"abcdef\", k = 5"
            let expectedOutput = "edcbaf"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_6() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "36232bb3-8c46-480d-8069-5c3e8f0858e5"
            let rawInput = "s = \"a\", k = 10"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_7() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "0d458e1c-36af-4d3e-9184-9293a99680ff"
            let rawInput = "s = \"aaaa\", k = 2"
            let expectedOutput = "aaaa"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_8() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "42cd2487-888b-4eb4-b73b-2c866ef68ee9"
            let rawInput = "s = \"aaaa\", k = 4"
            let expectedOutput = "aaaa"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_9() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "c2bceaa2-a360-4d34-b0d2-936b6bbfd198"
            let rawInput = "s = \"aaaa\", k = 1"
            let expectedOutput = "aaaa"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_10() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "7f83cf6c-92e7-49c1-b535-c6b12dd3b0aa"
            let rawInput = "s = \"dcba\", k = 1"
            let expectedOutput = "dcba"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_11() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "6be2304b-0606-451b-8bfe-72f274fef9d1"
            let rawInput = "s = \"abcdefghij\", k = 1"
            let expectedOutput = "abcdefghij"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_12() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "484628bb-04b4-4f4b-ab5a-e9c351c1bd57"
            let rawInput = "s = \"abcdefgh\", k = 6"
            let expectedOutput = "fedcbahg"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_13() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "40125021-b784-410d-a12f-08fa95969907"
            let rawInput = "s = \"abcdefghi\", k = 7"
            let expectedOutput = "gfedcbaih"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_14() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "92ce8188-e5b9-419e-b6ed-b45054183740"
            let rawInput = "s = \"abcdefghij\", k = 8"
            let expectedOutput = "hgfedcbaji"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_15() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "34ca85d5-7d1d-41ee-8298-1f59489f35d3"
            let rawInput = "s = \"abcdefghijk\", k = 9"
            let expectedOutput = "ihgfedcbakj"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_16() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "8b3821d1-631b-4f46-b596-b94dad44ba08"
            let rawInput = "s = \"ab\", k = 10"
            let expectedOutput = "ba"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_17() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "45552abb-2f06-43f5-94f0-e1531c3622d6"
            let rawInput = "s = \"abc\", k = 10"
            let expectedOutput = "cba"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_18() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "0b7e6770-bbd4-41d7-b91f-fc09c1d5f535"
            let rawInput = "s = \"abcd\", k = 10"
            let expectedOutput = "dcba"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_19() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "5e42528a-d5e2-482d-b19b-913e07e448cc"
            let rawInput = "s = \"abcde\", k = 10"
            let expectedOutput = "edcba"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_20() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "13e39122-446a-4abd-a4e6-6824b47f18ca"
            let rawInput = "s = \"dcba\", k = 2"
            let expectedOutput = "cdab"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_21() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "fb2e67cf-868e-4e2a-8a1b-ff5f88faea69"
            let rawInput = "s = \"dcba\", k = 4"
            let expectedOutput = "abcd"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_22() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "f20f4957-fc04-4a85-b7dc-b837ed605b83"
            let rawInput = "s = \"abcdefghij\", k = 10"
            let expectedOutput = "jihgfedcba"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_23() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "160f0a46-0e29-4a77-9765-139928eec68f"
            let rawInput = "s = \"abcdefghij\", k = 11"
            let expectedOutput = "jihgfedcba"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

        @Test static func test_24() async {
            let slug = "reverse-string-ii"
            let topic = "two-pointers"
            let testId = "f4de6200-c9d3-4b21-8240-dc38099624a3"
            let rawInput = "s = \"abcdefghij\", k = 100"
            let expectedOutput = "jihgfedcba"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 2, got \(params.count)")
                return
            }

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: s string too long (\(p_s.count))")
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 1 as Int: '\(params[1])'")
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= s.length <= 104")
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= k <= 104")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.reverseStr(p_s, p_k)
                let computedOutput = OutputSerializer.serialize(result)

                // Normalize: strip outer quotes from both sides (QUAL-03)
                func stripQuotes(_ s: String) -> String {
                    let t = s.trimmingCharacters(in: .whitespaces)
                    if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                    return t
                }
                let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
                #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
            } catch {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: true, status: "runtime_error", orderMatters: orderMatters, errorMessage: "Runtime error: \(error)")
                #expect(Bool(false), "Test \(testId): runtime error: \(error)")
            }
        }

    }

}
