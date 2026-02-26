import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTotalHammingDistance {
    private class Solution {
        func totalHammingDistance(_ nums: [Int]) -> Int {
            var totalHammingDistance = 0
            let maxNum = nums.max().unsafelyUnwrapped
            let maxBits = Int(log2(Double(maxNum))) + 1
            for bitPosition in 0..<maxBits {
                var zeroCount = 0
                var oneCount = 0
                for num in nums {
                    if (num >> bitPosition) % 2 == 0 {
                        zeroCount += 1
                    } else {
                        oneCount += 1
                    }
                }
                totalHammingDistance += zeroCount * oneCount
            }
            return totalHammingDistance
        }
    }

    @Suite struct TotalHammingDistanceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7ad2ee12-8541-4325-9de2-dfb22cf39997",
             input: "nums = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9e1d0f2b-8b7d-47c1-8486-af559ae7a9a5",
             input: "nums = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9a259032-5c8f-45cd-a8bd-6b3a3cc6cc6e",
             input: "nums = [1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3e005362-5383-46fc-beec-36862bc7e582",
             input: "nums = [0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "959932d0-4df2-4185-b6f6-86af60898599",
             input: "nums = [1,2]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "687f67ce-f2a3-4e6f-98fe-7983b9ff2ac8",
             input: "nums = [1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "682ac3fa-b24a-43f6-ba6a-0fa5fdb478a9",
             input: "nums = [0,1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "288784eb-a5dd-4d0f-86a9-9fced7dc2d81",
             input: "nums = [-1,-1,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c1b1eb54-f8d5-49d4-92fe-2a628e07cc9a",
             input: "nums = [1000,2000,3000]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "9bb801c8-439c-4c71-836b-3bfdc1a6eab3",
             input: "nums = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "21dc15be-8b50-44ea-b9f6-be7a1a793fa3",
             input: "nums = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f660dc07-80a8-4390-9500-70497232b4a5",
             input: "nums = [1,1,1,1,2]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "a1649fcc-c77a-4ca9-a21c-4db497b9565d",
             input: "nums = [10,10,10,10,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "73c114b1-0823-4d7c-b400-76d669f23b7b",
             input: "nums = [100,100,100,100,100]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f01b2f3d-e459-4ea6-b59c-9b1681673174",
             input: "nums = [1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e3988c02-8d5d-4655-a373-5b643860e8eb",
             input: "nums = [0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b7b86bf0-a8ce-4291-bdd1-0bf7b266576b",
             input: "nums = [1,-1,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "3913f66c-7a70-49d2-83a4-e71555626f93",
             input: "nums = [10,20,30]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "1a84c9c9-a633-4c2f-8d3b-94c170b0b48e",
             input: "nums = [1,2,3,4,5]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "487acc9f-a87c-4140-a315-d12dd6fbcb76",
             input: "nums = [5,4,3,2,1]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "e51f9258-0abf-4b00-b939-4a5deb39900b",
             input: "nums = [-1,-2,-3,-4,-5]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "67c05d8e-f365-46ef-a9dd-bf71dd59689a",
             input: "nums = [100,200,300,400,500]",
             expected: "29", orderMatters: true),
            TestCaseData(id: "a6097c2d-ae8b-4a12-b82b-00e617b72ef4",
             input: "nums = [1,3,5,7,9]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "771f978d-51ab-4cbd-9493-fefa1a0a523d",
             input: "nums = [9,7,5,3,1]",
             expected: "18", orderMatters: true),
            TestCaseData(id: "35ae1d20-90d2-4081-b49f-5fd64e905ff5",
             input: "nums = [2,2,2,2,1]",
             expected: "8", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "total-hamming-distance"
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
            guard p_nums.count >= 1 && p_nums.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.totalHammingDistance(p_nums)
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
