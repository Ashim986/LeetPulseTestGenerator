import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReorganizeString {
    private class Solution {
        func reorganizeString(_ s: String) -> String {
            var count: [Character: Int] = [:]
            for char in s { count[char, default: 0] += 1 }

            var heap = count.map { ($0.value, $0.key) }.sorted { $0.0 > $1.0 }
            if heap[0].0 > (s.count + 1) / 2 { return "" }

            var result = ""
            while heap.count >= 2 {
                let first = heap.removeFirst()
                let second = heap.removeFirst()
                result += String(first.1) + String(second.1)
                if first.0 > 1 { heap.append((first.0 - 1, first.1)) }
                if second.0 > 1 { heap.append((second.0 - 1, second.1)) }
                heap.sort { $0.0 > $1.0 }
            }
            if !heap.isEmpty { result += String(heap[0].1) }
            return result
        }
    }

    @Suite struct ReorganizeStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1af22290-4697-4727-9401-b11d95cacdf4",
             input: "s = \"abc\"",
             expected: "abc", orderMatters: true),
            TestCaseData(id: "4a7665f4-adff-4a16-97d8-08ab6dc3402d",
             input: "s = \"aabb\"",
             expected: "abab", orderMatters: true),
            TestCaseData(id: "17c64b95-5d54-4dec-9f1a-6a1248923b07",
             input: "s = \"aabbcc\"",
             expected: "abcabc", orderMatters: true),
            TestCaseData(id: "4a08e293-42fe-465d-a88c-874694a4a028",
             input: "s = \"a\"",
             expected: "a", orderMatters: true),
            TestCaseData(id: "a35ae3d3-de31-4563-b189-515e17277203",
             input: "s = \"ab\"",
             expected: "ab", orderMatters: true),
            TestCaseData(id: "a8ecd4e8-de87-435d-875c-bb434a7caae2",
             input: "s = \"aba\"",
             expected: "aba", orderMatters: true),
            TestCaseData(id: "8f92cf54-95f6-4c41-b3d4-68910fc4a31d",
             input: "s = \"ababab\"",
             expected: "ababab", orderMatters: true),
            TestCaseData(id: "ed903d04-a8d6-438f-bde0-e2dbd54646fa",
             input: "s = \"abababab\"",
             expected: "abababab", orderMatters: true),
            TestCaseData(id: "683a94d4-d143-43bd-a2ba-ab740153070a",
             input: "s = \"abcabcabc\"",
             expected: "abcabcabc", orderMatters: true),
            TestCaseData(id: "623828a8-8755-4da2-a978-93722363f29c",
             input: "s = \"abcdabcd\"",
             expected: "abcdabcd", orderMatters: true),
            TestCaseData(id: "7bdfc3da-1f02-4884-8e8a-41a41a271038",
             input: "s = \"abcdeabcde\"",
             expected: "abcdeabcde", orderMatters: true),
            TestCaseData(id: "7ab5ed1f-3cbe-4416-89e7-87f0c405837b",
             input: "s = \"aabbccddeeff\"",
             expected: "abcdefabcdef", orderMatters: true),
            TestCaseData(id: "f7b62936-a0be-4ca2-b7e0-cf18c2d89391",
             input: "s = \"abcdefgh\"",
             expected: "abcdefgh", orderMatters: true),
            TestCaseData(id: "9eec3fc8-a142-4470-8a74-ae96cb01f245",
             input: "s = \"abcdefghi\"",
             expected: "abcdefghi", orderMatters: true),
            TestCaseData(id: "759019cb-e7c6-461e-b864-cad19b3d1b83",
             input: "s = \"abcdefghij\"",
             expected: "abcdefghij", orderMatters: true),
            TestCaseData(id: "de131624-66eb-4a7f-b379-ecaf284fc00a",
             input: "s = \"aab\"",
             expected: "\"aba\"", orderMatters: true),
            TestCaseData(id: "aacbc8b9-87ed-4d5d-bde0-d1d76434108e",
             input: "s = \"aaab\"",
             expected: "\"\"", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reorganize-string"
            let topic = "heap-priority-queue"
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

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 500"
                )
                return
            }

            let solution = Solution()
            var resultHolder: String?
            let didCrash = withCrashGuard {
                resultHolder = solution.reorganizeString(p_s)
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
