import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMinStack {
    private class Solution {
        class MinStack {
            private var stack: [(val: Int, min: Int)] = []

            init() {}

            func push(_ val: Int) {
                let currentMin = stack.isEmpty ? val : min(val, stack[stack.count - 1].min)
                stack.append((val, currentMin))
            }

            func pop() {
                stack.removeLast()
            }

            func top() -> Int {
                return stack[stack.count - 1].val
            }

            func getMin() -> Int {
                return stack[stack.count - 1].min
            }
        }
    }

    @Suite struct MinStackTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "a7dddb7f-b36b-4bc0-a52c-2ac7daebb13f",
             input: "['MinStack', 'push', 'push', 'getMin', 'pop', 'getMin']",
             expected: "[null,null,null,1,null,1]", orderMatters: true),
            TestCaseData(id: "b9100e69-5aa7-472c-896c-2f7cec14a620",
             input: "['MinStack', 'push', 'push', 'getMin', 'push', 'getMin']",
             expected: "[null,null,null,1,null,1]", orderMatters: true),
            TestCaseData(id: "a25eca79-d0da-4fae-9d2e-8995790ea205",
             input: "['MinStack', 'push', 'getMin']",
             expected: "[null,null,1]", orderMatters: true),
            TestCaseData(id: "8d75fcda-bed3-49b4-beec-68f3f3a90851",
             input: "['MinStack', 'push', 'push', 'getMin', 'pop']",
             expected: "[null,null,null,1,null]", orderMatters: true),
            TestCaseData(id: "e8d11879-5134-4d61-99d6-e87d0c3d9856",
             input: "['MinStack', 'push', 'push', 'getMin', 'pop', 'getMin', 'pop']",
             expected: "[null,null,null,1,null,1,null]", orderMatters: true),
            TestCaseData(id: "8f854465-799a-4875-9d1f-a8358d3778f1",
             input: "['MinStack', 'push', 'getMin', 'pop']",
             expected: "[null,null,1,null]", orderMatters: true),
            TestCaseData(id: "8093d508-6ed4-4488-b79b-abdea2113075",
             input: "['MinStack', 'push', 'push', 'getMin', 'pop', 'getMin', 'push', 'getMin']",
             expected: "[null,null,null,1,null,1,null,1]", orderMatters: true),
            TestCaseData(id: "a3dfe7ee-d573-4ffd-9e1f-4a5ddaa1d936",
             input: "['MinStack', 'push', 'push', 'push', 'getMin']",
             expected: "[null,null,null,null,1]", orderMatters: true),
            TestCaseData(id: "6702899e-e69a-460b-aa0a-3d43066fb2fc",
             input: "['MinStack', 'push', 'push', 'getMin', 'pop', 'push', 'getMin']",
             expected: "[null,null,null,1,null,null,1]", orderMatters: true),
            TestCaseData(id: "75474525-9de9-440b-b6e8-26a865ae2a7f",
             input: "['MinStack', 'push', 'push', 'push', 'getMin', 'pop', 'getMin']",
             expected: "[null,null,null,null,1,null,1]", orderMatters: true),
            TestCaseData(id: "686ea695-c5fb-4a89-a974-834c6823f59c",
             input: "['MinStack', 'push', 'getMin', 'push', 'getMin']",
             expected: "[null,null,-2,null,-2]", orderMatters: true),
            TestCaseData(id: "bb8d23c3-45af-4beb-adab-fb6a1723f133",
             input: "['MinStack', 'push', 'push', 'getMin', 'pop', 'push', 'push', 'getMin']",
             expected: "[null,null,null,-2,null,null,null,-3]", orderMatters: true),
            TestCaseData(id: "3c6c4c39-ea99-4d7c-9697-93841e3fc719",
             input: "['MinStack', 'push', 'push', 'push', 'push', 'getMin']",
             expected: "[null,null,null,null,null,-3]", orderMatters: true),
            TestCaseData(id: "3fa892d6-1e0a-45c2-a830-6bff7551ff53",
             input: "['MinStack', 'push', 'push', 'getMin', 'pop', 'pop', 'getMin']",
             expected: "[null,null,null,-2,null,null,null]", orderMatters: true),
            TestCaseData(id: "b6bb1e8b-aa4e-4a0c-930c-25ff2bc6dac2",
             input: "['MinStack', 'push', 'push', 'push', 'getMin', 'pop', 'pop', 'getMin']",
             expected: "[null,null,null,null,-3,null,null,-2]", orderMatters: true),
            TestCaseData(id: "f7c2207b-8bcf-4e62-b32e-afcc06e8cd25",
             input: "['MinStack', 'push', 'getMin', 'pop', 'push', 'getMin']",
             expected: "[null,null,-2,null,null,0]", orderMatters: true),
            TestCaseData(id: "682eb9aa-fd77-4410-b297-165abd0a454b",
             input: "['MinStack', 'push', 'push', 'getMin', 'push', 'push', 'getMin']",
             expected: "[null,null,null,-2,null,null,-3]", orderMatters: true),
            TestCaseData(id: "490de417-59a4-40b3-9064-a33c235c689a",
             input: "['MinStack', 'push', 'push', 'getMin', 'pop', 'pop', 'push', 'getMin']",
             expected: "[null,null,null,-2,null,null,null,-3]", orderMatters: true),
            TestCaseData(id: "613eecdb-9105-487b-b398-6553424c64fd",
             input: "['MinStack', 'push', 'push', 'push', 'getMin', 'pop', 'pop', 'pop', 'getMin']",
             expected: "[null,null,null,null,-3,null,null,null,null]", orderMatters: true),
            TestCaseData(id: "010e2ac7-5bec-4889-95cc-df23ca34dce6",
             input: "['MinStack', 'push', 'getMin', 'push', 'getMin', 'pop', 'getMin']",
             expected: "[null,null,-2,null,-2,null,-2]", orderMatters: true),
            TestCaseData(id: "4c1402ff-7b21-4c22-8723-0e11db6d23e3",
             input: "['MinStack', 'push', 'push', 'getMin', 'push', 'getMin', 'pop', 'getMin']",
             expected: "[null,null,null,1,null,1,null,1]", orderMatters: true),
            TestCaseData(id: "d240ca6a-c21d-46f8-ab4d-2dd700f51806",
             input: "['MinStack', 'push', 'push', 'push', 'getMin', 'pop', 'pop', 'getMin', 'pop']",
             expected: "[null,null,null,null,1,null,null,1,null]", orderMatters: true),
            TestCaseData(id: "babe07c5-3825-439b-ad2e-93ddd64b7215",
             input: "['MinStack', 'push', 'push', 'push', 'getMin', 'pop', 'pop', 'pop']",
             expected: "[null,null,null,null,1,null,null,null]", orderMatters: true),
            TestCaseData(id: "dfacea12-d58e-43e0-a12e-4ae31e879e08",
             input: "['MinStack', 'push', 'getMin', 'push', 'getMin', 'pop', 'push', 'getMin']",
             expected: "[null,null,1,null,1,null,null,1]", orderMatters: true),
            TestCaseData(id: "2dbcfd10-ec51-4445-84c3-77aaf44479fc",
             input: "['MinStack', 'push', 'push', 'getMin', 'pop', 'push', 'getMin', 'pop']",
             expected: "[null,null,null,1,null,null,1,null]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "min-stack"
            let topic = "stack"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let inputLines = rawInput.components(separatedBy: "\n")
            guard inputLines.count >= 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Invalid class design input format"
                )
                return
            }

            guard let methodNames = InputParser.parseStringArray(inputLines[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse method names"
                )
                return
            }
            guard let argsList = InputParser.parseRawArgsList(inputLines[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse args list"
                )
                return
            }
            guard methodNames.count == argsList.count, !methodNames.isEmpty else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Methods/args count mismatch"
                )
                return
            }

            // Init
            let initArgs = argsList[0]
            var objHolder: Solution.MinStack?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.MinStack()
            }
            guard !initDidCrash, var obj = objHolder else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution init crashed at runtime"
                )
                return
            }

            var results: [String] = []
            let loopDidCrash = withCrashGuard {
            for idx in 1..<methodNames.count {
                let methodName = methodNames[idx]
                let args = argsList[idx]
                switch methodName {
                case "push":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    obj.push(mArg_0)
                    results.append("null")
                case "pop":
                    obj.pop()
                    results.append("null")
                case "top":
                    let rv = obj.top()
                    results.append("\(rv)")
                case "getMin":
                    let rv = obj.getMin()
                    results.append("\(rv)")
                default:
                    results.append("null")
                }
            }
            }
            guard !loopDidCrash else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "runtime_error", orderMatters: orderMatters,
                    errorMessage: "Solution method crashed at runtime"
                )
                return
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
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
