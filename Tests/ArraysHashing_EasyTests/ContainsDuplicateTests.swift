import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCContainsDuplicate {
    private class Solution {
        func containsDuplicate(_ nums: [Int]) -> Bool {
            var seen = Set<Int>()
            for num in nums {
                if seen.contains(num) { return true }
                seen.insert(num)
            }
            return false
        }
    }

    @Suite struct ContainsDuplicateTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "A4D3D0CF-0E5F-42AE-8316-2CE109EE707E",
             input: "[1,2,3,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "B5CEC526-CD8D-4641-A4F7-C37CCA0C33E8",
             input: "[1,2,3,4]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4C0160B5-9C75-4078-BDBB-577E1EEC4253",
             input: "[1,1,1,3,3,4,3,2,4,2]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "FBEC0129-8F0E-48EA-AD1F-059EB73BD110",
             input: "[1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "323FBAA7-9033-430F-8BF0-B921606B6F68",
             input: "[]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5DB90B21-6FB4-4F97-9103-BF272B4540E4",
             input: "[1,2]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "056E3535-E58C-4DF7-B2A0-B696F67BC3D0",
             input: "[1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "E6708F52-C60C-4FFF-A8D4-EEA81ECB628C",
             input: "[-1,-2,-3,-1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5491C66C-FFBF-40B8-8046-56A080F000B0",
             input: "[0,0,0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "E7EA4E50-5EF9-4F7F-82B2-C26D13A8F7BF",
             input: "[1,2,3,4,5,6,7,8,9,10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "C610D5A0-DA72-43BC-9DE6-5B064822421C",
             input: "[10,9,8,7,6,5,4,3,2,1]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "E89AF0CF-B8AA-4FFE-82A9-282DE7F4119E",
             input: "[1,1,1,1,1,1,1,1,1,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "3CEC64B2-43B9-4BFA-A3DB-34B76428B5BD",
             input: "[1,-1,1,-1,1,-1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "523FF917-AD8C-4866-BE56-0993A9FC4BCC",
             input: "[10000,10001,10002,10003,10004]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "A9B5718F-B7A4-438D-9DDE-FF6D9018D13E",
             input: "[1,-10000]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "332F9273-3228-4230-94BD-010E5B955127",
             input: "[10000,-10000]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "18909DB4-0058-47BA-9CC3-CE499E59EC9F",
             input: "[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "23A23B56-97F8-4E45-8D1F-759186B27975",
             input: "[0,0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "262D661B-963C-4CD5-BFE2-DA8A2A989623",
             input: "[10,20,30,10,40]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "26BD0238-1415-46FD-84CE-84CBC9FDF892",
             input: "[1,10,100,1000]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "CAC96991-19EF-40E9-A844-D2E7033C72BC",
             input: "[100,200,300,100]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4D3C293D-0B7B-46D3-A311-46A0725B45AA",
             input: "[1,2,3,4,5,6,7,8,9,1]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6A7FE2EB-5FC8-4328-988F-D27D95A14D40",
             input: "[1,-1,0]",
             expected: "false", orderMatters: true),
            TestCaseData(id: "015E3033-5755-4B23-A057-7EEF58E0E9EF",
             input: "[0,0,0,0,0,0,0]",
             expected: "true", orderMatters: true),
            TestCaseData(id: "6EA9EE9F-1E45-4365-AE98-13E0D482A73D",
             input: "[100,200,300,100,400,500,100]",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "contains-duplicate"
            let topic = "arrays-hashing"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 10^5"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -1000000000 && $0 <= 1000000000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10^9 <= nums[i] <= 10^9"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.containsDuplicate(p_nums)
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
