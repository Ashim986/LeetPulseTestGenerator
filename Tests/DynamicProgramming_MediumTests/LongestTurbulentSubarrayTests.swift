import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestTurbulentSubarray {
    private class Solution {
        func maxTurbulenceSize(_ arr: [Int]) -> Int {
            if arr.count == 1 {
                return 1
            }
            var up = 1
            var down = 1
            var res = 1
            for i in 1..<arr.count {
                if arr[i] > arr[i - 1] {
                    up = down + 1
                    down = 1
                } else if arr[i] < arr[i - 1] {
                    down = up + 1
                    up = 1
                } else {
                    up = 1
                    down = 1
                }
                res = max(res, max(up, down))
            }
            return res
        }
    }

    @Suite struct LongestTurbulentSubarrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a3c2230d-5201-4cc7-8080-402ed12808a4",
             input: "arr = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c213cc1e-1abf-4003-a361-290a9e7a6bf0",
             input: "arr = [1, 2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bd23c61b-2b3a-4aa4-9f5f-0280ee983db8",
             input: "arr = [2, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f4e678f1-ff23-4f08-9049-01e45004c26b",
             input: "arr = [1, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a480f1ed-9a38-4d68-a619-8b2b2650c2ac",
             input: "arr = [1, 1, 1, 1, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "72f17d29-04b3-490e-a1b3-f052942075e7",
             input: "arr = [10, 10, 10, 10, 10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "de159d61-d2f6-4b77-a9a0-c230a1b10cad",
             input: "arr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "07b34415-5408-45f0-8cc7-54cff453f127",
             input: "arr = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "80462d54-0e8a-4cdf-a71e-f03e4161405e",
             input: "arr = []",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ad266158-6859-43a1-ab94-92381a2e658a",
             input: "arr = [1, 2, 3, 4, 5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "bfd6fbe6-a884-45ca-809d-75e449a7c3cb",
             input: "arr = [5, 4, 3, 2, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "dac0de2f-fcd9-49d5-9aa7-06e29e17b83a",
             input: "arr = [1, -2, 3, -4, 5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3b313d86-98b4-45fc-9fb5-534dded1b457",
             input: "arr = [-1, -2, -3, -4, -5]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "f6de566f-ac52-42c9-a050-501bfede0127",
             input: "arr = [10, 9, 8, 7, 6]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5ed2ff58-fb53-4b96-ab9e-217e576dd0dd",
             input: "arr = [1, 2, 1, 2, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "37390bbf-6edf-4266-98b4-97767d7b2cb3",
             input: "arr = [1, 1, 2, 2, 3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "da13daab-e055-46e3-8e94-414428cf9fdd",
             input: "arr = [1, 2, 3, 2, 1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2e05f147-cd22-41c9-9f97-386fea982c42",
             input: "arr = [1, 2, 3, 4, 3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "39157917-c122-4996-97cc-b79dbfaceaff",
             input: "arr = [1, 3, 5, 7, 9]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "fb51f537-f2ea-401f-b210-42bb6f66b9ac",
             input: "arr = [9, 7, 5, 3, 1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "0943d935-1c3d-4606-926b-c3854150ffab",
             input: "arr = [1, -1, 1, -1, 1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d79fe7af-ecb1-4061-bd02-0786180dccfd",
             input: "arr = [-1, 1, -1, 1, -1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "25a40d04-3583-401f-b5e7-b52ff5a50320",
             input: "arr = [1, 2, 3, 2, 3, 2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "cac403ab-2282-4014-bc10-54d38ed384d1",
             input: "arr = [1, 2, 3, 4, 5, 4]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e7f000f8-1e8d-49c7-ad2c-949030508388",
             input: "arr = [10, 20, 30, 40, 50, 40]",
             expected: "2", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-turbulent-subarray"
            let topic = "dynamic-programming"
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

            guard let p_arr = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_arr.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: arr array too large (\(p_arr.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_arr.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= arr.length <= 4 * 104"
                )
                return
            }
            guard p_arr.allSatisfy({ $0 >= 0 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= arr[i] <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxTurbulenceSize(p_arr)
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
