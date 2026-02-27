import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLargestRectangleInHistogram {
    private class Solution {
        func largestRectangleArea(_ heights: [Int]) -> Int {
            var stack: [Int] = []
            var maxArea = 0
            let heights = heights + [0]
            for i in 0..<heights.count {
                while !stack.isEmpty && heights[i] < heights[stack[stack.count - 1]] {
                    let h = heights[stack.removeLast()]
                    let w = stack.isEmpty ? i : i - stack[stack.count - 1] - 1
                    maxArea = max(maxArea, h * w)
                }
                stack.append(i)
            }
            return maxArea
        }
    }

    @Suite struct LargestRectangleInHistogramTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7fad5e06-d325-4af2-bd08-6e0da962fec4",
             input: "heights = [1,2,3,4,5]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "2ae7cbd3-01e9-47c5-b735-6b342d431ec6",
             input: "heights = [5,4,3,2,1]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "1ec5580b-5835-4294-8f2f-ff7cf6a8bf8c",
             input: "heights = [1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5a16bba8-cb26-4dd5-9f4b-595b5bf7de49",
             input: "heights = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e91eae7e-e787-4263-8b2d-9ecc715d8de8",
             input: "heights = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8ab157a7-aa6e-4755-9bb2-d837e34790e1",
             input: "heights = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3882c464-87ec-4856-9e52-d084d3c625ab",
             input: "heights = [-1,-2,-3,-4,-5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4cb96837-c2d1-45ef-9805-cf894d6a115c",
             input: "heights = [10,10,10,10,10]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "6c44478b-2ed8-4272-a840-cd7d2e87c0e8",
             input: "heights = [1,2,3,4,5,6,7,8,9,10]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "49327cf8-9be6-48aa-bdd6-3b4f18fb4abd",
             input: "heights = [10,9,8,7,6,5,4,3,2,1]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "3a401a83-03c4-40d8-b54a-457ca677eb09",
             input: "heights = [1,1,1,1,1,1,1,1,1,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "9575d1f3-2205-49cb-8808-9ee701f3ce5d",
             input: "heights = [5,5,5,5,5,5,5,5,5,5]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "9b381df7-71dc-4e24-8f75-28109055cbb0",
             input: "heights = [2,2,2,2,2,2,2,2,2,2]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "06bb1ace-a447-43d6-bf3f-3f7972e95611",
             input: "heights = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "f5aeba77-bc80-4c99-8e26-837e4e474dd0",
             input: "heights = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "89ce7a6e-24ac-47b3-babc-06241e267e71",
             input: "heights = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]",
             expected: "200", orderMatters: true),
            TestCaseData(id: "f5eca1f8-24af-4583-b928-b1026a0025d3",
             input: "heights = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "97a7f907-74ab-4f25-8ed8-dcc52bca0cce",
             input: "heights = [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]",
             expected: "150", orderMatters: true),
            TestCaseData(id: "2d845be7-459a-4a3a-a0e8-f4a337a8e653",
             input: "heights = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]",
             expected: "300", orderMatters: true),
            TestCaseData(id: "f3076596-14f6-4652-9f3f-ef84b967f47f",
             input: "heights = [1,3,5,7,9,11,13,15,17,19]",
             expected: "55", orderMatters: true),
            TestCaseData(id: "f27c730d-6f71-4e0a-80ea-a1578c7e6a19",
             input: "heights = [19,17,15,13,11,9,7,5,3,1]",
             expected: "55", orderMatters: true),
            TestCaseData(id: "5533dcb6-7acb-41fb-a952-aecbb42e66e8",
             input: "heights = [10,20,30,40,50,60,70,80,90,100]",
             expected: "300", orderMatters: true),
            TestCaseData(id: "36fd5e4f-4d2e-4af2-85f6-1bec2b7edd7a",
             input: "heights = [100,90,80,70,60,50,40,30,20,10]",
             expected: "300", orderMatters: true),
            TestCaseData(id: "a0cb0f1d-b680-471b-b6db-a1a994cd1a64",
             input: "heights = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "110", orderMatters: true),
            TestCaseData(id: "487bc18e-331a-4083-9a93-e5cbc8e7d2e8",
             input: "heights = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "110", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "largest-rectangle-in-histogram"
            let topic = "stack"
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

            guard let p_heights = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_heights.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: heights array too large (\(p_heights.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_heights.count >= 1 && p_heights.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= heights.length <= 105"
                )
                return
            }
            guard p_heights.allSatisfy({ $0 >= 0 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= heights[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.largestRectangleArea(p_heights)
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
