import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSumOfSquareNumbers {
    private class Solution {
        func judgeSquareSum(_ c: Int) -> Bool {
            var set = Set<Int>()
            var i = 0
            while i * i <= c {
                set.insert(i * i)
                i += 1
            }
            for square in set {
                if set.contains(c - square) {
                    return true
                }
            }
            return false
        }
    }

    @Suite struct SumOfSquareNumbersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "c0841656-eb57-40b9-a991-bc3b89c0308d",
             input: "c = 0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "697d4362-ba9f-4a82-8927-e7f4d67630b1",
             input: "c = 1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8c1cb665-60ed-465d-b199-92205413096b",
             input: "c = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "988bb56b-f791-4344-9ca0-9f7b10403370",
             input: "c = 4",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2b5a0ae6-833f-4535-b529-c02eece4b854",
             input: "c = 9",
             expected: "true", orderMatters: true),
            TestCaseData(id: "eaee06f4-237b-4058-92be-3ce6e4f4bb0c",
             input: "c = 16",
             expected: "true", orderMatters: true),
            TestCaseData(id: "b897a89d-98d4-4da8-8695-124f83e90037",
             input: "c = 25",
             expected: "true", orderMatters: true),
            TestCaseData(id: "405aa9f5-2df0-4b2b-b40c-166598500497",
             input: "c = 36",
             expected: "true", orderMatters: true),
            TestCaseData(id: "32c6ab02-79ef-4ea4-8ad0-1e10247be7ac",
             input: "c = 49",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cd81ee8b-7ad7-4dd8-8886-aa82feae0a4c",
             input: "c = 64",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6f3a49f7-2700-4b18-9354-f7c188091ce0",
             input: "c = 81",
             expected: "true", orderMatters: true),
            TestCaseData(id: "03ff7ed0-d6d1-420a-8f70-0114312e03ad",
             input: "c = 100",
             expected: "true", orderMatters: true),
            TestCaseData(id: "08ddc4df-0c7d-4299-82bf-0e252c84a873",
             input: "c = 121",
             expected: "true", orderMatters: true),
            TestCaseData(id: "33236c29-af75-401f-b9b3-7d644a25d01f",
             input: "c = 144",
             expected: "true", orderMatters: true),
            TestCaseData(id: "386b2a26-b31f-4490-9def-3466ba6d2552",
             input: "c = 169",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4a137666-acbe-45f1-9168-33f1f3ad1d4a",
             input: "c = 196",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5b29832e-65fc-48ef-9c7d-a8f5e0b7661f",
             input: "c = 225",
             expected: "true", orderMatters: true),
            TestCaseData(id: "24776581-f468-4578-b1b0-bfb0fd55223a",
             input: "c = 256",
             expected: "true", orderMatters: true),
            TestCaseData(id: "06007fbd-9879-4c29-b5ef-ab36e172b7b1",
             input: "c = 289",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6611ece0-5660-4501-b07b-7d804dfb0fa7",
             input: "c = 324",
             expected: "true", orderMatters: true),
            TestCaseData(id: "145bd42a-85fc-4ce2-905f-681e448f0c19",
             input: "c = 361",
             expected: "true", orderMatters: true),
            TestCaseData(id: "31a55219-f1c0-4eb3-90dd-2b2fde645436",
             input: "c = 400",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a283ff0b-1bed-4bdc-a121-07aedd1b1276",
             input: "c = 441",
             expected: "true", orderMatters: true),
            TestCaseData(id: "bc6d3fcf-f111-42c3-bbd7-42e3d2a55ea2",
             input: "c = 484",
             expected: "true", orderMatters: true),
            TestCaseData(id: "028dc0db-d33c-4ca9-8e88-f50ad831757b",
             input: "c = 529",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "sum-of-square-numbers"
            let topic = "math-geometry"
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

            guard let p_c = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_c >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= c <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.judgeSquareSum(p_c)
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
