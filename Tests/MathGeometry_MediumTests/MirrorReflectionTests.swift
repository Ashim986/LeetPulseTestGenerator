import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMirrorReflection {
    private class Solution {
        func mirrorReflectionOptimized(_ p: Int, _ q: Int) -> Int {
            if q % 2 == 0 {
                return 2
            } else {
                if p % 2 == 0 {
                    return 0
                } else {
                    return 1
                }
            }
        }
    }

    @Suite struct MirrorReflectionTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3d765cf5-7069-4de4-8415-4cfe5e99c0a9",
             input: "p = 1, q = 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "663e9778-43ad-4404-9474-0f3c77b4d0e5",
             input: "p = 3, q = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "15f81844-cb4f-4ff6-a14e-043c0818136b",
             input: "p = 8, q = 7",
             expected: "1", orderMatters: true),
            TestCaseData(id: "eedd31fd-680f-478d-b225-2cc79ff84eb0",
             input: "p = 11, q = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5756bddf-02de-4aa4-b582-ea34b902dc31",
             input: "p = 19, q = 18",
             expected: "1", orderMatters: true),
            TestCaseData(id: "22c4e7f9-da17-4456-b9ec-8f1c9a479464",
             input: "p = 0, q = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ec837c85-835c-4dbc-afd9-c1bb95db27c5",
             input: "p = 1, q = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "859760ec-61be-427e-9abb-47b373ed029b",
             input: "p = 1, q = 100",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6c34c7a8-3a9f-46da-bedd-7e4fd6c248c7",
             input: "p = 1000, q = 1000",
             expected: "1", orderMatters: true),
            TestCaseData(id: "76340b19-a558-4cd7-80a2-9fe3807193c0",
             input: "p = 1, q = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e07288ed-4f54-4697-8449-91fe16b0c639",
             input: "p = 1, q = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9fda6d2a-40b2-4823-b073-9ab9043f2d76",
             input: "p = 2, q = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a03e211c-774b-4fd0-8142-7cbde8902467",
             input: "p = 4, q = 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4e0b118b-2970-4901-88b4-6c7ac0827319",
             input: "p = 5, q = 4",
             expected: "0", orderMatters: true),
            TestCaseData(id: "de146711-b2b1-4f7d-afe6-103a86b9d536",
             input: "p = 6, q = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ecdc6817-b6d3-4482-9c74-d8dc7dabbfe0",
             input: "p = 7, q = 6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4264b9b8-683b-4c5d-8846-27e71c0918f2",
             input: "p = 9, q = 8",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d8bb3af6-a560-4079-9b4f-dd6ad8be6707",
             input: "p = 10, q = 9",
             expected: "1", orderMatters: true),
            TestCaseData(id: "24eee96c-0fbf-40c5-a5c2-bc2af75d6836",
             input: "p = 12, q = 11",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6c8585c1-33c6-43d0-be8e-dbdcf778bc69",
             input: "p = 13, q = 12",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b86216ff-d002-45f6-8e53-5c5daff20754",
             input: "p = 14, q = 13",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5f207200-690f-423f-8254-9984ae1d42bb",
             input: "p = 15, q = 14",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a7007249-310f-49c2-a685-8accbd4320ca",
             input: "p = 16, q = 15",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0358a943-3f61-439b-ad82-14456ff81742",
             input: "p = 17, q = 16",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6cddbc8a-ae6c-40e1-9da4-1832090ca9e4",
             input: "p = 18, q = 17",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "mirror-reflection"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_p = InputParser.parseInt(params[0]) else {
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
            guard let p_q = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_q >= 1 && p_q <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= q <= p <= 1000"
                )
                return
            }
            guard p_p >= 1 && p_p <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= q <= p <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.mirrorReflectionOptimized(p_p, p_q)
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
