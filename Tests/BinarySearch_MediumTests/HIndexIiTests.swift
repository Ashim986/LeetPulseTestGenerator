import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCHIndexIi {
    private class Solution {
        func hIndex(_ citations: [Int]) -> Int {
            let n = citations.count
            var low = 0
            var high = n
            while low <= high {
                let mid = low + (high - low) / 2
                if citations.count - mid <= mid && citations[citations.count - mid] >= mid {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            return low
        }
    }

    @Suite struct HIndexIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f7f9d40b-a03b-4e3d-969a-e046914fd2c9",
             input: "citations = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8c5e3d50-a15e-4ccc-83fd-fa50eb5fb998",
             input: "citations = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6861ec29-30bc-442a-a0b4-4a5d32363119",
             input: "citations = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b126636f-fa53-400f-8b8a-3ba6bcade0f1",
             input: "citations = [1000]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6f7271e1-80bc-45eb-b089-1e11cdddabec",
             input: "citations = [-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ba4a4037-0dc6-44ce-aee0-6c4317211533",
             input: "citations = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "481bee6e-39bb-415f-b982-802e7f08b6b7",
             input: "citations = [1,2,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "1f6cd90a-3edd-45e0-8cad-c41111e27114",
             input: "citations = [3,2,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7cf9c07e-ff22-45c2-b53b-956c586bc078",
             input: "citations = [10,10,10,10,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4c9e255d-3afd-4945-990a-a828e003ab31",
             input: "citations = [100,100,100,100,100]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "6de8e022-627b-4177-8b3e-f94474c79709",
             input: "citations = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4025f960-673e-4484-b70f-dcece1cf2bb9",
             input: "citations = [1,0,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1bd22fd1-32b0-4909-b097-d52ad45f1735",
             input: "citations = [0,1,0,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9e5e273e-3c75-4038-9980-ccd133bd435f",
             input: "citations = [0,0,1,0,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ff65ada2-fdee-482e-8002-f515530c0603",
             input: "citations = [0,0,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "78b70a8a-9655-4139-9baa-1502fd7bc182",
             input: "citations = [0,0,0,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "03288b6f-a5ec-4a0c-a9b9-dc392328ca1e",
             input: "citations = [10,20,30,40,50]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "cbd5b8a6-4af3-4af0-8c71-6052911444b4",
             input: "citations = [50,40,30,20,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "198d821d-5082-4da0-a57f-3e06361f85f7",
             input: "citations = [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d04b692e-ca4a-41bc-b340-62de06a34a52",
             input: "citations = [1,1,1,1,1,1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "10f10d2c-119e-4b09-8281-df320cf1f9ed",
             input: "citations = [0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9dc2a1ee-0ecd-49a0-aa1f-1bb38c869977",
             input: "citations = [1,2,3,4,5,6,7,8,9,10]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a4c981e4-1817-46db-9adf-c216b3cfc5c4",
             input: "citations = [10,9,8,7,6,5,4,3,2,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a01cb88e-e681-429a-931d-849b2af0ca46",
             input: "citations = [100,200,300,400,500,600,700,800,900,1000]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "aa1412d4-d6c7-418f-863a-1b2e942d1c05",
             input: "citations = [1000,900,800,700,600,500,400,300,200,100]",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "h-index-ii"
            let topic = "binary-search"
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

            guard let p_citations = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_citations.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: citations array too large (\(p_citations.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_citations.count >= 1 && p_citations.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 105"
                )
                return
            }
            guard p_citations.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= citations[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.hIndex(p_citations)
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
