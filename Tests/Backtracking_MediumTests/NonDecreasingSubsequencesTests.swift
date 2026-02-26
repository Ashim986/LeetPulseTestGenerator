import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNonDecreasingSubsequences {
    private class Solution {
        func findSubsequences(nums: [Int]) -> [[Int]] {
            var result: [[Int]] = []
            var n = nums.count
            backtrack(nums, 0, [], &result)
            return result
        }

        func backtrack(_ nums: [Int], _ start: Int, _ current: [Int], _ result: inout [[Int]]) {
            if start == nums.count {
                if current.count > 1 {
                    result.append(current)
                }
                return
            }
            if current.isEmpty || nums[start] >= current[current.count - 1] {
                var newCurrent = current
                newCurrent.append(nums[start])
                backtrack(nums, start + 1, newCurrent, &result)
            }
            backtrack(nums, start + 1, current, &result)
        }
    }

    @Suite struct NonDecreasingSubsequencesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "50682689-fade-4661-bc59-a503cb97dd9f",
             input: "nums = []",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "b0b9d6c5-40d6-4a58-8a8f-c790d52f7068",
             input: "nums = [1]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "d57f568c-8464-4a79-a711-ef6873f35c43",
             input: "nums = [1,2]",
             expected: "[[12]]", orderMatters: false),
            TestCaseData(id: "5715580a-7dc9-43b1-a63e-ab9d7163c090",
             input: "nums = [1,1]",
             expected: "[[11]]", orderMatters: false),
            TestCaseData(id: "bf1f9a9e-db0a-462f-9413-574cf4fc2510",
             input: "nums = [1,2,3,4,5]",
             expected: "[[12],[123],[1234],[12345],[1235],[124],[1245],[125],[13],[134],[1345],[135],[14],[145],[15],[23],[234],[2345],[235],[24],[245],[25],[34"
                + "],[345],[35],[45]]", orderMatters: false),
            TestCaseData(id: "12bf4c0b-f2e0-4a2b-b0d6-0258e5fef6ca",
             input: "nums = [5,4,3,2,1]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "b1245979-6060-4ee1-aa70-c0096fe96d75",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "4270b841-1668-4781-a0fc-de750569f7ec",
             input: "nums = [1,1,1,1,1]",
             expected: "[[11],[111],[1111],[11111]]", orderMatters: false),
            TestCaseData(id: "fb7d58fa-229a-4f73-afaf-1602fbdb0274",
             input: "nums = [1,2,2,2,2]",
             expected: "[[12],[122],[1222],[12222],[22],[222],[2222]]", orderMatters: false),
            TestCaseData(id: "c34a1686-702a-4f8e-9b76-c37b6dc61bd0",
             input: "nums = [1,1,1,2,2,2]",
             expected: "[[11],[111],[1112],[11122],[111222],[112],[1122],[11222],[12],[122],[1222],[22],[222],[2222]]", orderMatters: false),
            TestCaseData(id: "c15301dc-dabf-49d1-8546-3b963647d776",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[[11],[111],[1111],[11111],[111111],[1111111],[11111111],[111111111],[1111111111]]", orderMatters: false),
            TestCaseData(id: "861f034d-f691-410a-a616-60519f6fb108",
             input: "nums = [10,10,10,10,10,10,10,10,10,10]",
             expected: "[[1010],[101010],[10101010],[1010101010],[101010101010],[10101010101010],[1010101010101010],[101010101010101010],[10101010101010101010]]", orderMatters: false),
            TestCaseData(id: "0e56222e-65f0-41ab-ab71-617e4dc69b9b",
             input: "nums = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]",
             expected: "[[-11],[-111],[-1111],[-11111],[-111111],[-1111111],[-11111111],[-111111111],[-1111111111]]", orderMatters: false),
            TestCaseData(id: "15c88983-d095-479e-ad5a-3dba3c220090",
             input: "nums = [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000]",
             expected: "[[10001000],[100010001000],[1000100010001000],[10001000100010001000],[100010001000100010001000],[1000100010001000100010001000],[10001000"
                + "100010001000100010001000],[100010001000100010001000100010001000],[1000100010001000100010001000100010001000]]", orderMatters: false),
            TestCaseData(id: "40c9ca89-eb7e-40eb-aee2-f08563952637",
             input: "nums = [4,6,7,7]",
             expected: "[[4,6],[4,6,7],[4,6,7,7],[4,7],[4,7,7],[6,7],[6,7,7],[7,7]]", orderMatters: false),
            TestCaseData(id: "49978eca-f0b7-4f95-adf6-25365137b9c5",
             input: "nums = [4,4,3,2,1]",
             expected: "[[4,4]]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "non-decreasing-subsequences"
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
            guard p_nums.count >= 1 && p_nums.count <= 15 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 15"
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

            let solution = Solution()
            let result = solution.findSubsequences(nums: p_nums)
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
