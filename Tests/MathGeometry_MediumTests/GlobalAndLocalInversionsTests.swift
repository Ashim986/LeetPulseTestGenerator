import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCGlobalAndLocalInversions {
    private class Solution {
        func isIdealPermutation(_ A: [Int]) -> Bool {
            for i in 0...A.count - 1 {
                if abs(A[i] - i) > 1 {
                    return false
                }
            }
            return true
        }
    }

    @Suite struct GlobalAndLocalInversionsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "78716b06-ddc1-4e02-bb91-2ce368ea9aee",
             input: "nums = [4,0,2,3,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bf21b651-6eda-4a60-bdb9-739cffb5019f",
             input: "nums = [4,3,2,1,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "936a498a-9f67-42f7-b612-561cb4ed18b5",
             input: "nums = [9,8,7,6,5,4,3,2,1,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f358410f-f8d0-4ca2-9f1d-0ed267b13885",
             input: "nums = [-1,0,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "70a49996-a91c-4820-ab87-3b868ed3ac49",
             input: "nums = [1,-1,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c971a17b-9db7-4489-98e5-394326d97947",
             input: "nums = [10,9,8,7,6,5,4,3,2,1,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "406d3380-67cb-4a85-9626-77db844fb70e",
             input: "nums = [0,1,2,3,4,5,6,7,8,9,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "68f54b87-75d5-464d-bb08-9769f0c5da32",
             input: "nums = [5,4,3,2,1,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e9bc4ef8-9c74-4c63-8152-498a5f8a51fa",
             input: "nums = [0,1,2,3,4,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "acae81e3-c23b-4b60-b763-32308968f45e",
             input: "nums = [6,5,4,3,2,1,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7ada0b14-5ddf-4728-a02f-87edc2a8e5e9",
             input: "nums = [0,2,1,4,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e5d8fda5-9059-47fc-936f-02900a458e96",
             input: "nums = [2,0,1,4,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a4ee2943-83b3-49e0-ab26-885c57fcccac",
             input: "nums = [0,1,2,3,4,5,6,7,8]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "606a901a-3fc8-4f1a-b674-5d18eef33cb9",
             input: "nums = [1,0,2,3]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "77077f4b-2503-4204-807b-58a832e2ebf2",
             input: "nums = [3,1,2,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "04faaf90-39a8-4d9f-8270-29c5e4e584a1",
             input: "nums = [0,1,2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "05a1524b-3b7e-4e4c-b0f6-483b86c68d58",
             input: "nums = [2,1,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "291301cc-f1c3-4232-a128-62b3e68306cc",
             input: "nums = [0,2,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "52f457d8-15f1-4837-98c2-3c9bc801a8b6",
             input: "nums = [1,2,0,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "18097fc1-8e49-4ec8-8299-7fb207dcea6f",
             input: "nums = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "282264e9-cb19-4039-8756-e185e8238750",
             input: "nums = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7e394be8-7bee-4910-8f1a-2d958ce338b1",
             input: "nums = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5e900460-1d91-4ff0-bdd5-2da14823183c",
             input: "nums = [0,2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "184e5492-f46b-4b00-9be5-3cff2a3e1d47",
             input: "nums = [2,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2a76e81d-a3fb-4bfa-8eb5-e9db15d9f191",
             input: "nums = [1,0,3,2]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "global-and-local-inversions"
            let topic = "math-geometry"
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

            let solution = Solution()
            let result = solution.isIdealPermutation(p_A)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
