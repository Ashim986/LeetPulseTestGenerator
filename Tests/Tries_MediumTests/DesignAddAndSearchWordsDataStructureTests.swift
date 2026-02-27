import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDesignAddAndSearchWordsDataStructure {
    private class Solution {
        class WordDictionary {


            private let root = TrieNode()

            func addWord(_ word: String) {
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
                let chars = Array(word)
                func dfs(_ node: TrieNode?, _ i: Int) -> Bool {
                    guard let node = node else { return false }
                    if i == chars.count { return node.isEnd }
                    let c = chars[i]
                    if c == "." {
                        for child in node.children {
                            if dfs(child, i + 1) { return true }
                        }
                        return false
                    }
                    let index = Int(c.asciiValue.unsafelyUnwrapped - Character("a").asciiValue.unsafelyUnwrapped)
                    return dfs(node.children[index], i + 1)
                }
                return dfs(root, 0)
            }
        }
    }

    @Suite struct DesignAddAndSearchWordsDataStructureTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a5cce6af-5c81-4bf2-8379-980a6457473c",
             input: "['WordDictionary', 'addWord', 'search']",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1f0f0d53-3dda-46a9-b113-4bba1d0ce651",
             input: "['WordDictionary', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "edf20a63-086a-4c6a-9f83-0f41cff1a92d",
             input: "['WordDictionary', 'search', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "38a62840-510d-466e-8f02-ac83f9a75839",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'search', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8a9ae01b-ee71-4da0-89b9-f4b89a404b1c",
             input: "['WordDictionary', 'addWord', 'search', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d96bc235-b7d8-4683-8779-2c983ad2a1dc",
             input: "['WordDictionary', 'search', 'search', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f7a1045d-c14c-4326-8881-30400e1dbaa7",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'search', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6ada9ff8-7aa0-4364-9446-1b32698adb3c",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "05afc099-8034-4141-9fca-dfd425aeb57e",
             input: "['WordDictionary', 'search', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ed9e3a25-abcb-4f2b-aefd-5d1f07d18b1c",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f0daa092-5490-4d6d-a3d2-70e2a3c0f10e",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "95622dae-ff23-4497-9440-24720263750b",
             input: "['WordDictionary', 'search', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "[false,true]", orderMatters: true),
            TestCaseData(id: "cf10f8ac-54f6-4be6-8068-755c0a4c27be",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2ac22141-0272-4992-b736-3285c158efa9",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "993bc05e-17b1-433a-828b-8b5747e19625",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cc9a362f-8660-4dc9-9cac-e69277a673ea",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a402ea62-933f-4548-9b16-2bfb65000962",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1bf3b17c-b363-49fc-ac7f-60c6be3e3968",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "54507584-6d45-47d8-87b8-6b41b948169c",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d8503c83-314a-44d6-8055-448694bbad72",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "true", orderMatters: true),
            TestCaseData(id: "043bd8ee-9a32-44e7-a128-56659246a379",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,true]", orderMatters: true),
            TestCaseData(id: "f20407e1-b7ec-4991-8c32-c4c069db6ef5",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,true]", orderMatters: true),
            TestCaseData(id: "9a2c631e-312c-4be3-acdc-cb8e945227af",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,true]", orderMatters: true),
            TestCaseData(id: "ce67cdf1-8a2f-428c-94b1-5cf9befc7fdf",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,true]", orderMatters: true),
            TestCaseData(id: "120153b0-ab4d-46cd-99ef-0c333c52d00e",
             input: "['WordDictionary', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWor"
                + "d', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'addWord', 'search']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,true]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "design-add-and-search-words-data-structure"
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
            var objHolder: Solution.WordDictionary?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.WordDictionary()
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
                case "addWord":
                    let mArg_0 = InputParser.parseString(args[0])
                    obj.addWord(mArg_0)
                    results.append("null")
                case "search":
                    let mArg_0 = InputParser.parseString(args[0])
                    let rv = obj.search(mArg_0)
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
