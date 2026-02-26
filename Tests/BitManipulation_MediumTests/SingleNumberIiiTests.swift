import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSingleNumberIii {
    private class Solution {
        func singleNumber(_ nums: [Int]) -> [Int] {
            var xor = 0
            for num in nums {
                xor ^= num
            }
            var rightmostSetBit = xor & -xor
            var single1 = 0, single2 = 0
            for num in nums {
                if num & rightmostSetBit != 0 {
                    single1 ^= num
                } else {
                    single2 ^= num
                }
            }
            return [single1, single2]
        }
    }

    @Suite struct SingleNumberIiiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "76e9990a-1b38-43a0-8fa5-8b196d21ce8c",
             input: "nums = []",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "f6127057-c3ff-4a8b-ad8b-5dd4cc5368fe",
             input: "nums = [1]",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "30b0001c-30f7-48de-b623-74a67fd300e5",
             input: "nums = [1,2,1]",
             expected: "[2]", orderMatters: false),
            TestCaseData(id: "80972d99-a501-44bd-b472-c50aa1d5fd3c",
             input: "nums = [1,1,2,2,3]",
             expected: "[3]", orderMatters: false),
            TestCaseData(id: "80423405-cb9d-4127-baf5-966d75804967",
             input: "nums = [0,0,1,2,1]",
             expected: "[2]", orderMatters: false),
            TestCaseData(id: "64bece52-bf51-4d75-919b-9c836f7cf7e5",
             input: "nums = [-1,-1,1]",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "a92a49b0-e89b-4dea-ab53-548052dbda37",
             input: "nums = [1,2,3,4,5,1,2,3,4]",
             expected: "[5]", orderMatters: false),
            TestCaseData(id: "d55ae18e-c6ae-4adc-9aed-a7f819634c6a",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6]",
             expected: "[6]", orderMatters: false),
            TestCaseData(id: "b1e10fdb-5b37-4527-b91e-b33e222e86a3",
             input: "nums = [10,20,10,30,20,40,50]",
             expected: "[30,40,50]", orderMatters: false),
            TestCaseData(id: "10ba97e9-2b86-4a4f-892a-349495d6025b",
             input: "nums = [100,200,100,300,200,400,500]",
             expected: "[300,400,500]", orderMatters: false),
            TestCaseData(id: "4ace0af8-7494-4c89-82a0-b2923e8100da",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9]",
             expected: "[10]", orderMatters: false),
            TestCaseData(id: "70b6a46b-224f-483d-9f23-a5ffea9cad53",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11]",
             expected: "[11]", orderMatters: false),
            TestCaseData(id: "b6005df4-1407-4a7c-8d62-c20766a2b43f",
             input: "nums = [0,0,0,1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7]",
             expected: "[7]", orderMatters: false),
            TestCaseData(id: "f66f8116-cf6f-4c9c-b065-7f1c0e68b4b3",
             input: "nums = [1,2,1,3,2,5,3,5]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "acacd981-3642-4c9a-b118-901f1517ced7",
             input: "nums = [1,2,3,1,2,3,4,5,4,5]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "88c7fab4-db03-4e67-a154-6629a25003c5",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "bea1e535-96a8-44e3-9fe6-6e76762c50c2",
             input: "nums = [1,2,1,3,2,5,3,5,4,4]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "1a3d0551-b8cf-47f7-8cff-e98b964f5754",
             input: "nums = [1,2,3,4,5,1,2,3,4,5,6,7,8,9,10,6,7,8,9,10]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "ae5df393-6bf7-4e1f-92bf-c6bf73d6444b",
             input: "nums = [10,20,10,30,20,40,50,40,50]",
             expected: "[30]", orderMatters: false),
            TestCaseData(id: "3964b956-d52f-4bd2-a452-2726c39bfaa2",
             input: "nums = [100,200,100,300,200,400,500,400,500]",
             expected: "[300]", orderMatters: false),
            TestCaseData(id: "66f37aa2-21c7-4954-ab16-6beec04caf91",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "[11,12]", orderMatters: false),
            TestCaseData(id: "4fbbbd9d-8d4c-4bb5-8f11-006177f65396",
             input: "nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13]",
             expected: "[13]", orderMatters: false),
            TestCaseData(id: "8202ec17-4244-40c8-9eca-a2ec688bef7e",
             input: "nums = [0,0,0,1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7,7,7,8]",
             expected: "[8]", orderMatters: false),
            TestCaseData(id: "b10650e9-181d-45f1-a148-c46002d18040",
             input: "nums = [1,2,1,3,2,5,3,5,4,4,6,6]",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "a1b107f8-d701-4951-9806-35f6016c354d",
             input: "nums = [1,2,3,1,2,3,4,5,4,5,6,7,8,9,10,6,7,8,9,10,11,12,13]",
             expected: "[11,12,13]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "single-number-iii"
            let topic = "bit-manipulation"
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
            guard p_nums.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= nums.length <= 3 * 104"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -231 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= nums[i] <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.singleNumber(p_nums)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
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
                input: rawInput, originalExpected: expectedOutput,
                computedOutput: computedOutput,
                isValid: true,
                status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
