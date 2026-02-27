import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaxChunksToMakeSorted {
    private class Solution {
        func maxChunksToSorted(_ arr: [Int]) -> Int {
            var max = 0, count = 0
            for (i, x) in arr.enumerated() {
                max = Swift.max(max, x)
                if max == i {
                    count += 1
                }
            }
            return count
        }
    }

    @Suite struct MaxChunksToMakeSortedTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "bfa383c2-f7f6-4192-8a36-609bd57b70f1",
             input: "arr = [1,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f10b6a22-f6f1-4b45-83e8-f8e5d9bc634d",
             input: "arr = [0,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7492d608-6c12-4e9e-a568-598aa231f5ee",
             input: "arr = [1,2,3,4,5,6,7,8,9,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "e0b67bc4-7349-44c1-a347-dd3129586340",
             input: "arr = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fae56a7c-cddd-4ff1-bed9-0ade69aa9258",
             input: "arr = [5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d7015ef0-64c4-4419-b9fa-2994381481cc",
             input: "arr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "fc6043ab-8f78-4aaa-b85b-067a996a00c0",
             input: "arr = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "aebd2e4d-050b-48eb-b937-47a3b52b084d",
             input: "arr = [10,20,30,40,50]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5deabe7a-5c65-433b-b8da-b10dfc902c2a",
             input: "arr = [1,3,5,7,9]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "3f59fb65-ae4b-43fe-a976-b5679d95b76f",
             input: "arr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "a06ac6cb-47fe-4fdb-b9dc-28c40e781738",
             input: "arr = [-3,-2,-1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "b7e5a14a-c828-4ed0-9eaa-d3f46d2040a3",
             input: "arr = [3,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6c5f7072-ac54-41d8-bb51-705c955ca457",
             input: "arr = [1,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8754d10c-9531-4426-be73-9f536449bc3a",
             input: "arr = [-1,0,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ec287c5b-c215-48ab-acc8-55d98a60d606",
             input: "arr = [10,9,8,7,6,5,4,3,2,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "48c96479-2a96-4412-bb20-f9574ead9513",
             input: "arr = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "44d8d427-27be-4b30-8a95-70c246e122d6",
             input: "arr = [50,40,30,20,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "3faaf258-757b-4ace-bc3e-ef038d9a9648",
             input: "arr = [9,7,5,3,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ff082e79-0a7b-406d-8cef-bfe311205f83",
             input: "arr = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "abc3b15e-1169-489c-baa8-d6277d7ff625",
             input: "arr = [1,3,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "627211f2-a35e-46c4-9174-d404a8a2cb26",
             input: "arr = [3,1,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "de3d388f-e0b9-4020-b6f7-5cb941b14c7a",
             input: "arr = [4,3,2,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1fe830d4-48d1-4297-affe-c9d3e8e5294f",
             input: "arr = [1,0,2,3,4]",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "max-chunks-to-make-sorted"
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
            guard p_arr.count >= 1 && p_arr.count <= 10 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 10"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxChunksToSorted(p_arr)
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
