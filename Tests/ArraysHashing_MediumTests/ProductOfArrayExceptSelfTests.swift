import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCProductOfArrayExceptSelf {
    private class Solution {
        func productExceptSelf(_ nums: [Int]) -> [Int] {
            var result = Array(repeating: 1, count: nums.count)
            var prefix = 1
            for i in 0..<nums.count {
                result[i] = prefix
                prefix *= nums[i]
            }
            var suffix = 1
            for i in stride(from: nums.count - 1, through: 0, by: -1) {
                result[i] *= suffix
                suffix *= nums[i]
            }
            return result
        }
    }

    @Suite struct ProductOfArrayExceptSelfTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "C251CCA7-1827-4BBA-A5DE-E003207E45D0",
             input: "1,2,3,4",
             expected: "[24,12,8,6]", orderMatters: true),
            TestCaseData(id: "5254D733-ABC1-4154-9C03-FD300D500924",
             input: "-1,1,0,-3,3",
             expected: "[0,0,9,0,0]", orderMatters: true),
            TestCaseData(id: "9C7CD0E5-3E10-41D8-B409-7D05C99E30C3",
             input: "0,1",
             expected: "[1,0]", orderMatters: true),
            TestCaseData(id: "FE25118C-5D2B-440D-85D6-8ADB9CF0B43E",
             input: "1,0",
             expected: "[0,1]", orderMatters: true),
            TestCaseData(id: "C805E563-7E65-44ED-8BDB-3C7538F0B971",
             input: "1,1",
             expected: "[1,1]", orderMatters: true),
            TestCaseData(id: "EFFA7C28-74B2-4B80-8645-913FF8610867",
             input: "1,2,3,4,5",
             expected: "[120,60,40,30,24]", orderMatters: true),
            TestCaseData(id: "A1CCA928-C786-4AB7-A26C-3347B09D5806",
             input: "0,0,0",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "F3DF811A-D288-46C7-A167-5CBDB12E8E99",
             input: "5",
             expected: "[1]", orderMatters: true),
            TestCaseData(id: "A15D403E-8F1D-48DD-9D97-7AA048C03737",
             input: "1,1,1",
             expected: "[1,1,1]", orderMatters: true),
            TestCaseData(id: "4491CA33-10F2-4E5E-924D-5C3880B7BE34",
             input: "2,3,4,5",
             expected: "[60,40,30,24]", orderMatters: true),
            TestCaseData(id: "0E96A674-09B7-4E56-961A-3206B724B57B",
             input: "0,-1,0",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "AE8593CA-6D91-40A3-9B11-F6C3BC7FEE9A",
             input: "2,-1,0,-3",
             expected: "[0,0,6,0]", orderMatters: true),
            TestCaseData(id: "E5E6C637-B12B-4759-9797-109507A2D47D",
             input: "10,20,30,40",
             expected: "[24000,12000,8000,6000]", orderMatters: true),
            TestCaseData(id: "993A440F-BE70-4BE1-944D-A2F8DCD11647",
             input: "5,5,5",
             expected: "[25,25,25]", orderMatters: true),
            TestCaseData(id: "6A388589-8C81-4119-BD8D-717B97E52662",
             input: "-5,-5,-5",
             expected: "[25,25,25]", orderMatters: true),
            TestCaseData(id: "002ECC4E-F7D5-4D76-9F44-D9984D94E987",
             input: "0,1,0",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "476DF35E-9FAE-45F6-AFFC-C97FDCC9EA0E",
             input: "1,-1,1",
             expected: "[-1,1,-1]", orderMatters: true),
            TestCaseData(id: "0D822AB6-F03C-41BD-BD3C-7F541232FB8B",
             input: "-1,-1,0",
             expected: "[0,0,1]", orderMatters: true),
            TestCaseData(id: "5625436C-CC96-43D2-A5EA-3029F91DAD8A",
             input: "1,1,1,1",
             expected: "[1,1,1,1]", orderMatters: true),
            TestCaseData(id: "9AB8F2CC-BF20-427D-AF79-292D001A08AE",
             input: "1,2,3",
             expected: "[6,3,2]", orderMatters: true),
            TestCaseData(id: "9903AFBE-66D4-4668-AA0C-C16C299B4947",
             input: "-1,-2,-3",
             expected: "[6,3,2]", orderMatters: true),
            TestCaseData(id: "B09DAC0A-2C74-4C00-AC11-0088703A75BC",
             input: "10,10,10",
             expected: "[100,100,100]", orderMatters: true),
            TestCaseData(id: "8E6E64BB-F5ED-4C8E-B16A-E0B4D206B232",
             input: "-10,-10,-10",
             expected: "[100,100,100]", orderMatters: true),
            TestCaseData(id: "01358136-64CF-44C6-B83A-30EDC92131BD",
             input: "5,10,15",
             expected: "[150,75,50]", orderMatters: true),
            TestCaseData(id: "97B9072C-3B0E-4E42-9AF7-A8CA78AFE39B",
             input: "-5,-10,-15",
             expected: "[150,75,50]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "product-of-array-except-self"
            let topic = "arrays-hashing"
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
            guard p_nums.count >= 2 && p_nums.count <= 100000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 2 <= nums.length <= 10^5"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -30 && $0 <= 30 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -30 <= nums[i] <= 30"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.productExceptSelf(p_nums)
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

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
