import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCStringCompression {
    private class Solution {
        func compress(_ chars: inout [Character]) -> Int {
            let n = chars.count
            if n == 0 {
                return 0
            }
            var left = 0
            var write = 0
            for (right, char) in chars.enumerated() {
                if right == n - 1 || char != chars[right + 1] {
                    chars[write] = char
                    write += 1
                    if right > left {
                        let count = right - left + 1
                        for c in String(count) {
                            chars[write] = c
                            write += 1
                        }
                    }
                    left = right + 1
                }
            }
            return min(write, n)
        }
    }

    @Suite struct StringCompressionTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "84e6112f-14e6-4bd7-acc8-69508e213b26",
             input: "chars = ['a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'b']",
             expected: "4", orderMatters: true),
            TestCaseData(id: "4271bfc0-a852-46bd-903e-d2344d847c73",
             input: "chars = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']",
             expected: "10", orderMatters: true),
            TestCaseData(id: "9acc9e05-705e-4d77-a478-a8abe9d3118a",
             input: "chars = ['a', 'a', 'b', 'b', 'c', 'c', 'c', 'c']",
             expected: "6", orderMatters: true),
            TestCaseData(id: "4573ba1d-f43b-4090-ae44-0478c7e9244b",
             input: "chars = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "81107a3b-f953-4b18-b4fe-07c37c8fc52c",
             input: "chars = ['a']",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d416d0d8-57ee-4539-bdb0-89aa43e2a7a4",
             input: "chars = ['a', 'b']",
             expected: "2", orderMatters: true),
            TestCaseData(id: "72a93ee1-da1a-45e0-ac3c-7a9ac77dfee8",
             input: "chars = ['a', 'a', 'a']",
             expected: "2", orderMatters: true),
            TestCaseData(id: "434fa33c-22c0-4e05-b423-34581c30503d",
             input: "chars = ['b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b']",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f5190957-bf70-45fa-8410-230fd5cba464",
             input: "chars = ['z', 'z', 'z', 'z', 'z']",
             expected: "2", orderMatters: true),
            TestCaseData(id: "18e54af4-16f5-42be-b569-a6460b3dfb20",
             input: "chars = ['a', 'b', 'c', 'a', 'b', 'c']",
             expected: "6", orderMatters: true),
            TestCaseData(id: "8108f4e8-bae0-45e3-9008-fb188d33d53e",
             input: "chars = ['a', 'a', 'a', 'b', 'b', 'b', 'c', 'c', 'c']",
             expected: "6", orderMatters: true),
            TestCaseData(id: "3eae02a2-29f9-4aed-abf1-bd5feabecc8e",
             input: "chars = ['q', 'q', 'q', 'q', 'q', 'q', 'q', 'q']",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a7f615a5-5e20-42a0-b1d5-76c3b254c640",
             input: "chars = ['k', 'k', 'k', 'k', 'k', 'k', 'k', 'k', 'k']",
             expected: "2", orderMatters: true),
            TestCaseData(id: "726a07c4-4f93-43c7-b7e6-98850327367b",
             input: "chars = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']",
             expected: "26", orderMatters: true),
            TestCaseData(id: "4631f48e-1729-440a-b455-0f36291a6fa9",
             input: "chars = ['z', 'y', 'x', 'w', 'v', 'u', 't', 's', 'r', 'q', 'p', 'o', 'n', 'm', 'l', 'k', 'j', 'i', 'h', 'g', 'f', 'e', 'd', 'c', 'b', 'a']",
             expected: "26", orderMatters: true),
            TestCaseData(id: "f2662291-53f6-4e49-8809-7f472e17e8c4",
             input: "chars = ['a', 'a', 'b', 'b', 'c', 'c', 'd', 'd']",
             expected: "8", orderMatters: true),
            TestCaseData(id: "241d227b-bc60-42df-b47f-58ecd11ab972",
             input: "chars = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c69ea305-ffa1-4b9d-be17-05e373de2466",
             input: "chars = ['p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p']",
             expected: "3", orderMatters: true),
            TestCaseData(id: "42c9607c-8b33-456a-9411-58e88bc7101b",
             input: "chars = ['o', 'o', 'o', 'o', 'o', 'o', 'o', 'o', 'o', 'o', 'o']",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6f62033d-083f-4e2c-9903-528f3466cb5e",
             input: "chars = ['n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n']",
             expected: "3", orderMatters: true),
            TestCaseData(id: "8f219e68-03d6-44a6-acbf-666c2e1cb9c0",
             input: "chars = ['m', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm']",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e2a58258-2d9a-454c-8787-3c730d377dc5",
             input: "chars = ['l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l']",
             expected: "3", orderMatters: true),
            TestCaseData(id: "28919b43-7199-4f11-90c7-094fdd6a202c",
             input: "chars = ['j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j']",
             expected: "3", orderMatters: true),
            TestCaseData(id: "29fedb1b-6321-405a-8bb6-3cf10c5fa148",
             input: "chars = ['i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i']",
             expected: "3", orderMatters: true),
            TestCaseData(id: "bfa2cb7a-e908-4567-ab59-8e053eef4bf0",
             input: "chars = ['h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h']",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "string-compression"
            let topic = "two-pointers"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard var p_chars = InputParser.parseCharacterArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as inout [Character]"
                )
                return
            }

            // Constraint precondition checks
            guard p_chars.count >= 1 && p_chars.count <= 2000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= chars.length <= 2000"
                )
                return
            }

            let solution = Solution()
            let result = solution.compress(&p_chars)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
