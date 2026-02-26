import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCHouseRobberIi {
    private class Solution {
        func rob(_ nums: [Int]) -> Int {
            if nums.count == 1 { return nums[0] }

            func robRange(_ start: Int, _ end: Int) -> Int {
                var prev2 = 0, prev1 = 0
                for i in start..<end {
                    let curr = max(prev1, prev2 + nums[i])
                    prev2 = prev1
                    prev1 = curr
                }
                return prev1
            }

            return max(robRange(0, nums.count - 1), robRange(1, nums.count))
        }
    }

    @Suite struct HouseRobberIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "42e491be-3f24-469d-a8a7-7805138d76d6",
             input: "nums = [1,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "76d98aa5-2d7f-4a99-b9c8-7176ccd6fdf9",
             input: "nums = [1,2,3,1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "5d0cf418-01d3-4c8a-bdd4-e77e1e6a90f9",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0336d51c-2e1b-496e-978a-251989e74117",
             input: "nums = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b6fdfe28-5359-4a84-9967-ac886a965ac5",
             input: "nums = [1,1,1,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "26b94398-b365-4aea-a6e1-e947e453f453",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "30", orderMatters: true),
            TestCaseData(id: "1e2b5781-391a-4fd7-bf9b-88e4200abbf2",
             input: "nums = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ddff3b85-4001-41b4-9361-bd026fd3789e",
             input: "nums = [2,7,9,3,1]",
             expected: "11", orderMatters: true),
            TestCaseData(id: "60c2761a-60f3-47d3-826a-6063878c5fb9",
             input: "nums = [100,1,100,1,100,1,100,1]",
             expected: "400", orderMatters: true),
            TestCaseData(id: "d8f15d2e-9c02-416b-8be6-4d46ac313a61",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "3ebdf0db-d9c3-4d0b-8126-bc79cae1234a",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "66abb64c-525f-4315-8487-007647d6ab51",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "f927e4d7-a6be-4da5-a75c-7d92104f464e",
             input: "nums = [10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1]",
             expected: "100", orderMatters: true),
            TestCaseData(id: "4ef323fd-4adb-4e2b-b107-c3fc3bf1740d",
             input: "nums = [1,100,1,100,1,100,1,100,1,100,1,100,1,100,1,100,1,100,1,100]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "7520e438-4473-4c45-b233-0cec72dfcdcc",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "8a007627-5ab2-41ff-9e93-0c94ec2e910a",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "4005f64f-f88b-48cc-a73e-2d341e63b555",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "1605f54a-01f1-450f-869c-f6b4bd80d268",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8448296c-8bfe-492e-b347-eb579a984178",
             input: "nums = [10,20,30,40,50]",
             expected: "80", orderMatters: true),
            TestCaseData(id: "29427b26-fdbe-43f6-a1c1-da2e56863cbe",
             input: "nums = [5,1,1,5]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "2e46a337-e445-49ba-841b-5b7597ceb7a8",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "42", orderMatters: true),
            TestCaseData(id: "94700fc9-45b0-4b98-8528-43ce5ab9f087",
             input: "nums = [1,100,1,100,1,100,1,100,1]",
             expected: "400", orderMatters: true),
            TestCaseData(id: "8c83e058-cd56-42f4-b3c1-7be00630d89e",
             input: "nums = [10,10,10,10,10,10,10,10,10,10]",
             expected: "50", orderMatters: true),
            TestCaseData(id: "0677bff1-354c-48b2-a317-29a2e972b5fb",
             input: "nums = [5,2,3,7,1]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "e7e6a4c7-4c34-44c8-9e11-1e3887ce9235",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "110", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "house-robber-ii"
            let topic = "dynamic-programming"
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
            guard p_nums.count >= 1 && p_nums.count <= 100 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 100"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            let result = solution.rob(p_nums)
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
