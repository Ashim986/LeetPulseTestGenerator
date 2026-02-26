import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinimumMovesToEqualArrayElementsIi {
    private class Solution {
        func minMovesToEqualArrayElementsII(_ nums: [Int]) -> Int {
            let sortedNums = nums.sorted()
            let median = sortedNums[sortedNums.count / 2]
            let totalMoves = sortedNums.reduce(0, { $0 + abs($1 - median) })

            return totalMoves
        }
    }

    @Suite struct MinimumMovesToEqualArrayElementsIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7b78b83c-2721-463b-84ee-b17bf9f4280f",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e94d2100-7ca0-4b56-a942-f6003a34d583",
             input: "nums = [1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f167b2ed-083b-4b8d-9458-aa82475e11c0",
             input: "nums = [1,2,3,4,5]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "0db1f05e-6189-4244-b1cd-69a45764ce66",
             input: "nums = [10,20,30,40,50]",
             expected: "60", orderMatters: true),
            TestCaseData(id: "243a5157-a0b5-495f-9743-b50dc3fbb744",
             input: "nums = [-1,-2,-3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c6db902a-f219-4876-97a4-2250de7d36dd",
             input: "nums = [-10,-20,-30]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "ec7cf949-2bd6-4424-b11d-c79ab3da697b",
             input: "nums = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "30d7b750-175c-4dca-86ce-71db7b0f3737",
             input: "nums = [1000,2000,3000]",
             expected: "2000", orderMatters: true),
            TestCaseData(id: "ddfef8f0-364b-4fbd-86a8-1f6198d2c361",
             input: "nums = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9959d477-f4de-4ba6-8abc-82e84d394aa7",
             input: "nums = [5,5,5,5,5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9c41ee66-53b1-4848-a93f-f86e340787f5",
             input: "nums = [-5,-5,-5,-5,-5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a5da8e64-a51b-4bce-be0d-6f4327f2157a",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8e62ca08-3fe7-4b1b-a1a0-78451c6809f3",
             input: "nums = [10,10,10,10,10,10,10,10,10,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "63b2c050-2813-45ee-b74a-9a87384bf103",
             input: "nums = [-10,-10,-10,-10,-10,-10,-10,-10,-10,-10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a0cd6b15-461f-4082-85a5-893843a8f940",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "b6c044d2-cb87-41ab-a8d2-1d3cf080cf82",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "25", orderMatters: true),
            TestCaseData(id: "dad3fae3-1ece-4dab-a251-30c439ae5a8f",
             input: "nums = [100,200,300,400,500,600,700,800,900,1000]",
             expected: "2500", orderMatters: true),
            TestCaseData(id: "be65ec33-283c-4373-870f-c6508dcca31f",
             input: "nums = [1000,900,800,700,600,500,400,300,200,100]",
             expected: "2500", orderMatters: true),
            TestCaseData(id: "81ca5732-3693-4934-ac85-baf3b4c9ad61",
             input: "nums = [-100,-200,-300,-400,-500,-600,-700,-800,-900,-1000]",
             expected: "2500", orderMatters: true),
            TestCaseData(id: "c9c8f887-b6c9-4670-96e2-0042cf80e32f",
             input: "nums = [-1000,-900,-800,-700,-600,-500,-400,-300,-200,-100]",
             expected: "2500", orderMatters: true),
            TestCaseData(id: "41eed335-54e8-44b2-9bb8-71842760d5e9",
             input: "nums = [1,3,5,7,9,11,13,15,17,19]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "c0adc630-159a-40eb-89b7-257b9010c7cc",
             input: "nums = [19,17,15,13,11,9,7,5,3,1]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "79d362d2-cbd9-4396-86e7-fad7f64d2bab",
             input: "nums = [100,300,500,700,900,1100,1300,1500,1700,1900]",
             expected: "5000", orderMatters: true),
            TestCaseData(id: "c38e2910-f29a-4d33-836c-28203c442290",
             input: "nums = [1900,1700,1500,1300,1100,900,700,500,300,100]",
             expected: "5000", orderMatters: true),
            TestCaseData(id: "606d9b9b-2e9e-4e26-8015-f7ae5da40656",
             input: "nums = [-100,-300,-500,-700,-900,-1100,-1300,-1500,-1700,-1900]",
             expected: "5000", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "minimum-moves-to-equal-array-elements-ii"
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
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -109 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -109 <= nums[i] <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.minMovesToEqualArrayElementsII(p_nums)
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
