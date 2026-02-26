import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumDominoRotationsForEqualRow {
    private class Solution {
        func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
            let n = A.count
            func check(x: Int) -> Int {
                var rotationsA = 0
                var rotationsB = 0
                for i in 0..<n {
                    if A[i] != x && B[i] != x {
                        return -1
                    } else if A[i] != x {
                        rotationsA += 1
                    } else if B[i] != x {
                        rotationsB += 1
                    }
                }
                return min(rotationsA, rotationsB)
            }
            let rotationsA = check(x: A[0])
            let rotationsB = check(x: B[0])
            if rotationsA == -1 && rotationsB == -1 {
                return -1
            }
            if rotationsA == -1 {
                return rotationsB
            }
            if rotationsB == -1 {
                return rotationsA
            }
            return min(rotationsA, rotationsB)
        }
    }

    @Suite struct MinimumDominoRotationsForEqualRowTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "576c7969-6d2a-48cf-8fa0-6afed187cc89",
             input: "A = [1,1,1,1,1], B = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "31a57a96-d2b4-472a-be6d-15fc3acb5035",
             input: "A = [1], B = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "eb2ce257-8cb6-4f77-8cb6-feecba04f617",
             input: "A = [1,2,3], B = [1,2,3]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "851a13a1-2cfc-467b-8747-9d807d527e76",
             input: "A = [1,2,3], B = [3,2,1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "1d096761-3b84-4aa6-908f-5a1c25850bd5",
             input: "A = [1,1,1], B = [2,2,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "41c23186-b200-41f2-a0b5-59208009291a",
             input: "A = [1,2,3,4,5], B = [1,2,3,4,5]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "d3d99e56-f214-48d5-acab-3076dce46e2d",
             input: "A = [1,1,1,1,1], B = [2,2,2,2,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f285080a-8610-46d4-860c-390e95c3a7cf",
             input: "A = [1,2,3,4,5], B = [5,4,3,2,1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "9bb33a40-cef0-4eda-a8be-e86630e9e191",
             input: "A = [1,1,1,1,1], B = [1,1,1,1,2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5706e54b-3478-4bf4-af7b-b8aa2e862fe8",
             input: "A = [1,2,3,4,5], B = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1b81e335-6333-410d-9c33-7544f342c6c3",
             input: "A = [1,1,1,1,1], B = [2,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "70fe701e-de18-452e-8f0d-0c7bc8b70d80",
             input: "A = [1,2,3,4,5], B = [2,3,4,5,6]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "a2e58bfe-ed24-4451-b14f-2215a2e8c39c",
             input: "A = [1,1,1,1,1], B = [1,2,3,4,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "78216237-8443-4cc2-b2d0-0906c4cfccb2",
             input: "A = [1,2,3,4,5], B = [6,7,8,9,10]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "dd5485cc-964e-46ce-8a71-7bad92b844d4",
             input: "A = [1,1,1,1,1], B = [1,1,1,1,6]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "98c6c06a-f6e2-4bea-81f6-e238294268b0",
             input: "A = [1,2,3,4,5], B = [1,3,5,7,9]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "b2d24969-493c-4558-b8bf-1a43ebc29381",
             input: "A = [1,1,1,1,1], B = [1,1,1,1,7]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3a2c7f48-a04a-488a-913a-5c1e03365fd1",
             input: "A = [1,2,3,4,5], B = [10,9,8,7,6]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "8352476d-27cc-43a8-b072-e7fee7c8f001",
             input: "A = [1,1,1,1,1], B = [1,1,1,1,8]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a4baf2a7-51c2-466d-837a-72a269d9eac0",
             input: "A = [1,2,3,4,5], B = [11,12,13,14,15]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "74946a51-3f2d-4a62-a334-a446cf58fd8e",
             input: "A = [1,1,1,1,1], B = [1,1,1,1,9]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d4e8d960-2cf0-4e95-a7b1-3163dd7b7148",
             input: "A = [1,2,3,4,5], B = [16,17,18,19,20]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "92c15c36-77d3-4cc4-b8c6-7cad03845379",
             input: "A = [1,1,1,1,1], B = [1,1,1,1,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c3d1dc97-8908-432c-8d0b-6f6c793e618f",
             input: "A = [1,2,3,4,5], B = [21,22,23,24,25]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "3711e847-ab36-425c-8154-76ca3e0ac3d4",
             input: "A = [1,1,1,1,1], B = [1,1,1,1,11]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-domino-rotations-for-equal-row"
            let topic = "greedy"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_A = InputParser.parseIntArray(params[0]) else {
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
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }
            guard let p_B = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_B.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: B array too large (\(p_B.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= tops.length <= 2 * 104"
                )
                return
            }
            guard p_A.allSatisfy({ $0 >= 1 && $0 <= 6 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= tops[i], bottoms[i] <= 6"
                )
                return
            }
            guard p_B.allSatisfy({ $0 >= 1 && $0 <= 6 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= tops[i], bottoms[i] <= 6"
                )
                return
            }

            let solution = Solution()
            let result = solution.minDominoRotations(p_A, p_B)
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
