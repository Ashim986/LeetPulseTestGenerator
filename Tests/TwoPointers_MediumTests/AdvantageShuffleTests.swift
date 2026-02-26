import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAdvantageShuffle {
    private class Solution {
        func advantageCount(_ A: [Int], _ B: [Int]) -> [Int] {
            let n = A.count
            var res: [Int] = Array(repeating: 0, count: n)
            let a = A.sorted()
            let b = B.sorted { $0 > $1 }
            var left = 0
            var right = n - 1
            for bIndex in 0..<n {
                if a[right] > b[bIndex] {
                    res[bIndex] = a[right]
                    right -= 1
                } else {
                    res[bIndex] = a[left]
                    left += 1
                }
            }
            return res
        }
    }

    @Suite struct AdvantageShuffleTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "36cf723f-b381-4206-a4b2-aca7400cc248",
             input: "A = [], B = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "96cbb9e8-1af6-4aa6-97f7-db3523d04bb7",
             input: "A = [1,2,3,4,5,6,7,8,9,10], B = [10,9,8,7,6,5,4,3,2,1]",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "7e17de4b-0456-4ced-8966-163be9f06c06",
             input: "A = [10,9,8,7,6,5,4,3,2,1], B = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[10,9,8,7,6,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "e44a7217-2c3d-473a-985e-ad715cffc026",
             input: "A = [1,2,3], B = [4,5,6]",
             expected: "[4,5,6]", orderMatters: true),
            TestCaseData(id: "9d2100fe-fb16-4490-954f-2c08a00e4391",
             input: "A = [10,20,30], B = [1,2,3]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "91d2f239-6386-4c32-9751-fb45456870ed",
             input: "A = [5,5,5], B = [1,2,3]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "86cb2e65-0a4c-4c72-8c86-29f2e307047d",
             input: "A = [1,1,1], B = [2,3,4]",
             expected: "[2,3,4]", orderMatters: true),
            TestCaseData(id: "3b2711e3-515b-4fbe-989b-f02b54514149",
             input: "A = [1], B = [2]",
             expected: "[2]", orderMatters: true),
            TestCaseData(id: "8783076e-6dd3-48cd-a11c-a9b289dbcc44",
             input: "A = [1,2], B = [3,4]",
             expected: "[3,4]", orderMatters: true),
            TestCaseData(id: "a8152db4-9f0d-4cc5-853c-6b289d5b05cd",
             input: "A = [10,20,30,40,50], B = [5,5,5,5,5]",
             expected: "[5,5,5,5,5]", orderMatters: true),
            TestCaseData(id: "a7bd0434-b307-4456-a4f6-48a5d85d2121",
             input: "A = [1,2,3,4,5], B = [10,20,30,40,50]",
             expected: "[10,20,30,40,50]", orderMatters: true),
            TestCaseData(id: "c5830d93-c8cf-44f8-aea0-2a13b5a59e94",
             input: "A = [-1,-2,-3], B = [1,2,3]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "a1761854-3b9b-4b95-a40b-590d08658b1e",
             input: "A = [1,2,3], B = [-1,-2,-3]",
             expected: "[-1,-2,-3]", orderMatters: true),
            TestCaseData(id: "1d3d539a-b355-4379-8983-c1e618a4c03b",
             input: "A = [1000,2000,3000], B = [1,2,3]",
             expected: "[1,2,3]", orderMatters: true),
            TestCaseData(id: "9358707c-180a-4c18-ba47-e5c30315ac5f",
             input: "A = [1,2,3], B = [1000,2000,3000]",
             expected: "[1000,2000,3000]", orderMatters: true),
            TestCaseData(id: "67742332-bf05-4f40-92b4-4573944fd512",
             input: "A = [1,1,1,1,1], B = [2,2,2,2,2]",
             expected: "[2,2,2,2,2]", orderMatters: true),
            TestCaseData(id: "67d399a5-7f4d-4acc-8b23-01ce214a47af",
             input: "A = [2,2,2,2,2], B = [1,1,1,1,1]",
             expected: "[1,1,1,1,1]", orderMatters: true),
            TestCaseData(id: "2ca7fbae-6af9-47ef-bcc1-f39b77f6a55b",
             input: "A = [1,3,5], B = [2,4,6]",
             expected: "[4,6,2]", orderMatters: true),
            TestCaseData(id: "0598ae8b-9fdc-4b0e-933e-f87dddd7f572",
             input: "A = [6,5,4], B = [3,2,1]",
             expected: "[3,2,1]", orderMatters: true),
            TestCaseData(id: "fae31388-8d32-4ea8-bf5e-e8c0501be3d3",
             input: "A = [1,1,1,1,1,1,1,1,1,1], B = [2,2,2,2,2,2,2,2,2,2]",
             expected: "[2,2,2,2,2,2,2,2,2,2]", orderMatters: true),
            TestCaseData(id: "4274137c-cfa7-44ec-8171-d659e13705c8",
             input: "nums1 = [2,7,11,15], nums2 = [1,10,4,11]",
             expected: "[2,11,7,15]", orderMatters: true),
            TestCaseData(id: "6c401c3e-6b80-4f8e-9cf0-f559b2972079",
             input: "nums1 = [12,24,8,32], nums2 = [13,25,32,11]",
             expected: "[24,32,8,12]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "advantage-shuffle"
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

            guard let p_A = InputParser.parseIntArray(params[0]) else {
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
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }
            guard let p_B = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_B.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: B array too large (\(p_B.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_A.count >= 1 && p_A.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums1.length <= 105"
                )
                return
            }
            guard p_A.allSatisfy({ $0 >= 0 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums1[i], nums2[i] <= 109"
                )
                return
            }
            guard p_B.allSatisfy({ $0 >= 0 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums1[i], nums2[i] <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.advantageCount(p_A, p_B)
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
