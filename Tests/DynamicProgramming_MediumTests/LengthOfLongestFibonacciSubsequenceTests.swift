import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLengthOfLongestFibonacciSubsequence {
    private class Solution {
        func lenLongestFibSubseq(_ A: [Int]) -> Int {
            let set = Set(A)
            var maxLength = 0
            for i in 0..<A.count {
                for j in i+1..<A.count {
                    var x = A[i], y = A[j]
                    var length = 2
                    while true {
                        let z = x + y
                        guard set.contains(z) else {
                            break
                        }
                        x = y
                        y = z
                        length += 1
                    }
                    if length > 2 {
                        maxLength = max(maxLength, length)
                    }
                }
            }
            return maxLength
        }
    }

    @Suite struct LengthOfLongestFibonacciSubsequenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "459f3237-9748-4487-af13-fa4f97faf5b6",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0b45a5e6-56c3-4162-97f8-e4c5c19fb460",
             input: "nums = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "23a1f219-a676-427b-90be-9d7447c092bb",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8d5f2757-7207-4fc9-b356-557d27fa0dc5",
             input: "nums = [1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "44e89acc-8594-49e6-ae0d-4171ddc2c8ad",
             input: "nums = [0, 1, 1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "26e456d1-11c3-47a4-9d59-96a306931eca",
             input: "nums = [1, 100, 1000]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "482aaa2e-d082-400d-9afd-5915bd85a05d",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "77fe5968-de1c-407c-b502-455999f81bee",
             input: "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "93c789e3-e073-42ea-9363-51f8fa41b8b8",
             input: "nums = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3346ea4b-13e1-460d-85e0-1c35b034f976",
             input: "nums = [1, -1, 1, -1, 1, -1, 1, -1, 1, -1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "db5f416c-3be4-499d-a783-0200a835be92",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5ac7bd5b-d82b-4469-89ea-b7870b9ac4d0",
             input: "nums = [1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "4140321b-0732-4f05-8c39-dd4dd8524099",
             input: "nums = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "80ebf2a9-0fb4-447b-bfd8-4d4d90f374c8",
             input: "nums = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a6e6a069-397b-4347-b611-8b5e5351364d",
             input: "nums = [1, 2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "03d07cd6-c772-4a93-a684-0866d9000169",
             input: "nums = [1, 3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6a715b1e-9d90-47ba-8174-c44c7ea0418b",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "1d321d5c-9b88-4f54-8d18-da9c09a0cc90",
             input: "nums = [5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5ef57a48-3f66-4d82-a729-7df337d8f5ae",
             input: "nums = [-1, 0, 1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "cc5d3945-a540-4a87-9783-37dc9490f709",
             input: "nums = [-1, -2, -3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "86d51c5d-a194-48b4-bb91-d7923faafbe9",
             input: "nums = [100, 200, 300]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6be0370a-09f8-45e5-9ac2-4782c0fa2fcb",
             input: "nums = [1, 1, 2, 3, 5, 8, 13]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "464b23f6-5bd0-4fc8-a8a3-c13e615f9257",
             input: "nums = [1, 2, 3, 5, 8, 13, 21, 34, 55, 89]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "a5361159-5e13-452d-ad87-3b4241e89c70",
             input: "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e005edaa-0b0b-4e61-85d1-49baf4c61874",
             input: "nums = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]",
             expected: "5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "length-of-longest-fibonacci-subsequence"
            let topic = "dynamic-programming"
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
            guard p_A.count >= 3 && p_A.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 3 <= arr.length <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.lenLongestFibSubseq(p_A)
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
