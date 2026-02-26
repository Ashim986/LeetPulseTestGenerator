import Foundation
import Testing
@testable import LeetCodeHelpers

private class Solution {
    class ImplementMagicDictionaryTrieNode {
        var children: [Character: ImplementMagicDictionaryTrieNode] = [:]
        var isEndOfWord = false
    }
    class MagicDictionary {
        var root: ImplementMagicDictionaryTrieNode = ImplementMagicDictionaryTrieNode()
        func buildDictionary(_ dictionary: [String]) {
            for word in dictionary {
                var node = root
                for char in word {
                    if node.children[char] == nil {
                        node.children[char] = ImplementMagicDictionaryTrieNode()
                    }
                    node = node.children[char]!
                }
                node.isEndOfWord = true
            }
        }
        func search(_ searchWord: String) -> Bool {
            return searchFromNode(root, searchWord, 0, 0)
        }
        func searchFromNode(_ node: ImplementMagicDictionaryTrieNode, _ word: String, _ index: Int, _ diff: Int) -> Bool {
            if index == word.count {
                return diff == 1 && node.isEndOfWord
            }
            if diff > 1 {
                return false
            }
            for (char, childNode) in node.children {
                if char == word[word.index(word.startIndex, offsetBy: index)] {
                    if searchFromNode(childNode, word, index + 1, diff) {
                        return true
                    }
                }
                else {
                    if searchFromNode(childNode, word, index + 1, diff + 1) {
                        return true
                    }
                }
            }
            return false
        }
    }
}

@Suite struct ImplementMagicDictionaryTests {
    init() { registerResultFlush() }

    @Test func test_0() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "d5c1d385-32ad-42e2-9a6f-a55e08313aa5"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'search', 'search']"
        let expectedOutput = "[null,null,false,true,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_1() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "94483e5c-d8bf-458f-a168-03fdb131f0c2"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[null,null,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_2() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "b11635b6-8014-4f52-a3a7-36aa942e4fc2"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'search']"
        let expectedOutput = "[null,null,false,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_3() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "dfdda647-e177-47a9-a3c5-72cfaaf09973"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'search']"
        let expectedOutput = "[null,null,false,null,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_4() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "c3a7ad0e-0f98-47c2-82aa-08e3862a3834"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'search']"
        let expectedOutput = "[null,null,false,true,null,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_5() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "0d8013c8-f9e8-4d19-a214-f453e6787eb6"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[null,null,null,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_6() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "bd389b29-abe0-411b-9d5d-372e9be86002"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[null,null,false,null,null,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_7() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "87b79c22-0ebe-4ede-9ddc-6b67f32357c7"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[null,null,false,true,null,null,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_8() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "4f727e9e-b7fa-495f-b5e6-df99708faa33"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[null,null,null,null,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_9() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "8b836569-e45b-4ac0-a5dd-e9c9054f6453"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[null,null,false,null,null,null,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_10() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "eeb0c1c6-b19f-40f3-87d2-e373de88967a"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false,true,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_11() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "a552c8fb-08f8-4322-9018-b05b874cbc24"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_12() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "e91851c3-6fd9-4048-9f2f-5f16a9536df8"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_13() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "31074455-8bdf-4829-8f81-4252bfff7c26"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false,true,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_14() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "e691a10d-c8a9-4dbe-b3bd-42c6157698fa"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_15() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "cb407c37-2001-414d-8c5a-af30bbce0779"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_16() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "b8f32046-fc98-4bf5-a229-4a0fee743108"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false,true,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_17() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "ad8db53d-073d-4376-a32e-a485652da6a4"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_18() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "e6a4c9bf-98e8-42a5-ac04-9f5959d3fbfc"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false,true]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_19() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "85b64fcc-6807-4833-b048-b59a6df3b2a5"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false,true,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_20() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "5fe3ec73-f3d3-4e89-b3a3-ed31a1d0cd27"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "false"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_21() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "f55b8b31-7199-4df9-823a-46c94a5ab357"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_22() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "b73cb518-1fd7-4b51-8670-8a438598b241"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false,false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_23() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "3d252d00-0762-41da-9f43-a6653adde2e5"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "false"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

    @Test func test_24() async {
        let slug = "implement-magic-dictionary"
        let topic = "tries"
        let testId = "c03af727-7b4f-401a-9c0b-6b1db3848b4e"
        let rawInput = "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']"
        let expectedOutput = "[false,false]"
        let orderMatters = true

        let inputLines = rawInput.components(separatedBy: "\n")
        guard inputLines.count >= 2 else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Invalid class design input format")
            return
        }

        let methodNames = InputParser.parseStringArray(inputLines[0])
        let argsList = InputParser.parseRawArgsList(inputLines[1])
        guard methodNames.count == argsList.count, !methodNames.isEmpty else {
            await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: "", isValid: false, outputMatches: false, orderMatters: orderMatters, errorMessage: "Methods/args count mismatch")
            return
        }

        // Init
        let initArgs = argsList[0]
        var obj = Solution.TrieNode()

        var results: [String] = []
        for i in 1..<methodNames.count {
            let m = methodNames[i]
            let a = argsList[i]
            switch m {
            case "buildDictionary":
                obj.buildDictionary(InputParser.parseStringArray(a[0]))
                results.append("null")
            case "search":
                let r = obj.search(InputParser.parseString(a[0]))
                results.append(r ? "true" : "false")
            case "searchFromNode":
                let r = obj.searchFromNode(a[0], InputParser.parseString(a[1]), InputParser.parseInt(a[2]), InputParser.parseInt(a[3]))
                results.append(r ? "true" : "false")
            default:
                results.append("null")
            }
        }

        let computedOutput = "[" + results.joined(separator: ",") + "]"
        let matches = computedOutput == expectedOutput
        await ResultRecorderActor.shared.record(slug: slug, topic: topic, testId: testId, input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput, isValid: true, outputMatches: matches, orderMatters: orderMatters)
        #expect(computedOutput == expectedOutput, "Test \(testId): input=\(rawInput)")
    }

}
