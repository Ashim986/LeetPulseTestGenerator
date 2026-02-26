import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSubarrayProductLessThanK {
    private class Solution {
        func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
            if k <= 1 {
                return 0
            }
            var left = 0
            var product = 1
            var count = 0
            for right in 0..<nums.count {
                product *= nums[right]
                while product >= k && left <= right {
                    product /= nums[left]
                    left += 1
                }
                count += right - left + 1
            }
            return count
        }
    }

    @Suite struct SubarrayProductLessThanKTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c403418f-efdd-43c6-8035-b0183d5c6956",
             input: "nums = [1], k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7c280601-3e15-4ceb-ab43-e4b74a1bc436",
             input: "nums = [], k = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0064565d-871b-4402-8737-aa765f018902",
             input: "nums = [5, 5, 5], k = 25",
             expected: "3", orderMatters: true),
            TestCaseData(id: "dd29f042-1557-4cfa-b086-1605581bfb58",
             input: "nums = [10, 5, 2, 6], k = 50",
             expected: "6", orderMatters: true),
            TestCaseData(id: "3949b5dd-389f-402f-aa34-205a1bc74fef",
             input: "nums = [5, 5, 5, 5, 5], k = 25",
             expected: "5", orderMatters: true),
            TestCaseData(id: "1fb892b3-c974-44d2-8dc8-b435f50526a1",
             input: "nums = [1, 1, 1, 1, 1], k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "add971e6-f8e3-4555-9881-addafbf1a4c6",
             input: "nums = [5, 5, 5, 5, 5], k = 5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ff7b35b9-42d3-4b2b-ae58-389f156aab57",
             input: "nums = [1, 2, 3, 4, 5], k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "94359ec5-1764-4f91-8047-6b41165f52cd",
             input: "nums = [10, 5, 2, 6], k = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cf178c6c-6011-444c-beb8-7d666a44b11f",
             input: "nums = [1, 2, 3, 4, 5], k = 100",
             expected: "13", orderMatters: true),
            TestCaseData(id: "515fce9b-9c90-4cb0-84d1-e5b471598532",
             input: "nums = [1, 2, 3], k = 10",
             expected: "6", orderMatters: true),
            TestCaseData(id: "03d03667-bef5-437e-b318-7d9f56cb0621",
             input: "nums = [10, 20, 30], k = 1000",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5ba95424-cfab-479c-9af5-b0d885cae42f",
             input: "nums = [1, 1, 1], k = 2",
             expected: "6", orderMatters: true),
            TestCaseData(id: "825a6660-f618-4690-8594-f4750ccd456c",
             input: "nums = [1, 2, 3, 4, 5], k = 50",
             expected: "12", orderMatters: true),
            TestCaseData(id: "b410f93d-6143-420b-8cf7-756f8debb013",
             input: "nums = [1, 2, 3, 4, 5], k = 10",
             expected: "8", orderMatters: true),
            TestCaseData(id: "b130c10a-4307-402e-9bd5-f45c7b3d09cd",
             input: "nums = [1, 1, 1, 1, 1], k = 2",
             expected: "15", orderMatters: true),
            TestCaseData(id: "792167a9-280b-486e-8ca2-8fdb02909244",
             input: "nums = [1, 2, 3, 4, 5], k = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "3e57b279-30a0-44a9-833c-f0d68e7e7c20",
             input: "nums = [10, 20, 30, 40, 50], k = 1000",
             expected: "7", orderMatters: true),
            TestCaseData(id: "ca587304-8670-480d-92a6-3b6dd36d3a18",
             input: "nums = [1, 2, 3, 4, 5], k = 1000",
             expected: "15", orderMatters: true),
            TestCaseData(id: "fdc8843c-79e2-4f8a-9f28-a4c8fdc0a8b2",
             input: "nums = [10, 20, 30, 40, 50], k = 10000",
             expected: "10", orderMatters: true),
            TestCaseData(id: "aab5286f-930d-4d21-ab4e-73c54540fbaf",
             input: "nums = [1, 1, 1, 1, 1], k = 10",
             expected: "15", orderMatters: true),
            TestCaseData(id: "c8f265d0-6ccd-4974-80af-7ebd80245661",
             input: "nums = [5, 5, 5, 5, 5], k = 100",
             expected: "9", orderMatters: true),
            TestCaseData(id: "642b632b-7cec-4de9-9ddc-59322613f23c",
             input: "nums = [10, 20, 30, 40, 50], k = 500",
             expected: "6", orderMatters: true),
            TestCaseData(id: "5dc7e9a0-1505-4c74-8d37-2c547ac8ba6c",
             input: "nums = [1, 1, 1, 1, 1], k = 5",
             expected: "15", orderMatters: true),
            TestCaseData(id: "361b1204-877a-4a8e-8b37-065ba220d097",
             input: "nums = [5, 5, 5, 5, 5], k = 50",
             expected: "9", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "subarray-product-less-than-k"
            let topic = "binary-search"
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
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 3 * 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 1 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums[i] <= 1000"
                )
                return
            }
            guard p_k >= 0 && p_k <= 106 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= k <= 106"
                )
                return
            }

            let solution = Solution()
            let result = solution.numSubarrayProductLessThanK(p_nums, p_k)
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
