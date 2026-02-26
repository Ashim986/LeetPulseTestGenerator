import Foundation
import Testing
@testable import LeetCodeHelpers

enum LC_longest_word_in_dictionary {
    private class Solution {
        class TrieNode {
            var children: [Character: TrieNode] = [:]
            var endOfWord: Bool = false
        }

        class Trie {
            var root: TrieNode

            init() {
                root = TrieNode()
            }

            func insert(_ word: String) {
                var node = root
                for char in word {
                    if node.children[char] == nil {
                        node.children[char] = TrieNode()
                    }
                    node = node.children[char]!
                }
                node.endOfWord = true
            }

            func search(_ word: String) -> Bool {
                var node = root
                for char in word {
                    if node.children[char] == nil {
                        return false
                    }
                    node = node.children[char]!
                }
                return node.endOfWord
            }
        }

        func longestWord(_ words: [String]) -> String {
            let trie = Trie()
            for word in words {
                trie.insert(word)
            }
            var longestWord = ""
            for word in words.sorted(by: { $0.count > $1.count }) {
                var isFormed = true
                for i in 1...word.count {
                    let substring = String(word.prefix(i))
                    if !trie.search(substring) {
                        isFormed = false
                        break
                    }
                }
                if isFormed {
                    longestWord = word
                    break
                }
            }
            return longestWord
        }
    }

    @Suite struct LongestWordInDictionaryTests {
        init() { registerResultFlush() }

        @Test static func test_0() async {
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "200d0442-370c-4319-addf-aeda8901d3d8"
            let rawInput = "words = [\"a\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "46924aca-04ec-4ee4-a1e9-535bc29d7d4f"
            let rawInput = "words = []"
            let expectedOutput = "\"\""
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "00617d16-c63e-432b-925c-6ab36accc42b"
            let rawInput = "words = [\"a\",\"b\",\"c\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "bbb43a62-8cdd-4efb-afc8-27c6efd8e4ca"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "60540a34-a586-4d03-aa7a-719f21481e5f"
            let rawInput = "words = [\"banana\",\"ban\",\"ba\",\"b\"]"
            let expectedOutput = "b"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "54387f8e-8337-438a-9195-b8492fecadf1"
            let rawInput = "words = [\"word\",\"wor\",\"wo\",\"w\"]"
            let expectedOutput = "w"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "b46d1b8a-ea0c-438e-837d-6ba906d1d0a7"
            let rawInput = "words = [\"a\",\"aa\",\"aaa\",\"aaaa\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "e621ae15-6d88-417b-bf4f-e734f3b5b991"
            let rawInput = "words = [\"b\",\"bb\",\"bbb\",\"bbbb\"]"
            let expectedOutput = "b"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "ac690377-14a6-42a1-8182-8a447af2dfa0"
            let rawInput = "words = [\"c\",\"cc\",\"ccc\",\"cccc\"]"
            let expectedOutput = "c"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "53e80d56-ca0b-4915-8ab8-0d4cd3755d1c"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"application\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "779979aa-ad6b-4558-9d97-af3aa95a7a72"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apply\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "67d3cea4-cc26-4637-a38f-1732c0e4db6d"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apart\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "d8eac0a3-d8d1-4e6a-81a9-0eadcaa21b67"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apt\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "91719b44-5ae4-4030-b842-f0d6bc4d64de"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apex\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "c970108e-7082-4a0f-a427-5ae5b434f29c"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apricot\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "c103901d-9eae-44d0-bcbd-bf6e2ccb7d19"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apron\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "46e1f7dd-9988-45b8-a8df-2034eb2dd4aa"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apology\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "e6b121e0-53f7-45fa-8764-9ddd88127de4"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apostle\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "24f1f95f-bd05-42e5-8061-7f6de5e7aecb"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apothecary\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "29a9d60a-1a43-4919-a317-ef27d1d7eab4"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apricots\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "c8890f1e-bada-4b3b-b883-a78dd36453fa"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"aprons\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "b9e37e4d-9ffa-478c-a1ba-d51df0bc84a0"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apologies\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "225bb32a-3576-4607-9428-a496a6b9228c"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apostles\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "cc9b903f-761e-4203-a168-9a8bede60559"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apothecaries\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
            let slug = "longest-word-in-dictionary"
            let topic = "tries"
            let testId = "5bf6f7c0-48ef-48d8-ac3d-cefde45909e4"
            let rawInput = "words = [\"apple\",\"app\",\"ap\",\"a\",\"apricot\",\"apron\",\"apology\",\"apostle\",\"apothecary\"]"
            let expectedOutput = "a"
            let orderMatters = true

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Wrong number of params: expected 1, got \(params.count)")
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse param 0 as [String]: '\(params[0])'")
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: words array too large (\(p_words.count))")
                return
            }

            // Constraint precondition checks
            guard p_words.count >= 1 && p_words.count <= 1000 else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words.length <= 1000")
                return
            }
            guard p_words.allSatisfy({ $0.count >= 1 && $0.count <= 30 }) else {
                await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Constraint violation: 1 <= words[i].length <= 30")
                return
            }

            // Solution execution with runtime error handling
            do {
                let solution = Solution()
                let result = solution.longestWord(p_words)
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
