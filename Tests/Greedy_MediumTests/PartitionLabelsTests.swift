import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPartitionLabels {
    private class Solution {
        func partitionLabels(_ s: String) -> [Int] {
            let chars = Array(s)
            var last: [Character: Int] = [:]
            for (i, c) in chars.enumerated() { last[c] = i }
            var result: [Int] = []
            var start = 0, end = 0
            for (i, c) in chars.enumerated() {
                end = max(end, last[c].unsafelyUnwrapped)
                if i == end {
                    result.append(end - start + 1)
                    start = i + 1
                }
            }
            return result
        }
    }

    @Suite struct PartitionLabelsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2da37e71-2e6d-4900-9b6d-2ece41524760",
             input: "s = \"abc\"",
             expected: "[1,1,1]", orderMatters: true),
            TestCaseData(id: "6c59c19f-3037-4557-917e-db5933bae1d6",
             input: "s = \"aaa\"",
             expected: "[3]", orderMatters: true),
            TestCaseData(id: "72214463-ef25-41f2-967c-28004d2976a2",
             input: "s = \"ab\"",
             expected: "[1,1]", orderMatters: true),
            TestCaseData(id: "13f45927-70f6-413a-ba39-4880ca4865c6",
             input: "s = \"a\"",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "eaab4128-6344-40d0-889d-93cfbd0e0631",
             input: "s = \"\"",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "51707207-b3c7-4e6b-91af-c44e3f2cef23",
             input: "s = \"abcdefghijklmnopqrstuvwxyz\"",
             expected: "[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "76e5192a-9090-48a8-8c08-3ffffaf711f2",
             input: "s = \"zyxwvutsrqponmlkjihgfedcba\"",
             expected: "[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "4952c7dd-eb21-4615-9887-63c9ad623c85",
             input: "s = \"aaaaaa\"",
             expected: "[6]", orderMatters: true),
            TestCaseData(id: "8f4ea972-b50e-4c28-9c1b-4a7845eff7a9",
             input: "s = \"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\"",
             expected: "[32]", orderMatters: true),
            TestCaseData(id: "fac97c7e-f6e3-4aae-b4a4-a1cbf1e52bfa",
             input: "s = \"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\"",
             expected: "[32]", orderMatters: true),
            TestCaseData(id: "b6836a57-82e3-4905-9a08-54f6f604aae8",
             input: "s = \"ababab\"",
             expected: "[6]", orderMatters: true),
            TestCaseData(id: "9c8e002c-98ac-481d-91ad-d79fb4ba391c",
             input: "s = \"abcabc\"",
             expected: "[6]", orderMatters: true),
            TestCaseData(id: "c70302c1-c877-40ee-ae85-0fda81f29093",
             input: "s = \"abcdabcd\"",
             expected: "[8]", orderMatters: true),
            TestCaseData(id: "cf06da64-8f5e-4f66-9e00-d62da968247e",
             input: "s = \"abcdeabcde\"",
             expected: "[10]", orderMatters: true),
            TestCaseData(id: "9b9923d3-870e-4e72-a648-c5185138f582",
             input: "s = \"abcdefabcdef\"",
             expected: "[12]", orderMatters: true),
            TestCaseData(id: "c3240607-c6d9-4be2-a18c-eae98cdb0b95",
             input: "s = \"abcdefghabcdefgh\"",
             expected: "[16]", orderMatters: true),
            TestCaseData(id: "9bc1bd6d-e3c9-46e1-ae8d-75e09c238c67",
             input: "s = \"abcdefghiabcdefghi\"",
             expected: "[18]", orderMatters: true),
            TestCaseData(id: "f3ba72e0-8e14-4c07-9c39-4f8c5d636dfb",
             input: "s = \"abcdefghijabcdefghij\"",
             expected: "[20]", orderMatters: true),
            TestCaseData(id: "fa9c09c0-59cc-4b7f-af6e-2fcdd372081d",
             input: "s = \"abcdefghijkabcdefghijk\"",
             expected: "[22]", orderMatters: true),
            TestCaseData(id: "dea06109-51bc-4ce4-b019-788716d16dce",
             input: "s = \"abcdefghijklabcdefghijkl\"",
             expected: "[24]", orderMatters: true),
            TestCaseData(id: "858b8084-1e9c-4970-8be7-53a4ab6fe973",
             input: "s = \"abcdefghijklmabcdefghijklm\"",
             expected: "[26]", orderMatters: true),
            TestCaseData(id: "4d3e1898-d2e7-488f-ad5d-e93b72721acd",
             input: "s = \"abcdefghijklmnabcdefghijklmn\"",
             expected: "[28]", orderMatters: true),
            TestCaseData(id: "148bbf3e-b55d-48e3-b46b-4106ff216822",
             input: "s = \"abcdefghijklmnopabcdefghijklmnop\"",
             expected: "[32]", orderMatters: true),
            TestCaseData(id: "bb9850f3-205a-4677-a5d3-546f1de5bb04",
             input: "s = \"abcdefghijklmnopqabcdefghijklmnopq\"",
             expected: "[34]", orderMatters: true),
            TestCaseData(id: "595f7256-f4bd-41d6-a04f-2a737def335e",
             input: "s = \"abcdefghijklmnopqrabcdefghijklmnopqr\"",
             expected: "[36]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "partition-labels"
            let topic = "greedy"
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
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.partitionLabels(p_s)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
