import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTrappingRainWater {
    private class Solution {
        func trap(_ height: [Int]) -> Int {
            var left = 0, right = height.count - 1
            var maxLeft = 0, maxRight = 0
            var water = 0

            while left < right {
                if height[left] < height[right] {
                    if height[left] >= maxLeft {
                        maxLeft = height[left]
                    } else {
                        water += maxLeft - height[left]
                    }
                    left += 1
                } else {
                    if height[right] >= maxRight {
                        maxRight = height[right]
                    } else {
                        water += maxRight - height[right]
                    }
                    right -= 1
                }
            }

            return water
        }
    }

    @Suite struct TrappingRainWaterTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "1aafbf1e-6bf9-4fa1-a0b8-ca55bf40526b",
             input: "height = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b45d81a0-de4b-4a32-ab53-dbc43b4df17f",
             input: "height = [3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b54a8bc1-e9b4-4107-8253-6692dcd36c81",
             input: "height = [1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8dc1c3db-e6e3-4f4f-82e7-327ead47e166",
             input: "height = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1d3354f5-3739-472f-961b-e1b094190e60",
             input: "height = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "88ca9320-731f-43e1-864c-d1c5f503a2a1",
             input: "height = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d0920b76-2854-4f36-ad58-7b59897af705",
             input: "height = [1,2,3,4,5,6,7,8,9,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "28dd1090-0c5c-4deb-bed5-0db5178982cb",
             input: "height = [10,9,8,7,6,5,4,3,2,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fce2813c-c800-4f72-82b5-eefa58cb4a3c",
             input: "height = [1,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f896fbe3-e158-469d-93d7-eb30f0827fc1",
             input: "height = [1,1,0,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6f64de5b-3318-4f23-8b5f-6019fc85cbd8",
             input: "height = [4,2,0,3,2,5]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "7e16742a-ae7a-40e6-b7b0-bec02e0d53d9",
             input: "height = [0,1,0,2,1,0,1,3,2,1,2,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "d4b698f5-1fa9-4891-9f42-ebd19d4c3c67",
             input: "height = [1000,999,998,997,996,995,994,993,992,991,990,989,988,987,986,985,984,983,982,981,980]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6b524bfa-e2d9-42f7-984f-ab4ba7a06024",
             input: "height = [1,2,3,4,5,6,7,8,9,10,1000,999,998,997,996,995,994,993,992,991,990]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "36d931b1-274c-492f-834b-b1e003f63819",
             input: "height = [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "be2f8a8c-0481-41cf-b3f7-6053e2c608b6",
             input: "height = [1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "350a73ec-d89c-4f7e-9dfa-48f6daa54f50",
             input: "height = [0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4f75633c-81a4-4a0c-a4c3-45f10764ba70",
             input: "height = [5,5,5,1,1,5,5,5]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "2f42b8c5-164f-40d4-962d-b2169e306d8d",
             input: "height = [5,4,3,2,1,2,3,4,5]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "a7966998-62fa-4081-bc71-13b112a70968",
             input: "height = [2,1,0,1,3,2,1,2,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e51d07fb-e582-41ce-9848-ed4089bbaa92",
             input: "height = [5,2,3,6,3,4,1,2,5,3,4,6]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "1aa35a6c-21db-464f-9509-d6cfa7e7702f",
             input: "height = [1,8,6,2,5,4,8,3,7]",
             expected: "17", orderMatters: true),
            TestCaseData(id: "c4e771e9-ea68-4a9d-8b9e-59a7e67bbf5c",
             input: "height = [9,0,0,3,2,1,0,1,2,1,0,1,0]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "a9cfc960-ebff-43e6-b9ee-557c8b501993",
             input: "height = [0,1,0,2,1,0,1,3,2,1,2,1,0,1,0,1,2,1,0,1,0,1,3,2,1,2,1]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "b6122bbf-6877-4c12-91c5-e3776bd0a60f",
             input: "height = [0,-1,0,-2,-1,0,-1,-3,-2,-1,0,-1,0,-1,-2,-1,0,-1,0,-1,-3,-2,-1,0,-1,0,-1,-2,-1]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "trapping-rain-water"
            let topic = "two-pointers"
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

            guard let p_height = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_height.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: height array too large (\(p_height.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_height.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 2 * 104"
                )
                return
            }
            guard p_height.allSatisfy({ $0 >= 0 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= height[i] <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.trap(p_height)
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
