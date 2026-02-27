import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumProductOfThreeNumbers {
    private class Solution {
        func maximumProduct(_ nums: [Int]) -> Int { let nums = nums.sorted(); return max(nums[nums.count-1] * nums[nums.count-2] * nums[nums.count-3], nums[0] * nums[1] * nums[nums.count-1]); }
    }

    @Suite struct MaximumProductOfThreeNumbersTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7ce8dcd0-0d75-4448-baf9-d4626a6face7",
             input: "nums = [4,2,1]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "4da39bc4-a025-4277-8e14-fad1eb8291b7",
             input: "nums = [-1,-2,-3]",
             expected: "-6", orderMatters: true),
            TestCaseData(id: "91513cf4-387f-4dfc-a96a-8d08561f9d08",
             input: "nums = [0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1d0376af-9a58-41c4-82b3-87e873b862a7",
             input: "nums = [5,5,5]",
             expected: "125", orderMatters: true),
            TestCaseData(id: "0a39dd82-ca21-47ca-a985-462c4b8f9c10",
             input: "nums = [-5,-5,-5]",
             expected: "-125", orderMatters: true),
            TestCaseData(id: "85a00830-1c15-48d7-ab76-12d546e16e01",
             input: "nums = [1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "325e8e8d-a47e-4ccc-9aa2-d5a676e3dbbb",
             input: "nums = [-10,0,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1fd5c63f-b107-4b1a-b6bf-30de61088046",
             input: "nums = [10,10,10]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "0650d441-8693-4bc2-a869-98a90d509cb6",
             input: "nums = [-100,-100,-100]",
             expected: "-1000000", orderMatters: true),
            TestCaseData(id: "fe23fffe-0016-4846-9291-43a7a9e4c07e",
             input: "nums = [100,100,100]",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "f5c83244-0de7-4b8f-80f4-f706b1240c81",
             input: "nums = [1,2,3,4,5]",
             expected: "60", orderMatters: true),
            TestCaseData(id: "2a621c06-a258-4b0d-9ba1-bebdd3359c98",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "-6", orderMatters: true),
            TestCaseData(id: "efe2e05a-e133-4edf-952f-684171931c67",
             input: "nums = [0,1,2,3,4]",
             expected: "24", orderMatters: true),
            TestCaseData(id: "d7f5cae2-2ed6-4eb9-a48f-fa943ffec9f0",
             input: "nums = [5,4,3,2,1]",
             expected: "60", orderMatters: true),
            TestCaseData(id: "31e9018b-87d3-4e79-959b-7965020dffc7",
             input: "nums = [1,1,1,1,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "c4fb6b8c-1669-4725-a32f-478bc987b814",
             input: "nums = [-1,-1,-1,-1,-1]",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "111fa6c1-acd9-4252-8f53-8524d5738e4a",
             input: "nums = [10,-10,10,-10]",
             expected: "1000", orderMatters: true),
            TestCaseData(id: "2cd013ad-1382-4d38-bcdb-41fbc0e368e1",
             input: "nums = [1000,-1000,1000,-1000]",
             expected: "1000000000", orderMatters: true),
            TestCaseData(id: "b6addfc0-8709-4a25-8f2d-de2ddf429b7d",
             input: "nums = [1,0,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7e4c51a9-bf22-4b69-9438-6604d23d949b",
             input: "nums = [-10,0,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "86389805-d654-4c42-981b-94e17346743a",
             input: "nums = [0,0,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "86e500d4-57d0-4acc-ad88-95d05ae2e646",
             input: "nums = [0,1,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "61445e65-9b27-4461-a164-856a50c2bd71",
             input: "nums = [1,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e17a48c5-0e73-479c-9801-ed5558047d5b",
             input: "nums = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7e5c22db-0e20-4494-a67b-7e7cc2cfcc02",
             input: "nums = [1,1,1,1,1,1]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-product-of-three-numbers"
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
            guard p_nums.count >= 3 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 3 <= nums.length <= 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -1000 && $0 <= 1000 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -1000 <= nums[i] <= 1000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maximumProduct(p_nums)
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
