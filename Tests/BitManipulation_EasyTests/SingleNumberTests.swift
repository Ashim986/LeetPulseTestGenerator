import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSingleNumber {
    private class Solution {
        func singleNumber(_ nums: [Int]) -> Int {
            var seen = Set<Int>()
            for num in nums {
                if seen.contains(num) {
                    seen.remove(num)
                } else {
                    seen.insert(num)
                }
            }
            return seen[seen.startIndex]
        }
    }

    @Suite struct SingleNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "10e03eb1-648c-41d1-8749-4a80673c3496",
             input: "nums = [0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f31f8699-b04d-4748-b213-2167fc0a9d12",
             input: "nums = [1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3c5175c0-3cc9-4118-a36d-6f751417bae1",
             input: "nums = [-1,-1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "49822e3d-43a9-4952-ae03-f9cc09281fec",
             input: "nums = [10,20,10]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "383e637a-2597-48a8-b56c-c16ed20163a9",
             input: "nums = [5,5,5,5,6]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "86274b5a-db7a-4af5-8399-df42bd7609ed",
             input: "nums = [-10,-20,-10]",
             expected: "-20", orderMatters: true),
            TestCaseData(id: "5ee4383c-823a-4174-ae66-fd9d83abb442",
             input: "nums = [100,200,100]",
             expected: "200", orderMatters: true),
            TestCaseData(id: "d7890870-6d8b-47ca-a09a-02e70ae60d36",
             input: "nums = [0,0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "545cb383-0cf1-48c5-ac45-8ed00c640bc7",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "be1b593e-c6aa-4044-b7b6-3f62fe6556da",
             input: "nums = [1,2,1,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2b5ff5ba-230b-4426-b9ae-0629795f1efe",
             input: "nums = [-1,-2,-1,-2,-3]",
             expected: "-3", orderMatters: true),
            TestCaseData(id: "ceb46834-bcc3-47e1-be6d-5a52761342f0",
             input: "nums = [10,10,20,20,30]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "af60ec40-a1d3-4b3a-9e1a-21787d62bce3",
             input: "nums = [1000,1000,2000,2000,3000]",
             expected: "3000", orderMatters: true),
            TestCaseData(id: "cfc93a02-855d-4615-a978-49a06562cc22",
             input: "nums = [0,0,0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dabe74f9-5be8-4bcf-8ca8-896853d425b0",
             input: "nums = [1,1,1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "748e6eec-389b-4bfe-910f-66e055fd6fd8",
             input: "nums = [1,2,3,4,5,1,2,3,4]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ad4d477d-286b-4bd5-9b53-c9cfe4f613a2",
             input: "nums = [-1,-2,-3,-4,-5,-1,-2,-3,-4]",
             expected: "-5", orderMatters: true),
            TestCaseData(id: "6fd125f0-7228-4c76-a714-61ba93a3868d",
             input: "nums = [10,20,30,40,50,10,20,30,40]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "cab9a17f-1567-496f-a42a-1038bad443d3",
             input: "nums = [100,200,300,400,500,100,200,300,400]",
             expected: "500", orderMatters: true),
            TestCaseData(id: "15fd9e0f-70fe-4365-a632-a18f2ab948ff",
             input: "nums = [1,1,1,1,1,1,1,1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8eac640a-e5b7-45b5-9018-c8b71e5a7307",
             input: "nums = [0,0,0,0,0,0,0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e48bfbaf-eda6-4ed1-862e-83b81fe62f0b",
             input: "nums = [1,2,3,1,2,3,4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "63c79fd2-300c-4439-9cfc-6cbd21eac948",
             input: "nums = [-1,-2,-3,-1,-2,-3,-4]",
             expected: "-4", orderMatters: true),
            TestCaseData(id: "26039b79-f18e-4733-bd0e-1f3f2632ed88",
             input: "nums = [10,20,30,10,20,30,40]",
             expected: "40", orderMatters: true),
            TestCaseData(id: "0a2b52a7-23f3-4491-8355-75afd0643dfc",
             input: "nums = [100,200,300,100,200,300,400]",
             expected: "400", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "single-number"
            let topic = "bit-manipulation"
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
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 3 * 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.singleNumber(p_nums)
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
