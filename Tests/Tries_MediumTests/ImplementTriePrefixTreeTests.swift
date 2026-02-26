import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class Trie {


        private let root = Node()

        func insert(_ word: String) {
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
            guard let node = walk(word) else { return false }
            return node.isEnd
        }

        func startsWith(_ prefix: String) -> Bool {
            return walk(prefix) != nil
        }

        private func walk(_ word: String) -> Node? {
            var node: Node? = root
            for char in word {
                let index = Int(char.asciiValue! - Character("a").asciiValue!)
                node = node?.children[index]
                if node == nil { return nil }
            }
            return node
        }
    }
}

@Suite struct ImplementTriePrefixTreeTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "9ec92828-370a-411a-b1b3-b338fcf6cf85"
        let rawInput = "['Trie', 'insert', 'insert', 'search', 'search', 'startsWith', 'startsWith']"
        let expectedOutput = "[null,null,null,true,true,true,true]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "8b87af70-b4fc-4efa-8ec4-a8af166ba7ec"
        let rawInput = "['Trie', 'insert', 'search', 'startsWith']"
        let expectedOutput = "[null,null,false,true]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "4ebd7284-3eb7-4c72-b5f0-2689835d81bd"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'search', 'search', 'search']"
        let expectedOutput = "[null,null,null,null,true,false,true]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "ac48e20e-378b-4f7a-ba69-e3a2dfef7875"
        let rawInput = "['Trie', 'insert', 'insert', 'startsWith', 'startsWith', 'search']"
        let expectedOutput = "[null,null,null,true,true,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "9637b330-5001-42e6-b60f-57e0813798c2"
        let rawInput = "['Trie', 'search', 'search', 'insert', 'insert', 'search']"
        let expectedOutput = "[null,false,false,null,null,true]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "d1c2e05e-a9fd-4fb7-81d9-81b3761e6b00"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'search', 'search', 'search', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,true,true,true,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "140c906e-9f01-4b9c-b02c-a0e177f3f38c"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'startsWith', 'startsWith', 'startsWith']"
        let expectedOutput = "[null,null,null,null,true,true,true]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "87f92699-84e9-44cb-95f2-17823227ed09"
        let rawInput = "['Trie', 'search', 'startsWith', 'insert', 'insert', 'search', 'search']"
        let expectedOutput = "[null,false,false,null,null,true,true]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "e7f6b516-33da-44fb-b2b1-3ff23ef253fd"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search', 'search', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,true,true,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "ae8fc466-d1f0-4c8e-a4db-f0b22ed16cd8"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith', 'startsWith', 'startsWith']"
        let expectedOutput = "[null,null,null,null,null,null,true,true,true]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "c359fad4-ed41-402e-af4b-c1520818f75b"
        let rawInput = "['Trie', 'search', 'search', 'search', 'insert', 'insert', 'insert']"
        let expectedOutput = "[null,false,false,false,null,null,null]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "bcbcc728-238e-4f68-be24-b9dc850b20a6"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "e6e43335-c137-4df0-8501-0066de324557"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "4ff2c72a-0dea-4323-baee-626266f3c62c"
        let rawInput = "['Trie', 'search', 'search', 'search', 'search', 'insert', 'insert']"
        let expectedOutput = "[null,false,false,false,false,null,null]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "774ed163-d4c8-4941-ab93-d9f65d87e251"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "d8d22b3d-2b90-44be-8796-376793636f32"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "e8de91fa-c081-428e-ae0c-2bd97672c8bb"
        let rawInput = "['Trie', 'search', 'search', 'search', 'search', 'search', 'insert']"
        let expectedOutput = "[null,false,false,false,false,false,null]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "d7207f78-6117-4a01-b6fa-c6c2e568059c"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "e32bac3f-2db9-47fb-a830-c93488dbdd06"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "225db699-a812-4a55-9ece-60c46d0efca1"
        let rawInput = "['Trie', 'search', 'search', 'search', 'search', 'search', 'search', 'insert']"
        let expectedOutput = "[null,false,false,false,false,false,false,null]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "fab0e668-369c-4924-9289-7f5fd05879c0"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,null,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "278bdc9e-159c-4ab4-ab57-596b14fc656f"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,null,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "4bd93ecf-5e87-465d-92a4-14cbb1ad0be4"
        let rawInput = "['Trie', 'search', 'search', 'search', 'search', 'search', 'search', 'search', 'insert']"
        let expectedOutput = "[null,false,false,false,false,false,false,false,null]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "72eaa292-3add-4edb-9f27-8025c0a0cb9c"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,null,null,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
        let slug = "implement-trie-prefix-tree"
        let topic = "tries"
        let testId = "0c7c5889-9e33-4d2c-970c-9a14decf7e08"
        let rawInput = "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith']"
        let expectedOutput = "[null,null,null,null,null,null,null,null,null,null,null,null,false]"
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
            var obj = Solution.Trie()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "insert":
                obj.insert(InputParser.parseString(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "startsWith":
                let r = obj.startsWith(InputParser.parseString(a[0]))
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
