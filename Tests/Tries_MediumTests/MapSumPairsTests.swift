import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMapSumPairs {
    private class Solution {
        class MapSumPairsTrieNode {
            var children: [Character: MapSumPairsTrieNode] = [:]
            var value = 0
        }

        class MapSum {
            var root = MapSumPairsTrieNode()
            var map: [String: Int] = [:]

            func insert(_ key: String, _ val: Int) {
                let diff = val - (map[key] ?? 0)
                map[key] = val
                var node = root
                for char in key {
                    if node.children[char] == nil {
                        node.children[char] = MapSumPairsTrieNode()
                    }
                    node = node.children[char].unsafelyUnwrapped
                    node.value += diff
                }
            }

            func sum(_ prefix: String) -> Int {
                var node = root
                for char in prefix {
                    if node.children[char] == nil {
                        return 0
                    }
                    node = node.children[char].unsafelyUnwrapped
                }
                return node.value
            }
        }
    }

    @Suite struct MapSumPairsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4a70d811-0702-4640-9425-6c5a7116ef57",
             input: "['MapSum', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,1]", orderMatters: true),
            TestCaseData(id: "22ecb4d1-3c8d-4352-8622-eda90b6ab049",
             input: "['MapSum', 'insert', 'sum', 'insert', 'sum']",
             expected: "[null,null,1,null,2]", orderMatters: true),
            TestCaseData(id: "835f8ad5-c2fe-46f4-b038-e2485b112598",
             input: "['MapSum', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,1]", orderMatters: true),
            TestCaseData(id: "a86686ba-bfae-49b2-9baf-eabebad2398e",
             input: "['MapSum', 'insert', 'sum', 'insert', 'insert', 'sum']",
             expected: "[null,null,1,null,null,2]", orderMatters: true),
            TestCaseData(id: "c7c931a2-37de-473d-921f-7d00f2e0cd96",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,null,1]", orderMatters: true),
            TestCaseData(id: "49c73cbc-5e6a-437f-8861-dbd6c6d7ef5a",
             input: "['MapSum', 'insert', 'insert', 'sum', 'insert', 'sum']",
             expected: "[null,null,null,1,null,2]", orderMatters: true),
            TestCaseData(id: "dc3e9961-23c1-411e-b22f-34b2bd29a1db",
             input: "['MapSum', 'insert', 'insert', 'insert', 'sum', 'insert', 'sum']",
             expected: "[null,null,null,null,1,null,2]", orderMatters: true),
            TestCaseData(id: "2ddc3ecd-567d-4975-8371-337990a426c8",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,null,null,1]", orderMatters: true),
            TestCaseData(id: "b855f7ac-fe83-4e2c-bab3-1d4308cdd711",
             input: "['MapSum', 'insert', 'sum', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,1,null,null,null,2]", orderMatters: true),
            TestCaseData(id: "1903229c-86f3-429a-b311-b31173a44189",
             input: "['MapSum', 'insert', 'insert', 'sum', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,1,null,null,null,2]", orderMatters: true),
            TestCaseData(id: "776dd7f0-882e-4a5f-ab8e-e862a37f181a",
             input: "['MapSum', 'insert', 'insert', 'insert', 'sum', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,0,null,null,0]", orderMatters: true),
            TestCaseData(id: "540da747-28cf-47f2-aac9-692c81fb114a",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'sum', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,null,0,null,null,0]", orderMatters: true),
            TestCaseData(id: "28f5e0eb-2e75-4197-9dec-d148b918d649",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'sum', 'insert', 'sum']",
             expected: "[null,null,null,null,null,null,0,null,0]", orderMatters: true),
            TestCaseData(id: "75254f56-c05a-45b0-a724-fcb1750bcc2e",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'sum', 'sum']",
             expected: "[null,null,null,null,null,null,null,0,0]", orderMatters: true),
            TestCaseData(id: "b0825dad-b6f6-4bd6-87ec-3ff8c689ae26",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,null,null,null,null,0]", orderMatters: true),
            TestCaseData(id: "a6a5913d-5582-45e4-852f-887b8b89dc20",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,null,null,null,null,null,0]", orderMatters: true),
            TestCaseData(id: "31552c8d-2648-4b30-9f70-f12a148cd746",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,null,null,null,null,null,null,0]", orderMatters: true),
            TestCaseData(id: "f11d9835-c560-476c-9384-dce319d22a06",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,0]", orderMatters: true),
            TestCaseData(id: "f3f7b930-9807-4609-aab4-3e70064536ca",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,null,0]", orderMatters: true),
            TestCaseData(id: "38041d26-62a6-42c1-b1f3-35903f6021e1",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'sum']",
             expected: "[null,null,null,null,null,null,null,null,null,null,null,null,null,0]", orderMatters: true),
            TestCaseData(id: "8b126b8b-90b5-4bbc-8829-15e686a9d888",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'inse"
                + "rt', 'sum']",
             expected: "91", orderMatters: true),
            TestCaseData(id: "5b84cd8d-1960-4155-bd42-2194b4c99f6e",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'inse"
                + "rt', 'insert', 'sum']",
             expected: "105", orderMatters: true),
            TestCaseData(id: "6a231061-6e18-44e3-99e3-9721ee8da2df",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'inse"
                + "rt', 'insert', 'insert', 'sum']",
             expected: "120", orderMatters: true),
            TestCaseData(id: "4a0a3011-c112-44da-bf27-9af0ffef3a99",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'inse"
                + "rt', 'insert', 'insert', 'insert', 'sum']",
             expected: "136", orderMatters: true),
            TestCaseData(id: "24124030-2a0c-4b49-876d-fe8e875ee68d",
             input: "['MapSum', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'insert', 'inse"
                + "rt', 'insert', 'insert', 'insert', 'insert', 'sum']",
             expected: "153", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "map-sum-pairs"
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
            var objHolder: Solution.MapSum?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.MapSum()
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
                    guard let mArg_1 = InputParser.parseInt(args[1]) else { results.append("null"); continue }
                    obj.insert(mArg_0, mArg_1)
                    results.append("null")
                case "sum":
                    let mArg_0 = InputParser.parseString(args[0])
                    let rv = obj.sum(mArg_0)
                    results.append("\(rv)")
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
