import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDistributeCandies {
    private class Solution {
        func distributeCandies(_ candyType: [Int]) -> Int {
            let types = Array(Set(candyType))
            let sisterCount = candyType.count / 2
            return min(types.count, sisterCount)
        }
    }

    @Suite struct DistributeCandiesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "cce96ee3-d2b4-4861-b85e-652a7076336d",
             input: "candyType = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2c40e19b-e88a-4035-9927-7ed3bef3bc06",
             input: "candyType = [1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6dad5d1e-f6d5-423a-9177-24c73fbf10a3",
             input: "candyType = [1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "85ea4dd9-8d08-4a45-beec-4092f0ab49bb",
             input: "candyType = [1,2,2,2,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ceebc7fc-212f-4cba-97a3-a321039b4b98",
             input: "candyType = [-1,-1,-1,-1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "18706460-6bb4-47fc-9b9a-21332ccc10fd",
             input: "candyType = [0,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bdda428f-8db0-4560-9f1c-c8be9cfa318f",
             input: "candyType = [1,1,1,2,2,2,3,3,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "c4ec581a-28f2-4f3e-a58c-c5bbf38c3400",
             input: "candyType = [1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6bc2c164-b8ab-4352-91e2-a0a5d858ff8c",
             input: "candyType = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7d69981a-c3c6-42e2-aec8-c40e9cad7aa2",
             input: "candyType = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5381cbe2-70ce-4181-b604-8d12edc59513",
             input: "candyType = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4569a792-6715-4ee4-8d01-729d91acc4e6",
             input: "candyType = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8f634168-271e-434b-b325-221043204801",
             input: "candyType = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3843ac5c-0911-4952-accf-1aee19e4d4c1",
             input: "candyType = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bbb738a8-7318-4b1c-9126-1e92c81f7bee",
             input: "candyType = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "21aa83e5-5cd7-4f07-8560-70049bbbcb0e",
             input: "candyType = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0b44f290-b4d5-4406-8d1f-87ed19128b3d",
             input: "candyType = [1,2]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "94cc7e24-79a0-4b43-9405-c3ffe9fae588",
             input: "candyType = [1,2,3]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a6beb5a2-c4e9-43f1-86ed-894777b08551",
             input: "candyType = [10,20,30,40,50]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "eb252f06-56ac-429e-93bf-ccc51c67c112",
             input: "candyType = [1,2,3,4,5,6,7,8,9,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "8baa04b1-1321-49f7-a6ae-b38f61734a22",
             input: "candyType = [10,9,8,7,6,5,4,3,2,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "aa7f34e1-ab00-4eec-8bba-d2900bba490f",
             input: "candyType = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "76a5f913-dd25-4502-bc08-d12b312161ab",
             input: "candyType = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "70c94ad8-a7d0-4c80-8541-32483ecc5bf5",
             input: "candyType = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "2d603275-73a3-4273-b3d7-440926610d64",
             input: "candyType = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "distribute-candies"
            let topic = "arrays-hashing"
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

            guard let p_candyType = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_candyType.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: candyType array too large (\(p_candyType.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_candyType.count >= 2 && p_candyType.count <= 10000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= n <= 10^4"
                )
                return
            }
            guard p_candyType.allSatisfy({ $0 >= -100000 && $0 <= 100000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10^5 <= candyType[i] <= 10^5"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.distributeCandies(p_candyType)
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
