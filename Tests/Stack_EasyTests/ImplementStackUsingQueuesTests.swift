import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCImplementStackUsingQueues {
    private class Solution {
        class MyStack {
            private var q1: [Int] = []
            private var q2: [Int] = []
            init() {}
            func push(_ x: Int) {
                q2.append(x)
                while !q1.isEmpty {
                    q2.append(q1.removeFirst())
                }
                (q1, q2) = (q2, q1)
            }
            func pop() -> Int {
                return q1.removeFirst()
            }
            func top() -> Int {
                return q1[q1.startIndex]
            }
            func empty() -> Bool {
                return q1.isEmpty
            }
        }
    }

    @Suite struct ImplementStackUsingQueuesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "130269c0-c403-49c7-8045-86d185804e8f",
             input: "['MyStack', 'push', 'push', 'top', 'pop']",
             expected: "[null,null,null,2,2]", orderMatters: true),
            TestCaseData(id: "cf83a5be-76cf-4b66-bcf5-57236187f390",
             input: "['MyStack', 'push', 'pop', 'empty']",
             expected: "[null,null,1,true]", orderMatters: true),
            TestCaseData(id: "9c07cedd-bd0a-4f2e-b626-76ac3e5ad3bd",
             input: "['MyStack', 'push', 'top', 'empty']",
             expected: "[null,null,1,false]", orderMatters: true),
            TestCaseData(id: "7182d626-b223-44dc-a5c1-b8982de27d59",
             input: "['MyStack', 'empty']",
             expected: "[null,true]", orderMatters: true),
            TestCaseData(id: "f95fbe3b-7f80-414e-abf0-ba881528b4f2",
             input: "['MyStack', 'push', 'push', 'push', 'pop', 'pop', 'pop']",
             expected: "[null,null,null,null,3,2,1]", orderMatters: true),
            TestCaseData(id: "cdc8153d-e38e-4ccf-a4c2-cdd1f5496367",
             input: "['MyStack', 'push', 'push', 'empty']",
             expected: "[null,null,null,false]", orderMatters: true),
            TestCaseData(id: "54a8e730-8533-4287-a178-c32f9d5f450a",
             input: "['MyStack', 'push', 'pop', 'push', 'top']",
             expected: "[null,null,1,null,2]", orderMatters: true),
            TestCaseData(id: "4bf9242e-7a39-48a8-a32f-831543ff83de",
             input: "['MyStack', 'push', 'push', 'push', 'push', 'push', 'pop', 'pop', 'pop', 'pop', 'pop']",
             expected: "[null,null,null,null,null,null,5,4,3,2,1]", orderMatters: true),
            TestCaseData(id: "5d00c651-7816-4d5e-87fe-c82b961627ac",
             input: "['MyStack', 'push', 'push', 'push', 'empty']",
             expected: "[null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "0dfe46d9-5b1f-4ea9-9be7-5b9eddf2f3b4",
             input: "['MyStack', 'push', 'top', 'push', 'top']",
             expected: "[null,null,1,null,2]", orderMatters: true),
            TestCaseData(id: "933a8348-a701-47c8-b7a2-73bc7fa514f5",
             input: "['MyStack', 'push', 'push', 'pop', 'push', 'top']",
             expected: "[null,null,null,2,null,3]", orderMatters: true),
            TestCaseData(id: "632f8a11-13fc-4c4c-887e-e2e5926bf5bd",
             input: "['MyStack', 'push', 'push', 'push', 'pop', 'pop', 'push', 'top']",
             expected: "[null,null,null,null,3,2,null,4]", orderMatters: true),
            TestCaseData(id: "12d19e0b-e67f-4233-aed9-8d4d8fc8e3ed",
             input: "['MyStack', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'pop']",
             expected: "[null,null,null,null,null,null,null,null,null,null,9]", orderMatters: true),
            TestCaseData(id: "35dd2949-0447-48d6-85f5-c33969b62f80",
             input: "['MyStack', 'push', 'empty']",
             expected: "[null,null,false]", orderMatters: true),
            TestCaseData(id: "ec9ac86c-fb18-46a5-ae60-adb8eb38a5f3",
             input: "['MyStack', 'push', 'push', 'push', 'empty', 'empty']",
             expected: "[null,null,null,null,false,false]", orderMatters: true),
            TestCaseData(id: "c8785acb-94fb-4f09-b2fa-ccfa1ecd0f6a",
             input: "['MyStack', 'push', 'push', 'pop', 'empty']",
             expected: "[null,null,null,2,false]", orderMatters: true),
            TestCaseData(id: "0d81c595-acea-4be3-93cd-8508bc1701ff",
             input: "['MyStack', 'push', 'push', 'push', 'pop', 'pop', 'empty']",
             expected: "[null,null,null,null,3,2,false]", orderMatters: true),
            TestCaseData(id: "cfcb799b-605f-46ca-a2c2-d7798b613fb3",
             input: "['MyStack', 'push', 'push', 'push', 'push', 'push', 'pop', 'pop', 'pop', 'pop', 'empty']",
             expected: "[null,null,null,null,null,null,5,4,3,2,false]", orderMatters: true),
            TestCaseData(id: "68a06e7d-4e0d-48da-a4fb-19ee3bdf0f2e",
             input: "['MyStack', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'pop', 'pop']",
             expected: "[null,null,null,null,null,null,null,null,null,null,9,8]", orderMatters: true),
            TestCaseData(id: "2f377687-5e93-4745-9614-6562ffac7108",
             input: "['MyStack', 'push', 'push', 'push', 'empty', 'pop']",
             expected: "[null,null,null,null,false,3]", orderMatters: true),
            TestCaseData(id: "3b59d63a-14d9-40d9-8eba-bfc9f1e2d488",
             input: "['MyStack', 'push', 'push', 'push', 'push', 'empty', 'empty']",
             expected: "[null,null,null,null,null,false,false]", orderMatters: true),
            TestCaseData(id: "a13cceaa-6f23-4c03-ab86-f0cba01d9468",
             input: "['MyStack', 'push', 'push', 'push', 'push', 'push', 'push', 'empty']",
             expected: "[null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "0feaa59e-4138-406b-9bdc-a5ff40934f71",
             input: "['MyStack', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'empty']",
             expected: "[null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "6be0dbbc-bcea-4f64-95c5-b4b728d51ff1",
             input: "['MyStack', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'empty']",
             expected: "[null,null,null,null,null,null,null,null,null,false]", orderMatters: true),
            TestCaseData(id: "6bbf06bc-3535-48ab-9781-32044b06c39e",
             input: "['MyStack', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'push', 'empty']",
             expected: "[null,null,null,null,null,null,null,null,null,null,false]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "implement-stack-using-queues"
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
            var objHolder: Solution.MyStack?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.MyStack()
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
                    let rv = obj.pop()
                    results.append("\(rv)")
                case "top":
                    let rv = obj.top()
                    results.append("\(rv)")
                case "empty":
                    let rv = obj.empty()
                    results.append(rv ? "true" : "false")
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
