import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBitwiseAndOfNumbersRange {
    private class Solution {
        func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
            var mCopy = m
            var nCopy = n
            var shift = 0
            while mCopy != nCopy {
                mCopy >>= 1
                nCopy >>= 1
                shift += 1
            }
            return mCopy << shift
        }
    }

    @Suite struct BitwiseAndOfNumbersRangeTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "114a1183-8cc8-4c23-90f8-589664e1b24d",
             input: "m = 1, n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b3f28747-dc82-473b-93f5-a4f94be1078e",
             input: "m = 2, n = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b1613c35-52b1-4421-8b54-1d81035e1cd1",
             input: "m = 3, n = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c70eb144-a02b-4592-8948-af82a0fcd156",
             input: "m = 4, n = 4",
             expected: "4", orderMatters: true),
            TestCaseData(id: "908a43a4-fc44-4c7a-8c0a-d1439173cd09",
             input: "m = 5, n = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "eaa8211b-b7f5-46cc-b6e6-d3b274a56ad7",
             input: "m = 6, n = 6",
             expected: "6", orderMatters: true),
            TestCaseData(id: "6406a144-b1ca-4ee8-b66d-ba56d6c72d15",
             input: "m = 7, n = 7",
             expected: "7", orderMatters: true),
            TestCaseData(id: "adf8a51d-1648-46c8-80dc-f9bd25c3e69a",
             input: "m = 8, n = 8",
             expected: "8", orderMatters: true),
            TestCaseData(id: "e4c3ba7d-ba8b-4cf4-9a55-0c71a6243aef",
             input: "m = 9, n = 9",
             expected: "9", orderMatters: true),
            TestCaseData(id: "94d9f15f-e6dc-4c76-bb1d-9b83d419031d",
             input: "m = 10, n = 10",
             expected: "10", orderMatters: true),
            TestCaseData(id: "4b5371ec-49a5-4d2e-9308-13f90ea451b6",
             input: "m = 0, n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "74ae9565-06bb-4cc0-a99a-e29b086f3757",
             input: "m = -1, n = -1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "9f8170d0-0e92-465c-b2e8-4bc3c0403e06",
             input: "m = -2, n = -2",
             expected: "-2", orderMatters: true),
            TestCaseData(id: "63b4cef3-8860-4a4d-af18-d7e3d3052a56",
             input: "m = 1, n = 2",
             expected: "0", orderMatters: true),
            TestCaseData(id: "086ee6c9-f8a0-44f7-9a4e-8b6fa1f79b06",
             input: "m = 2, n = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4ace58c0-8f76-41d8-a8f0-cd820d00753c",
             input: "m = 3, n = 4",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1f0056b8-35d4-4288-a1ba-8733296a77d7",
             input: "m = 4, n = 5",
             expected: "4", orderMatters: true),
            TestCaseData(id: "83ad6261-1f6c-4237-ac98-5fd48440f802",
             input: "m = 5, n = 6",
             expected: "4", orderMatters: true),
            TestCaseData(id: "883b5910-4ed7-49fb-be21-a288f89bf8a2",
             input: "m = 6, n = 7",
             expected: "6", orderMatters: true),
            TestCaseData(id: "e7082f8a-d930-469d-a7f5-79e9b0a290ef",
             input: "m = 7, n = 8",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d58a26ed-161e-4fd5-abe9-34de4b1194db",
             input: "m = 8, n = 9",
             expected: "8", orderMatters: true),
            TestCaseData(id: "e5dccca6-0a2d-4c48-b834-031aefecfb27",
             input: "m = 9, n = 10",
             expected: "8", orderMatters: true),
            TestCaseData(id: "64de9c4b-79d2-43cd-a3e7-46b65e7a202f",
             input: "m = 11, n = 12",
             expected: "8", orderMatters: true),
            TestCaseData(id: "ac79f16e-33ad-433f-9850-0bfd2ac7dfd4",
             input: "m = 15, n = 16",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0029e7be-e4ea-463d-9aaf-37ced7d69693",
             input: "m = 16, n = 17",
             expected: "16", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "bitwise-and-of-numbers-range"
            let topic = "bit-manipulation"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_m = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_n = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_m >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= left <= right <= 231 - 1"
                )
                return
            }
            guard p_n >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= left <= right <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.rangeBitwiseAnd(p_m, p_n)
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
