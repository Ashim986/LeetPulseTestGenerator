import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDesignCircularQueue {
    private class Solution {
        class MyCircularQueue {
            let k: Int
            var data: [Int?]
            var front: Int
            var count: Int

            init(_ k: Int) {
                self.k = k
                data = Array(repeating: nil, count: k)
                front = 0
                count = 0
            }

            func enQueue(_ value: Int) -> Bool {
                if count == k {
                    return false
                }
                let rear = (front + count) % k
                data[rear] = value
                count += 1
                return true
            }

            func deQueue() -> Bool {
                if count == 0 {
                    return false
                }
                data[front] = nil
                front = (front + 1) % k
                count -= 1
                return true
            }

            func Front() -> Int {
                if count == 0 {
                    return -1
                }
                return data[front].unsafelyUnwrapped
            }

            func Rear() -> Int {
                if count == 0 {
                    return -1
                }
                let rear = (front + count - 1) % k
                return data[rear].unsafelyUnwrapped
            }

            func isEmpty() -> Bool {
                return count == 0
            }

            func isFull() -> Bool {
                return count == k
            }
        }
    }

    @Suite struct DesignCircularQueueTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5d377ed5-fb26-4073-8b43-51a827a3e1b3",
             input: "[\"MyCircularQueue\",\"enQueue\",\"deQueue\",\"isEmpty\"]",
             expected: "[null,true,true,true]", orderMatters: true),
            TestCaseData(id: "c97e8848-c3e9-4410-8889-f41e6b715565",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"isEmpty\"]",
             expected: "[null,true,true,true,false]", orderMatters: true),
            TestCaseData(id: "779b1df5-8c3f-4194-9013-44d78e6d6f59",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"isFull\"]",
             expected: "[null,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "8b5c43ef-ab2a-4f13-9961-2167ec820221",
             input: "[\"MyCircularQueue\",\"deQueue\",\"isEmpty\"]",
             expected: "[null,false,true]", orderMatters: true),
            TestCaseData(id: "ac36786a-eab7-4b67-9d22-a4b00cf2b31a",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"isEmpty\"]",
             expected: "[null,true,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "6b388667-3c32-4185-b3ba-24126a6fec4f",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"deQueue\",\"isEmpty\"]",
             expected: "[null,true,true,true,true,true,true,true]", orderMatters: true),
            TestCaseData(id: "8259ed4e-9bf9-45e9-9ea8-8ffb0be3173e",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"isFull\"]",
             expected: "[null,true,true,true,false,true]", orderMatters: true),
            TestCaseData(id: "38203e0a-899f-4b21-808d-ce43d9ebdc46",
             input: "[\"MyCircularQueue\",\"enQueue\",\"deQueue\",\"enQueue\",\"enQueue\",\"Rear\"]",
             expected: "[null,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "e862b6bd-4d09-4b65-96b4-d1b461977fc2",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"Front\"]",
             expected: "[null,true,true,true,true,2]", orderMatters: true),
            TestCaseData(id: "7785efc4-0b2a-49cf-9c66-c8e91850d1be",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"Front\"]",
             expected: "[null,true,true,true,2]", orderMatters: true),
            TestCaseData(id: "8fec96e5-bb0b-4c71-aa3d-7c654f823d65",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"Front\"]",
             expected: "[null,true,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "16a55a8b-aeec-4369-86f2-467a12023305",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"Rear\"]",
             expected: "[null,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "6090cffd-c344-4851-8f2b-e3aa07db93f9",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"Rear\"]",
             expected: "[null,true,true,true,false,true,true,3]", orderMatters: true),
            TestCaseData(id: "879ef671-dbed-4f96-8e10-a9d152b8c132",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"deQueue\",\"Rear\"]",
             expected: "[null,true,true,true,false,true,true,true,-1]", orderMatters: true),
            TestCaseData(id: "0647caba-2619-4105-96a0-3f0dcdc8fae6",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"deQueue\",\"Front\"]",
             expected: "[null,true,true,true,false,true,true,true,-1]", orderMatters: true),
            TestCaseData(id: "3927a84c-6e2b-4754-9bbb-1f08dd25d3fc",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"enQueue\",\"Rear\"]",
             expected: "[null,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "797b92da-cce9-48ef-8ecc-9d6d84c3dcbc",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"enQueue\",\"Front\"]",
             expected: "[null,true,true,true,true,2]", orderMatters: true),
            TestCaseData(id: "6e60d760-f7d7-4575-80f7-224ad6e1e40f",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"enQueue\",\"Rear\"]",
             expected: "[null,true,true,true,true,true,true,4]", orderMatters: true),
            TestCaseData(id: "56a93823-e843-4c9a-ba76-0bb96ebcbbca",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"enQueue\",\"Front\"]",
             expected: "[null,true,true,true,true,true,true,3]", orderMatters: true),
            TestCaseData(id: "e93c5754-5226-45a9-afb1-e7ff41efda32",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"deQueue\",\"deQueue\"]",
             expected: "[null,true,true,true,false,true,true,true,false]", orderMatters: true),
            TestCaseData(id: "07058eed-1da0-45e6-869e-6bbf6939ce74",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"deQueue\",\"deQueue\",\"deQueue\"]",
             expected: "[null,true,true,true,true,true,true,false,false]", orderMatters: true),
            TestCaseData(id: "6779f1ec-bad9-498c-889a-25c351e32b4d",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"deQueue\",\"deQueue\",\"deQueue\"]",
             expected: "[null,true,true,true,false,true,true,true,false,false]", orderMatters: true),
            TestCaseData(id: "ef66212f-312b-4348-8595-9f670627c503",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"deQueue\",\"deQueue\"]",
             expected: "[null,true,true,true,false,false,true,true,true,false]", orderMatters: true),
            TestCaseData(id: "4534878f-0656-4c10-9394-051caf0026b3",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\",\"deQueue\"]",
             expected: "[null,true,true,true,false,false,false,true,true,true]", orderMatters: true),
            TestCaseData(id: "58dd7073-d8c9-4f00-b80f-04c8bab545bb",
             input: "[\"MyCircularQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"enQueue\",\"deQueue\",\"deQueue\"]",
             expected: "[null,true,true,true,false,false,false,false,true,true]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "design-circular-queue"
            let topic = "linked-list"
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
            guard initArgs.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Init args count too small"
                )
                return
            }
            guard let initP_0 = InputParser.parseInt(initArgs[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse init param 0 as Int"
                )
                return
            }
            var objHolder: Solution.MyCircularQueue?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.MyCircularQueue(initP_0)
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
                case "enQueue":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.enQueue(mArg_0)
                    results.append(rv ? "true" : "false")
                case "deQueue":
                    let rv = obj.deQueue()
                    results.append(rv ? "true" : "false")
                case "Front":
                    let rv = obj.Front()
                    results.append("\(rv)")
                case "Rear":
                    let rv = obj.Rear()
                    results.append("\(rv)")
                case "isEmpty":
                    let rv = obj.isEmpty()
                    results.append(rv ? "true" : "false")
                case "isFull":
                    let rv = obj.isFull()
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
