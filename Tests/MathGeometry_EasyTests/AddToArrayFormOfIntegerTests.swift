import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAddToArrayFormOfInteger {
    private class Solution {
        func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
            var num = num
            var k = k
            for i in stride(from: num.count - 1, through: 0, by: -1) {
                num[i] += k
                k = num[i] / 10
                num[i] %= 10
            }
            while k > 0 {
                num.insert(k % 10, at: 0)
                k /= 10
            }
            return num
        }
    }

    @Suite struct AddToArrayFormOfIntegerTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a515b424-f8ef-4a3f-9718-0d13fab73cda",
             input: "num = [0], k = 0",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "a7c8351c-6f36-45f3-9078-7cdadc1981c9",
             input: "num = [9, 9, 9], k = 1",
             expected: "[1, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "c3fcbcb0-ed75-4295-9034-062c9ba34b09",
             input: "num = [1, 2, 3], k = 0",
             expected: "[1, 2, 3]", orderMatters: true),
            TestCaseData(id: "0959d4c5-a0be-419f-880f-f54c7ff6153f",
             input: "num = [9], k = 9",
             expected: "[1, 8]", orderMatters: true),
            TestCaseData(id: "e5f8003e-3aa2-44c1-8819-42d91c2e75bb",
             input: "num = [1, 1, 1], k = 1",
             expected: "[1, 1, 2]", orderMatters: true),
            TestCaseData(id: "87c422b0-7afb-4343-9d52-1773cc874665",
             input: "num = [5, 5, 5], k = 5",
             expected: "[5, 6, 0]", orderMatters: true),
            TestCaseData(id: "de73c141-9b0f-4bbb-9e62-5fd4185cd7b1",
             input: "num = [1], k = 1",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "614cb45d-d9a6-4b07-accb-bcdd829f9bfa",
             input: "num = [8, 8, 8], k = 1",
             expected: "[9, 8, 8]", orderMatters: true),
            TestCaseData(id: "227f5a8e-6888-4cfc-9bd5-2063827936b1",
             input: "num = [7, 7, 7], k = 7",
             expected: "[7, 8, 4]", orderMatters: true),
            TestCaseData(id: "64920c45-525f-49aa-8112-2185c12155a7",
             input: "num = [6, 6, 6], k = 6",
             expected: "[6, 7, 2]", orderMatters: true),
            TestCaseData(id: "69b12d51-4caf-4271-a59c-199dc70ad168",
             input: "num = [1, 0, 0], k = 0",
             expected: "[1, 0, 0]", orderMatters: true),
            TestCaseData(id: "27109e21-266a-4de1-960d-fb8d69ae0cf4",
             input: "num = [0, 1, 0], k = 0",
             expected: "[0, 1, 0]", orderMatters: true),
            TestCaseData(id: "67c8bd9f-45aa-4d87-994f-6c928d9f3770",
             input: "num = [0, 0, 1], k = 0",
             expected: "[0, 0, 1]", orderMatters: true),
            TestCaseData(id: "02d5ea48-f0c9-4261-9c82-9d1c1d0f866f",
             input: "num = [9, 9], k = 1",
             expected: "[1, 0, 0]", orderMatters: true),
            TestCaseData(id: "8b3a4bd9-ff56-4471-8abb-4b7c81125d08",
             input: "num = [1, 9], k = 1",
             expected: "[2, 0]", orderMatters: true),
            TestCaseData(id: "8fd26dd6-9c3a-4172-a19c-6045d623e276",
             input: "num = [0, 9], k = 1",
             expected: "[1, 0]", orderMatters: true),
            TestCaseData(id: "3275c5b0-3352-42f0-8fe8-0475cd5b5126",
             input: "num = [1, 1, 1, 1], k = 1",
             expected: "[1, 1, 1, 2]", orderMatters: true),
            TestCaseData(id: "4cadbae9-eb4e-41d6-84e5-565a388d1a69",
             input: "num = [8, 8, 8, 8], k = 1",
             expected: "[9, 8, 8, 8]", orderMatters: true),
            TestCaseData(id: "76caffeb-303f-4fb0-933b-80e4ca6fc176",
             input: "num = [9999], k = 1",
             expected: "[1, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "fc9dee72-633c-4e6c-8e29-8a9cfb1e3419",
             input: "num = [10000], k = 1",
             expected: "[1, 0, 0, 0, 1]", orderMatters: true),
            TestCaseData(id: "d48c0a16-a0a7-4bfa-86a4-45ff7a649c53",
             input: "num = [12345], k = 1",
             expected: "[1, 2, 3, 4, 6]", orderMatters: true),
            TestCaseData(id: "d8a05635-d211-4dcc-b698-c13f8403e801",
             input: "num = [54321], k = 1",
             expected: "[5, 4, 3, 2, 2]", orderMatters: true),
            TestCaseData(id: "313bd5de-efd8-485b-9e79-1fe348e7556b",
             input: "num = [], k = 0",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "1dfb5358-1074-4e8a-8a76-f05d9ef39c66",
             input: "num = [0, 0, 0], k = 1",
             expected: "[0,0,1]", orderMatters: true),
            TestCaseData(id: "ae026a51-1461-4f9e-860e-981f9aee6032",
             input: "num = [4, 4, 4], k = 4",
             expected: "[4,4,8]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "add-to-array-form-of-integer"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_num = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_num.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: num array too large (\(p_num.count))"
                )
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_num.count >= 1 && p_num.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= num.length <= 104"
                )
                return
            }
            guard p_num.allSatisfy({ $0 >= 0 && $0 <= 9 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= num[i] <= 9"
                )
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.addToArrayForm(p_num, p_k)
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
