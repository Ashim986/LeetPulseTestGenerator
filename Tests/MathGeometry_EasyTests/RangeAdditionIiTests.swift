import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRangeAdditionIi {
    private class Solution {
        func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
            var min_row = m
            var min_col = n
            for op in ops {
                min_row = min(min_row, op[0])
                min_col = min(min_col, op[1])
            }
            return min_row * min_col
        }
    }

    @Suite struct RangeAdditionIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b25e4300-c448-40a6-86a8-0284fcc20c54",
             input: "m = 0, n = 0, ops = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7e0f054d-e06d-4ea2-bd92-986777e1abb7",
             input: "m = 1, n = 1, ops = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9aa73734-fa88-441f-835e-357e5290314d",
             input: "m = 2, n = 2, ops = [[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f6ad7eb2-2309-4466-9548-54befb6680d5",
             input: "m = 3, n = 3, ops = [[1,1],[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b8ca4615-7bae-48d3-b807-1e61804458e3",
             input: "m = 4, n = 4, ops = [[2,2],[2,2]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1f465d12-f513-433a-a4fb-e1901809ef5d",
             input: "m = 5, n = 5, ops = [[3,3],[3,3],[3,3]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2c308efb-3bd8-44c7-ad9a-65ea1a44d1b0",
             input: "m = 1, n = 10, ops = [[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a6f7c2e7-7569-47e2-8b5d-8c5be493e24f",
             input: "m = 10, n = 1, ops = [[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "baa7d300-827a-4881-8c1c-6d75cc99801d",
             input: "m = 100, n = 100, ops = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "37361bd9-ddee-4881-9bdb-600dc5ef265d",
             input: "m = 100, n = 100, ops = [[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "656bfc2e-d5dd-4320-a7bd-fb8fe82ec4bb",
             input: "m = 100, n = 100, ops = [[100,100]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4d75de5a-4748-4f7d-a57b-4224e245f4b8",
             input: "m = 10, n = 10, ops = [[5,5],[5,5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a136e804-a643-4f8b-8974-9c9c1d88cfff",
             input: "m = 10, n = 10, ops = [[1,1],[2,2],[3,3]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "579a52dd-4126-4a01-b8d5-c9d8fc5086c2",
             input: "m = 10, n = 10, ops = [[1,1],[1,1],[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "981a2e10-429f-4416-80b1-ca6f1ae674c2",
             input: "m = 10, n = 10, ops = [[5,5],[5,5],[5,5]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8a510ef8-4f20-4762-8cb5-171ac66fa965",
             input: "m = 10, n = 10, ops = [[10,10],[10,10],[10,10]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bb653b89-7814-4233-b143-de4a2a50107a",
             input: "m = 1000, n = 1000, ops = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c8e37ed7-92e4-4eac-bfc1-b4a6a1fdb742",
             input: "m = 1000, n = 1000, ops = [[1,1]]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "01213fa2-fae5-4db4-a385-3a572e8e55b5",
             input: "m = 3, n = 3, ops = [[2,2],[3,3]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "163f410e-5be7-44fa-8223-fa4470f05bd7",
             input: "m = 3, n = 3, ops = [[2,2],[3,3],[3,3],[3,3],[2,2],[3,3],[3,3],[3,3],[2,2],[3,3],[3,3],[3,3]]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "095ee49e-0ea2-47fd-b0e6-8cb9689bed9c",
             input: "m = 3, n = 3, ops = []",
             expected: "9", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "range-addition-ii"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            guard let p_m = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }
            guard let p_n = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }
            guard let p_ops = InputParser.parse2DIntArray(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as [[Int]]"
                )
                return
            }
            guard p_ops.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: ops 2D array too large (\(p_ops.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_m >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 4 * 104"
                )
                return
            }
            guard p_n >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= m, n <= 4 * 104"
                )
                return
            }
            guard p_ops.count >= 0 && p_ops.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= ops.length <= 104"
                )
                return
            }
            guard p_ops.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: ops[i].length == 2"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxCount(p_m, p_n, p_ops)
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
