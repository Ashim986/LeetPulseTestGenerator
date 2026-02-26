import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMajorityElementIi {
    private class Solution {
        func majorityElement(_ nums: [Int]) -> [Int] {
            var candidate1 = 0
            var candidate2 = 1
            var count1 = 0
            var count2 = 0

            for num in nums {
                if num == candidate1 {
                    count1 += 1
                } else if num == candidate2 {
                    count2 += 1
                } else if count1 == 0 {
                    candidate1 = num
                    count1 = 1
                } else if count2 == 0 {
                    candidate2 = num
                    count2 = 1
                } else {
                    count1 -= 1
                    count2 -= 1
                }
            }

            var res: [Int] = []
            let count = nums.count

            if nums.filter { $0 == candidate1 }.count > count / 3 {
                res.append(candidate1)
            }

            if nums.filter { $0 == candidate2 }.count > count / 3 {
                res.append(candidate2)
            }

            return res
        }
    }

    @Suite struct MajorityElementIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7edc91d2-56b0-4845-b77c-b9a13a923358",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "258acdfe-8c16-4f2c-ac3d-7628c7513e40",
             input: "nums = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "d0ddc28b-3e7e-4842-a687-62103ca99151",
             input: "nums = [1,1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "ad4bfb9b-1553-49e1-bfde-b9027a52f289",
             input: "nums = [1,2]",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "e9cf8c20-64a7-459e-a620-a00a94ea3b6e",
             input: "nums = [1,1,1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "9974b352-2d3f-4701-bb67-757d7f737e34",
             input: "nums = [-1,-1,-1]",
             expected: "[-1]", orderMatters: true),
            TestCaseData(id: "ae720893-c5f5-4f28-98e0-183657938a7a",
             input: "nums = [0,0,0]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "442567b5-5074-4761-8f7f-96d4b91925aa",
             input: "nums = [100,100,100]",
             expected: "[100]", orderMatters: true),
            TestCaseData(id: "7a934b35-e165-4281-846c-0835177e2246",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "91074cd9-7e35-4fdb-ab03-97fa63950128",
             input: "nums = [5,5,5,5,5,1,1,1,1,1]",
             expected: "[1,5]", orderMatters: true),
            TestCaseData(id: "347d3ba1-7a40-49d0-9d66-17e6d5abd58d",
             input: "nums = [1,1,1,1,1,5,5,5,5,5]",
             expected: "[1,5]", orderMatters: true),
            TestCaseData(id: "b786c824-7070-49c6-9c7a-80222414c314",
             input: "nums = [1,5,1,5,1,5,1,5,1,5]",
             expected: "[1,5]", orderMatters: true),
            TestCaseData(id: "3180c4f4-34ad-42ee-a8ea-d6b5dd824c4e",
             input: "nums = [1,1,1,5,5,5,1,1,1,5]",
             expected: "[1,5]", orderMatters: true),
            TestCaseData(id: "67c6e984-b667-46f4-8d9b-2a399049f2f7",
             input: "nums = [1,5,1,5,1,5,1,5,1,5,1,5]",
             expected: "[1,5]", orderMatters: true),
            TestCaseData(id: "6f88639a-c8b2-4f67-ba8d-a1ff14c6ce66",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "68b77ec8-dbea-42ca-b2c7-45bae2f461ca",
             input: "nums = [5,5,5,5,5,5,5,5,5,5,5,5]",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "e91bae79-8acd-42d5-9024-c6096c22b530",
             input: "nums = [1,1,1,1,1,5,5,5,5,5,5,5]",
             expected: "[1,5]", orderMatters: true),
            TestCaseData(id: "c8b3d130-7d6e-4183-9729-53b7bed4f7b1",
             input: "nums = [1,5,1,5,1,5,1,5,1,5,1,5,1,5]",
             expected: "[1,5]", orderMatters: true),
            TestCaseData(id: "1f9b9bc7-62ab-4e64-92d6-3eb7ae8d9a48",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "c5c1f6ca-6d81-4108-be80-552a00410cc0",
             input: "nums = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "7df18cfd-c6b9-40fb-b6a2-b6304d362415",
             input: "nums = [1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5]",
             expected: "[1,5]", orderMatters: true),
            TestCaseData(id: "a2437030-776e-4deb-825f-b9db740a10b6",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "7d5d6137-d0cc-4ea6-b4e1-a17a70ede63a",
             input: "nums = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]",
             expected: "[5]", orderMatters: true),
            TestCaseData(id: "4b381a2c-1fd5-4486-9a5c-0abe6ca12324",
             input: "nums = [1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5]",
             expected: "[1,5]", orderMatters: true),
            TestCaseData(id: "6a39f165-32fb-45cd-bec1-6dea50337615",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "majority-element-ii"
            let topic = "arrays-hashing"
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
            guard p_nums.count >= 1 && p_nums.count <= 50000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 5 * 10^4"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -1000000000 && $0 <= 1000000000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10^9 <= nums[i] <= 10^9"
                )
                return
            }

            let solution = Solution()
            let result = solution.majorityElement(p_nums)
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
