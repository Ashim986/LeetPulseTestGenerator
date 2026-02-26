import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRabbitsInForest {
    private class Solution {
        func numRabbits(_ answers: [Int]) -> Int {
            var counts: [Int: Int] = [:]
            for answer in answers {
                counts[answer, default: 0] += 1
            }
            var result = 0
            for (answer, count) in counts {
                result += (count + answer) / (answer + 1) * (answer + 1)
            }
            return result
        }
    }

    @Suite struct RabbitsInForestTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f96672e9-611d-4f4e-a58b-265ac0984c79",
             input: "answers = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "31cff292-2c8c-453d-bfb2-0aa1b877c571",
             input: "answers = [0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "51c7a242-6f3e-4474-aadb-2895ae8892a6",
             input: "answers = [1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "71eea454-3975-4aa4-9f8e-ab46da778978",
             input: "answers = [2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1383594e-c11d-4f35-a13e-471bdd293d9d",
             input: "answers = [10]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "da72669a-85ca-4b9c-8b5d-5c17461c5847",
             input: "answers = [100]",
             expected: "101", orderMatters: true),
            TestCaseData(id: "38407619-2b3d-4fa3-a459-13221ad9c16c",
             input: "answers = [1000]",
             expected: "1001", orderMatters: true),
            TestCaseData(id: "87863d05-7d92-440c-b1b2-c7cd7db2b7d3",
             input: "answers = [10,10]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "f7dcb022-037e-4f0d-a562-487692564c24",
             input: "answers = [1,1,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "13b3e0fd-e22c-41ef-9e96-af27293830c2",
             input: "answers = [10,10,10,10]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "189ed33f-8fe5-49f7-ac25-c69bc80255b2",
             input: "answers = [1,1,1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "0167e905-8932-42c5-b9d8-a29a4b5237fd",
             input: "answers = [10,10,10,10,10,10]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "48494c6d-d095-4073-ba4c-afc5eb4fd9a8",
             input: "answers = [0,0,0,0,0]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "5be7fd59-652a-4f33-a00f-36893db9fd70",
             input: "answers = [1,0,1,0,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "114f449a-866b-48d1-8244-c6818b344363",
             input: "answers = [1,1,2,2,3]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "dd2954a5-14b2-4490-a2e7-e3a651675309",
             input: "answers = [3,2,2,1,1]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "6dbc46d1-6d89-4791-a9bf-37d17db4b642",
             input: "answers = [1,1,1,1,1,1,1]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "651d278f-5e37-4aff-95e1-d7232edf4e80",
             input: "answers = [2,2,2,2,2,2,2]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "5e040e3b-7a87-48a1-ae00-1a69823af9cf",
             input: "answers = [10,10,10,10,10,10,10,10,10,10]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "99831acf-e050-46d3-a219-2730b32f0d1c",
             input: "answers = [100,100,100,100,100,100,100,100,100,100]",
             expected: "101", orderMatters: true),
            TestCaseData(id: "6e082e84-c689-498a-840c-4b7e08c37655",
             input: "answers = [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000]",
             expected: "1001", orderMatters: true),
            TestCaseData(id: "93ea1831-e9d6-4888-86a8-057190fbacc4",
             input: "answers = [1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "32c5408e-c9c1-4085-9c55-9e3072a8a7aa",
             input: "answers = [2,2]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e97eb26b-1036-4c37-aca5-c880598566da",
             input: "answers = [1,2]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f3a1cfb7-e700-47b3-8538-6da52388b0da",
             input: "answers = [1,2,3]",
             expected: "9", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "rabbits-in-forest"
            let topic = "math-geometry"
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

            guard let p_answers = InputParser.parseIntArray(params[0]) else {
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
            guard p_answers.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: answers array too large (\(p_answers.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_answers.count >= 1 && p_answers.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= answers.length <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.numRabbits(p_answers)
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
