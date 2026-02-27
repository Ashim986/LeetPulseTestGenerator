import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRotateFunction {
    private class Solution {
        func rotateFunction(_ nums: [Int]) -> Int {
            let n = nums.count;
            var sum = 0;
            var rotateFunction = 0;
            for i in 0..<n {
                rotateFunction += i * nums[i];
                sum += nums[i];
            }
            var maxRotateFunction = rotateFunction;
            for k in 1...n-1 {
                rotateFunction = rotateFunction - (n-1) * nums[n-k] + nums[n-k] * (n-1) - (sum - nums[n-k]);
                maxRotateFunction = max(maxRotateFunction, rotateFunction);
            }
            return maxRotateFunction;
        }
    }

    @Suite struct RotateFunctionTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "907f05cc-e639-4d51-bcf1-a1d0955c831c",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "60443a05-edfc-4b2e-93d2-5dae96e5dc5f",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "330", orderMatters: true),
            TestCaseData(id: "c067cc9b-b8a4-4a85-9e5a-fc112d5e43a1",
             input: "nums = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2879c36f-be79-40b2-8715-e3f12eb6b02d",
             input: "nums = [1,3,5,7,9]",
             expected: "60", orderMatters: true),
            TestCaseData(id: "7875d857-63be-406f-891e-128c1fa0fe60",
             input: "nums = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b989f04b-f6d2-4ade-9677-3c3da2bab85a",
             input: "nums = [1,1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "53de78eb-ec3c-4088-b156-0eeb011f0894",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "334901a6-b42c-429b-af81-ea967d1ac0c1",
             input: "nums = [10,20,30,40,50]",
             expected: "400", orderMatters: true),
            TestCaseData(id: "1dada0e3-439b-4292-bef6-e7e40f487f78",
             input: "nums = [2,4,6,8,10]",
             expected: "120", orderMatters: true),
            TestCaseData(id: "e6b247e4-879b-4734-93ca-7ddd4c1fc2ac",
             input: "nums = [-10,-8,-6,-4,-2]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "73eb61d7-8f28-41f2-bbc8-a4df924e22bc",
             input: "nums = [100,200,300,400,500]",
             expected: "4000", orderMatters: true),
            TestCaseData(id: "74cdac59-baec-4b63-ac58-3f90c4252b05",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "45", orderMatters: true),
            TestCaseData(id: "6eaeb041-8634-49fc-9fbf-66e5cbe13793",
             input: "nums = [5,4,3,2,1]",
             expected: "35", orderMatters: true),
            TestCaseData(id: "8acfa8ba-14ca-41f7-9d84-5871ef11d00c",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "572", orderMatters: true),
            TestCaseData(id: "fc84a7bd-23ad-48d5-8bb8-019f60a34958",
             input: "nums = [-5,-4,-3,-2,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f33002b3-eb3a-4787-82ea-1b0c9310c272",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "220", orderMatters: true),
            TestCaseData(id: "88f356e9-c308-43cf-bc39-768509bb6f19",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "66", orderMatters: true),
            TestCaseData(id: "ed10a1f4-6754-4fd1-a938-53d7b21170c1",
             input: "nums = [1000,2000,3000,4000,5000]",
             expected: "40000", orderMatters: true),
            TestCaseData(id: "de10702d-8222-4162-8d0f-ad212741733e",
             input: "nums = [1,3,5,7,9,11,13,15,17,19]",
             expected: "660", orderMatters: true),
            TestCaseData(id: "7c59ea2b-e59a-4254-93ec-f4d37b1f8f65",
             input: "nums = [2,4,6,8,10,12,14,16,18,20]",
             expected: "660", orderMatters: true),
            TestCaseData(id: "17f66cae-6c85-4a2c-bdf2-804637d8db12",
             input: "nums = [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1]",
             expected: "-165", orderMatters: true),
            TestCaseData(id: "3abbe20c-b802-4498-a966-91394d3d941d",
             input: "nums = [100,99,98,97,96,95,94,93,92,91]",
             expected: "4340", orderMatters: true),
            TestCaseData(id: "b7c9d314-0d11-4502-9807-481f6356db51",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "105", orderMatters: true),
            TestCaseData(id: "9423999b-4579-41fa-9377-6abd83e7a458",
             input: "nums = [5,5,5,5,5,5,5,5,5,5]",
             expected: "225", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "rotate-function"
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
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -100 && $0 <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -100 <= nums[i] <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.rotateFunction(p_nums)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
