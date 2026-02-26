import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCImplementMagicDictionary {
    private class Solution {
        class ImplementMagicDictionaryTrieNode {
            var children: [Character: ImplementMagicDictionaryTrieNode] = [:]
            var isEndOfWord = false
        }
        class MagicDictionary {
            var root = ImplementMagicDictionaryTrieNode()
            func buildDictionary(_ dictionary: [String]) {
                for word in dictionary {
                    var node = root
                    for char in word {
                        if node.children[char] == nil {
                            node.children[char] = ImplementMagicDictionaryTrieNode()
                        }
                        node = node.children[char].unsafelyUnwrapped
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

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "d5c1d385-32ad-42e2-9a6f-a55e08313aa5",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'search', 'search']",
             expected: "[null,null,false,true,false]", orderMatters: true),
            TestCaseData(id: "94483e5c-d8bf-458f-a168-03fdb131f0c2",
             input: "['MagicDictionary', 'buildDictionary', 'search']",
             expected: "[null,null,false]", orderMatters: true),
            TestCaseData(id: "b11635b6-8014-4f52-a3a7-36aa942e4fc2",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'search']",
             expected: "[null,null,false,true]", orderMatters: true),
            TestCaseData(id: "dfdda647-e177-47a9-a3c5-72cfaaf09973",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'search']",
             expected: "[null,null,false,null,true]", orderMatters: true),
            TestCaseData(id: "c3a7ad0e-0f98-47c2-82aa-08e3862a3834",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'search']",
             expected: "[null,null,false,true,null,false]", orderMatters: true),
            TestCaseData(id: "0d8013c8-f9e8-4d19-a214-f453e6787eb6",
             input: "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[null,null,null,false]", orderMatters: true),
            TestCaseData(id: "bd389b29-abe0-411b-9d5d-372e9be86002",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[null,null,false,null,null,true]", orderMatters: true),
            TestCaseData(id: "87b79c22-0ebe-4ede-9ddc-6b67f32357c7",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[null,null,false,true,null,null,false]", orderMatters: true),
            TestCaseData(id: "4f727e9e-b7fa-495f-b5e6-df99708faa33",
             input: "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "8b836569-e45b-4ac0-a5dd-e9c9054f6453",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[null,null,false,null,null,null,true]", orderMatters: true),
            TestCaseData(id: "eeb0c1c6-b19f-40f3-87d2-e373de88967a",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[false,true,false]", orderMatters: true),
            TestCaseData(id: "a552c8fb-08f8-4322-9018-b05b874cbc24",
             input: "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[false]", orderMatters: true),
            TestCaseData(id: "e91851c3-6fd9-4048-9f2f-5f16a9536df8",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[false,true]", orderMatters: true),
            TestCaseData(id: "31074455-8bdf-4829-8f81-4252bfff7c26",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', '"
                + "search']",
             expected: "[false,true,false]", orderMatters: true),
            TestCaseData(id: "e691a10d-c8a9-4dbe-b3bd-42c6157698fa",
             input: "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[false]", orderMatters: true),
            TestCaseData(id: "cb407c37-2001-414d-8c5a-af30bbce0779",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDicti"
                + "onary', 'search']",
             expected: "[false,true]", orderMatters: true),
            TestCaseData(id: "b8f32046-fc98-4bf5-a229-4a0fee743108",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', '"
                + "buildDictionary', 'search']",
             expected: "[false,true,false]", orderMatters: true),
            TestCaseData(id: "ad8db53d-073d-4376-a32e-a485652da6a4",
             input: "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 's"
                + "earch']",
             expected: "[false]", orderMatters: true),
            TestCaseData(id: "e6a4c9bf-98e8-42a5-ac04-9f5959d3fbfc",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDicti"
                + "onary', 'buildDictionary', 'search']",
             expected: "[false,true]", orderMatters: true),
            TestCaseData(id: "85b64fcc-6807-4833-b048-b59a6df3b2a5",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', '"
                + "buildDictionary', 'buildDictionary', 'search']",
             expected: "[false,true,false]", orderMatters: true),
            TestCaseData(id: "5fe3ec73-f3d3-4e89-b3a3-ed31a1d0cd27",
             input: "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'b"
                + "uildDictionary', 'search']",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f55b8b31-7199-4df9-823a-46c94a5ab357",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDicti"
                + "onary', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[false,false]", orderMatters: true),
            TestCaseData(id: "b73cb518-1fd7-4b51-8670-8a438598b241",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', '"
                + "buildDictionary', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[false,false,false]", orderMatters: true),
            TestCaseData(id: "3d252d00-0762-41da-9f43-a6653adde2e5",
             input: "['MagicDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'b"
                + "uildDictionary', 'buildDictionary', 'search']",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c03af727-7b4f-401a-9c0b-6b1db3848b4e",
             input: "['MagicDictionary', 'buildDictionary', 'search', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'buildDicti"
                + "onary', 'buildDictionary', 'buildDictionary', 'buildDictionary', 'search']",
             expected: "[false,false]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "implement-magic-dictionary"
            let topic = "tries"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            var obj = Solution.MagicDictionary()

            var results: [String] = []
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "buildDictionary":
                    guard let mArg_0 = InputParser.parseStringArray(args[0]) else { results.append("null"); continue }
                    obj.buildDictionary(mArg_0)
                    results.append("null")
                case "search":
                    let mArg_0 = InputParser.parseString(args[0])
                    let rv = obj.search(mArg_0)
                    results.append(rv ? "true" : "false")
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
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
