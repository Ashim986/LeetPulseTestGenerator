import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCReachANumber {
    private class Solution {
        func reachNumber(target: Int) -> Int {
            let target = abs(target)
            var step = 0
            var sum = 0
            while sum < target {
                step += 1
                sum += step
            }
            while (sum - target) % 2 != 0 {
                step += 1
                sum += step
            }
            return step
        }
    }

    @Suite struct ReachANumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a1bc9ac4-bcbd-44fb-981d-a9c6c2d4e065",
             input: "target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "60331082-6dfb-46b9-92e9-0ffd7b7e870d",
             input: "target = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "64fb6528-f7cb-475c-8d43-fdd6983466eb",
             input: "target = -1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "581650c3-81b4-4a90-8eab-05bb34fced9a",
             input: "target = -2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d001bd34-f6f4-438f-8d4f-f37f31b42a90",
             input: "target = -3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "e3d6b5da-b1e0-4f46-bcae-8cec806d9ab1",
             input: "target = 7",
             expected: "5", orderMatters: true),
            TestCaseData(id: "2d69b2e2-5538-4e95-9ff5-ebeb4f4689d4",
             input: "target = -4",
             expected: "3", orderMatters: true),
            TestCaseData(id: "991c0c73-3eb6-454d-b598-acd555cb73ca",
             input: "target = 8",
             expected: "4", orderMatters: true),
            TestCaseData(id: "01650809-761d-40b0-a8d7-d37795e1c53e",
             input: "target = -5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "4a5e271b-ea45-4d6c-a0a5-d8f38bd4de90",
             input: "target = 9",
             expected: "5", orderMatters: true),
            TestCaseData(id: "eda1fe1a-ec3c-44dd-affd-f0783386ca0d",
             input: "target = 10",
             expected: "4", orderMatters: true),
            TestCaseData(id: "8f010ec5-cfd4-437f-9a71-5d0883267067",
             input: "target = -7",
             expected: "5", orderMatters: true),
            TestCaseData(id: "6f9be5b7-064f-4ae8-9a27-dc48f089b3e7",
             input: "target = -8",
             expected: "4", orderMatters: true),
            TestCaseData(id: "0d54a969-a721-4bbf-9cbb-05d4fe681aed",
             input: "target = 12",
             expected: "7", orderMatters: true),
            TestCaseData(id: "6672dfec-09de-4d37-8912-7d80892186e9",
             input: "target = -9",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e2ee9648-5020-4d2b-8b4a-b7b03bdaac43",
             input: "target = 14",
             expected: "7", orderMatters: true),
            TestCaseData(id: "16e872ed-5bae-4faf-9f95-7a59faf97bc7",
             input: "target = -12",
             expected: "7", orderMatters: true),
            TestCaseData(id: "562dab3f-352a-424f-b76b-d092681f104f",
             input: "target = 4",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d8f362cc-2d42-4a52-a993-6aa380f9dcbe",
             input: "target = 6",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9f68e6eb-a7d6-4b19-9132-db0b39882039",
             input: "target = -6",
             expected: "3", orderMatters: true),
            TestCaseData(id: "5b047ae2-a198-4d6d-85fa-057a1331910a",
             input: "target = 11",
             expected: "5", orderMatters: true),
            TestCaseData(id: "01432527-f184-4b41-816e-945055b8527a",
             input: "target = 13",
             expected: "5", orderMatters: true),
            TestCaseData(id: "a2a3e20d-7423-4246-81ea-0a4534e3566f",
             input: "target = -10",
             expected: "4", orderMatters: true),
            TestCaseData(id: "796cc3c5-6b9d-4fdb-92bb-fb49da8dc434",
             input: "target = -11",
             expected: "5", orderMatters: true),
            TestCaseData(id: "04420be3-b417-4ab3-9081-beee7aa933be",
             input: "target = 15",
             expected: "5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "reach-a-number"
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

            guard let p_target = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_target >= -109 && p_target <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= target <= 109"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.reachNumber(target: p_target)
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
