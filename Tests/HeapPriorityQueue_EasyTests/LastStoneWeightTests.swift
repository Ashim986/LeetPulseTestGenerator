import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLastStoneWeight {
    private class Solution {
        func lastStoneWeight(_ stones: [Int]) -> Int {
            // Using sorted array as simple heap
            var heap = stones.sorted(by: >)  // Descending order

            while heap.count > 1 {
                let first = heap.removeFirst()   // Largest
                let second = heap.removeFirst()  // Second largest

                if first != second {
                    let diff = first - second
                    // Binary search insert to maintain sorted order
                    if let idx = heap.firstIndex(where: { $0 < diff }) {
                        heap.insert(diff, at: idx)
                    } else {
                        heap.append(diff)
                    }
                }
            }

            return heap.first ?? 0
        }
    }

    @Suite struct LastStoneWeightTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4a89cfad-8eb6-4807-91be-bf01d99fd0c4",
             input: "stones = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1b7e8154-01b2-4204-8577-819c8a22eb75",
             input: "stones = [0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "fc9fcd99-69b1-4c4c-b37e-5a813c8b1bfd",
             input: "stones = [5]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c2362ee4-5d71-473b-ac59-7dfe99e04022",
             input: "stones = [10, 10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3b364b81-1835-495e-8e3b-23ef639cb0b9",
             input: "stones = [1, 1, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4c83ff9a-12ae-4a6c-ab1f-c486eab465f0",
             input: "stones = [1000, 1000, 1000]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "853f24af-5bbf-4b2a-973b-8b24f1eb65cd",
             input: "stones = [-1, -1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "37fa0e56-edcc-4034-82f5-3012c4437bed",
             input: "stones = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "73eb3000-900d-4767-99f6-97c05fa0e15f",
             input: "stones = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "01dccfe1-f3fa-482a-bd59-50d548fa6ff0",
             input: "stones = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6b34ff40-8bd6-4dda-b146-0b431c515921",
             input: "stones = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "57fbafc5-c256-46b1-9158-ac3ff77b7a39",
             input: "stones = [1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "55888957-d204-4aff-ad8e-a388ef9b783f",
             input: "stones = [-10, 10]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "9f680be5-f409-41c9-9353-f676248189c6",
             input: "stones = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "27229f0f-e6b2-4cdd-9221-4aebe989fd1b",
             input: "stones = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "761d583f-d8d7-4559-9358-46cd16a8f067",
             input: "stones = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10]",
             expected: "53", orderMatters: true),
            TestCaseData(id: "c96370f1-c5f0-43cc-b275-e081e773e391",
             input: "stones = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "45343ff7-230d-4f7c-a138-22efc71ef054",
             input: "stones = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9626a964-64af-4221-a616-aa0a3233ba3f",
             input: "stones = [100, 90, 80, 70, 60, 50, 40, 30, 20, 10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2a884c3d-0993-479e-85b0-e9f53096b32b",
             input: "stones = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5abab5cb-ba3b-4eef-aff7-5e73ff999bf7",
             input: "stones = [19, 17, 15, 13, 11, 9, 7, 5, 3, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4cac16ea-92dc-41a5-9e29-14116ba72935",
             input: "stones = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1000]",
             expected: "955", orderMatters: true),
            TestCaseData(id: "a3be1ca6-4b47-4a4a-9b2b-9357977c57b5",
             input: "stones = [1000, 2, 3, 4, 5, 6, 7, 8, 9, 1]",
             expected: "955", orderMatters: true),
            TestCaseData(id: "f455e291-7a20-447b-9489-1eb276e5ae00",
             input: "stones = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1000]",
             expected: "991", orderMatters: true),
            TestCaseData(id: "9562a836-8aa2-444f-84a6-9b92975be533",
             input: "stones = [1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1]",
             expected: "999", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "last-stone-weight"
            let topic = "heap-priority-queue"
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

            guard let p_stones = InputParser.parseIntArray(params[0]) else {
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
            guard p_stones.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: stones array too large (\(p_stones.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_stones.count >= 1 && p_stones.count <= 30 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= stones.length <= 30"
                )
                return
            }
            guard p_stones.allSatisfy({ $0 >= 1 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= stones[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.lastStoneWeight(p_stones)
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
