import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCSquaresOfASortedArray {
    private class Solution {
        func sortedSquares(_ nums: [Int]) -> [Int] {
            return nums.map { $0 * $0 }.sorted()
        }
    }

    @Suite struct SquaresOfASortedArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b60d5211-774e-4198-93db-52d05111378f",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "05338a99-b127-479b-8ce8-72133a8780f9",
             input: "nums = [0]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "601b98ba-9d0a-41b1-8275-fde425190313",
             input: "nums = [1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "473dbb54-3dc1-498c-9fb5-a33b7941323f",
             input: "nums = [-1]",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "d742222e-5080-4f9e-b28c-0b35e711cde3",
             input: "nums = [1, 2]",
             expected: "[1, 4]", orderMatters: true),
            TestCaseData(id: "6b4d36d1-73aa-4f9a-ae3a-2c7a092ba847",
             input: "nums = [-1, 2]",
             expected: "[1, 4]", orderMatters: true),
            TestCaseData(id: "1ff54fe4-5687-45a2-b351-096b5136b05a",
             input: "nums = [1, -2]",
             expected: "[1, 4]", orderMatters: true),
            TestCaseData(id: "5c409165-20ed-475e-9362-003b53de2d13",
             input: "nums = [-1, -2]",
             expected: "[1, 4]", orderMatters: true),
            TestCaseData(id: "12cc474b-c1ca-4811-aeca-eccdfeea2d4f",
             input: "nums = [1000, 2000]",
             expected: "[1000000, 4000000]", orderMatters: true),
            TestCaseData(id: "a4d89d99-4dc6-418d-9255-916df1cd3a89",
             input: "nums = [-1000, -2000]",
             expected: "[1000000, 4000000]", orderMatters: true),
            TestCaseData(id: "91f4ae7f-7e50-4c37-8eae-6fa4af333b95",
             input: "nums = [1, 1, 1]",
             expected: "[1, 1, 1]", orderMatters: true),
            TestCaseData(id: "142b88d9-75de-4e23-b7d8-d98b2b7c43e2",
             input: "nums = [-1, -1, -1]",
             expected: "[1, 1, 1]", orderMatters: true),
            TestCaseData(id: "5a0a0caa-22f3-4462-8718-976d9c58a376",
             input: "nums = [1, 2, 3, 4, 5]",
             expected: "[1, 4, 9, 16, 25]", orderMatters: true),
            TestCaseData(id: "cf1408c5-3f32-4795-bd98-249c74559918",
             input: "nums = [-5, -4, -3, -2, -1]",
             expected: "[1, 4, 9, 16, 25]", orderMatters: true),
            TestCaseData(id: "619504a8-b728-4d1d-ab40-466a9a7dee53",
             input: "nums = [-1, -2, -3, -4, -5]",
             expected: "[1, 4, 9, 16, 25]", orderMatters: true),
            TestCaseData(id: "d26a3204-7988-4897-b67f-5485bf503b17",
             input: "nums = [10, 20, 30, 40, 50]",
             expected: "[100, 400, 900, 1600, 2500]", orderMatters: true),
            TestCaseData(id: "3af25475-6c1a-4a56-8702-6deda7e8a70b",
             input: "nums = [-50, -40, -30, -20, -10]",
             expected: "[100, 400, 900, 1600, 2500]", orderMatters: true),
            TestCaseData(id: "11370126-8e9d-45eb-9db1-86ee55a1c224",
             input: "nums = [0, 0, 0, 0, 0]",
             expected: "[0, 0, 0, 0, 0]", orderMatters: true),
            TestCaseData(id: "3d0c4d11-b95b-48da-ac62-8b264f4c4067",
             input: "nums = [100, -100, 100, -100, 100]",
             expected: "[10000, 10000, 10000, 10000, 10000]", orderMatters: true),
            TestCaseData(id: "7420ed32-c560-436e-840b-f95df3c2ff93",
             input: "nums = [-100, 100, -100, 100, -100]",
             expected: "[10000, 10000, 10000, 10000, 10000]", orderMatters: true),
            TestCaseData(id: "8a53533f-3eec-4f44-a03f-e7d2430ae448",
             input: "nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]",
             expected: "[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]", orderMatters: true),
            TestCaseData(id: "3e05185b-20b2-4818-843b-688d355339b4",
             input: "nums = [-9, -8, -7, -6, -5, -4, -3, -2, -1, 0]",
             expected: "[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]", orderMatters: true),
            TestCaseData(id: "cd621cc5-bb77-4697-8e26-885867ce93cd",
             input: "nums = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]",
             expected: "[10000, 40000, 90000, 160000, 250000, 360000, 490000, 640000, 810000, 1000000]", orderMatters: true),
            TestCaseData(id: "d19d6e14-5488-46f8-94ed-e4e8900753e7",
             input: "nums = [-1000, -900, -800, -700, -600, -500, -400, -300, -200, -100]",
             expected: "[1000000, 810000, 640000, 490000, 360000, 250000, 160000, 90000, 40000, 10000]", orderMatters: true),
            TestCaseData(id: "f05af0e7-6a11-4626-8e25-c7946c65b62c",
             input: "nums = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]",
             expected: "[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "squares-of-a-sorted-array"
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
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.sortedSquares(p_nums)
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
