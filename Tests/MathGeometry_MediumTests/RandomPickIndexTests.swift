import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRandomPickIndex {
    private class Solution {
        var nums: [Int]
        init(_ nums: [Int]) {
            self.nums = nums
        }
        func pick(_ target: Int) -> Int {
            var reservoir: Int?
            var count = 0
            for (i, num) in nums.enumerated() {
                if num == target {
                    count += 1
                    if reservoir == nil || Int.random(in: 1...count) == 1 {
                        reservoir = i
                    }
                }
            }
            return reservoir.unsafelyUnwrapped
        }
    }

    @Suite struct RandomPickIndexTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "631b37a2-39ef-46a6-8cc2-a3d810f0bd60",
             input: "nums = [1], target = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "149b0cb2-8829-4438-b778-3bca78dae9f3",
             input: "nums = [1,2,3,4,5], target = 5",
             expected: "4", orderMatters: true),
            TestCaseData(id: "b02e203a-11cb-4dd4-92dc-c46d30d31e21",
             input: "nums = [5,4,3,2,1], target = 1",
             expected: "4", orderMatters: true),
            TestCaseData(id: "abb3e83a-b20f-41fc-8a86-41e029c99618",
             input: "nums = [1,2,3,4,5], target = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1a6b56ff-9588-4aa2-bae5-bcacd3f112d1",
             input: "nums = [1,2,3,4,5], target = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "72235733-e92e-48ad-9566-fb1048abf688",
             input: "nums = [1,-2,3,-4,5], target = -2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e67f6f7b-5b7f-466f-a63b-6a18c0b2b90c",
             input: "nums = [10,20,30,40,50], target = 30",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d78cba8c-d282-4112-b350-8afd7204ca3c",
             input: "nums = [100,200,300,400,500], target = 400",
             expected: "3", orderMatters: true),
            TestCaseData(id: "1a908f0f-fedd-48ba-ae66-6d49489fd730",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 5",
             expected: "4", orderMatters: true),
            TestCaseData(id: "c37bc32b-3f8b-425e-88a3-054c10dbf686",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 10",
             expected: "9", orderMatters: true),
            TestCaseData(id: "8216d682-7a4f-4ffc-aa8b-7d3083458c6c",
             input: "nums = [10,9,8,7,6,5,4,3,2,1], target = 1",
             expected: "9", orderMatters: true),
            TestCaseData(id: "a4864862-3925-48d8-9ef7-6e2a21ceb84c",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a795325d-b5d8-4dd9-8f85-3e871bd54a05",
             input: "nums = [1,1,2,2,3,3,4,4,5,5], target = 3",
             expected: "4", orderMatters: true),
            TestCaseData(id: "45302aa4-ef30-4ba0-954e-e4c581066df4",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 6",
             expected: "5", orderMatters: true),
            TestCaseData(id: "df9782cb-bb90-4317-afd5-44180f4a6665",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 7",
             expected: "6", orderMatters: true),
            TestCaseData(id: "401d022a-2d3e-4a05-a48d-63d16e9e1ed8",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 8",
             expected: "7", orderMatters: true),
            TestCaseData(id: "eec82ce7-9824-49a9-b5ac-52d0cf654a8d",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 9",
             expected: "8", orderMatters: true),
            TestCaseData(id: "e7af758a-5932-47fa-9c52-b4803971c3ee",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 4",
             expected: "3", orderMatters: true),
            TestCaseData(id: "bf6f9fa4-1779-4ce8-977b-65d05e5f9266",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "277c6f71-5b44-4704-b195-b9525fac6795",
             input: "nums = [1,2,3,4,5,6,7,8,9,10], target = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "4e30f924-83b1-4f19-8ae4-b6619fd1316a",
             input: "nums = [-1,-2,-3,-4,-5], target = -3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8457392d-2e58-4613-8cde-8a50acad967b",
             input: "nums = [-10,-9,-8,-7,-6], target = -8",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0be3fadb-0d6b-43f4-81df-505651136a76",
             input: "nums = [-1,-1,-1], target = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e62d8453-ea63-4516-8338-af5ea74f52f5",
             input: "nums = [10000,20000,30000], target = 20000",
             expected: "1", orderMatters: true),
            TestCaseData(id: "2d0ea2fc-036d-4052-bf6a-ee9a64429e38",
             input: "nums = [10,9,8,7,6,5,4,3,2,1], target = 5",
             expected: "5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "random-pick-index"
            let topic = "math-geometry"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            guard initArgs.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Init args count too small"
                )
                return
            }
            guard let initP_0 = InputParser.parseIntArray(initArgs[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 0 as [Int]"
                )
                return
            }
            var obj = Solution(initP_0)

            var results: [String] = []
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                results.append("null")
            }

            let computedOutput = "[" + results.joined(separator: ",") + "]"
            // Class-design comparison: normalize null representations and whitespace
            func normalizeClassOutput(_ s: String) -> String {
                var result = s.replacingOccurrences(of: " ", with: "")
                result = result.replacingOccurrences(of: "nil", with: "null")
                result = result.replacingOccurrences(of: "None", with: "null")
                result = result.replacingOccurrences(of: "NULL", with: "null")
                return result
            }
            let matches = normalizeClassOutput(computedOutput) == normalizeClassOutput(expectedOutput)
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
