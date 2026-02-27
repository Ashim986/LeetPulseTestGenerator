import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCImplementTriePrefixTree {
    private class Solution {
        class Trie {


            private let root = TrieNode()

            func insert(_ word: String) {
                var node = root
                for char in word {
                    let index = Int(char.asciiValue.unsafelyUnwrapped - Character("a").asciiValue.unsafelyUnwrapped)
                    if node.children[index] == nil {
                        node.children[index] = TrieNode()
                    }
                    node = node.children[index].unsafelyUnwrapped
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

            private func walk(_ word: String) -> TrieNode? {
                var node: TrieNode? = root
                for char in word {
                    let index = Int(char.asciiValue.unsafelyUnwrapped - Character("a").asciiValue.unsafelyUnwrapped)
                    node = node?.children[index]
                    if node == nil { return nil }
                }
                return node
            }
        }
    }

    @Suite struct ImplementTriePrefixTreeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9ec92828-370a-411a-b1b3-b338fcf6cf85",
             input: "['Trie', 'insert', 'insert', 'search', 'search', 'startsWith', 'startsWith']",
             expected: "[null,null,null,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "8b87af70-b4fc-4efa-8ec4-a8af166ba7ec",
             input: "['Trie', 'insert', 'search', 'startsWith']",
             expected: "[null,null,false,true]", orderMatters: true),
            TestCaseData(id: "4ebd7284-3eb7-4c72-b5f0-2689835d81bd",
             input: "['Trie', 'insert', 'insert', 'insert', 'search', 'search', 'search']",
             expected: "[null,null,null,null,true,false,true]", orderMatters: true),
            TestCaseData(id: "ac48e20e-378b-4f7a-ba69-e3a2dfef7875",
             input: "['Trie', 'insert', 'insert', 'startsWith', 'startsWith', 'search']",
             expected: "[null,null,null,true,true,false]", orderMatters: true),
            TestCaseData(id: "9637b330-5001-42e6-b60f-57e0813798c2",
             input: "['Trie', 'search', 'search', 'insert', 'insert', 'search']",
             expected: "[null,false,false,null,null,true]", orderMatters: true),
            TestCaseData(id: "d1c2e05e-a9fd-4fb7-81d9-81b3761e6b00",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'search', 'search', 'search', 'search']",
             expected: "[null,null,null,null,null,null,true,true,true,false]", orderMatters: true),
            TestCaseData(id: "140c906e-9f01-4b9c-b02c-a0e177f3f38c",
             input: "['Trie', 'insert', 'insert', 'insert', 'startsWith', 'startsWith', 'startsWith']",
             expected: "[null,null,null,null,true,true,true]", orderMatters: true),
            TestCaseData(id: "87f92699-84e9-44cb-95f2-17823227ed09",
             input: "['Trie', 'search', 'startsWith', 'insert', 'insert', 'search', 'search']",
             expected: "[null,false,false,null,null,true,true]", orderMatters: true),
            TestCaseData(id: "e7f6b516-33da-44fb-b2b1-3ff23ef253fd",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search', 'search', 'search']",
             expected: "[null,null,null,null,null,null,null,true,true,false]", orderMatters: true),
            TestCaseData(id: "ae8fc466-d1f0-4c8e-a4db-f0b22ed16cd8",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith', 'startsWith', 'startsWith']",
             expected: "[null,null,null,null,null,null,true,true,true]", orderMatters: true),
            TestCaseData(id: "c359fad4-ed41-402e-af4b-c1520818f75b",
             input: "['Trie', 'search', 'search', 'search', 'insert', 'insert', 'insert']",
             expected: "[null,false,false,false,null,null,null]", orderMatters: true),
            TestCaseData(id: "bcbcc728-238e-4f68-be24-b9dc850b20a6",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search']",
             expected: "[null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "e6e43335-c137-4df0-8501-0066de324557",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith']",
             expected: "[null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "4ff2c72a-0dea-4323-baee-626266f3c62c",
             input: "['Trie', 'search', 'search', 'search', 'search', 'insert', 'insert']",
             expected: "[null,false,false,false,false,null,null]", orderMatters: true),
            TestCaseData(id: "774ed163-d4c8-4941-ab93-d9f65d87e251",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search']",
             expected: "[null,null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "d8d22b3d-2b90-44be-8796-376793636f32",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith']",
             expected: "[null,null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "e8de91fa-c081-428e-ae0c-2bd97672c8bb",
             input: "['Trie', 'search', 'search', 'search', 'search', 'search', 'insert']",
             expected: "[null,false,false,false,false,false,null]", orderMatters: true),
            TestCaseData(id: "d7207f78-6117-4a01-b6fa-c6c2e568059c",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search']",
             expected: "[null,null,null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "e32bac3f-2db9-47fb-a830-c93488dbdd06",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith']",
             expected: "[null,null,null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "225db699-a812-4a55-9ece-60c46d0efca1",
             input: "['Trie', 'search', 'search', 'search', 'search', 'search', 'search', 'insert']",
             expected: "[null,false,false,false,false,false,false,null]", orderMatters: true),
            TestCaseData(id: "fab0e668-369c-4924-9289-7f5fd05879c0",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "278bdc9e-159c-4ab4-ab57-596b14fc656f",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "4bd93ecf-5e87-465d-92a4-14cbb1ad0be4",
             input: "['Trie', 'search', 'search', 'search', 'search', 'search', 'search', 'search', 'insert']",
             expected: "[null,false,false,false,false,false,false,false,null]", orderMatters: true),
            TestCaseData(id: "72eaa292-3add-4edb-9f27-8025c0a0cb9c",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'search']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "0c7c5889-9e33-4d2c-970c-9a14decf7e08",
             input: "['Trie', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'startsWith']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,null,false]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "implement-trie-prefix-tree"
            let topic = "tries"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            var objHolder: Solution.Trie?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.Trie()
            }
            guard !initDidCrash, var obj = objHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution init crashed at runtime"
                )
                return
            }

            var results: [String] = []
            let loopDidCrash = withCrashGuard {
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "insert":
                    let mArg_0 = InputParser.parseString(args[0])
                    obj.insert(mArg_0)
                    results.append("null")
                case "search":
                    let mArg_0 = InputParser.parseString(args[0])
                    let rv = obj.search(mArg_0)
                    results.append(rv ? "true" : "false")
                case "startsWith":
                    let mArg_0 = InputParser.parseString(args[0])
                    let rv = obj.startsWith(mArg_0)
                    results.append(rv ? "true" : "false")
                default:
                    results.append("null")
                }
            }
            }
            guard !loopDidCrash else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution method crashed at runtime"
                )
                return
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
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
