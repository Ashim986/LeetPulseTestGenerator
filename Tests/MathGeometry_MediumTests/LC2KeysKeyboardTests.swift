import Foundation
@testable import LeetCodeHelpers
import Testing

enum LC2KeysKeyboard {
    private class Solution {
        func minSteps(_ n: Int) -> Int {
            var queue = [(Int, Int)]()
            queue.append((1, 0))
            var visited = Set<Int>()
            visited.insert(1)
            while !queue.isEmpty {
                let (curr, steps) = queue.removeFirst()
                if curr == n {
                    return steps
                }
                for i in 2...curr {
                    if curr * i <= n && !visited.contains(curr * i) {
                        queue.append((curr * i, steps + i))
                        visited.insert(curr * i)
                    }
                }
                if curr + 1 <= n && !visited.contains(curr + 1) {
                    queue.append((curr + 1, steps + 1))
                    visited.insert(curr + 1)
                }
            }
            return -1
        }
    }

    @Suite struct LC2KeysKeyboardTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a78ae0b9-fda8-4440-9abe-f4b5fc51d0d1",
             input: "n = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e08076e8-a1db-41db-ae14-f3ea59c7aa2c",
             input: "n = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e76605e1-2749-4c43-ae8b-59c6bb5007b1",
             input: "n = 4",
             expected: "4", orderMatters: true),
            TestCaseData(id: "6273f472-a16d-4dd5-8b9c-9a91ccd40f83",
             input: "n = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e149bb5c-81c6-4adf-88d2-33d716454fdd",
             input: "n = 8",
             expected: "6", orderMatters: true),
            TestCaseData(id: "21aee041-5bca-4162-9e65-b01a8a6e347d",
             input: "n = 9",
             expected: "6", orderMatters: true),
            TestCaseData(id: "a1783eb0-c9d6-4c79-9988-eb2f14b3e497",
             input: "n = 10",
             expected: "7", orderMatters: true),
            TestCaseData(id: "2fd9303c-fc77-41a9-8cfe-04c4d01c6ff3",
             input: "n = 12",
             expected: "7", orderMatters: true),
            TestCaseData(id: "59b6536e-0732-466e-a5b9-3b23412a1108",
             input: "n = 15",
             expected: "8", orderMatters: true),
            TestCaseData(id: "093bd27c-16c2-4a9c-8f4a-b08c81df7818",
             input: "n = 16",
             expected: "8", orderMatters: true),
            TestCaseData(id: "56107541-a7c2-4b94-b63f-f945d433ce7d",
             input: "n = 20",
             expected: "9", orderMatters: true),
            TestCaseData(id: "996ab61c-2a8c-42db-9f31-351399225bf0",
             input: "n = 25",
             expected: "10", orderMatters: true),
            TestCaseData(id: "850bdfe0-3b19-48ea-9239-2b7f97cc87a5",
             input: "n = 70",
             expected: "14", orderMatters: true),
            TestCaseData(id: "e0ddb9d3-1515-4eb3-93ee-41319e5cb32c",
             input: "n = 7",
             expected: "7", orderMatters: true),
            TestCaseData(id: "2bce8dc0-985f-4df8-aa2c-bc70b868a8a2",
             input: "n = 11",
             expected: "11", orderMatters: true),
            TestCaseData(id: "5db01e42-274b-4438-8253-c6ec6c485d9e",
             input: "n = 27",
             expected: "9", orderMatters: true),
            TestCaseData(id: "884232da-1465-40b6-ab95-db9bea20beed",
             input: "n = 30",
             expected: "10", orderMatters: true),
            TestCaseData(id: "03dd3561-08af-464e-89ea-533034b85fa6",
             input: "n = 32",
             expected: "10", orderMatters: true),
            TestCaseData(id: "8c224da9-671f-4239-ae8f-5b786e048545",
             input: "n = 35",
             expected: "10", orderMatters: true),
            TestCaseData(id: "6b44d59e-9276-469f-8440-c9b1d4b49ba1",
             input: "n = 40",
             expected: "10", orderMatters: true),
            TestCaseData(id: "3a65a5a4-8355-4a34-9d01-6cb9ad570d08",
             input: "n = 45",
             expected: "10", orderMatters: true),
            TestCaseData(id: "e5010668-abc9-4393-abf3-8c27dea1a7ab",
             input: "n = 50",
             expected: "12", orderMatters: true),
            TestCaseData(id: "bbf052e9-a6ec-4b14-aa96-ea03bc46ee1b",
             input: "n = 55",
             expected: "16", orderMatters: true),
            TestCaseData(id: "720ec868-3820-4000-97a6-4dd612c6ab00",
             input: "n = 60",
             expected: "12", orderMatters: true),
            TestCaseData(id: "744899e4-b6ac-43d6-9894-d0323331afe2",
             input: "n = 64",
             expected: "12", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "2-keys-keyboard"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
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
            guard p_n >= 1 && p_n <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.minSteps(p_n)
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
