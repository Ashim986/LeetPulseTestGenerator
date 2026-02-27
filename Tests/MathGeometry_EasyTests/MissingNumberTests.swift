import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMissingNumber {
    private class Solution {
        func missingNumber(_ nums: [Int]) -> Int {
            let n = nums.count
            let expectedSum = n * (n + 1) / 2
            let actualSum = nums.reduce(0, +)
            return expectedSum - actualSum
        }
    }

    @Suite struct MissingNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "808b4bdf-30f3-4125-a1d1-9a3fe6695a2d",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7a067be9-b30b-47c5-be0e-37edc72784f0",
             input: "nums = [0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1538dfab-0763-45e6-bf66-d9b0475f09b7",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c6ae98b3-d836-42bf-8efe-19f4f76bbac0",
             input: "nums = [0, 1, 2, 3, 4]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "bcde773b-8468-4d20-adbd-7cf7603f4fcf",
             input: "nums = [5, 4, 3, 2, 1, 0]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "d39f7f23-c373-453e-9bca-8bd20c901fca",
             input: "nums = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "c199953d-82bd-4a69-98f1-b5510a2bec64",
             input: "nums = [1000, 999, 998, 997, 996]",
             expected: "1001", orderMatters: true),
            TestCaseData(id: "02b8e1ff-2b11-45f4-9620-3e68130aeea0",
             input: "nums = [1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0fa54d76-2e05-4e5b-97c1-80bfb7272530",
             input: "nums = [0, 0, 0, 0, 0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "95827dc0-fb45-4551-9e4a-246aefa99b99",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0a430512-e2b2-41f6-8308-4c0d98e3552d",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "f2473e5b-277c-47db-b5ac-e23f2a382525",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "a995daa4-cd42-496d-aa37-6a39f074c2d2",
             input: "nums = [20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "21", orderMatters: true),
            TestCaseData(id: "207992fc-75d5-41f8-9804-763baffe3aae",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "2ac30528-296c-4e72-9772-58f288d7def1",
             input: "nums = [25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "26", orderMatters: true),
            TestCaseData(id: "fe68991a-c942-4f5c-bda9-ab6fbd8aedf7",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "31a3aa3a-cb6d-4d7e-ad93-e478c6efc5dc",
             input: "nums = [30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "31", orderMatters: true),
            TestCaseData(id: "24bee23e-c296-4997-95ab-ec28f06bfefc",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34]",
             expected: "35", orderMatters: true),
            TestCaseData(id: "16c07128-ec1f-44ac-a955-c04d4ef5e07b",
             input: "nums = [35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, "
                + "1, 0]",
             expected: "36", orderMatters: true),
            TestCaseData(id: "74286a4c-74d5-4e9b-9f1c-343f2c2dd1d4",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34"
                + ", 35, 36, 37, 38]",
             expected: "39", orderMatters: true),
            TestCaseData(id: "18d42e67-1481-41fd-b22b-49b3c31bbbe2",
             input: "nums = [39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7,"
                + " 6, 5, 4, 3, 2, 1, 0]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "e9b35450-6b40-4227-abb4-7f01db7ec5d3",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34"
                + ", 35, 36, 37, 38, 39, 40]",
             expected: "41", orderMatters: true),
            TestCaseData(id: "acb98dda-4ff2-4a35-9d17-acf8ee93788a",
             input: "nums = [41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, "
                + "9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "42", orderMatters: true),
            TestCaseData(id: "1d2e82d6-4dcc-414c-9aa3-e3a4ea641150",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34"
                + ", 35, 36, 37, 38, 39, 40, 41, 42, 43, 44]",
             expected: "45", orderMatters: true),
            TestCaseData(id: "47ab00da-6192-4c1c-b381-d1068c56fd13",
             input: "nums = [45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, "
                + "13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]",
             expected: "46", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "missing-number"
            let topic = "math-geometry"
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
            guard p_nums.count >= 1 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= n"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.missingNumber(p_nums)
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
