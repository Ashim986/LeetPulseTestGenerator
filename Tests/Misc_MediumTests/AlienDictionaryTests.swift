import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAlienDictionary {
    private class Solution {
        func alienOrder(_ words: [String]) -> String {
            var graph = [Character: Set<Character>]()
            var inDegree = [Character: Int]()

            // Initialize all characters
            for word in words {
                for c in word {
                    graph[c] = graph[c] ?? Set()
                    inDegree[c] = inDegree[c] ?? 0
                }
            }

            // Build graph from adjacent word pairs
            for i in 0..<words.count - 1 {
                let w1 = Array(words[i]), w2 = Array(words[i+1])

                // Check invalid case: prefix comes after longer word
                if w1.count > w2.count && w1.starts(with: w2) {
                    return ""
                }

                // Find first differing character
                for j in 0..<min(w1.count, w2.count) {
                    if w1[j] != w2[j] {
                        if !graph[w1[j]].unsafelyUnwrapped.contains(w2[j]) {
                            graph[w1[j], default: []].insert(w2[j])
                            inDegree[w2[j], default: 0] += 1
                        }
                        break
                    }
                }
            }

            // BFS topological sort
            var queue = inDegree.filter { $0.value == 0 }.map { $0.key }
            var result = ""

            while !queue.isEmpty {
                let c = queue.removeFirst()
                result.append(c)

                for next in graph[c].unsafelyUnwrapped {
                    inDegree[next, default: 0] -= 1
                    if inDegree[next] == 0 {
                        queue.append(next)
                    }
                }
            }

            return result.count == inDegree.count ? result : ""
        }
    }

    @Suite struct AlienDictionaryTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "eadd66a6-bb30-44e6-a598-9b12a0441ba7",
             input: "words = [\"a\",\"b\",\"c\"]",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "7e24f77a-5d53-4800-ab76-e474273383a3",
             input: "words = [\"a\",\"b\",\"c\",\"d\"]",
             expected: "abcd", orderMatters: true),
            TestCaseData(id: "82734f8d-86f6-4b28-a564-21c215a7fd0a",
             input: "words = [\"a\",\"a\",\"a\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "3ffadfbc-1b9e-4a1e-adfc-7eb3a1950b26",
             input: "words = [\"abc\",\"abc\",\"abc\"]",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "314acc4d-ee93-4cb7-aac9-c91026393345",
             input: "words = [\"abc\",\"abcd\",\"abce\"]",
             expected: "abcde", orderMatters: true),
            TestCaseData(id: "35c22dc3-85c2-4e91-ac80-74f0b6616084",
             input: "words = [\"a\",\"aa\",\"aaa\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "72bcfe36-569b-4ff3-842c-26775b4fb58d",
             input: "words = [\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\","
                + "\"v\",\"w\",\"x\",\"y\",\"z\"]",
             expected: "abcdefghijklmnopqrstuvwxyz", orderMatters: true),
            TestCaseData(id: "ca34bac6-c344-4e78-8105-0de39d95c246",
             input: "words = [\"a\"]",
             expected: "a", orderMatters: true),
            TestCaseData(id: "c64c5f9f-92c1-41d0-ae01-e2c164cfa766",
             input: "words = [\"baa\",\"abcd\",\"abca\",\"cab\",\"cad\"]",
             expected: "bdac", orderMatters: true),
            TestCaseData(id: "6a7f3418-ce22-4343-9841-dd62121619b4",
             input: "words = [\"q\",\"r\",\"s\",\"t\",\"u\",\"v\",\"w\",\"x\",\"y\",\"z\"]",
             expected: "qrstuvwxyz", orderMatters: true),
            TestCaseData(id: "d619f329-e1ce-4ff2-8951-597fe132a167",
             input: "words = [\"abc\",\"def\",\"ghi\"]",
             expected: "abcefhidg", orderMatters: true),
            TestCaseData(id: "c6a2fc02-a645-4b45-88f3-00568cf4ff91",
             input: "words = [\"cba\",\"daf\",\"ghi\"]",
             expected: "abcfhidg", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "alien-dictionary"
            let topic = "misc"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_words = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_words.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: words array too large (\(p_words.count))"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.alienOrder(p_words)
            }
            guard !didCrash, let result = resultHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution crashed at runtime"
                )
                return
            }
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
