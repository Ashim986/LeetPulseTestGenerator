import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSummaryRanges {
    private class Solution {
        func summaryRanges(_ nums: [Int]) -> [String] {
            var result: [String] = []
            var i = 0
            while i < nums.count {
                let start = nums[i]
                var end = start
                while i + 1 < nums.count, nums[i + 1] == nums[i] + 1 {
                    i += 1
                    end = nums[i]
                }
                if start == end {
                    result.append("\(start)")
                } else {
                    result.append("\(start)->\(end)")
                }
                i += 1
            }
            return result
        }
    }

    @Suite struct SummaryRangesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "f2698365-60d2-4990-bb02-1e1599b15dfa",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "d486185d-b957-4c80-b794-e33455cb6bee",
             input: "nums = [1]",
             expected: "[\"1\"]", orderMatters: true),
            TestCaseData(id: "367e1579-b993-46ce-b4b8-b431519cc3c5",
             input: "nums = [1, 2, 3]",
             expected: "[\"1->3\"]", orderMatters: true),
            TestCaseData(id: "014e111a-a91c-4e76-803a-05dfcb44fcc4",
             input: "nums = [1, 3, 5]",
             expected: "[\"1\", \"3\", \"5\"]", orderMatters: true),
            TestCaseData(id: "fa9f8996-7d01-4e56-b4d1-dbe62fda2d46",
             input: "nums = [-1, 0, 1]",
             expected: "[\"-1->1\"]", orderMatters: true),
            TestCaseData(id: "f625c33f-5fae-4d0c-9673-004fd3567b9a",
             input: "nums = [100, 101, 102]",
             expected: "[\"100->102\"]", orderMatters: true),
            TestCaseData(id: "0a2e2167-77ed-44da-b514-7d2c6ec545c0",
             input: "nums = [10, 20, 30, 40, 50]",
             expected: "[\"10\", \"20\", \"30\", \"40\", \"50\"]", orderMatters: true),
            TestCaseData(id: "22d6a251-df45-4ef7-a71d-bc393ddfda80",
             input: "nums = [1, 2, 3, 5, 6, 7]",
             expected: "[\"1->3\", \"5->7\"]", orderMatters: true),
            TestCaseData(id: "5dde888c-9cf0-4268-a77f-0932c2f18b40",
             input: "nums = [1, 3, 5, 7, 9]",
             expected: "[\"1\", \"3\", \"5\", \"7\", \"9\"]", orderMatters: true),
            TestCaseData(id: "32377fdd-b026-40fe-ad02-2872530b73d0",
             input: "nums = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]",
             expected: "[\"10->20\"]", orderMatters: true),
            TestCaseData(id: "62f7b3c3-705d-45d4-8e66-faea0a7ee79f",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "[\"1->10\"]", orderMatters: true),
            TestCaseData(id: "aad77fea-0d69-4af9-963d-852c74bc15c6",
             input: "nums = [1000, 1001, 1002, 1003, 1004, 1005]",
             expected: "[\"1000->1005\"]", orderMatters: true),
            TestCaseData(id: "272d9abd-3170-4b2b-b64b-0e6fa13f4d54",
             input: "nums = [-100, -99, -98, -97, -96]",
             expected: "[\"-100->-96\"]", orderMatters: true),
            TestCaseData(id: "9fe25c41-a01a-4301-8ebc-2e2945695e06",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]",
             expected: "[\"1->15\"]", orderMatters: true),
            TestCaseData(id: "eee95dd2-818d-41dc-a7ac-dcc2a6b35117",
             input: "nums = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1]",
             expected: "[\"-10->-1\"]", orderMatters: true),
            TestCaseData(id: "cab23ebb-a186-453c-b72f-8a0fa59f21d6",
             input: "nums = [10000, 10001, 10002, 10003, 10004, 10005, 10006, 10007, 10008, 10009, 10010]",
             expected: "[\"10000->10010\"]", orderMatters: true),
            TestCaseData(id: "30bd1ed1-563d-494a-a4f1-65040d3d6929",
             input: "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]",
             expected: "[\"1\", \"3\", \"5\", \"7\", \"9\", \"11\", \"13\", \"15\", \"17\", \"19\"]", orderMatters: true),
            TestCaseData(id: "7f3c31d0-a120-42c0-adf8-96bd89d0bbfa",
             input: "nums = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]",
             expected: "[\"10\", \"20\", \"30\", \"40\", \"50\", \"60\", \"70\", \"80\", \"90\", \"100\"]", orderMatters: true),
            TestCaseData(id: "87912845-b487-43ca-9f6a-76e400e8c18a",
             input: "nums = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]",
             expected: "[\"100\", \"200\", \"300\", \"400\", \"500\", \"600\", \"700\", \"800\", \"900\", \"1000\"]", orderMatters: true),
            TestCaseData(id: "972db74d-44de-4354-a8d8-3321bfe3b7e4",
             input: "nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]",
             expected: "[\"1->20\"]", orderMatters: true),
            TestCaseData(id: "152a7bc9-b703-4f64-9d82-e7e38836fa42",
             input: "nums = [-1000, -999, -998, -997, -996, -995, -994, -993, -992, -991]",
             expected: "[\"-1000->-991\"]", orderMatters: true),
            TestCaseData(id: "2ff82d2e-f58b-4237-968f-2c183e1ac2d8",
             input: "nums = [1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015]",
             expected: "[\"1000->1015\"]", orderMatters: true),
            TestCaseData(id: "7ae1e6cf-f256-4eb1-9737-b7311bf40806",
             input: "nums = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29]",
             expected: "[\"1\", \"3\", \"5\", \"7\", \"9\", \"11\", \"13\", \"15\", \"17\", \"19\", \"21\", \"23\", \"25\", \"27\", \"29\"]", orderMatters: true),
            TestCaseData(id: "62868691-04a7-4135-b6ba-ca9527ea3156",
             input: "nums = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150]",
             expected: "[\"10\", \"20\", \"30\", \"40\", \"50\", \"60\", \"70\", \"80\", \"90\", \"100\", \"110\", \"120\", \"130\", \"140\", \"150\"]", orderMatters: true),
            TestCaseData(id: "8abe1bf8-14e4-44ce-928a-2cf9f1f135c4",
             input: "nums = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500]",
             expected: "[\"100\", \"200\", \"300\", \"400\", \"500\", \"600\", \"700\", \"800\", \"900\", \"1000\", \"1100\", \"1200\", \"1300\", \"1400\", \"15"
                + "00\"]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "summary-ranges"
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
            guard p_nums.count >= 0 && p_nums.count <= 20 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums.length <= 20"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -2147483648 && $0 <= 2147483647 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -2^31 <= nums[i] <= 2^31 - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [String]?
            let didCrash = withCrashGuard {
                resultHolder = solution.summaryRanges(p_nums)
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

            // Order-independent string array comparison (QUAL-01)
            guard let expectedArray = InputParser.parseStringArray(expectedOutput) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [String]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
