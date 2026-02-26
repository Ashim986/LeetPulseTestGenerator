import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCLongestConsecutiveSequence {
    private class Solution {
        func longestConsecutive(_ nums: [Int]) -> Int {
            let numSet = Set(nums)
            var maxLength = 0

            for num in numSet {
                // Only start if this is beginning of sequence
                if !numSet.contains(num - 1) {
                    var current = num
                    var length = 1
                    while numSet.contains(current + 1) {
                        current += 1
                        length += 1
                    }
                    maxLength = max(maxLength, length)
                }
            }

            return maxLength
        }
    }

    @Suite struct LongestConsecutiveSequenceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "787DA03B-3352-484B-A2BE-0B05F30A6DED",
             input: "100\n4\n200\n1\n3\n2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "B1A81BB4-0A1F-4907-A1FC-0FC3EFCE7E15",
             input: "0\n3\n7\n2\n5\n8\n4\n6\n0\n1",
             expected: "9", orderMatters: true),
            TestCaseData(id: "09E76929-F794-45BC-BD13-31E53FAD2A40",
             input: "1\n9\n3\n10\n4\n20\n2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "B0D22767-2B1B-4306-B149-3BE604B2CD6E",
             input: "36\n41\n56\n35\n44\n33\n34\n92\n43\n32\n42",
             expected: "5", orderMatters: true),
            TestCaseData(id: "CEA82526-3BD1-44BF-BF1C-9B5C18EC291B",
             input: "0\n-1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "788BE7AC-BD6B-4890-AC9A-3E5B92E453DC",
             input: "0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "E2163A60-2230-467A-980F-D5D9C73E1F6B",
             input: "-1\n-2\n-3\n-4\n-5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "F7C6956F-7F08-4A70-9E9F-011F01A4EF7F",
             input: "1\n1\n1\n1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "AFD43C06-7625-47B9-A8D3-01E94FBFC142",
             input: "1\n1\n2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9D74A634-77A2-421B-8251-A1A366D1CC3F",
             input: "1\n2\n3\n4\n5\n6\n7\n8\n9\n10",
             expected: "10", orderMatters: true),
            TestCaseData(id: "E43CBD34-0B35-47C3-BA69-A5721C2ADBEA",
             input: "0\n1\n2\n3\n4\n5\n6\n7\n8\n9",
             expected: "10", orderMatters: true),
            TestCaseData(id: "AEBEE6BD-D0F2-4903-8291-D54948764C6B",
             input: "1\n2\n4\n5\n6\n8\n9\n10",
             expected: "3", orderMatters: true),
            TestCaseData(id: "8F272A62-55D0-4DA7-8E4D-8AD2A3C9EABB",
             input: "1\n2\n3\n5\n6\n7\n9\n10",
             expected: "3", orderMatters: true),
            TestCaseData(id: "0D4D48C5-D649-4383-A10C-36D059EFA75A",
             input: "1\n3\n5\n7\n9",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ED7B7890-B067-4D45-ACDF-AB822AC31635",
             input: "2\n4\n6\n8",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6D342DDE-22A0-4D41-A005-A8778A00A2C4",
             input: "-10\n-9\n-8\n-7\n-6\n-5\n-4\n-3\n-2\n-1",
             expected: "10", orderMatters: true),
            TestCaseData(id: "DC1AF100-68A4-4E93-815C-C62A00F3B2DF",
             input: "10\n9\n8\n7\n6\n5\n4\n3\n2\n1",
             expected: "10", orderMatters: true),
            TestCaseData(id: "174465F2-1E46-46EF-89CD-FF8819236268",
             input: "10\n20\n30\n40\n50",
             expected: "1", orderMatters: true),
            TestCaseData(id: "B0555DF2-F689-470C-A8BE-8807D51F9322",
             input: "-1\n-2\n-3\n-4\n-5\n0\n1\n2\n3\n4",
             expected: "10", orderMatters: true),
            TestCaseData(id: "564A1A6A-004D-4EE3-B2A1-9149D1193FA2",
             input: "1\n2\n3\n4\n5\n1\n2\n3\n4\n5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "C44F0BF6-3A13-4EF9-9CC2-4771FEE8452B",
             input: "0\n1\n1\n2",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1744479E-AEAF-4256-AD4A-32C3BF5F4D50",
             input: "0\n1\n2\n3\n4\n5\n6\n7\n8\n9\n10",
             expected: "11", orderMatters: true),
            TestCaseData(id: "C1F6F67C-FD2B-4517-8E73-89FDF0625F98",
             input: "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11",
             expected: "11", orderMatters: true),
            TestCaseData(id: "EF7F1246-BAC6-436D-B79A-47BE15F8831A",
             input: "1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "934C0717-5B8C-4287-912E-06BCE7466986",
             input: "1\n2\n3",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "longest-consecutive-sequence"
            let topic = "arrays-hashing"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
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
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 0 && p_nums.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums.length <= 10^5"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -1000000000 && $0 <= 1000000000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -10^9 <= nums[i] <= 10^9"
                )
                return
            }

            let solution = Solution()
            let result = solution.longestConsecutive(p_nums)
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
