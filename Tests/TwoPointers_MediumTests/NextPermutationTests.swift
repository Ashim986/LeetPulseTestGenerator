import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNextPermutation {
    private class Solution {
        func nextPermutation(_ nums: inout [Int]) {
            let n = nums.count
            var i = n - 2
            while i >= 0 && nums[i] >= nums[i+1] { i -= 1 }
            if i >= 0 {
                var j = n - 1
                while nums[j] <= nums[i] { j -= 1 }
                nums.swapAt(i, j)
            }
            nums[(i+1)...].reverse()
        }
    }

    @Suite struct NextPermutationTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "001FC4D2-80CE-4938-81ED-C510A248BD76",
             input: "[1,2,3]",
             expected: "[1,3,2]", orderMatters: true),
            TestCaseData(id: "16704B54-363F-44C1-9A81-88C4253C1679",
             input: "[3,2,1]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "6AE04FD7-63C4-43A5-827B-6ABDEAA6AA90",
             input: "[1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "29E3AA3B-E137-4965-9076-43C1E6FF41DA",
             input: "[1,2]",
             expected: "[2,1]", orderMatters: true),
            TestCaseData(id: "8551C500-AD08-4760-A90F-36EFB701F619",
             input: "[2,1]",
             expected: "[1,2]", orderMatters: true),
            TestCaseData(id: "CD1914C5-0624-4DBF-AF28-2B4E4DD3134E",
             input: "[1,1,5]",
             expected: "[1,5,1]", orderMatters: true),
            TestCaseData(id: "05388CCC-9BA6-4B0E-9DF1-4B1016B07F58",
             input: "[1,3,2]",
             expected: "[2,3,1]", orderMatters: true),
            TestCaseData(id: "38D8AA9D-605D-4A60-88D0-1BB707876B77",
             input: "[5,4,3,3,2,1]",
             expected: "[1,2,3,3,4,5]", orderMatters: true),
            TestCaseData(id: "B05D1925-30EF-431E-8A3C-FF4D6F604815",
             input: "[1,3,2,2]",
             expected: "[2,3,1,2]", orderMatters: true),
            TestCaseData(id: "87803CA6-6E78-4C59-BC64-E060E5B70556",
             input: "[1,5,1]",
             expected: "[5,1,1]", orderMatters: true),
            TestCaseData(id: "3DF312C3-299A-4165-A0BD-93864F19B38E",
             input: "[4,5,2,6,3,1]",
             expected: "[4,5,3,1,2,6]", orderMatters: true),
            TestCaseData(id: "A3E5A551-43A8-41FE-B51B-193A3EDB13D1",
             input: "[2,3,1,3,3]",
             expected: "[2,3,3,3,1]", orderMatters: true),
            TestCaseData(id: "029452BF-1ADF-4955-90D7-2DF91A9E6BC0",
             input: "[1,2,3,4]",
             expected: "[1,2,4,3]", orderMatters: true),
            TestCaseData(id: "D40D1071-0644-4A8B-AF3F-E332271F916A",
             input: "[2,3,1,3]",
             expected: "[2,3,3,1]", orderMatters: true),
            TestCaseData(id: "62119A8F-4659-4E1B-B82D-2E5016A3F079",
             input: "[1,5,8,4,7,6,5,3,1]",
             expected: "[1,5,8,5,1,3,4,6,7]", orderMatters: true),
            TestCaseData(id: "AAA67482-A45C-4EA3-83B4-1071DC82F6B9",
             input: "[3,3,2,1]",
             expected: "[1,2,3,3]", orderMatters: true),
            TestCaseData(id: "9B2FD9DC-37C0-488A-AE79-CFDF58A3BA70",
             input: "[1,2,5,4,3]",
             expected: "[1,3,4,5,2]", orderMatters: true),
            TestCaseData(id: "64D750E7-6E03-4E80-97FE-B6AEE526AA3B",
             input: "[1,2,3,4,5]",
             expected: "[1,2,4,3,5]", orderMatters: true),
            TestCaseData(id: "8E82AFD2-D57F-4757-8FEC-D1FDAD2CABFB",
             input: "[3,1,4,2]",
             expected: "[3,2,1,4]", orderMatters: true),
            TestCaseData(id: "2EA02133-1414-4C8E-81D9-68E0C597DDEC",
             input: "[2,3,1]",
             expected: "[3,1,2]", orderMatters: true),
            TestCaseData(id: "22FB5BB4-EF05-4102-8AB6-81FF0B97D5F4",
             input: "[5,4,3,2,1]",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "aa4649ea-21df-4258-ae73-6cf7c2cfad77",
             input: "nums = [1,1,5]",
             expected: "[1,5,1]", orderMatters: true),
            TestCaseData(id: "c6c1317a-2cd4-4402-aa5c-1018f7f03f13",
             input: "nums = [6,9,3,5,2]",
             expected: "[6,9,3,5,2]", orderMatters: true),
            TestCaseData(id: "35b83a13-e680-4f66-964c-9cfa85aeb9fc",
             input: "nums = [1,8,2]",
             expected: "[2,1,8]", orderMatters: true),
            TestCaseData(id: "b16edf9d-766f-439c-bfc9-7b7ba48be87a",
             input: "nums = [5]",
             expected: "[5]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "next-permutation"
            let topic = "two-pointers"
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

            guard var p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as inout [Int]"
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
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums[i] <= 100"
                )
                return
            }

            let solution = Solution()
            solution.nextPermutation(&p_nums)
            let computedOutput = OutputSerializer.serialize(p_nums)

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
