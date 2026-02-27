import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPermutations {
    private class Solution {
        func permute(_ nums: [Int]) -> [[Int]] {
            var result: [[Int]] = []
            var current: [Int] = []
            var used = [Bool](repeating: false, count: nums.count)

            func backtrack() {
                if current.count == nums.count {
                    result.append(current)
                    return
                }
                for i in 0..<nums.count {
                    if used[i] { continue }
                    used[i] = true
                    current.append(nums[i])
                    backtrack()
                    current.removeLast()
                    used[i] = false
                }
            }

            backtrack()
            return result
        }
    }

    @Suite struct PermutationsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "48D729C8-28FC-471B-9DB7-460D04FB233A",
             input: "[1,2,3]",
             expected: "[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]", orderMatters: false),
            TestCaseData(id: "F1E3EB0A-F94A-4977-8ADA-68D476051E36",
             input: "[0,1]",
             expected: "[[0,1],[1,0]]", orderMatters: false),
            TestCaseData(id: "07412F79-F12C-425A-9E63-185020BCD0EC",
             input: "[5,4,3]",
             expected: "[[5,4,3],[5,3,4],[4,5,3],[4,3,5],[3,5,4],[3,4,5]]", orderMatters: false),
            TestCaseData(id: "1916C942-04D7-4162-9C38-AB63114A6217",
             input: "[1]",
             expected: "[[1]]", orderMatters: false),
            TestCaseData(id: "CCFBF211-87DF-4F8D-A8E5-7C96151F817E",
             input: "[]",
             expected: "[[]]", orderMatters: false),
            TestCaseData(id: "1AB780B8-377F-4EE0-8F68-BE05A5304BDE",
             input: "[1,-1,0]",
             expected: "[[1,-1,0],[1,0,-1],[-1,1,0],[-1,0,1],[0,1,-1],[0,-1,1]]", orderMatters: false),
            TestCaseData(id: "75598C7A-92ED-40F6-93C3-08145DB75301",
             input: "[1,2,3,4]",
             expected: "[[1,2,3,4],[1,2,4,3],[1,3,2,4],[1,3,4,2],[1,4,2,3],[1,4,3,2],[2,1,3,4],[2,1,4,3],[2,3,1,4],[2,3,4,1],[2,4,1,3],[2,4,3,1],[3,1,2,4],[3,1,"
                + "4,2],[3,2,1,4],[3,2,4,1],[3,4,1,2],[3,4,2,1],[4,1,2,3],[4,1,3,2],[4,2,1,3],[4,2,3,1],[4,3,1,2],[4,3,2,1]]", orderMatters: false),
            TestCaseData(id: "14816F54-4486-45DC-9614-EE8B4F4D0C48",
             input: "[5,0]",
             expected: "[[5,0],[0,5]]", orderMatters: false),
            TestCaseData(id: "A49BDC5E-1634-4332-B3FB-16CD4DB93E7F",
             input: "[-1,-2,-3]",
             expected: "[[-1,-2,-3],[-1,-3,-2],[-2,-1,-3],[-2,-3,-1],[-3,-1,-2],[-3,-2,-1]]", orderMatters: false),
            TestCaseData(id: "BA40C50E-FFDF-4F76-9DA2-58904CEF1790",
             input: "[-2,-4,-3,-1]",
             expected: "[[-2,-4,-3,-1],[-2,-4,-1,-3],[-2,-3,-4,-1],[-2,-3,-1,-4],[-2,-1,-4,-3],[-2,-1,-3,-4],[-4,-2,-3,-1],[-4,-2,-1,-3],[-4,-3,-2,-1],[-4,-3,-1"
                + ",-2],[-4,-1,-2,-3],[-4,-1,-3,-2],[-3,-2,-4,-1],[-3,-2,-1,-4],[-3,-4,-2,-1],[-3,-4,-1,-2],[-3,-1,-2,-4],[-3,-1,-4,-2],[-1,-2,-4,-3],[-1,-"
                + "2,-3,-4],[-1,-4,-2,-3],[-1,-4,-3,-2],[-1,-3,-2,-4],[-1,-3,-4,-2]]", orderMatters: false),
            TestCaseData(id: "EBD49E76-07E7-46A8-B619-26AA5C1BB1B1",
             input: "[2]",
             expected: "[[2]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "permutations"
            let topic = "backtracking"
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
            guard p_nums.count >= 1 && p_nums.count <= 6 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 6"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -10 && $0 <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10 <= nums[i] <= 10"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [[Int]]?
            let didCrash = withCrashGuard {
                resultHolder = solution.permute(p_nums)
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

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [[Int]]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArrays
            } else {
                // Sort outer array by content for stable comparison (inner order preserved)
                let sortOuter: ([[Int]]) -> [[Int]] = { $0.sorted { a, b in
                    for i in 0..<min(a.count, b.count) { if a[i] != b[i] { return a[i] < b[i] } }
                    return a.count < b.count
                } }
                matches = sortOuter(result) == sortOuter(expectedArrays)
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
