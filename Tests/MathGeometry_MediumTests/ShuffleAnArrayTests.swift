import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCShuffleAnArray {
    private class Solution {
        func shuffle(_ nums: [Int]) -> [Int] {
            var numsCopy = nums
            for i in stride(from: numsCopy.count - 1, to: 0, by: -1) {
                let j = Int.random(in: 0...i)
                numsCopy.swapAt(i, j)
            }
            return numsCopy
        }
    }

    @Suite struct ShuffleAnArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a1ba9745-d901-4de3-8597-da5d674433b1",
             input: "nums = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "5b76c453-d240-4a50-bf06-276fccec9184",
             input: "nums = [1,2]",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "9bfea955-64d2-4584-b097-cc6d277ed0ce",
             input: "nums = [1,1,1]",
             expected: "[1,1,1]", orderMatters: true),
            TestCaseData(id: "448e6470-53e3-4ce1-b16e-5525da3ef397",
             input: "nums = [1,2,3,4,5]",
             expected: "[5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "9f10f13b-c407-4c21-9bc8-c7d52921314c",
             input: "nums = [-1,-2,-3]",
             expected: "[-3,-2,-1]", orderMatters: true),
            TestCaseData(id: "5f7335d0-5bfa-4af6-9158-444b25299060",
             input: "nums = [0,0,0]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "328a7090-5d19-4111-bf40-66f891b18fd9",
             input: "nums = [10,20,30,40,50]",
             expected: "[50,40,30,20,10]", orderMatters: true),
            TestCaseData(id: "f53660ad-1ff2-4178-b00a-24d3f97b463d",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[10,9,8,7,6,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "e1ad10d1-5b5c-4155-ab0b-be7876e6c927",
             input: "nums = [-10,-20,-30,-40,-50]",
             expected: "[-50,-40,-30,-20,-10]", orderMatters: true),
            TestCaseData(id: "a19ac055-0d6c-4e7d-9a49-dc922e81a0a3",
             input: "nums = [1,1,1,1,1]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "7d2e9b7b-13ab-4b71-9138-3ce8a5968a92",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "[15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "14c66985-f561-4a4d-a757-c4ca7624d3ad",
             input: "nums = [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]",
             expected: "[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]", orderMatters: true),
            TestCaseData(id: "6323822f-b753-4bea-a6f5-79df430e614a",
             input: "nums = [0,1,2,3,4,5,6,7,8,9,10]",
             expected: "[10,9,8,7,6,5,4,3,2,1,0]", orderMatters: true),
            TestCaseData(id: "d3081629-8ff4-4733-a69a-fd8db88b3ffe",
             input: "nums = [100,200,300,400,500]",
             expected: "[500,400,300,200,100]", orderMatters: true),
            TestCaseData(id: "9faac943-90c1-4273-96a1-63a2934e308b",
             input: "nums = [1,3,5,7,9]",
             expected: "[9,7,5,3,1]", orderMatters: true),
            TestCaseData(id: "25381714-e7e2-4832-93ba-14b93f56c127",
             input: "nums = [2,4,6,8,10]",
             expected: "[10,8,6,4,2]", orderMatters: true),
            TestCaseData(id: "948eb9c8-c9e4-44ad-a31b-8fb7b185fc1f",
             input: "nums = [-1,1,-3,3,-5,5]",
             expected: "[5,-5,3,-3,1,-1]", orderMatters: true),
            TestCaseData(id: "da375f9f-c858-4fb4-9ad7-8065a2770615",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1,1,1,1,1,1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "811a5f73-d86e-43ce-8373-aa8c5d19dbf7",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "2743c076-2156-444d-a69f-09aaa4ad8c91",
             input: "nums = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]", orderMatters: true),
            TestCaseData(id: "1aaff0c5-bc8d-456a-909a-80d3928212af",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "[5000,4000,3000,2000,1000]", orderMatters: true),
            TestCaseData(id: "302d78c8-694f-4e9e-b042-728bee1db082",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "[20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "a49f4b2f-e7ed-446d-b536-d9383df58e42",
             input: "nums = [-100,-200,-300,-400,-500]",
             expected: "[-500,-400,-300,-200,-100]", orderMatters: true),
            TestCaseData(id: "e2a950e8-266f-4d6a-b5c3-5f90bdafbd2b",
             input: "nums = [1,3,5,7,9,11,13,15,17,19]",
             expected: "[19,17,15,13,11,9,7,5,3,1]", orderMatters: true),
            TestCaseData(id: "41da36e9-8558-4cdd-9b88-31ca3b3afdd2",
             input: "nums = [2,4,6,8,10,12,14,16,18,20]",
             expected: "[20,18,16,14,12,10,8,6,4,2]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "shuffle-an-array"
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
            guard p_nums.count >= 1 && p_nums.count <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 50"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -106 && $0 <= 106 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -106 <= nums[i] <= 106"
                )
                return
            }

            let solution = Solution()
            let result = solution.shuffle(p_nums)
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
