import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCContainerWithMostWater {
    private class Solution {
        func maxArea(_ height: [Int]) -> Int {
            var left = 0, right = height.count - 1
            var maxArea = 0

            while left < right {
                let area = min(height[left], height[right]) * (right - left)
                maxArea = max(maxArea, area)

                if height[left] < height[right] {
                    left += 1
                } else {
                    right -= 1
                }
            }

            return maxArea
        }
    }

    @Suite struct ContainerWithMostWaterTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "01099AEC-1200-4823-B5F1-6505A7C50357",
             input: "[1,8,6,2,5,4,8,3,7]",
             expected: "49", orderMatters: true),
            TestCaseData(id: "5ABB4ED1-9698-4B2A-9207-A1934FF9D66B",
             input: "[1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "87AEAEF1-088A-4FF0-BFB1-B7F32254BB1C",
             input: "[4,3,2,1,4]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "AB3A6D80-2797-4F73-8D2B-2604C2C5F94C",
             input: "[1,2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "17FB3222-31BA-4B7F-9FF3-7EC6D48B0A2A",
             input: "[]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "74B06D48-2D56-408A-ABEC-B962E4C08EE1",
             input: "[2,3,4,5,18,17,6]",
             expected: "17", orderMatters: true),
            TestCaseData(id: "be3b5975-b26f-4c4f-872d-0b538b9c64b1",
             input: "height = [1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "91844a4a-c19b-4875-8556-985ed8a302a3",
             input: "height = [1,2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a6513c5c-80d2-4a29-8bb5-556b923c15d7",
             input: "height = [4,3,2,1,4]",
             expected: "16", orderMatters: true),
            TestCaseData(id: "d86e601d-4adc-4a21-9d1f-1b656f664dc9",
             input: "height = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8332918e-1895-47f3-871e-4c176a5a7b0d",
             input: "height = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "be54b414-2d96-4585-a3f6-3ef9f3a71c69",
             input: "height = [1,1,1,1,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "020fda55-c1c4-40bd-b222-33357c53faa8",
             input: "height = [10,10,10,10,10]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "817e5e5d-c91d-4b4b-8caf-cc016ba82e8a",
             input: "height = [1,8,6,2,5,4,8,25,7]",
             expected: "49", orderMatters: true),
            TestCaseData(id: "15a4615c-5b0f-4f88-ae2b-09fd90656ade",
             input: "height = [1,2,3,4,5,6,7,8,9,10]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "779516a7-d597-402a-96ed-7b805727c62c",
             input: "height = [10,9,8,7,6,5,4,3,2,1]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "eef80110-7c27-4a22-87c3-1b063e998dee",
             input: "height = [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000]",
             expected: "9000", orderMatters: true),
            TestCaseData(id: "c5722e13-3ae7-4ad7-9159-009a500f7956",
             input: "height = [0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8911d42f-1154-41aa-9371-aea1ab2e3062",
             input: "height = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "19", orderMatters: true),
            TestCaseData(id: "64e0f157-a51d-4661-a034-5ff6d9370ccf",
             input: "height = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]",
             expected: "190", orderMatters: true),
            TestCaseData(id: "1e12d131-4fcb-4c3a-b5c0-c9b1dfcdadef",
             input: "height = [100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100]",
             expected: "1900", orderMatters: true),
            TestCaseData(id: "4ebacfed-b91c-4642-bea1-f379645f7aa7",
             input: "height = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "5d6d6074-5faa-42c5-b452-b8b748b08874",
             input: "height = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "36d7cc5d-ec13-4a7d-b4f2-fcc99379c10e",
             input: "height = [1,2,4,3,5,4,3,2]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "ad8c118c-c5fb-4b79-a99e-3bce0b388e76",
             input: "height = [5,5,5,5,5,5,5,5,5,5]",
             expected: "45", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "container-with-most-water"
            let topic = "two-pointers"
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

            guard let p_height = InputParser.parseIntArray(params[0]) else {
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
            guard p_height.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: height array too large (\(p_height.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_height.allSatisfy({ $0 >= 0 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= height[i] <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.maxArea(p_height)
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
