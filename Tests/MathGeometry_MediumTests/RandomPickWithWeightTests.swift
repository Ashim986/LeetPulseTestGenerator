import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCRandomPickWithWeight {
    private class Solution {
        var weights = [Int]()
        var cumulativeSum = [Int]()
        init(_ w: [Int]) {
            weights = w
            cumulativeSum = Array(repeating: 0, count: w.count)
            var sum = 0
            for i in 0..<w.count {
                sum += w[i]
                cumulativeSum[i] = sum
            }
        }
        func pickIndex() -> Int {
            let random = Int.random(in: 0..<cumulativeSum[cumulativeSum.count - 1])
            var left = 0
            var right = cumulativeSum.count - 1
            while left < right {
                let mid = (left + right) / 2
                if cumulativeSum[mid] < random {
                    left = mid + 1
                }
                else {
                    right = mid
                }
            }
            return left
        }
    }

    @Suite struct RandomPickWithWeightTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "2efd868e-446f-42e8-982b-27de6d3b8b88",
             input: "weights = [1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f7b71428-516b-4206-b28b-eb3fcca1a90c",
             input: "weights = [10, 1, 2, 3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c68c26ba-cec1-4f74-95d2-9891cb04a625",
             input: "weights = [0, 1, 0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3f1b044d-05b5-499d-bc7a-5901b96d80bb",
             input: "weights = [1, 0, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6ab5b989-5c8c-4ea0-aea8-802d246913b7",
             input: "weights = [1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8b406a5e-4c07-478e-a025-de94b7317f50",
             input: "weights = [5, 5, 5, 5, 5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "46bcd3c1-c498-4a95-bc42-d24a4353f71f",
             input: "weights = [10, 10, 10, 10, 10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "030219eb-c3ca-4535-83a0-47c2e7450256",
             input: "weights = [1, 2, 3, 4, 5]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e4e22f8b-7244-442a-a7b9-4cb689a572a8",
             input: "weights = [5, 4, 3, 2, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a4fc31c6-2c9a-4906-bc15-c64ef22740ae",
             input: "weights = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b90e6c1f-70fb-42f8-b665-b1c1267b9ca8",
             input: "weights = [10, 20, 30, 40, 50]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a190f99a-fc16-4d3b-999c-f0e17fa78d82",
             input: "weights = [50, 40, 30, 20, 10]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "70673851-81bb-4c40-82a3-bef6a8308c1d",
             input: "weights = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "a8abd885-a8b0-4c57-b852-b20115c40b0e",
             input: "weights = [100, 200, 300, 400, 500]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "75fd2690-56cb-4f3b-ad15-80291c805ba1",
             input: "weights = [500, 400, 300, 200, 100]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "e5bcc60a-11e0-47b7-86e3-8164e1c59970",
             input: "weights = [1, 3, 5, 7, 9]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d56b0f8e-c44a-4d39-8ea8-a0ac1d01cc68",
             input: "weights = [9, 7, 5, 3, 1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "178e2677-f744-4a72-9078-3455ea14fb99",
             input: "weights = [1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "883f94a9-fad2-439e-93b2-851d80f03cae",
             input: "weights = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "1e0dcb09-8281-4209-85ca-1d79e0ca3eb2",
             input: "weights = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "31f9d2c0-9f62-4e13-80f9-441fba1b6a36",
             input: "weights = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9409dd1e-9f94-4f99-952d-2925905f0389",
             input: "weights = [1, 3, 6, 10, 15]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8a2ad62d-bcef-4511-bf3e-dff79ba0cb24",
             input: "weights = [15, 10, 6, 3, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "dc48c936-4d8d-43dd-b101-bfcc5e2df616",
             input: "weights = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e159255f-31da-4fec-bcb2-14923a9ba4f8",
             input: "weights = [1, 2, 4, 8, 16]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "random-pick-with-weight"
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
