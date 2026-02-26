import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRangeSumQueryImmutable {
    private class Solution {
        class NumArray {
            var prefix: [Int]

            init(_ nums: [Int]) {
                prefix = [0]
                for num in nums {
                    prefix.append(prefix[prefix.count - 1] + num)
                }
            }

            func sumRange(_ left: Int, _ right: Int) -> Int {
                return prefix[right + 1] - prefix[left]
            }
        }
    }

    @Suite struct RangeSumQueryImmutableTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "be0c416c-40b6-4a63-93b8-6936387b2e8f",
             input: "nums = [], target = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "55685812-8ce7-4c56-8e75-07403e0de4fc",
             input: "nums = [1], target = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dd0e19d8-dcb6-427f-ab15-8bc6f6e1dd18",
             input: "nums = [1, 2], sumRange(0,1)",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9dfb9090-10d9-4356-a84f-1d3d9c56a1a1",
             input: "nums = [1, 2, 3], sumRange(1,2)",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c149ec15-051f-4441-882f-a1da84341252",
             input: "nums = [1, 2, 3, 4], sumRange(0,3)",
             expected: "10", orderMatters: true),
            TestCaseData(id: "9b7eba9f-e085-4885-bbf5-d514a2e78be2",
             input: "nums = [-1, -2, -3], sumRange(0,2)",
             expected: "-6", orderMatters: true),
            TestCaseData(id: "ba6e6560-5377-4077-b16a-9ac7f19df0f0",
             input: "nums = [0, 0, 0], sumRange(0,2)",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6e0f318b-94f8-4f8e-8125-6059ff1f4927",
             input: "nums = [1, 1, 1], sumRange(0,2)",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1061b8ee-d158-42de-83a6-0eff0fbab2da",
             input: "nums = [5, 5, 5], sumRange(0,2)",
             expected: "15", orderMatters: true),
            TestCaseData(id: "42aaa796-eea4-4e28-914f-97e96dab6fb4",
             input: "nums = [10, 20, 30], sumRange(0,2)",
             expected: "60", orderMatters: true),
            TestCaseData(id: "50bbbabc-7910-4202-a397-935a7c0ddb82",
             input: "nums = [10, 20, 30], sumRange(1,2)",
             expected: "50", orderMatters: true),
            TestCaseData(id: "3e610587-3ec1-4018-ae21-ad867db2ae7d",
             input: "nums = [10, 20, 30], sumRange(0,1)",
             expected: "30", orderMatters: true),
            TestCaseData(id: "ec4dee48-6256-4f97-972e-9f22d7775f45",
             input: "nums = [10, 20, 30], sumRange(2,2)",
             expected: "30", orderMatters: true),
            TestCaseData(id: "115a4280-5a16-4d46-a831-b16b1b511ebf",
             input: "nums = [10, 20, 30], sumRange(0,0)",
             expected: "10", orderMatters: true),
            TestCaseData(id: "44bbb51b-77a8-45fb-830d-d69dbc7057fd",
             input: "nums = [10, 20, 30], sumRange(1,1)",
             expected: "20", orderMatters: true),
            TestCaseData(id: "7b660a67-ce52-4b43-88e6-671e1a38cce4",
             input: "nums = [10, 20, 30], sumRange(2,1)",
             expected: "0", orderMatters: true),
            TestCaseData(id: "41923d2f-11d7-4f3b-92ba-1419dd2d9c44",
             input: "nums = [-10, -20, -30], sumRange(0,2)",
             expected: "-60", orderMatters: true),
            TestCaseData(id: "4814cff6-59da-4b76-be50-1a5a19132475",
             input: "nums = [-10, -20, -30], sumRange(1,2)",
             expected: "-50", orderMatters: true),
            TestCaseData(id: "b0bcbdcb-ac17-48c1-a2e2-552b0a19854e",
             input: "nums = [-10, -20, -30], sumRange(0,1)",
             expected: "-30", orderMatters: true),
            TestCaseData(id: "0b201266-f72f-4370-a9cb-ac30f64b125a",
             input: "nums = [-10, -20, -30], sumRange(2,2)",
             expected: "-30", orderMatters: true),
            TestCaseData(id: "382b2879-c107-43e7-94f0-05b90f2f2460",
             input: "nums = [100, 200, 300], sumRange(0,2)",
             expected: "600", orderMatters: true),
            TestCaseData(id: "dc8b06ba-4a40-4977-9e07-a15437f80568",
             input: "nums = [100, 200, 300], sumRange(1,2)",
             expected: "500", orderMatters: true),
            TestCaseData(id: "5d02d5ef-a9e3-4b2a-ad2e-344a596b3499",
             input: "nums = [100, 200, 300], sumRange(0,1)",
             expected: "300", orderMatters: true),
            TestCaseData(id: "fa687165-c2d8-4062-94b3-1c9138e73ff8",
             input: "nums = [100, 200, 300], sumRange(2,2)",
             expected: "300", orderMatters: true),
            TestCaseData(id: "1bb3f370-aef5-4fba-8634-e38d70d2b56a",
             input: "nums = [1000, 2000, 3000], sumRange(0,2)",
             expected: "6000", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "range-sum-query-immutable"
            let topic = "dynamic-programming"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            guard initArgs.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Init args count too small"
                )
                return
            }
            guard let initP_0 = InputParser.parseIntArray(initArgs[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 0 as [Int]"
                )
                return
            }
            var obj = Solution.NumArray(initP_0)

            var results: [String] = []
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "sumRange":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    guard let mArg_1 = InputParser.parseInt(args[1]) else { results.append("null"); continue }
                    let rv = obj.sumRange(mArg_0, mArg_1)
                    results.append("\(rv)")
                default:
                    results.append("null")
                }
            }

            let computedOutput = "[" + results.joined(separator: ",") + "]"
            // Class-design comparison: normalize null representations and whitespace
            func normalizeClassOutput(_ s: String) -> String {
                var result = s.replacingOccurrences(of: " ", with: "")
                result = result.replacingOccurrences(of: "nil", with: "null")
                result = result.replacingOccurrences(of: "None", with: "null")
                result = result.replacingOccurrences(of: "NULL", with: "null")
                return result
            }
            let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
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
