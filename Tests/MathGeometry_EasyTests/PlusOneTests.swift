import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPlusOne {
    private class Solution {
        func plusOne(_ digits: [Int]) -> [Int] {
            var digits = digits

            // Find rightmost non-9
            var i = digits.count - 1
            while i >= 0 && digits[i] == 9 {
                i -= 1
            }

            if i < 0 {
                // All 9s: 999 -> 1000
                return [1] + Array(repeating: 0, count: digits.count)
            }

            // Increment found digit, zero everything to its right
            digits[i] += 1
            for j in (i+1)..<digits.count {
                digits[j] = 0
            }

            return digits
        }
    }

    @Suite struct PlusOneTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "49fdb859-aeb4-4f4d-b778-c8708f030486",
             input: "digits = [0]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "c0157e50-92b8-431b-81bb-8bb6eece2a46",
             input: "digits = [5]",
             expected: "[6]", orderMatters: true),
            TestCaseData(id: "9e4adb83-382e-44ad-b3c8-98f6cf7c24aa",
             input: "digits = [8]",
             expected: "[9]", orderMatters: true),
            TestCaseData(id: "23e51db0-beb4-49c8-a9b4-b78bdbdb6167",
             input: "digits = [0,0]",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "af37ef2b-a5ab-4be3-860d-8789005fd4cc",
             input: "digits = [1,0]",
             expected: "[1,1]", orderMatters: true),
            TestCaseData(id: "41552d1c-57a6-4b6c-a4c5-804beea91bc0",
             input: "digits = [9,0]",
             expected: "[9,1]", orderMatters: true),
            TestCaseData(id: "c8322be5-09e7-4ec9-b3c6-2e08a2d69362",
             input: "digits = [0,9]",
             expected: "[1,0]", orderMatters: true),
            TestCaseData(id: "ba9c5df2-ae62-4ebf-8da1-9b1dd7bbec8f",
             input: "digits = [1,1]",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "20bfe33d-21f8-4d6d-8f5c-345ec917fec6",
             input: "digits = [2,2]",
             expected: "[2,3]", orderMatters: true),
            TestCaseData(id: "cd1791d6-3878-4683-b1ed-5041d6f3371d",
             input: "digits = [3,3]",
             expected: "[3,4]", orderMatters: true),
            TestCaseData(id: "57799317-59b0-4f77-8ff7-1c0a054448b4",
             input: "digits = [4,4]",
             expected: "[4,5]", orderMatters: true),
            TestCaseData(id: "7d13cb0a-d39c-46bf-abec-e31be34c8e50",
             input: "digits = [5,5]",
             expected: "[5,6]", orderMatters: true),
            TestCaseData(id: "eba54892-89ea-47b6-af6e-efa1e15acd2f",
             input: "digits = [6,6]",
             expected: "[6,7]", orderMatters: true),
            TestCaseData(id: "e275960a-db00-4279-baa4-b431e195ce0f",
             input: "digits = [7,7]",
             expected: "[7,8]", orderMatters: true),
            TestCaseData(id: "7c22beb1-8820-45bd-937b-577cb3ad333f",
             input: "digits = [8,8]",
             expected: "[8,9]", orderMatters: true),
            TestCaseData(id: "35be6fd1-8e06-4e7a-8cee-273e6d5565c1",
             input: "digits = [9,8]",
             expected: "[9,9]", orderMatters: true),
            TestCaseData(id: "6e646117-a6bc-414f-9478-d17477bef3ab",
             input: "digits = [8,9]",
             expected: "[9,0]", orderMatters: true),
            TestCaseData(id: "e67637a0-95eb-4bf5-8f65-451d6612691b",
             input: "digits = [1,2,4]",
             expected: "[1,2,5]", orderMatters: true),
            TestCaseData(id: "fa126451-588b-471b-b16c-fd66a31b92ea",
             input: "digits = [3,9,9]",
             expected: "[4,0,0]", orderMatters: true),
            TestCaseData(id: "0dedf925-ea54-4241-a7f3-4b33f518808c",
             input: "digits = [9,9,8]",
             expected: "[9,9,9]", orderMatters: true),
            TestCaseData(id: "54e53bb9-6691-4751-a0ab-f09baa445903",
             input: "digits = [5,6,7]",
             expected: "[5,6,8]", orderMatters: true),
            TestCaseData(id: "c843d4c2-a716-482a-ab5e-892c3a2cef28",
             input: "digits = [1,9,9,9]",
             expected: "[2,0,0,0]", orderMatters: true),
            TestCaseData(id: "43f71665-c1c8-4d16-a23c-a70b74fbb8e5",
             input: "digits = [9,9,9,9]",
             expected: "[1,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "8000dcab-b1e1-4d08-9c9b-4c2bd9f5769c",
             input: "digits = [0,0,0]",
             expected: "[0,0,1]", orderMatters: true),
            TestCaseData(id: "0a954ce8-c31e-4a09-a78f-0e342341da9d",
             input: "digits = [1,0,0]",
             expected: "[1,0,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "plus-one"
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

            guard let p_digits = InputParser.parseIntArray(params[0]) else {
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
            guard p_digits.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: digits array too large (\(p_digits.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_digits.count >= 1 && p_digits.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= digits.length <= 100"
                )
                return
            }
            guard p_digits.allSatisfy({ $0 >= 0 && $0 <= 9 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= digits[i] <= 9"
                )
                return
            }

            let solution = Solution()
            let result = solution.plusOne(p_digits)
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
