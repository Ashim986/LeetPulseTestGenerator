import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPartitionArrayIntoThreePartsWithEqualSum {
    private class Solution {
        func canThreePartsEqualSum(_ A: [Int]) -> Bool {
            let sum = A.reduce(0, +)
            if sum % 3 != 0 {
                return false
            }
            let target = sum / 3
            var prefixSum = 0
            var count = 0
            for num in A {
                prefixSum += num
                if prefixSum == target {
                    count += 1
                    prefixSum = 0
                }
                if count == 3 {
                    return true
                }
            }
            return false
        }
    }

    @Suite struct PartitionArrayIntoThreePartsWithEqualSumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "fecc102a-7f8b-4bc3-a041-fd2bd7159fc1",
             input: "nums = [1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "66c71190-a07e-405b-b5e6-2e85de328e56",
             input: "nums = [1,2,3,4,5,6]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8c06962a-678c-4d4f-860c-e5e4a8f33a20",
             input: "nums = []",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ea4eebbc-086c-4653-a7d7-cdd33f5936d3",
             input: "nums = [1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "95af8e45-3339-46b6-bef5-e65c5e3f93a8",
             input: "nums = [1,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e4175458-ed48-43fa-99c3-f52dc0faff3c",
             input: "nums = [0,0,0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d95627ae-f761-47e1-96ea-6bd525c0cd71",
             input: "nums = [10,10,10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "822613ed-82d2-40ff-8f58-d0abad4ea883",
             input: "nums = [-1,-1,-1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7f04606c-94f4-42a4-9c35-8511d6a05d6e",
             input: "nums = [1,2,3,1,2,3]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "6a836835-f40e-4dda-9417-5e18601e0e1a",
             input: "nums = [1,1,1,1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c8f72f85-9e58-4745-ae62-3d7f9660d479",
             input: "nums = [5,5,5,5,5,5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d24d2c48-57ac-4016-adb8-c70e0f069bb8",
             input: "nums = [-5,-5,-5,-5,-5,-5]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "e3103bec-0f00-4173-8727-609997c1ee9e",
             input: "nums = [1,1,1,1,1,1,1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fb726cf1-827e-47db-8d80-161c000f7d2b",
             input: "nums = [10,20,30,40,50,60,70,80,90]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4740715b-157a-4918-ad59-9ae26d2c4966",
             input: "nums = [100,200,300,400,500,600,700,800,900]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ae33cc7b-7166-4de9-9207-033f2924f9d3",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "95f047f9-b107-46ad-a289-ef0ea016525b",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c0255f80-8a2b-4914-844c-6a25f8b7d3ed",
             input: "nums = [-10,-20,-30,-40,-50,-60,-70,-80,-90]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ef334c56-66d7-4e75-9976-18a5abedf9fa",
             input: "nums = [10,-10,10,-10,10,-10,10,-10,10,-10]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ad5d81b2-b9ce-45e5-8573-703da549171f",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "88fcf818-762b-46ef-bc9d-e863dab73b42",
             input: "nums = [1000,2000,3000,4000,5000,6000,7000,8000,9000]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "40e6d697-641c-477b-ad3b-ed1b7ed84d93",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "67080f4e-dbca-4c93-a2e5-feb07707f819",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "34c5a68a-ba85-4e70-b520-c537e2d5089b",
             input: "nums = [-100,-200,-300,-400,-500,-600,-700,-800,-900]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5e072631-bed8-4aef-b48d-509a2df160cb",
             input: "nums = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "partition-array-into-three-parts-with-equal-sum"
            let topic = "greedy"
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

            guard let p_A = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.count >= 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 3 <= arr.length <= 5 * 104"
                )
                return
            }
            guard p_A.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= arr[i] <= 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.canThreePartsEqualSum(p_A)
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

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
