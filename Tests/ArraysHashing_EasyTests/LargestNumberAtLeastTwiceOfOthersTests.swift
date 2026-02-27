import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLargestNumberAtLeastTwiceOfOthers {
    private class Solution {
        func dominantIndex(_ nums: [Int]) -> Int {
            var maxNum = Int.min
            var secondMaxNum = Int.min
            var maxIndex = -1
            for (index, num) in nums.enumerated() {
                if num > maxNum {
                    secondMaxNum = maxNum
                    maxNum = num
                    maxIndex = index
                } else if num > secondMaxNum {
                    secondMaxNum = num
                }
            }
            if maxNum >= secondMaxNum * 2 {
                return maxIndex
            }
            return -1
        }
    }

    @Suite struct LargestNumberAtLeastTwiceOfOthersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5f294ab7-7dc0-49a6-98a1-625857e2349c",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4c6674ec-efcd-4bff-a53d-d5f5643ef0b3",
             input: "nums = [10,10,10]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "af095623-9ace-4bf1-895a-1774c43f1e3a",
             input: "nums = [1,2,3,4,5]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "86e543e8-4ffa-4a32-b83e-42059533e07e",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5afda95e-35b7-4912-b2d2-e880e8d93e7d",
             input: "nums = [1000,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4209e5d5-c5d5-469e-8e04-e66e462f7d0c",
             input: "nums = [1,1,1,1,1000]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "cfdf8f4f-dad5-4ae3-9423-5aae45d2ad1a",
             input: "nums = [10,20,30,40,50,60,70,80,90,100]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "269ceac3-bbc0-4925-a140-aea5a1a3ba1e",
             input: "nums = [1,1,1,1,1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "fc2f55e7-e0bd-44bd-9d2e-1e8a8fad76aa",
             input: "nums = [10,10,10,10,100]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "72e99b1c-c63a-4a1a-b32b-aed505c04c28",
             input: "nums = [0,1,0,1,0]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "8513b012-95fa-40ec-b06d-7228f7878b30",
             input: "nums = [1,0,1,0,1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "cb3ecad9-4b8b-491a-ba99-d6b6f661f7c7",
             input: "nums = [5,5,5,5,10]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ac065a89-03e1-4ffb-9b53-20b4aef07a16",
             input: "nums = [10,5,5,5,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "aa2c0c17-fe8b-4485-9dd6-5dc17d51fa72",
             input: "nums = [1,2,4,8,16]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "5b908ded-0e29-466f-8861-a7e00b30e4c2",
             input: "nums = [16,8,4,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a777a31c-2cc0-4652-9977-b5502352f4ec",
             input: "nums = [2,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e11548e8-a6ff-4898-ba9a-b797ef6557c3",
             input: "nums = [1,3,5,7,9]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "11069e1e-08f2-47ff-9b78-45f60fd33d2a",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "e76a6b07-8085-4244-9486-ad80b289b3ae",
             input: "nums = [10,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "131e8fcd-daec-408a-8063-601fe87296eb",
             input: "nums = [1,10,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3e08350e-d980-4467-8f9e-326173df4409",
             input: "nums = [1,1,1,1,1,1,1,1,1,10]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "81bb4bcf-d3fa-4b7e-b0ef-a3fe696429e7",
             input: "nums = [100,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "770d17a1-aa78-4096-8fe1-8bd857acedfc",
             input: "nums = [1,1,1,1,1,1,1,1,1,100]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "daa32766-af96-4fe8-b228-2e5b5f98cc82",
             input: "nums = [1,1,1,1,1,1,1,1,10,1]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "7784b523-a666-4309-8a1a-78194b9b0448",
             input: "nums = [1,1,1,1,1,1,1,10,1,1]",
             expected: "7", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "largest-number-at-least-twice-of-others"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 2 && p_nums.count <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= nums.length <= 50"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.dominantIndex(p_nums)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
