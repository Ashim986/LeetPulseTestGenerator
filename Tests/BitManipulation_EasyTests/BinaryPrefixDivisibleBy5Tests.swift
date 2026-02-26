import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinaryPrefixDivisibleBy5 {
    private class Solution {
        func prefixesDivBy5(_ A: [Int]) -> [Int] {
            var result = [Int]()
            var prefixSum = 0
            for num in A {
                prefixSum = ((prefixSum << 1) + num) % 5
                if prefixSum == 0 {
                    result.append(1)
                } else {
                    result.append(0)
                }
            }
            return result
        }
    }

    @Suite struct BinaryPrefixDivisibleBy5Tests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2fc01c57-e2d7-4dbb-a5bb-926de577226e",
             input: "A = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "c5e37257-e520-41c2-974f-8b788ab77031",
             input: "A = [0]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "bdce82cc-037d-4d5c-ba28-354c2741f61e",
             input: "A = [1]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "92543195-128a-499e-94ea-677a6ee5b225",
             input: "A = [0, 0, 0]",
             expected: "[1, 1, 1]", orderMatters: true),
            TestCaseData(id: "9666941d-3ced-472a-a2f8-acf2f5278f73",
             input: "A = [0, 1, 0, 1]",
             expected: "[1, 1, 0, 0]", orderMatters: true),
            TestCaseData(id: "67442846-bb1a-4e54-b304-42784d0f688c",
             input: "A = [0, 0, 0, 0, 0]",
             expected: "[1, 1, 1, 1, 1]", orderMatters: true),
            TestCaseData(id: "fb035d89-8979-4874-a04b-5da5d4ba861d",
             input: "A = [1, 1, 1, 1, 1]",
             expected: "[0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "90c467a9-27b6-4733-8463-91aaefb6e6f1",
             input: "A = [10, 20, 30]",
             expected: "[0, 0, 0]", orderMatters: true),
            TestCaseData(id: "f4774ad7-f2f2-46bf-a355-a68ce2d3978e",
             input: "A = [0, 10, 20]",
             expected: "[1, 0, 0]", orderMatters: true),
            TestCaseData(id: "9dde6eb7-dbbc-4a1e-bfde-317b6d609d3e",
             input: "A = [100, 200, 300]",
             expected: "[0, 0, 0]", orderMatters: true),
            TestCaseData(id: "3f033c16-fa0a-4a7f-987d-1b4e77bd7c6e",
             input: "A = [0, 100, 200]",
             expected: "[1, 0, 0]", orderMatters: true),
            TestCaseData(id: "77a6d64e-d308-4ef4-a6cd-f7655e8ee7a9",
             input: "A = [4, 3, 2, 1, 0]",
             expected: "[0, 0, 0, 0, 1]", orderMatters: true),
            TestCaseData(id: "aadca3db-4173-400f-a73c-3f614e1294ec",
             input: "A = [0, 10, 20, 30, 40]",
             expected: "[1, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "d7f1d2ea-a515-4f82-a59e-9550deeb1491",
             input: "A = [40, 30, 20, 10, 0]",
             expected: "[0, 0, 0, 0, 1]", orderMatters: true),
            TestCaseData(id: "f36ddd80-e31e-43e8-88e6-ade024ac70b9",
             input: "A = [1000, 2000, 3000, 4000, 5000]",
             expected: "[0, 0, 0, 0, 1]", orderMatters: true),
            TestCaseData(id: "073ef6ee-3cc8-49ea-94d6-bd2a84e27cb5",
             input: "A = [5000, 4000, 3000, 2000, 1000]",
             expected: "[1, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "1d490c85-eec4-4c77-8357-e6a814bab571",
             input: "A = [0, 1000, 2000, 3000, 4000]",
             expected: "[1, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "93686157-596c-4e09-8957-4ed58dd585b0",
             input: "A = [4000, 3000, 2000, 1000, 0]",
             expected: "[0, 0, 0, 0, 1]", orderMatters: true),
            TestCaseData(id: "ee6d2d59-423e-4545-80b1-6090f49a3163",
             input: "A = [5]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "604b0662-a17d-406d-8a5e-789c5e768171",
             input: "A = [1, 0, 1, 0]",
             expected: "[0,1,0,1]", orderMatters: true),
            TestCaseData(id: "7d755bd2-53d4-4beb-9e23-a28ea6bbec9b",
             input: "A = [-1, 0, 1]",
             expected: "null", orderMatters: true),
            TestCaseData(id: "a1fb7df5-3902-4c6f-8533-e8f087fa31cf",
             input: "A = [5, 10, 15]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "4aa16d28-bf85-4a79-bc3f-d4fc2584ba25",
             input: "A = [0, 5, 10]",
             expected: "[1,0,0]", orderMatters: true),
            TestCaseData(id: "fcd2edb6-3f8e-42b3-8495-a8cb95933f03",
             input: "nums = [0,1,1]",
             expected: "[true,false,false]", orderMatters: true),
            TestCaseData(id: "cd597b1b-6d77-4dc4-82d7-e8d9db04daf1",
             input: "nums = [1,1,1]",
             expected: "[false,false,false]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-prefix-divisible-by-5"
            let topic = "bit-manipulation"
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

            guard let p_A = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.count >= 1 && p_A.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.prefixesDivBy5(p_A)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
