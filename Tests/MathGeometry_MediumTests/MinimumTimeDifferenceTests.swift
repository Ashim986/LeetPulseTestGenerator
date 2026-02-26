import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumTimeDifference {
    private class Solution {
        func findMinDifference(_ timePoints: [String]) -> Int {
            var times: [Int] = []
            for timePoint in timePoints {
                let components = timePoint.components(separatedBy: ":")
                let hours = Int(components[0]).unsafelyUnwrapped
                let minutes = Int(components[1]).unsafelyUnwrapped
                times.append(hours * 60 + minutes)
            }
            times.sort()
            var minDiff = times[1] - times[0]
            for i in 2..<times.count {
                minDiff = min(minDiff, times[i] - times[i-1])
            }
            minDiff = min(minDiff, 24 * 60 - times[times.count - 1] + times[times.startIndex])
            return minDiff
        }
    }

    @Suite struct MinimumTimeDifferenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "3bacc2d5-3f3c-4eb7-a88c-faf55a224518",
             input: "timePoints = [\"00:00\",\"00:00\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "646cc269-dbaa-4473-8e98-73d3466cd9ae",
             input: "timePoints = [\"00:00\",\"23:59\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cf86241e-3eaa-41ee-8334-30338b1484c4",
             input: "timePoints = [\"12:00\",\"12:00\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "84a58a27-6c20-489e-9f20-59f4d400122c",
             input: "timePoints = [\"00:00\",\"00:01\",\"00:02\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ae1266fb-9bcf-40b1-a7c4-1348e878e207",
             input: "timePoints = [\"23:59\",\"00:00\",\"00:01\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1a09f828-cc71-4e64-8922-2620f89017f0",
             input: "timePoints = [\"12:00\",\"12:01\",\"12:02\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c59cb4de-cef4-4ada-a936-e51cf07004e2",
             input: "timePoints = [\"00:00\",\"00:00\",\"00:00\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e00c3a95-b5bd-4d10-9bfc-26242cf96d76",
             input: "timePoints = [\"23:59\",\"23:59\",\"23:59\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "51c76d7b-cd44-4772-a1e2-7a8c00813077",
             input: "timePoints = [\"12:00\",\"12:00\",\"12:00\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "768b8f88-461e-4f1e-88bf-2f61ef20a05d",
             input: "timePoints = [\"00:00\",\"00:01\",\"00:02\",\"00:03\",\"00:04\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "526aca50-efdb-410e-88ec-9141501d1ce7",
             input: "timePoints = [\"23:59\",\"00:00\",\"00:01\",\"00:02\",\"00:03\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "429ad70c-91b1-4d2d-af04-40903922c67d",
             input: "timePoints = [\"12:00\",\"12:01\",\"12:02\",\"12:03\",\"12:04\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "04f2eb64-422c-49f7-af6b-4efe9f860574",
             input: "timePoints = [\"00:00\",\"00:00\",\"00:00\",\"00:00\",\"00:00\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "31f7880b-6c49-455f-8438-2bdf39f58a6e",
             input: "timePoints = [\"23:59\",\"23:59\",\"23:59\",\"23:59\",\"23:59\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cf0b03ab-74ce-42e7-ba57-1c7db6bc3d17",
             input: "timePoints = [\"12:00\",\"12:00\",\"12:00\",\"12:00\",\"12:00\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8ab96ae7-1372-4f87-83f0-0144fa6e7165",
             input: "timePoints = [\"00:00\",\"00:01\",\"00:02\",\"00:03\",\"00:04\",\"00:05\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5db5bda4-67b4-46e4-a353-e84cd87c2c32",
             input: "timePoints = [\"23:59\",\"00:00\",\"00:01\",\"00:02\",\"00:03\",\"00:04\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "61e21053-af73-4299-819d-e51a48a06378",
             input: "timePoints = [\"12:00\",\"12:01\",\"12:02\",\"12:03\",\"12:04\",\"12:05\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9d803a22-815e-4536-b0ec-bfff7944c8c6",
             input: "timePoints = [\"00:00\",\"00:00\",\"00:00\",\"00:00\",\"00:00\",\"00:00\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3f970dbd-c081-4268-9581-0778354e3023",
             input: "timePoints = [\"23:59\",\"23:59\",\"23:59\",\"23:59\",\"23:59\",\"23:59\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6f5af22b-d501-4b69-8df8-217301d6255f",
             input: "timePoints = [\"12:00\",\"12:00\",\"12:00\",\"12:00\",\"12:00\",\"12:00\"]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "031187cc-06cb-4032-ba92-58685663e36c",
             input: "timePoints = [\"23:59\",\"00:00\",\"12:00\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ab8024a1-df66-4d93-b276-54a5ea387185",
             input: "timePoints = [\"00:00\",\"00:01\",\"00:02\",\"00:03\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c59cf9b4-979b-4c69-8085-1d663cbd1598",
             input: "timePoints = [\"23:59\",\"00:00\",\"00:01\",\"00:02\"]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f034e1e3-814f-469f-bfe8-0728a4c6dc41",
             input: "timePoints = [\"12:00\",\"12:01\",\"12:02\",\"12:03\"]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-time-difference"
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

            guard let p_timePoints = InputParser.parseStringArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [String]"
                )
                return
            }
            guard p_timePoints.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: timePoints array too large (\(p_timePoints.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_timePoints.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= timePoints.length <= 2 * 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.findMinDifference(p_timePoints)
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
