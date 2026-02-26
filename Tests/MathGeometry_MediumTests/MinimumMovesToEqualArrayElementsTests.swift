import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumMovesToEqualArrayElements {
    private class Solution {
        func minMovesToEqualArrayElements(_ nums: [Int]) -> Int {
            let sortedNums = nums.sorted()
            let median = sortedNums.count % 2 == 1 ? sortedNums[sortedNums.count / 2] : (sortedNums[sortedNums.count / 2 - 1] + sortedNums[sortedNums.count / 2]) / 2
            return sortedNums.reduce(0) { $0 + abs($1 - median) }
        }
    }

    @Suite struct MinimumMovesToEqualArrayElementsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8b9a0b20-aa6b-4ff2-9b83-6a2a10375811",
             input: "nums = [1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dc787032-ecfc-40ad-bced-9c2f7908aacd",
             input: "nums = [10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "13bab398-de1a-4806-a9e3-70603f27cacb",
             input: "nums = [1, 100]",
             expected: "99", orderMatters: true),
            TestCaseData(id: "5e9e9ae2-8b5e-470c-a952-debcdbab0d56",
             input: "nums = [5, 5, 5, 5, 5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6e46134d-2022-4c9e-bb86-22a585feb2ca",
             input: "nums = [-1, 0, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "eb08b450-00ab-4b4a-9980-06e71214b9bb",
             input: "nums = [-10, -5, 0, 5, 10]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "08bc16b2-4a62-4fa9-9343-998b2374c8e2",
             input: "nums = [1000, 2000, 3000]",
             expected: "2000", orderMatters: true),
            TestCaseData(id: "839df5a3-4b4f-41c0-a98f-eaf05f0211dd",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8f9dcdfd-64d0-42e2-a3f9-de67216b1c7f",
             input: "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ab84603b-8eee-4d42-b65a-7a5e5a1ccb3d",
             input: "nums = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ebff5bad-f28d-4f6a-951f-2d61b3c55a32",
             input: "nums = [1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ac7abe66-e7cf-4f52-a317-ed1885acd72f",
             input: "nums = [1000, 1000, 1000, 1000, 1000]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cde5be40-a966-4c10-948e-b323312234a7",
             input: "nums = [1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a6b4d690-6262-4442-ab2b-a76552c01ab0",
             input: "nums = [100, 100, 100, 100, 100, 100]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9e9636b0-af50-4913-99ec-43abba489390",
             input: "nums = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "fa7a3767-e1c4-4d48-a2b4-aa4ea3d6e6b5",
             input: "nums = [5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "83a4f668-1a85-432e-bfff-c584c48a7e70",
             input: "nums = [4, 5, 6]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "53f32392-13bd-48ee-911c-bd3f8738d793",
             input: "nums = []",
             expected: "9223372036854775807", orderMatters: true),
            TestCaseData(id: "907c3e70-4ec0-4546-9452-9cfe286cfa02",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "5edb6736-23f7-4a0d-bbb9-86a3d1b1264d",
             input: "nums = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]",
             expected: "250", orderMatters: true),
            TestCaseData(id: "a7e1a8ae-9f55-4c2f-ab55-db4c74b4fbb4",
             input: "nums = [-100, -50, 0, 50, 100]",
             expected: "300", orderMatters: true),
            TestCaseData(id: "0482cf1f-83e1-445d-9b5c-21ed73202347",
             input: "nums = [1, 3, 5, 7, 9]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "2cd79d1f-7723-4bd1-9cfc-87e03c02eb18",
             input: "nums = [2, 4, 6, 8, 10]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "78bc7c18-d657-42f6-92f0-6b5641a8aa91",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "75e9b0b2-29a6-4ac4-b341-aa77911f333c",
             input: "nums = [-1, -2, -3, -4, -5]",
             expected: "6", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-moves-to-equal-array-elements"
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
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= nums[i] <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.minMovesToEqualArrayElements(p_nums)
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
