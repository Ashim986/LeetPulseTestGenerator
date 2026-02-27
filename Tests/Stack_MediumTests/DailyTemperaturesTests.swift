import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDailyTemperatures {
    private class Solution {
        func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
            var result = [Int](repeating: 0, count: temperatures.count)
            var stack: [Int] = []  // indices

            for i in 0..<temperatures.count {
                while !stack.isEmpty && temperatures[i] > temperatures[stack[stack.count - 1]] {
                    let j = stack.removeLast()
                    result[j] = i - j
                }
                stack.append(i)
            }

            return result
        }
    }

    @Suite struct DailyTemperaturesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "21debf1b-f7bf-4347-816b-bafe9714f0d4",
             input: "nums = [1,2,3]",
             expected: "[1,1,0]", orderMatters: true),
            TestCaseData(id: "af393814-6bf7-487b-82b0-8b4fba462ac5",
             input: "nums = [3,2,1]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "ab60d48e-9434-4215-aeb4-bb378e47f195",
             input: "nums = [1,1,1]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "0f0a51e0-2a4d-4944-9d9d-4a4239bae3ae",
             input: "nums = []",
             expected: "[]", orderMatters: true),
            TestCaseData(id: "9c681b79-45b3-49c7-b31f-5dc94b31a5fd",
             input: "nums = [1]",
             expected: "[0]", orderMatters: true),
            TestCaseData(id: "b2d841b2-4aa3-4ad0-9327-936f63a9381e",
             input: "nums = [1,2]",
             expected: "[1,0]", orderMatters: true),
            TestCaseData(id: "bb7c495e-0f81-4d93-916b-a1e7f26a9c95",
             input: "nums = [2,1]",
             expected: "[0,0]", orderMatters: true),
            TestCaseData(id: "c23f2c4d-876d-4138-9501-a40465581c92",
             input: "nums = [-1,-2,-3]",
             expected: "[0,0,0]", orderMatters: true),
            TestCaseData(id: "9b814243-13b7-43f2-9c69-8ec27250be21",
             input: "nums = [1000,1001,1002]",
             expected: "[1,1,0]", orderMatters: true),
            TestCaseData(id: "c83b25aa-c35c-4940-b985-1e402b6f4cb7",
             input: "nums = [3,3,3,3,3]",
             expected: "[0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "7d7a8baa-d601-42f9-88b1-0ca3523e7ee1",
             input: "nums = [1,2,3,4,5,6,7,8,9,10]",
             expected: "[1,1,1,1,1,1,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "3a490e4a-7a8d-4d2f-800c-2ba50920820f",
             input: "nums = [10,9,8,7,6,5,4,3,2,1]",
             expected: "[0,0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "4155c306-db88-4873-97b4-619afa7e7013",
             input: "nums = [1,1,1,1,1,1,1,1,1,1]",
             expected: "[0,0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "8ef201e7-4f68-451f-bf1c-d4c6f22fa745",
             input: "nums = [1,3,5,7,9,11,13,15,17,19]",
             expected: "[1,1,1,1,1,1,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "97e85863-e509-42e1-833c-40ae43ef07ea",
             input: "nums = [19,17,15,13,11,9,7,5,3,1]",
             expected: "[0,0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "e2d07414-f02b-4a48-8398-0f99a629a458",
             input: "nums = [1,1,1,1,1,1,1,1,1,19]",
             expected: "[9,8,7,6,5,4,3,2,1,0]", orderMatters: true),
            TestCaseData(id: "c2381876-1d1c-4ada-b49d-dd43d2d23188",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]",
             expected: "[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "3a02b896-693d-4bdd-8fdf-e0931a00a69e",
             input: "nums = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "2a44f313-684f-4818-86c3-344a362bdccc",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "b90ea7e0-7ab4-4a9c-9eb4-4fe18763fa0a",
             input: "nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]",
             expected: "[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "10ce56eb-8609-41b5-aedf-1206f73df67f",
             input: "nums = [30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]",
             expected: "[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "c9b359e2-b708-4403-a12a-4e3152f33fdd",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "791a8c28-3665-40e8-9595-133d5828ba9b",
             input: "nums = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39]",
             expected: "[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0]", orderMatters: true),
            TestCaseData(id: "de978778-ad11-42ca-b1c7-9b42e06c94f5",
             input: "nums = [39,37,35,33,31,29,27,25,23,21,19,17,15,13,11,9,7,5,3,1]",
             expected: "[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]", orderMatters: true),
            TestCaseData(id: "f1163b0b-770f-441d-9b44-9bdb0c3d23dc",
             input: "nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,39]",
             expected: "[19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "daily-temperatures"
            let topic = "stack"
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

            guard let p_temperatures = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_temperatures.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: temperatures array too large (\(p_temperatures.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_temperatures.count >= 1 && p_temperatures.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= temperatures.length <= 105"
                )
                return
            }
            guard p_temperatures.allSatisfy({ $0 >= 30 && $0 <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 30 <= temperatures[i] <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: [Int]?
            let didCrash = withCrashGuard {
                resultHolder = solution.dailyTemperatures(p_temperatures)
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
