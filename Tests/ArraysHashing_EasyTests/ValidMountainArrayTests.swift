import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCValidMountainArray {
    private class Solution {
        func validMountainArray(_ arr: [Int]) -> Bool {
            let n = arr.count
            if n < 3 {
                return false
            }
            var i = 0
            while i < n-1 && arr[i] < arr[i+1] {
                i += 1
            }
            if i == 0 || i == n-1 {
                return false
            }
            while i < n-1 && arr[i] > arr[i+1] {
                i += 1
            }
            return i == n-1
        }
    }

    @Suite struct ValidMountainArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "99235777-b7a6-4bc7-aca1-79ab938a92fc",
             input: "nums = [1,1,1,1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "93a556ad-2cce-4115-bd90-25db4faafa3d",
             input: "nums = [5,4,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "21ef9845-070f-41bd-9e25-c0db408a4a67",
             input: "nums = [1,2,3,2,1,2,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6c366c18-698b-4d1c-a573-ef7660586479",
             input: "nums = [1,1,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8d43f211-2e02-4794-b206-5a7e6ede0a48",
             input: "nums = [0,0,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8033f8e0-5245-4695-b1d3-f22a3b22a408",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "06cee284-9a75-44bf-94af-0682c22b08ca",
             input: "nums = [100,1,100]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e345529e-3922-4995-869b-4b0439e24b0b",
             input: "nums = [1,1,1,1,2,1,1,1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "dd75a1d7-4902-4e6a-8783-f26e079ba87a",
             input: "nums = [1,2,3,2,1,2,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "138e1bc2-49c1-453e-b160-bc623ef84023",
             input: "nums = [1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bd78e8c1-7a4e-4e01-9c32-f19a7996c360",
             input: "nums = []",
             expected: "false", orderMatters: true),
            TestCaseData(id: "aad9af68-a21e-4b4f-96a0-ecdad970c73b",
             input: "nums = [1,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2a313e48-2316-4b1e-901b-7e61b8573041",
             input: "nums = [2,1,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "225bba71-0b15-4e38-826f-9b12b0a6018a",
             input: "nums = [1,2,3,4,3,2,1,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "662bf015-d6c6-46a6-ac88-7203beb57eeb",
             input: "nums = [10,9,8,7,6,5,4,3,2,1,2,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "07729da2-6536-40df-8fab-af373544a20a",
             input: "nums = [1,2,1,2,1,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4b02c617-53d9-43b3-b230-a6db6ef10a88",
             input: "nums = [1,3,2,1,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "44893809-539f-4dd2-a85e-3ff1efd9e8f4",
             input: "nums = [1,2,3,4,5,6,5,4,3,2,1,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "40e49c45-7c00-487f-b225-925213bdab5a",
             input: "nums = [1,1,1,2,1,1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f479900b-1947-4a1d-a588-2465254d5814",
             input: "nums = [1,2,1,2,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "812f6161-3f2f-42bc-876c-338290ccc9e2",
             input: "nums = [1,2,3,4,5,4,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "30e3fcc5-7361-4f2a-ad88-20ae524d8266",
             input: "nums = [1,3,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "259593b8-d976-4758-9d22-bab935d2e0fa",
             input: "nums = [1,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c3ad6150-dffa-4ba9-8fcc-0c22bb80b84a",
             input: "nums = [1,2,3,4,3,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "89c4fefc-ce61-4258-b9d8-24c68d864c67",
             input: "nums = [1,2,3,4,5,6,7,6,5,4,3,2,1]",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "valid-mountain-array"
            let topic = "arrays-hashing"
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

            guard let p_arr = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_arr.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: arr array too large (\(p_arr.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_arr.count >= 1 && p_arr.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= arr.length <= 10^4"
                )
                return
            }
            guard p_arr.allSatisfy({ $0 >= 0 && $0 <= 10000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= arr[i] <= 10^4"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.validMountainArray(p_arr)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
