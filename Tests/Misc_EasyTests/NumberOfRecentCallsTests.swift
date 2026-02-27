import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberOfRecentCalls {
    private class Solution {
        class RecentCounter {
            var queue: [Int]

            init() {
                queue = []
            }

            func ping(_ t: Int) -> Int {
                queue.append(t)
                while let first = queue.first, first < t - 3000 {
                    queue.removeFirst()
                }
                return queue.count
            }
        }
    }

    @Suite struct NumberOfRecentCallsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "66697c64-652f-45d8-be62-07c542769df4",
             input: "RecentCounter().ping(0)",
             expected: "1", orderMatters: true),
            TestCaseData(id: "db9e32af-6d58-4fc0-b8fe-f4b851d99dae",
             input: "RecentCounter().ping(1000).ping(1001).ping(1002)",
             expected: "3", orderMatters: true),
            TestCaseData(id: "367a04db-31ff-4ad3-a426-7d2b7ed958d9",
             input: "RecentCounter().ping(-1).ping(0).ping(1)",
             expected: "3", orderMatters: true),
            TestCaseData(id: "cb9cb587-b70a-4b31-9e17-4ea437928577",
             input: "RecentCounter().ping(10000).ping(10001).ping(10002).ping(10003).ping(10004)",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c599e13d-e5f6-490f-8c86-70df1d9a81bd",
             input: "RecentCounter().ping(1).ping(1).ping(1).ping(1)",
             expected: "4", orderMatters: true),
            TestCaseData(id: "3099925f-1b94-4961-8985-b2e6779afff1",
             input: "RecentCounter().ping(1).ping(1001).ping(2001).ping(3001).ping(4001)",
             expected: "4", orderMatters: true),
            TestCaseData(id: "f315ba6c-d2ed-4b1e-a3bc-6c3cf5615e23",
             input: "RecentCounter().ping(100).ping(200).ping(300).ping(400).ping(500).ping(600).ping(700).ping(800).ping(900).ping(1000)",
             expected: "10", orderMatters: true),
            TestCaseData(id: "72a200d9-1950-4d96-9f26-b89834e21ac3",
             input: "RecentCounter().ping(1).ping(2).ping(3).ping(4).ping(5).ping(6).ping(7).ping(8).ping(9).ping(10)",
             expected: "10", orderMatters: true),
            TestCaseData(id: "b4fdd9f5-a3e0-4592-b0ea-6c834276b046",
             input: "RecentCounter().ping(1).ping(2).ping(3).ping(4).ping(5).ping(6).ping(7).ping(8).ping(9).ping(10).ping(11).ping(12).ping(13).ping(14).pin"
                + "g(15)",
             expected: "15", orderMatters: true),
            TestCaseData(id: "eb53ee38-9418-4208-8e5e-3753071f7041",
             input: "RecentCounter().ping(10).ping(20).ping(30).ping(40).ping(50).ping(60).ping(70).ping(80).ping(90).ping(100).ping(110).ping(120).ping(130)"
                + ".ping(140).ping(150)",
             expected: "15", orderMatters: true),
            TestCaseData(id: "5f27feec-acd3-43cc-9749-2b7df3899f77",
             input: "RecentCounter().ping(100).ping(200).ping(300).ping(400).ping(500).ping(600).ping(700).ping(800).ping(900).ping(1000).ping(1100).ping(120"
                + "0).ping(1300).ping(1400).ping(1500)",
             expected: "15", orderMatters: true),
            TestCaseData(id: "045ad6db-3b8b-4e0a-954c-3f48dce0476e",
             input: "RecentCounter().ping(100).ping(200).ping(300).ping(400).ping(500).ping(600).ping(700).ping(800).ping(900).ping(1000).ping(1100).ping(120"
                + "0).ping(1300).ping(1400).ping(1500).ping(1600)",
             expected: "16", orderMatters: true),
            TestCaseData(id: "8f3c6ecd-30a3-4825-ba98-d02ca024596c",
             input: "RecentCounter().ping(1).ping(2).ping(3).ping(4).ping(5).ping(6).ping(7).ping(8).ping(9).ping(10).ping(11).ping(12).ping(13).ping(14).pin"
                + "g(15).ping(16).ping(17).ping(18).ping(19).ping(20)",
             expected: "20", orderMatters: true),
            TestCaseData(id: "e994ccd9-10c6-45ed-83f4-eceec7630257",
             input: "RecentCounter().ping(10).ping(20).ping(30).ping(40).ping(50).ping(60).ping(70).ping(80).ping(90).ping(100).ping(110).ping(120).ping(130)"
                + ".ping(140).ping(150).ping(160).ping(170).ping(180).ping(190).ping(200)",
             expected: "20", orderMatters: true),
            TestCaseData(id: "2fb86cd4-5bbc-4de3-acf0-abaca2df57d1",
             input: "RecentCounter().ping(100).ping(200).ping(300).ping(400).ping(500).ping(600).ping(700).ping(800).ping(900).ping(1000).ping(1100).ping(120"
                + "0).ping(1300).ping(1400).ping(1500).ping(1600).ping(1700).ping(1800).ping(1900).ping(2000)",
             expected: "20", orderMatters: true),
            TestCaseData(id: "d33a6e58-a1ae-4800-870b-9c349ab58f4d",
             input: "RecentCounter().ping(100).ping(200).ping(300).ping(400).ping(500).ping(600).ping(700).ping(800).ping(900).ping(1000).ping(1100).ping(120"
                + "0).ping(1300).ping(1400).ping(1500).ping(1600).ping(1700).ping(1800).ping(1900).ping(2000).ping(2100)",
             expected: "21", orderMatters: true),
            TestCaseData(id: "689939ed-41c3-43ed-a766-970b5e5704e4",
             input: "nums = [], target = 0",
             expected: "null", orderMatters: true),
            TestCaseData(id: "ddb28c5e-1b13-4861-8787-eaeaa17bb502",
             input: "RecentCounter().ping(100).ping(200).ping(300).ping(1000).ping(1100)",
             expected: "5", orderMatters: true),
            TestCaseData(id: "6e5b0f29-7881-4caa-a4eb-61ce2876f7ab",
             input: "RecentCounter().ping(10).ping(20).ping(30).ping(40).ping(50).ping(60).ping(70).ping(80).ping(90).ping(100)",
             expected: "[1,2,3,4,5,6,7,8,9,10]", orderMatters: true),
            TestCaseData(id: "b2ee880d-9645-4e08-a798-32ced056ba1d",
             input: "RecentCounter().ping(100).ping(100).ping(100).ping(100).ping(100)",
             expected: "[1,2,3,4,5]", orderMatters: true),
            TestCaseData(id: "fabc9839-d645-415d-b69a-97cf0fac687c",
             input: "RecentCounter().ping(1).ping(2).ping(3).ping(1001).ping(1002).ping(1003)",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "c3da8f1c-fb55-4457-b5a5-1ead452599f3",
             input: "RecentCounter().ping(1000).ping(2000).ping(3000).ping(4000).ping(5000)",
             expected: "[1,2,3,4,4]", orderMatters: true),
            TestCaseData(id: "e12e975a-3b19-4631-a466-682af2169011",
             input: "RecentCounter().ping(1).ping(1000).ping(2000).ping(3000).ping(4000)",
             expected: "[1,2,3,4,4]", orderMatters: true),
            TestCaseData(id: "0391321e-3234-492b-9407-83079d43d341",
             input: "RecentCounter().ping(100).ping(200).ping(300).ping(1000).ping(1100).ping(1200)",
             expected: "[1,2,3,4,5,6]", orderMatters: true),
            TestCaseData(id: "e83b0380-8da1-4e7d-9110-e7924d5a8618",
             input: "RecentCounter().ping(100).ping(200).ping(300).ping(400).ping(500).ping(600).ping(700).ping(800).ping(900).ping(1000).ping(1100)",
             expected: "[1,2,3,4,5,6,7,8,9,10,11]", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-of-recent-calls"
            let topic = "misc"
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
            var objHolder: Solution.RecentCounter?
            let initDidCrash = withCrashGuard {
                objHolder = Solution.RecentCounter()
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
                case "ping":
                    guard let mArg_0 = InputParser.parseInt(args[0]) else { results.append("null"); continue }
                    let rv = obj.ping(mArg_0)
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
