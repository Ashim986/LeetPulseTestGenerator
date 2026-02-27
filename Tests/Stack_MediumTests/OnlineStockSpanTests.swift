import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCOnlineStockSpan {
    private class Solution {
        class StockSpanner { var stack: [(Int, Int)] = []; var index = 0
        func next(_ price: Int) -> Int { while !stack.isEmpty && stack[stack.count - 1].0 <= price { _ = stack.removeLast() }
        let span = stack.isEmpty ? index + 1 : index - stack[stack.count - 1].1
        stack.append((price, index))
        index += 1
        return span }
        }
    }

    @Suite struct OnlineStockSpanTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "7402fee3-cd9a-4421-97b3-22c45a284415",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,1,1,2,1]", orderMatters: true),
            TestCaseData(id: "8cc3241b-f699-4de8-9f56-d2ae3a04c940",
             input: "['StockSpanner', 'next', 'next', 'next', 'next']",
             expected: "[null,1,1,1,2]", orderMatters: true),
            TestCaseData(id: "661687f3-97b4-427e-b9dc-2ea3ff206157",
             input: "['StockSpanner', 'next', 'next', 'next']",
             expected: "[null,1,1,1]", orderMatters: true),
            TestCaseData(id: "920c61ab-4aea-4cd9-8bf0-b38b9e6eb9ac",
             input: "['StockSpanner', 'next', 'next']",
             expected: "[null,1,1]", orderMatters: true),
            TestCaseData(id: "f563a9b6-272b-4ace-8884-a6c9b818e7ce",
             input: "['StockSpanner', 'next']",
             expected: "[null,1]", orderMatters: true),
            TestCaseData(id: "34f73213-bc44-494c-887c-1b2a693811ad",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,1,1,2,1,4]", orderMatters: true),
            TestCaseData(id: "d4194565-2dc6-4dd7-8058-76581849ebf6",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,1,1,2,1,4,6]", orderMatters: true),
            TestCaseData(id: "7135448f-7ad0-4737-800a-a3dde7cbb653",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,1,1,2,1,4,6,7]", orderMatters: true),
            TestCaseData(id: "a99e5705-2cea-46f5-9504-e9bf8ab170a0",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,1,1,2,1,4,6,7,8]", orderMatters: true),
            TestCaseData(id: "bbdd0ecb-d90d-481e-b8b9-f582767d327c",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,1,1,2,1,4,6,7,8,10]", orderMatters: true),
            TestCaseData(id: "0d734377-3ad0-490e-adf5-092d04b47729",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10,11]", orderMatters: true),
            TestCaseData(id: "14f032ca-8c08-4ef1-a400-8e5dcb149773",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12]", orderMatters: true),
            TestCaseData(id: "25bf4213-1321-4bbe-a201-b2f1321bc849",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13]", orderMatters: true),
            TestCaseData(id: "74fe9471-6cd3-475b-af51-89b011c5be30",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14]", orderMatters: true),
            TestCaseData(id: "064bdb00-d0ef-4e89-be97-21b22be75cc2",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]", orderMatters: true),
            TestCaseData(id: "860388cd-55ad-4852-acc7-b60fee86c427",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next',"
                + " 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]", orderMatters: true),
            TestCaseData(id: "08bb1fab-dcf0-489c-ad64-e5d6e1029fac",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next',"
                + " 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]", orderMatters: true),
            TestCaseData(id: "a4e35860-0d37-47e1-8884-7cabd9d8f65b",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next',"
                + " 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]", orderMatters: true),
            TestCaseData(id: "719eccd5-8aff-4a51-b769-9db09219a1e6",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next',"
                + " 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]", orderMatters: true),
            TestCaseData(id: "7bb5ad16-305b-4b9c-b484-5977c0901d10",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next',"
                + " 'next', 'next', 'next', 'next', 'next']",
             expected: "[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]", orderMatters: true),
            TestCaseData(id: "11b3601f-4f65-4ee1-9595-adf2d34298de",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next',"
                + " 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]", orderMatters: true),
            TestCaseData(id: "7a20e199-220e-42e7-89f9-054eaac9685f",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next',"
                + " 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]", orderMatters: true),
            TestCaseData(id: "a7639fe0-933c-4285-a487-64a82072c968",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next',"
                + " 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]", orderMatters: true),
            TestCaseData(id: "8bcc19c1-0b13-4232-bf14-836db753a091",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next',"
                + " 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]", orderMatters: true),
            TestCaseData(id: "12bc7e2b-b527-487b-ac65-b94cd3b2dfcf",
             input: "['StockSpanner', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next',"
                + " 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next', 'next']",
             expected: "[null,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "online-stock-span"
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
            var objHolder: Solution.StockSpanner?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.StockSpanner()
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
                case "next":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.next(mArg_0)
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
