import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCContainsDuplicateIi {
    private class Solution {
        func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
            var lastIndex: [Int: Int] = [:]
            for (i, num) in nums.enumerated() {
                if let last = lastIndex[num], i - last <= k {
                    return true
                }
                lastIndex[num] = i
            }
            return false
        }
    }

    @Suite struct ContainsDuplicateIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "BFC6D26D-C8DE-47D9-A620-D3D516862DD3",
             input: "[1,2,3,1]\n3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4B1B2CD3-BCFC-4EDA-AF1D-A33AAD7052DE",
             input: "[1,0,1,1]\n1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9154470B-1FB7-470C-AC56-C759BB59F8A2",
             input: "[1,2,3,4,5]\n100",
             expected: "false", orderMatters: true),
            TestCaseData(id: "C10F0CE9-3A87-4E3E-AF50-4EE7B55C658D",
             input: "[]\n1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "C8FFEA41-CE3E-42CE-B4E6-FAEF071C4659",
             input: "[1]\n1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "4E4EFA04-F814-486F-98FA-45F51B0EC05D",
             input: "[1,2,3,4,5,6,7,8,9,1]\n10",
             expected: "true", orderMatters: true),
            TestCaseData(id: "5453A78F-BBB7-431E-985E-7197A181D409",
             input: "[1,1,1,1,1,1,1,1,1,1]\n1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "894BC8C9-C9DE-41FC-A326-7DF63D1B0057",
             input: "[1,2,3,4,5,6,7,8,9,10]\n1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "97AAD976-CA2C-4E2C-91F0-6174EFF2F7D8",
             input: "[-1,-2,-3,-4,-5]\n5",
             expected: "false", orderMatters: true),
            TestCaseData(id: "CC7CAEBF-E5A3-42F5-89BF-3B61AAC13E4A",
             input: "[1,2,2,3,4,5,6,7,8,9,1]\n11",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4CF327EE-D7F1-4C82-AEEA-C892F9984F7B",
             input: "[1,1,1,1,1,1,1,1,1,1]\n10",
             expected: "true", orderMatters: true),
            TestCaseData(id: "791AB622-8797-43CE-8042-06F5C4665263",
             input: "[0,0,0,0,0,0,0,0,0,0]\n9",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7AF5F354-F48E-4CA2-A369-DF100714C22E",
             input: "[5,5,5,5,5,5,5,5,5,5]\n2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "89ED3070-42FB-4179-9D8A-16ED60B5EA53",
             input: "[1,2,3,4,5,6,7,8,9,1]\n0",
             expected: "false", orderMatters: true),
            TestCaseData(id: "BF1AB9EB-E527-40CF-B76A-3C0AFF574799",
             input: "[1,2,3,4,5]\n1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "91FC4828-61A3-47AA-8E44-01C887E11586",
             input: "[1,2,3,4,5,6,7,8,9,1]\n1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "63EC92ED-1CAF-4EFB-A6AD-85839DEB5592",
             input: "[1,2,3,4,5,6,7,8,9,1]\n2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "29A3C0FB-D256-4BE8-99F6-36D99590DA3E",
             input: "[1,2,3,4,5,6,7,8,9,10]\n2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8605E11A-D7E8-4FE0-B185-503A9BAD5676",
             input: "[-1,-2,-3,-4,-5]\n2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "665E75DC-D663-4ED0-88A9-AC477901FC49",
             input: "[0,0,0,0,0,0,0,0,0,0]\n1",
             expected: "true", orderMatters: true),
            TestCaseData(id: "FE672EDF-DD75-49F3-8AD0-09A504DE1613",
             input: "[5,5,5,5,5,5,5,5,5,5]\n3",
             expected: "true", orderMatters: true),
            TestCaseData(id: "F502587C-D215-4977-A3AF-D1C9CC068960",
             input: "[0,1,0,3,2,5,6,7,1,9,4,8,3,7]\n4",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7159F835-0B76-41A5-89CC-5C8061BC6C8C",
             input: "[1,2,3,4,1,2,3,4]\n1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "58FAFCA5-9A5C-432C-960D-8403043A181D",
             input: "[1,2,3,4,1,2,3,4]\n4",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7CE64D51-2B99-4332-B215-8B41B07BE14D",
             input: "[1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8]\n8",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "contains-duplicate-ii"
            let topic = "sliding-window"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
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
            guard let p_k = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= nums[i] <= 109"
                )
                return
            }
            guard p_k >= 0 && p_k <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= k <= 105"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Bool?
            let didCrash = withCrashGuard {
                resultHolder = solution.containsNearbyDuplicate(p_nums, p_k)
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
