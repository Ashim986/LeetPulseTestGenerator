import Foundation
@testable import LeetCodeHelpers
import Testing

enum LC3sumClosest {
    private class Solution {
        func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
            let sortedNums = nums.sorted()
            var minDiff = Int.max
            var result = 0
            for i in 0..<sortedNums.count - 2 {
                var left = i + 1
                var right = sortedNums.count - 1
                while left < right {
                    let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                    let diff = abs(sum - target)
                    if diff < minDiff {
                        minDiff = diff
                        result = sum
                    }
                    if sum < target {
                        left += 1
                    } else if sum > target {
                        right -= 1
                    } else {
                        return sum
                    }
                }
            }
            return result
        }
    }

    @Suite struct LC3sumClosestTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "A0125DFB-66CE-4B4A-90C1-741ECF7F15C8",
             input: "{\"nums\": [-1, 2, 1, -4], \"target\": 1}",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6790C335-98AE-4835-A71E-B7422E8C6A3E",
             input: "{\"nums\": [1, 1, 1, 0], \"target\": -100}",
             expected: "2", orderMatters: true),
            TestCaseData(id: "706CE36E-FB93-4F5C-B7D1-12B8DD120A8A",
             input: "{\"nums\": [0, 0, 0], \"target\": 1}",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0A263075-B4AE-4258-AADF-902EC85F3132",
             input: "{\"nums\": [-10, 10, -5, 5, 0], \"target\": 0}",
             expected: "0", orderMatters: true),
            TestCaseData(id: "593509CA-878A-4051-8A6B-A58274BDEAE2",
             input: "{\"nums\": [1, 1, 1, 1, 1], \"target\": 1}",
             expected: "3", orderMatters: true),
            TestCaseData(id: "36EA9174-4B33-469A-922C-C24C704F534B",
             input: "{\"nums\": [1, 2, 4, 8, 16, 32, 64, 128], \"target\": 82}",
             expected: "82", orderMatters: true),
            TestCaseData(id: "A83A4E90-E34E-4F2D-A810-CC6A5DFE6670",
             input: "{\"nums\": [-100, -50, 0, 50, 100], \"target\": 1000}",
             expected: "150", orderMatters: true),
            TestCaseData(id: "5AC25D92-2780-474B-A66D-02320EB4B4BB",
             input: "{\"nums\": [-100, -50, 0, 50, 100], \"target\": -1000}",
             expected: "-150", orderMatters: true),
            TestCaseData(id: "C049EEB2-BAA0-46B1-A79D-3E9B5540E80C",
             input: "{\"nums\": [7, 7, 7, 7, 7], \"target\": 20}",
             expected: "21", orderMatters: true),
            TestCaseData(id: "2F4303B9-3916-4AFE-9B27-01E9D40A60D0",
             input: "{\"nums\": [-1000, -1, 0, 1, 1000], \"target\": 999}",
             expected: "999", orderMatters: true),
            TestCaseData(id: "5057EAF6-518B-4574-B8F9-BFA1ACB1D6CF",
             input: "[-1, 2, 1, -4], 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "66775186-0DAB-45D5-B0E3-3E2A5F56AF7A",
             input: "[0, 0, 0], 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1E097037-CFE6-45ED-BD33-BA091A6CF1E7",
             input: "[-5, -2, -1, -7], -7",
             expected: "-8", orderMatters: true),
            TestCaseData(id: "DDEC14ED-B5EF-4FFF-980C-07344AD035ED",
             input: "[1, 5, 2, 8], 10",
             expected: "11", orderMatters: true),
            TestCaseData(id: "68E3C069-D834-40A4-B3DC-32EBBF80BAF2",
             input: "[1, 1, 1, 1], 100",
             expected: "3", orderMatters: true),
            TestCaseData(id: "4D94423B-A03D-436D-ACB7-B49A785FEB0C",
             input: "[1, 2, 3], 10",
             expected: "6", orderMatters: true),
            TestCaseData(id: "891E97D3-F8BC-4951-8DF5-22BBBEC2F11A",
             input: "[-10, 0, 10, 20, -5], 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "EC8AC327-DCFE-492E-BF49-A322030BAB4B",
             input: "[100, 200, 300, 400], 600",
             expected: "600", orderMatters: true),
            TestCaseData(id: "6AB0F4EA-3D6E-4B28-AE5A-B7D460F0B8DF",
             input: "[-1, 0, 1, 5, 6], 4",
             expected: "4", orderMatters: true),
            TestCaseData(id: "87511E93-A909-489D-8B97-233B7D2090F5",
             input: "[-100, -50, 0, 1, 2, 3, 50, 100], 7",
             expected: "6", orderMatters: true),
            TestCaseData(id: "A3E3C85F-C128-4D4D-84EC-74DE8871372A",
             input: "{\"nums\": [-10, -5, -2, -1], \"target\": -15}",
             expected: "-16", orderMatters: true),
            TestCaseData(id: "18714B11-A43D-4F9C-89A4-F4EF659B7E80",
             input: "{\"nums\": [1, 5, 10, 20], \"target\": 18}",
             expected: "16", orderMatters: true),
            TestCaseData(id: "37150FE7-5707-4F03-8402-1368155F1D2F",
             input: "{\"nums\": [-5, 0, 5, 10, -10], \"target\": 0}",
             expected: "0", orderMatters: true),
            TestCaseData(id: "C547499A-9530-411F-8555-E6C1FFFC371C",
             input: "{\"nums\": [1, 2, 3, 4, 5], \"target\": 6}",
             expected: "6", orderMatters: true),
            TestCaseData(id: "E4DC4293-A5B6-46BE-8D39-63DED54824C1",
             input: "{\"nums\": [-1000, 0, 500, 1000, -500], \"target\": 200}",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "3sum-closest"
            let topic = "two-pointers"
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
            guard let p_target = InputParser.parseInt(params[1]) else {
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
            guard p_nums.count >= 3 && p_nums.count <= 500 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 3 <= nums.length <= 500"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -1000 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= nums[i] <= 1000"
                )
                return
            }
            guard p_target >= -104 && p_target <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= target <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.threeSumClosest(p_nums, p_target)
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
