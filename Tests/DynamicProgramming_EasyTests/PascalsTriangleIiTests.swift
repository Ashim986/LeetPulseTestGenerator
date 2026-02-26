import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPascalsTriangleIi {
    private class Solution {
        func getRow(_ rowIndex: Int) -> [Int] {
            var row: [Int] = [1]
            for _ in 1...rowIndex {
                var newRow: [Int] = [1]
                for i in 1..<row.count {
                    newRow.append(row[i-1] + row[i])
                }
                newRow.append(1)
                row = newRow
            }
            return row
        }
    }

    @Suite struct PascalsTriangleIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "8882afa5-f352-47ad-bab6-b8bd26d7006a",
             input: "rowIndex = 2",
             expected: "[1,2,1]", orderMatters: true),
            TestCaseData(id: "4ab15b51-0f86-4f84-bbcb-1a1c01ad7680",
             input: "rowIndex = 6",
             expected: "[1,6,15,20,15,6,1]", orderMatters: true),
            TestCaseData(id: "b6affa98-c107-4612-b322-c2f73e74aa5f",
             input: "rowIndex = 7",
             expected: "[1,7,21,35,35,21,7,1]", orderMatters: true),
            TestCaseData(id: "7508e2fe-870c-4f9f-9a1f-229e77a50da7",
             input: "rowIndex = 8",
             expected: "[1,8,28,56,70,56,28,8,1]", orderMatters: true),
            TestCaseData(id: "9c337231-aeef-4361-9067-b017ca98ce8d",
             input: "rowIndex = 9",
             expected: "[1,9,36,84,126,126,84,36,9,1]", orderMatters: true),
            TestCaseData(id: "3827d481-564b-4a2c-af74-106506a317da",
             input: "rowIndex = 11",
             expected: "[1,11,55,165,330,462,462,330,165,55,11,1]", orderMatters: true),
            TestCaseData(id: "c7c89488-b565-40b9-a6e8-ce9485807b4c",
             input: "rowIndex = 12",
             expected: "[1,12,66,220,495,792,924,792,495,220,66,12,1]", orderMatters: true),
            TestCaseData(id: "08a4d9ea-db5e-4dfa-957a-37d1da2e48ce",
             input: "rowIndex = 13",
             expected: "[1,13,78,286,715,1287,1716,1716,1287,715,286,78,13,1]", orderMatters: true),
            TestCaseData(id: "aaca6b16-15d2-4204-8045-6fd2dd63b14f",
             input: "rowIndex = 14",
             expected: "[1,14,91,364,1001,2002,3003,3432,3003,2002,1001,364,91,14,1]", orderMatters: true),
            TestCaseData(id: "56201527-483c-4f94-8eb6-af4a432455a3",
             input: "rowIndex = 15",
             expected: "[1,15,105,455,1365,3003,5005,6435,6435,5005,3003,1365,455,105,15,1]", orderMatters: true),
            TestCaseData(id: "433d5102-d6bd-4d36-bc92-19f08a3eb0c3",
             input: "rowIndex = 3",
             expected: "[1,3,3,1]", orderMatters: true),
            TestCaseData(id: "8cec68b8-a41e-471f-9be1-8f0eea579e56",
             input: "rowIndex = 0",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "e55cd208-af26-4efb-a5a2-e9a2447dd301",
             input: "rowIndex = 1",
             expected: "[1,1]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "pascals-triangle-ii"
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

            guard let p_rowIndex = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_rowIndex >= 0 && p_rowIndex <= 33 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= rowIndex <= 33"
                )
                return
            }

            let solution = Solution()
            let result = solution.getRow(p_rowIndex)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
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
