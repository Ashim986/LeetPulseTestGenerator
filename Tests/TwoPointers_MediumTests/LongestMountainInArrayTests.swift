import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestMountainInArray {
    private class Solution {
        func longestMountain(_ A: [Int]) -> Int {
            guard A.count > 2 else { return 0 }
            var maxLength = 0
            for i in 1..<A.count-1 {
                if A[i-1] < A[i] && A[i] > A[i+1] {
                    var left = i-1, right = i+1
                    while left > 0 && A[left-1] < A[left] {
                        left -= 1
                    }
                    while right < A.count-1 && A[right] > A[right+1] {
                        right += 1
                    }
                    maxLength = max(maxLength, right - left + 1)
                }
            }
            return maxLength
        }
    }

    @Suite struct LongestMountainInArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bbfd5702-44bc-4f37-871a-08c414bbfeea",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0649ee4d-3909-4697-9970-d3f326a39810",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "19ac1568-5a11-4a41-bf4c-6265372114ab",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "da2a9f6f-aede-4c6b-97b6-ffd7b54987b0",
             input: "nums = [1,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8dcb3c94-43ae-41bd-8feb-ad9922008f10",
             input: "nums = [2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "45871b1e-2fd0-443a-8547-79e6ee819fbd",
             input: "nums = [1,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ee29a128-6b1a-49f4-8eca-7d1bd39a8474",
             input: "nums = [1,3,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "4262f706-1ff2-4472-998e-aef7cbe5d7ca",
             input: "nums = [1,2,3,2,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "d560b7da-3e62-4570-ae23-92036fb6284f",
             input: "nums = [1,2,3,4,3,2,1]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "56625231-d9ff-4c33-9d9e-2413d0d426de",
             input: "nums = [1,1,2,2,3,3,2,2,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c81ffe8c-a493-402d-b374-f1e7af1f9502",
             input: "nums = [1,2,3,4,5,4,3,2,1,0]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "fa09cb96-015d-4595-934e-f74008a5a549",
             input: "nums = [10,20,30,40,50,40,30,20,10]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "d53c9024-dab8-4a1d-a3a3-8faf31a5f617",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9cfa576e-dbb6-42b0-9058-5d72dfa517ad",
             input: "nums = [1,2,1,2,1,2,1,2,1,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2e1c7d1e-d08c-4194-bffb-21ac968c25d2",
             input: "nums = [1000,2000,3000,4000,5000,4000,3000,2000,1000]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "54328ff4-4013-4d44-842e-792371b19a0c",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2b5697ed-46c7-469e-b454-45289a8826c2",
             input: "nums = [1,1,1,1,1,2,1,1,1,1,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "88799a66-5ab0-4b08-9326-6135bbb7c755",
             input: "nums = [1,2,1,2,1,2,1,2,1,2,1,2,1,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c1f37bcf-55ff-48e4-9e4d-dc1ba9514728",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "38fd6342-4bae-4fb8-afb1-a61abdd30bde",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "141dc5db-ea5e-4df9-845d-005f76a10e32",
             input: "nums = [1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "01e8d963-e0c4-4b36-adcf-11784b6195b1",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "90185fab-4d25-4e9a-a31a-e949a7569a58",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,-1,-2,-3,-4,-5,-4,-3,-2,-1]",
             expected: "41", orderMatters: true),
            TestCaseData(id: "2c13ff4e-7605-45c5-b809-b57d616158de",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "90c2b3ce-07e5-453d-b6ec-a108b228a43c",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,-1,-2,-3,-4,-5,-4,-3,-2,-1,"
                + "0,1,2,3,4,5,6,7,8,9,10]",
             expected: "41", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-mountain-in-array"
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
            guard p_A.count >= 1 && p_A.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= arr.length <= 104"
                )
                return
            }
            guard p_A.allSatisfy({ $0 >= 0 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= arr[i] <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.longestMountain(p_A)
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
