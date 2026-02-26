import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class WordDictionary {


        private let root = Node()

        func addWord(_ word: String) {
            var node = root
            for char in word {
                let index = Int(char.asciiValue! - Character("a").asciiValue!)
                if node.children[index] == nil {
                    node.children[index] = Node()
                }
                node = node.children[index]!
            }
            node.isEnd = true
        }

        func search(_ word: String) -> Bool {
            let chars = Array(word)
            func dfs(_ node: Node?, _ i: Int) -> Bool {
                guard let node = node else { return false }
                if i == chars.count { return node.isEnd }
                let c = chars[i]
                if c == "." {
                    for child in node.children {
                        if dfs(child, i + 1) { return true }
                    }
                    return false
                }
                let index = Int(c.asciiValue! - Character("a").asciiValue!)
                return dfs(node.children[index], i + 1)
            }
            return dfs(root, 0)
        }
    }
}

@Suite struct DesignAddAndSearchWordsDataStructureTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "a5cce6af-5c81-4bf2-8379-980a6457473c"
        let rawInput = "['WordDictionary', 'addWord', 'search']"
        let expectedOutput = "false"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_1() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "1f0f0d53-3dda-46a9-b113-4bba1d0ce651"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_2() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "edf20a63-086a-4c6a-9f83-0f41cff1a92d"
        let rawInput = "['WordDictionary', 'search', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_3() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "38a62840-510d-466e-8f02-ac83f9a75839"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'search', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_4() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "8a9ae01b-ee71-4da0-89b9-f4b89a404b1c"
        let rawInput = "['WordDictionary', 'addWord', 'search', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_5() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "d96bc235-b7d8-4683-8779-2c983ad2a1dc"
        let rawInput = "['WordDictionary', 'search', 'search', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_6() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "f7a1045d-c14c-4326-8881-30400e1dbaa7"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'search', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_7() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "6ada9ff8-7aa0-4364-9446-1b32698adb3c"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_8() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "05afc099-8034-4141-9fca-dfd425aeb57e"
        let rawInput = "['WordDictionary', 'search', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_9() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "ed9e3a25-abcb-4f2b-aefd-5d1f07d18b1c"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_10() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "f0daa092-5490-4d6d-a3d2-70e2a3c0f10e"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_11() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "95622dae-ff23-4497-9440-24720263750b"
        let rawInput = "['WordDictionary', 'search', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "[false,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_12() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "cf10f8ac-54f6-4be6-8068-755c0a4c27be"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_13() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "2ac22141-0272-4992-b736-3285c158efa9"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_14() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "993bc05e-17b1-433a-828b-8b5747e19625"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_15() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "cc9a362f-8660-4dc9-9cac-e69277a673ea"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_16() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "a402ea62-933f-4548-9b16-2bfb65000962"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_17() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "1bf3b17c-b363-49fc-ac7f-60c6be3e3968"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_18() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "54507584-6d45-47d8-87b8-6b41b948169c"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_19() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "d8503c83-314a-44d6-8055-448694bbad72"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "true"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_20() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "043bd8ee-9a32-44e7-a128-56659246a379"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_21() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "f20407e1-b7ec-4991-8c32-c4c069db6ef5"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_22() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "9a2c631e-312c-4be3-acdc-cb8e945227af"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_23() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "ce67cdf1-8a2f-428c-94b1-5cf9befc7fdf"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

    @Test func test_24() async {
        let slug = "design-add-and-search-words-data-structure"
        let topic = "tries"
        let testId = "120153b0-ab4d-46cd-99ef-0c333c52d00e"
        let rawInput = "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters,errorMessage: "Invalid class design input format")
            return
        }

        guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse method names from class design input")
            return
        }
        guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Failed to parse args list from class design input")
            return
        }
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, status: "parse_error", orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
            var obj = Solution.WordDictionary()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "addWord":
                obj.addWord(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "dfs":
                let r = obj.dfs(InputParser.parse2DIntArray(a[0]).map { buildGraph($0) }, InputParser.parseInt(a[1]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        // Class-design comparison: normalize null representations and whitespace
        func normalizeClassOutput(_ s: String) -> String {
            var result = s.replacingOccurrences(of: " ", with: "")
            result = result.replacingOccurrences(of: "nil", with: "null")
            result = result.replacingOccurrences(of: "None", with: "null")
            result = result.replacingOccurrences(of: "NULL", with: "null")
            return result
        }
        let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters)
        #expect(matches, "Test \(testId): expected=\(expectedOutput) computed=\(computedOutput)")
    }

}
