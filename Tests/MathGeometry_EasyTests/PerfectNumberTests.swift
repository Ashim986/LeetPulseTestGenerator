import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPerfectNumber {
    private class Solution {
        func checkPerfectNumber(_ num: Int) -> Bool { var sum = 1
        let sqrtNum = Int(sqrt(Double(num)))
        for i in 2...sqrtNum { if num % i == 0 { sum += i
        if i != num / i { sum += num / i } } }
        return sum == num }
    }

    @Suite struct PerfectNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "abebb991-6071-49fc-af9b-dd0468307ed3",
             input: "num = 1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "988f0514-e269-472b-b433-7e6cb571b4d9",
             input: "num = -1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "fb3d41b7-667f-40e6-b4ee-550373ec5973",
             input: "num = -28",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e2160608-f625-45e8-a300-62038101c3e3",
             input: "num = 2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c20cef14-ff66-41c2-957c-9b66347a1b3c",
             input: "num = 3",
             expected: "false", orderMatters: true),
            TestCaseData(id: "822def32-436b-41e3-8937-ee2e8b03306f",
             input: "num = 4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0bf46fc0-ca22-4294-b37c-d2f86a930939",
             input: "num = 5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "22a642ba-bd9e-4572-8fcd-7032a94cc192",
             input: "num = 7",
             expected: "false", orderMatters: true),
            TestCaseData(id: "19071c51-bde3-46ee-b5b4-b94069343849",
             input: "num = 8",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c65573f1-b032-4961-90db-d8260ea37e1f",
             input: "num = 9",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0f495402-97b9-4e62-a1d4-46052ffac70d",
             input: "num = 10",
             expected: "false", orderMatters: true),
            TestCaseData(id: "cada7451-3dc5-4aef-bf23-e167f8bc6b65",
             input: "num = 20",
             expected: "false", orderMatters: true),
            TestCaseData(id: "39d0ff75-8c45-4997-ab46-c06bfae48cf3",
             input: "num = 30",
             expected: "false", orderMatters: true),
            TestCaseData(id: "0798ee32-09b7-41cb-be88-ce847784d6e8",
             input: "num = 496",
             expected: "true", orderMatters: true),
            TestCaseData(id: "53c8495c-4b85-4236-a546-18358b3b6697",
             input: "num = 8128",
             expected: "true", orderMatters: true),
            TestCaseData(id: "40de7ac2-e668-433b-89eb-f769990cd87f",
             input: "num = 33550336",
             expected: "true", orderMatters: true),
            TestCaseData(id: "70946f89-d8b9-4f04-8550-5de16137f28a",
             input: "num = 100000000",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b6f2ac14-0bc9-4bfa-bf4e-1cdacd36d49b",
             input: "num = 999999999",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ddc31644-e020-40c9-8427-20cf188a0411",
             input: "num = -1000000000",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c499466f-8366-44e5-9eeb-355c17f46ddc",
             input: "num = -999999999",
             expected: "false", orderMatters: true),
            TestCaseData(id: "580cf74e-561d-4b0a-ab8b-abe7acf7f2ab",
             input: "num = -496",
             expected: "false", orderMatters: true),
            TestCaseData(id: "445b609a-70e4-4bda-951d-d593f842e6b2",
             input: "num = -8128",
             expected: "false", orderMatters: true),
            TestCaseData(id: "33cda58f-5511-4c2a-8cc6-a172751dbd47",
             input: "num = -33550336",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7b935542-7493-49cd-a15f-7b9c54cfc6ad",
             input: "num = 0",
             expected: "true", orderMatters: true),
            TestCaseData(id: "8d4dcd3d-f3b5-4874-9174-af555b7c8979",
             input: "num = 12",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "perfect-number"
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

            guard let p_num = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_num >= 1 && p_num <= 108 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= num <= 108"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.checkPerfectNumber(p_num)
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
