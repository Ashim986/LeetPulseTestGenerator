import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSubsets {
    private class Solution {
        func subsets(_ nums: [Int]) -> [[Int]] {
            var result: [[Int]] = []
            var current: [Int] = []

            func backtrack(_ index: Int) {
                if index == nums.count {
                    result.append(current)
                    return
                }
                // Include nums[index]
                current.append(nums[index])
                backtrack(index + 1)
                current.removeLast()
                // Exclude nums[index]
                backtrack(index + 1)
            }

            backtrack(0)
            return result
        }
    }

    @Suite struct SubsetsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "902C60DB-2884-4A4B-8114-489D095C8228",
             input: "[]",
             expected: "[[]]", orderMatters: false),
            TestCaseData(id: "FA067B72-7183-4ECB-AEA2-EFCA6E3D44ED",
             input: "[1,2,3]",
             expected: "[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]", orderMatters: false),
            TestCaseData(id: "855C32FD-151D-4CB5-952C-EBAF30C0E90F",
             input: "[0]",
             expected: "[[],[0]]", orderMatters: false),
            TestCaseData(id: "64F12346-94AE-4A99-BFA5-671F8308A39D",
             input: "[1]",
             expected: "[[1],[]]", orderMatters: false),
            TestCaseData(id: "AEAFE4C2-262E-45D7-8B19-B868514985DE",
             input: "[1,1]",
             expected: "[[1,1],[1],[1],[]]", orderMatters: false),
            TestCaseData(id: "F4512422-AF03-4924-90B8-23A3A9726156",
             input: "[1,2,1]",
             expected: "[[1,2,1],[1,2],[1,1],[1],[2,1],[2],[1],[]]", orderMatters: false),
            TestCaseData(id: "FDF01FED-1E4E-4CFE-8C4C-9332BF91C3F0",
             input: "[-1]",
             expected: "[[-1],[]]", orderMatters: false),
            TestCaseData(id: "201EE0E8-85C6-4E6D-B9DC-307688C81BFD",
             input: "[-1,0]",
             expected: "[[-1,0],[-1],[0],[]]", orderMatters: false),
            TestCaseData(id: "F1C3371F-055A-4AEE-9A93-E3831D7C3B7B",
             input: "[1,-1]",
             expected: "[[1,-1],[1],[-1],[]]", orderMatters: false),
            TestCaseData(id: "C001A77C-FE88-44F6-8DDC-B3A9916FA78D",
             input: "[1,-2]",
             expected: "[[1,-2],[1],[-2],[]]", orderMatters: false),
            TestCaseData(id: "5849DCBE-D70E-4B58-AAB7-23D686513C5A",
             input: "[1,0,-1]",
             expected: "[[1,0,-1],[1,0],[1,-1],[1],[0,-1],[0],[-1],[]]", orderMatters: false),
            TestCaseData(id: "AFEE14BE-CDE2-4FB2-8B56-A2F78756351D",
             input: "[0,-1,-2]",
             expected: "[[0,-1,-2],[0,-1],[0,-2],[0],[-1,-2],[-1],[-2],[]]", orderMatters: false),
            TestCaseData(id: "FABFD0FD-858E-4800-8471-C00817004EDC",
             input: "[1,-1,-2]",
             expected: "[[1,-1,-2],[1,-1],[1,-2],[1],[-1,-2],[-1],[-2],[]]", orderMatters: false),
            TestCaseData(id: "1B438F81-F1BB-44E1-A264-B87C3163B1CB",
             input: "[1,1,-1]",
             expected: "[[1,1,-1],[1,1],[1,-1],[1],[1,-1],[1],[-1],[]]", orderMatters: false),
            TestCaseData(id: "E98D5DD5-D8BD-4751-A9FB-C0C0ABF7EEF6",
             input: "[1,-1,-2,-3]",
             expected: "[[1,-1,-2,-3],[1,-1,-2],[1,-1,-3],[1,-1],[1,-2,-3],[1,-2],[1,-3],[1],[-1,-2,-3],[-1,-2],[-1,-3],[-1],[-2,-3],[-2],[-3],[]]", orderMatters: false),
            TestCaseData(id: "63F9F763-B65C-42F3-B7E8-9E7B8ED9203F",
             input: "[-1,1,-2,-3]",
             expected: "[[-1,1,-2,-3],[-1,1,-2],[-1,1,-3],[-1,1],[-1,-2,-3],[-1,-2],[-1,-3],[-1],[1,-2,-3],[1,-2],[1,-3],[1],[-2,-3],[-2],[-3],[]]", orderMatters: false),
            TestCaseData(id: "B09FC718-B7A3-4CB1-8922-B38B10DB6FAD",
             input: "[-1,-1,-1,-1]",
             expected: "[[-1,-1,-1,-1],[-1,-1,-1],[-1,-1,-1],[-1,-1],[-1,-1,-1],[-1,-1],[-1,-1],[-1],[-1,-1,-1],[-1,-1],[-1,-1],[-1],[-1,-1],[-1],[-1],[]]", orderMatters: false),
            TestCaseData(id: "7186249B-F4A9-47D5-B138-51D372DFD79B",
             input: "[1,2,3,4,5,6]",
             expected: "[[1,2,3,4,5,6],[1,2,3,4,5],[1,2,3,4,6],[1,2,3,4],[1,2,3,5,6],[1,2,3,5],[1,2,3,6],[1,2,3],[1,2,4,5,6],[1,2,4,5],[1,2,4,6],[1,2,4],[1,2,5,"
                + "6],[1,2,5],[1,2,6],[1,2],[1,3,4,5,6],[1,3,4,5],[1,3,4,6],[1,3,4],[1,3,5,6],[1,3,5],[1,3,6],[1,3],[1,4,5,6],[1,4,5],[1,4,6],[1,4],[1,5,6]"
                + ",[1,5],[1,6],[1],[2,3,4,5,6],[2,3,4,5],[2,3,4,6],[2,3,4],[2,3,5,6],[2,3,5],[2,3,6],[2,3],[2,4,5,6],[2,4,5],[2,4,6],[2,4],[2,5,6],[2,5],["
                + "2,6],[2],[3,4,5,6],[3,4,5],[3,4,6],[3,4],[3,5,6],[3,5],[3,6],[3],[4,5,6],[4,5],[4,6],[4],[5,6],[5],[6],[]]", orderMatters: false),
            TestCaseData(id: "B740681A-1AB5-41CF-B401-B32FAF53F9A9",
             input: "[1,-2,3,-4]",
             expected: "[[1,-2,3,-4],[1,-2,3],[1,-2,-4],[1,-2],[1,3,-4],[1,3],[1,-4],[1],[-2,3,-4],[-2,3],[-2,-4],[-2],[3,-4],[3],[-4],[]]", orderMatters: false),
            TestCaseData(id: "A1633739-F096-4208-AA8A-C10CCA9D81D5",
             input: "[9]",
             expected: "[[9],[]]", orderMatters: false),
            TestCaseData(id: "8A52CE95-D200-4491-9B8D-215815166C02",
             input: "[4,4,4,1,4]",
             expected: "[[4,4,4,1,4],[4,4,4,1],[4,4,4,4],[4,4,4],[4,4,1,4],[4,4,1],[4,4,4],[4,4],[4,1,4],[4,1],[4,4],[4],[4,1,4],[4,1],[4,4],[4],[4,4,1,4],[4,4,"
                + "1],[4,4,4],[4,4],[4,1,4],[4,1],[4,4],[4],[1,4],[1],[4],[]]", orderMatters: false),
            TestCaseData(id: "E2F96A07-A6A1-4633-86D8-BA00B7EEB8E6",
             input: "[-1,0,1]",
             expected: "[[-1,0,1],[-1,0],[-1,1],[-1],[0,1],[0],[1],[]]", orderMatters: false),
            TestCaseData(id: "1E91D4BD-CB58-43A6-B4FC-ABA0C418260E",
             input: "[-2,-1,-1]",
             expected: "[[-2,-1,-1],[-2,-1],[-2,-1],[-2],[-1,-1],[-1],[-1],[]]", orderMatters: false),
            TestCaseData(id: "588809FF-818C-4F9B-B1BE-9246371277C3",
             input: "[7,1,1]",
             expected: "[[7,1,1],[7,1],[7,1],[7],[1,1],[1],[1],[]]", orderMatters: false),
            TestCaseData(id: "A67AC958-9611-490D-9D58-A682ABFA2E1C",
             input: "1,2,3",
             expected: "[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "subsets"
            let topic = "backtracking"
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
            guard p_nums.count >= 1 && p_nums.count <= 10 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 10"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -10 && $0 <= 10 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10 <= nums[i] <= 10"
                )
                return
            }

            let solution = Solution()
            let result = solution.subsets(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Nested order-independent comparison (QUAL-01)
            // Inner arrays compared as-is, outer array order ignored when orderMatters=false
            guard let expectedArrays = InputParser.parse2DIntArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
