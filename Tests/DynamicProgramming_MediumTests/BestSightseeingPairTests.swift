import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBestSightseeingPair {
    private class Solution {
        func maxScoreSightseeingPair(_ A: [Int]) -> Int {
            var res = 0, maxScore = A[0] + 0
            for j in 1..<A.count {
                res = max(res, maxScore + A[j] - j)
                maxScore = max(maxScore, A[j] + j)
            }
            return res
        }
    }

    @Suite struct BestSightseeingPairTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "0d53d666-cdab-4e99-afb2-32dbfea07a83",
             input: "nums = [1,2,3,4,5]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "d7a149f9-2403-44e5-8464-03c6d6ad0145",
             input: "nums = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b6306b03-b90c-4636-b4f9-3440ee8daf58",
             input: "nums = [100,99,98,97,96,95,94,93,92,91]",
             expected: "198", orderMatters: true),
            TestCaseData(id: "8153cf53-e6dd-4d02-aae3-e6ad62274227",
             input: "nums = [10000,9999,9998,9997,9996,9995,9994,9993,9992,9991,9990,9989,9988,9987,9986,9985,9984,9983,9982,9981]",
             expected: "19998", orderMatters: true),
            TestCaseData(id: "3b3232a8-fb2d-4d0c-9a45-8d50f8a5a59b",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0ce14732-b67b-464c-bbbd-e7ec288d096d",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "02935772-6261-42f6-b568-3b71ba4ab7c7",
             input: "nums = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "470aeaea-0950-4b0e-9664-f674fb2607f3",
             input: "nums = [0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8607468c-aa6e-487e-b565-e1959266ab61",
             input: "nums = [1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "723aa343-227d-4018-a95e-a82ba72ef484",
             input: "nums = [5,4,3,2,1]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "b94babef-4d96-493b-8696-231cdf6d698f",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "c4b3cf51-cf6d-475a-9ac3-5d63975224d8",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "485b8575-e4c2-4a08-a7e8-a0626c81768b",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "31308547-c5ce-4084-9a65-b482bf8abb7c",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a8b03440-6cb4-4762-9195-0e02cecfe94d",
             input: "nums = [1,100,1,100,1,100,1,100,1,100]",
             expected: "198", orderMatters: true),
            TestCaseData(id: "5fc3867c-31e4-4d43-8f5d-01352658f6d0",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "28", orderMatters: true),
            TestCaseData(id: "96a46748-c5a2-4d85-b37a-82fa26b5d1e4",
             input: "nums = [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "28", orderMatters: true),
            TestCaseData(id: "2c2b54d5-5fa1-40d8-a0f7-a4d8b5fa86cc",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "14fb5ee4-d7bb-49b6-8874-d7a0f6ea9319",
             input: "nums = [1000,999,998,997,996,995,994,993,992,991,990,989,988,987,986]",
             expected: "1998", orderMatters: true),
            TestCaseData(id: "c8be228b-7a54-4e6d-b7eb-bcc80e5346ad",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "38", orderMatters: true),
            TestCaseData(id: "57dbef0f-fb4f-41d1-b219-5727dd308c97",
             input: "nums = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "38", orderMatters: true),
            TestCaseData(id: "a6c453c5-33f3-429e-a5c5-7821b02a51ac",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c91afe95-57e3-452b-9013-8e6c0690e772",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]",
             expected: "48", orderMatters: true),
            TestCaseData(id: "0b8aa7ce-39d5-4726-8de2-7e79355449b0",
             input: "nums = [25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "48", orderMatters: true),
            TestCaseData(id: "cd61a162-caa8-42ff-9489-34ac3db7b968",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "best-sightseeing-pair"
            let topic = "dynamic-programming"
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

            // Constraint precondition checks
            guard p_A.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= values.length <= 5 * 104"
                )
                return
            }
            guard p_A.allSatisfy({ $0 >= 1 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= values[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.maxScoreSightseeingPair(p_A)
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
