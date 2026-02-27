import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCStudentAttendanceRecordI {
    private class Solution {
        func checkRecord(_ s: String) -> Bool {
            return s.count(where: { $0 == "A" }) < 2 && !s.contains("LLL")
        }
    }

    @Suite struct StudentAttendanceRecordITests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5ecab3ac-e08d-4ada-82d0-372e9aa93f29",
             input: "s = \"\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "746d2813-1b51-454d-bf26-cdc9566e51d4",
             input: "s = \"P\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f71d31a3-6059-4993-a777-7190417ba08f",
             input: "s = \"A\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "439de213-e3b5-41b7-84dc-4dee8ecffd06",
             input: "s = \"L\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7d7b409f-8d23-4711-bf40-dc5a6a3f221f",
             input: "s = \"PA\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "244578ca-3f2c-4e3a-bb8e-cbffa2d29d80",
             input: "s = \"PL\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "471bab8a-58e8-4e28-8515-6264044f6470",
             input: "s = \"AL\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d40d1a30-074d-4f9f-8302-65110e8120d4",
             input: "s = \"LLL\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a9723197-e7bc-478e-93c5-5901a655e93e",
             input: "s = \"AAA\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b178bd98-bb39-43a7-9836-082de3c4af3f",
             input: "s = \"PPP\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "a048693b-df46-41d3-af14-b5027d60f2aa",
             input: "s = \"AAP\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "949f0063-3f9b-42e8-b0ad-8646d470b1cd",
             input: "s = \"PAL\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "db746483-509b-44f7-8686-5db6e1f5521e",
             input: "s = \"APL\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "bc39fb9c-60fd-4be3-bcda-6aecc9c66719",
             input: "s = \"LPA\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3d16bfa3-b845-4a98-afcf-f27a50ab155b",
             input: "s = \"PLLP\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0b7a0c19-e7b3-409d-90ee-6fc96fc66987",
             input: "s = \"AAPL\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b4e7847d-86b8-43e7-9e4f-b31ea959f8ba",
             input: "s = \"LLLP\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "d657c979-298c-4df8-bcdb-d9bd63c888bb",
             input: "s = \"PPPL\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "61e9e856-5d9a-4fdf-b116-8621521e9d08",
             input: "s = \"AAPPP\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a3942de6-eb6d-4683-807b-4f5cf4d2e418",
             input: "s = \"LLLPP\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5689bb6d-f5a1-405e-b0a4-073b17f7b6df",
             input: "s = \"PPALLPP\"",
             expected: "true", orderMatters: true),
            TestCaseData(id: "1be61735-7313-4285-8733-3623782471dd",
             input: "s = \"AAPALL\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9b9bb08e-3b65-4dfd-b8bb-66ba65c648a3",
             input: "s = \"LLPAL\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9670d676-cc4c-415b-8711-92341917f654",
             input: "s = \"PALLPALL\"",
             expected: "false", orderMatters: true),
            TestCaseData(id: "599d5919-24e8-4010-8ca2-043bf704a923",
             input: "s = \"AAPALLP\"",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "student-attendance-record-i"
            let topic = "misc"
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

            let p_s = InputParser.parseString(params[0])
            guard p_s.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: s string too long (\(p_s.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_s.count >= 1 && p_s.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= s.length <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.checkRecord(p_s)
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
