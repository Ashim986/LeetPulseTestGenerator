import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLargestNumber {
    private class Solution {
        func largestNumber(_ nums: [Int]) -> String {
            let numsStr = nums.map { String($0) }
            let sortedNums = numsStr.sorted { (num1, num2) -> Bool in
                return (num1 + num2) > (num2 + num1)
            }
            let result = sortedNums.joined()
            return result.first == "0" ? "0" : result
        }
    }

    @Suite struct LargestNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "58dcd3e7-daed-4f6b-b99e-d20af696e357",
             input: "nums = [1,2,3]",
             expected: "321", orderMatters: true),
            TestCaseData(id: "0783af7b-3e56-4a93-a2af-7a6f6ed10bf3",
             input: "nums = [5,5,5]",
             expected: "555", orderMatters: true),
            TestCaseData(id: "3f5d5ca3-50f2-4797-974d-a64921031482",
             input: "nums = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "452169bd-b2d9-4645-8fa3-760abc8eeed0",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b8d0dd85-fef1-4d76-9ef7-00b9036e6d77",
             input: "nums = [9,9,9,9,9]",
             expected: "99999", orderMatters: true),
            TestCaseData(id: "463faf89-6719-4f23-8dc6-51eab015c545",
             input: "nums = [3,3,3,3,3]",
             expected: "33333", orderMatters: true),
            TestCaseData(id: "5acd4460-9a92-479b-a155-5b1efecf431e",
             input: "nums = [1,1,1,1,1]",
             expected: "11111", orderMatters: true),
            TestCaseData(id: "7c8cc05e-8688-43a5-b302-d77ac4974119",
             input: "nums = [2,1]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "5af426c2-adb5-46d6-8fe1-1bba8521fdca",
             input: "nums = [1,2]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "da942393-c24c-41eb-9895-4e4e325ac0e1",
             input: "nums = [10,1]",
             expected: "110", orderMatters: true),
            TestCaseData(id: "b9dd42bb-cc51-4d70-8623-cc5f3622a23a",
             input: "nums = [1,10]",
             expected: "110", orderMatters: true),
            TestCaseData(id: "b57322f8-23c1-4a63-96be-cc735a3e12f9",
             input: "nums = [100,10,1]",
             expected: "110100", orderMatters: true),
            TestCaseData(id: "5bbc68a1-fa62-4668-a610-cabaaa68f8a4",
             input: "nums = [1,10,100]",
             expected: "110100", orderMatters: true),
            TestCaseData(id: "4526d158-74bb-418a-8420-1cc87b6258c4",
             input: "nums = [10,100,1]",
             expected: "110100", orderMatters: true),
            TestCaseData(id: "1b66a34c-303a-4ede-9482-c7a39fd28c20",
             input: "nums = [0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6e70ca3d-e98a-404b-859f-1456527f54fe",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "1111111111", orderMatters: true),
            TestCaseData(id: "4c857f7f-450e-4f57-aae2-4d6674989fc6",
             input: "nums = [9,9,9,9,9,9,9,9,9,9]",
             expected: "9999999999", orderMatters: true),
            TestCaseData(id: "ae227891-a7b9-4eb9-84f6-833160e3108b",
             input: "nums = [5,5,5,5,5,5,5,5,5,5]",
             expected: "5555555555", orderMatters: true),
            TestCaseData(id: "cf40c841-2b35-4b89-a50d-17a11c12b860",
             input: "nums = [5,50,500]",
             expected: "550500", orderMatters: true),
            TestCaseData(id: "33e5dd1b-0ba2-4117-a6f9-eb1bcccf0ec3",
             input: "nums = [50,5,500]",
             expected: "550500", orderMatters: true),
            TestCaseData(id: "8a633d0c-0d60-4807-ba5d-36dc00a4d530",
             input: "nums = [500,50,5]",
             expected: "550500", orderMatters: true),
            TestCaseData(id: "a93eed02-a5a7-477c-ab00-91460ff2e4f9",
             input: "nums = [-1,-2,-3]",
             expected: "-3-2-1", orderMatters: true),
            TestCaseData(id: "6fa8f3f3-b1f0-4be3-b174-4cb10c047138",
             input: "nums = [-10,-7,-76,-415]",
             expected: "-7-76-415-10", orderMatters: true),
            TestCaseData(id: "43d70f76-521c-4fe7-a49e-5cba22c93bcb",
             input: "nums = [1000,100,10,1]",
             expected: "1101001000", orderMatters: true),
            TestCaseData(id: "31a5a94b-03d9-46bc-8a39-03a7d6683197",
             input: "nums = [1,10,100,1000]",
             expected: "1101001000", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "largest-number"
            let topic = "greedy"
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
            guard p_nums.count >= 1 && p_nums.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 100"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.largestNumber(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: strip outer quotes from both sides (QUAL-03)
            func stripQuotes(_ s: String) -> String {
                let t = s.trimmingCharacters(in: .whitespaces)
                if t.count >= 2 && t.first == "\"" && t.last == "\"" { return String(t.dropFirst().dropLast()) }
                return t
            }
            let matches = stripQuotes(computedOutput) == stripQuotes(expectedOutput)
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
