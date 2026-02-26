import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSumOfSubarrayMinimums {
    private class Solution {
        func sumSubarrayMins(_ nums: [Int]) -> Int {
            let n = nums.count
            var stack: [Int] = []
            var res = 0
            for i in 0..<n {
                while !stack.isEmpty && nums[stack[stack.count - 1]] > nums[i] {
                    let j = stack.removeLast()
                    let left = stack.isEmpty ? -1 : stack[stack.count - 1]
                    let right = i
                    let count = (i - j) * (j - left)
                    res += nums[j] * count
                }
                stack.append(i)
            }
            while !stack.isEmpty {
                let j = stack.removeLast()
                let left = stack.isEmpty ? -1 : stack[stack.count - 1]
                let right = n
                let count = (n - j) * (j - left)
                res += nums[j] * count
            }
            return res
        }
    }

    @Suite struct SumOfSubarrayMinimumsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "00ac2923-821b-4d60-bdc7-017291823869",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4e75cc29-b73d-41c2-b8ab-81a5d82ff7f2",
             input: "nums = [1,2]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2c11c475-20b9-4a3f-9f76-4118108fcbe5",
             input: "nums = [2,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "75f17221-fdea-4279-a010-b39e8fe352d9",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b6f884ab-e20a-4f1c-a231-cdd65484aece",
             input: "nums = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "085cfb15-2d4c-43c1-9b96-13dd6a6386c1",
             input: "nums = [1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "ab36ca2e-3958-420c-b730-4afbe2fcd6d8",
             input: "nums = [-1,-2,-3]",
             expected: "-14", orderMatters: true),
            TestCaseData(id: "84fe89d1-d92f-4a8f-908d-f0adc01ca0b1",
             input: "nums = [1,3,5,7,9]",
             expected: "55", orderMatters: true),
            TestCaseData(id: "5840a54b-7bca-4ab0-bc72-750327aa9cea",
             input: "nums = [9,7,5,3,1]",
             expected: "55", orderMatters: true),
            TestCaseData(id: "8896af71-b51a-4a8c-bc85-9753a1118fd1",
             input: "nums = [10,20,30,40,50]",
             expected: "350", orderMatters: true),
            TestCaseData(id: "24452398-c76f-40c4-8b29-f45f5399b438",
             input: "nums = [50,40,30,20,10]",
             expected: "350", orderMatters: true),
            TestCaseData(id: "40a52403-0050-44f7-bc38-927ef779e619",
             input: "nums = [1,1,1,1,1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "09578284-606f-4899-9652-d3fb41cd6de5",
             input: "nums = [5,5,5,5,5]",
             expected: "75", orderMatters: true),
            TestCaseData(id: "afd2329a-f373-4a84-896a-d6694db3c031",
             input: "nums = [100,200,300,400,500]",
             expected: "3500", orderMatters: true),
            TestCaseData(id: "abee07d3-25a9-4459-8a60-d4f8003fbb51",
             input: "nums = [500,400,300,200,100]",
             expected: "3500", orderMatters: true),
            TestCaseData(id: "1e791d56-7c59-45ed-b846-e030d361da90",
             input: "nums = [1,-1,1,-1,1]",
             expected: "-9", orderMatters: true),
            TestCaseData(id: "9974afcc-0c07-4d96-a32a-57ca7edd5abf",
             input: "nums = [-1,1,-1,1,-1]",
             expected: "-11", orderMatters: true),
            TestCaseData(id: "8e2e45a5-a082-4acb-82f9-aa22967590b7",
             input: "nums = [10,-10,10,-10,10]",
             expected: "-90", orderMatters: true),
            TestCaseData(id: "4ede12e6-80b8-4e38-9b19-cc6af312e074",
             input: "nums = [-10,10,-10,10,-10]",
             expected: "-110", orderMatters: true),
            TestCaseData(id: "3f75f051-d296-4188-a59c-4e4baa776991",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "220", orderMatters: true),
            TestCaseData(id: "b2cb78f1-e762-45be-83ba-4180fd67af07",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "220", orderMatters: true),
            TestCaseData(id: "023ebf43-0b69-4524-afe7-0018de240e57",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "35000", orderMatters: true),
            TestCaseData(id: "3ecb54e3-e28c-4ed5-806e-69845aee0496",
             input: "nums = [5000,4000,3000,2000,1000]",
             expected: "35000", orderMatters: true),
            TestCaseData(id: "4cf29616-56f2-4d7c-a2ab-be2f0edfddc6",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "55", orderMatters: true),
            TestCaseData(id: "7e10782d-5366-4cc8-b7fc-8ea49ba68460",
             input: "nums = [5,5,5,5,5,5,5,5,5,5]",
             expected: "275", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sum-of-subarray-minimums"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
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
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= arr.length <= 3 * 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 1 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= arr[i] <= 3 * 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.sumSubarrayMins(p_nums)
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
