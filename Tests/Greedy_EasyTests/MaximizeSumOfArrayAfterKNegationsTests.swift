import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximizeSumOfArrayAfterKNegations {
    private class Solution {
        func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
            var arr = nums.sorted()
            for i in 0..<min(arr.count, k) {
                arr[i] = -arr[i]
            }
            return arr.reduce(0, +)
        }
    }

    @Suite struct MaximizeSumOfArrayAfterKNegationsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9cf18b0f-4e72-47d0-991b-2439e29895b6",
             input: "nums = [0,0,0], k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4df17fab-34b6-458c-9842-c96f2609dfd7",
             input: "nums = [0,0,0], k = 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4c4a2eb0-3ae7-44cd-9358-b71cef83f497",
             input: "nums = [1], k = 1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "100c8f14-1557-4998-818c-62dd122baf00",
             input: "nums = [-5,-4,-3,-2,-1], k = 1",
             expected: "-5", orderMatters: true),
            TestCaseData(id: "49f8a395-d8cc-428b-bef1-88fd296c6189",
             input: "nums = [-5,-4,-3,-2,-1], k = 5",
             expected: "15", orderMatters: true),
            TestCaseData(id: "9ecf0109-186a-4f4a-9764-986c888c240e",
             input: "nums = [-10,-10,-10,-10,-10], k = 5",
             expected: "50", orderMatters: true),
            TestCaseData(id: "c377501d-8291-4b85-9efb-1396ef6e718c",
             input: "nums = [1,2,3], k = 1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "7304d059-fa2c-4138-8689-529730fcd40f",
             input: "nums = [1,2,3], k = 3",
             expected: "-6", orderMatters: true),
            TestCaseData(id: "28c550a1-f5ed-40e9-9d42-e8047b1954cf",
             input: "nums = [-1,-2,-3], k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "65a13df2-9aec-4b75-9817-e5c96d25bd64",
             input: "nums = [-1,-2,-3], k = 3",
             expected: "6", orderMatters: true),
            TestCaseData(id: "628b8bc0-5287-401b-812f-30ac4df2c0cf",
             input: "nums = [1], k = 0",
             expected: "null", orderMatters: true),
            TestCaseData(id: "33c4d178-cee7-41a2-8f4b-58459d0bfe05",
             input: "nums = [], k = 1",
             expected: "-9223372036854775808", orderMatters: true),
            TestCaseData(id: "e84cf20e-e9f8-4444-bd7c-7bbd9f5203df",
             input: "nums = [], k = 0",
             expected: "null", orderMatters: true),
            TestCaseData(id: "a9f71afc-b18b-467f-ad6c-4ea18ce5bfd7",
             input: "nums = [1,1,1], k = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "196c5507-6695-4b2b-9d53-fdab3ca0a3e7",
             input: "nums = [1,1,1], k = 3",
             expected: "-3", orderMatters: true),
            TestCaseData(id: "1c63c3de-2cf7-4457-a3dd-9ec2d692bc35",
             input: "nums = [10,20,30], k = 1",
             expected: "40", orderMatters: true),
            TestCaseData(id: "aa6fa95a-906d-4d48-8cf0-478c3937a4f3",
             input: "nums = [10,20,30], k = 3",
             expected: "-60", orderMatters: true),
            TestCaseData(id: "d86fbbd4-c096-4b88-8302-1f3f9a77c785",
             input: "nums = [-10,-20,-30], k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ebbb1396-a7a7-4034-b6a1-8b6407a7fd9a",
             input: "nums = [-10,-20,-30], k = 3",
             expected: "60", orderMatters: true),
            TestCaseData(id: "98705884-f275-406a-ac87-3f9c603169ad",
             input: "nums = [1000,2000,3000], k = 1",
             expected: "4000", orderMatters: true),
            TestCaseData(id: "0ba56508-f095-455d-9183-f1d28f845faf",
             input: "nums = [1000,2000,3000], k = 3",
             expected: "-6000", orderMatters: true),
            TestCaseData(id: "ed9db750-0930-4908-b2d5-cb3cec48fcc9",
             input: "nums = [-1000,-2000,-3000], k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "813ca785-1d7f-4c0c-aea5-b1d3f33097ca",
             input: "nums = [-1000,-2000,-3000], k = 3",
             expected: "6000", orderMatters: true),
            TestCaseData(id: "e5065e5d-4711-4d88-aaf3-9cafcccf6001",
             input: "nums = [1,2,3,4,5], k = 1",
             expected: "13", orderMatters: true),
            TestCaseData(id: "94344c07-16d9-42e9-a255-aa81366a0b06",
             input: "nums = [1,2,3,4,5], k = 5",
             expected: "-15", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximize-sum-of-array-after-k-negations"
            let topic = "greedy"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
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
            guard p_nums.count >= 1 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -100 && $0 <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -100 <= nums[i] <= 100"
                )
                return
            }
            guard p_k >= 1 && p_k <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= k <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.largestSumAfterKNegations(p_nums, p_k)
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
