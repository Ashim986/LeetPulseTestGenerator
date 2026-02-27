import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCUglyNumberIi {
    private class Solution {
        func nthUglyNumber(_ n: Int) -> Int {
            var count = 0
            var num = 1

            while true {
                if isUgly(num) {
                    count += 1
                    if count == n { return num }
                }
                num += 1
            }
        }

        func isUgly(_ num: Int) -> Bool {
            var n = num

            n = divideOut(n, 2)
            n = divideOut(n, 3)
            n = divideOut(n, 5)

            return n == 1
        }

        func divideOut(_ num: Int, _ divisor: Int) -> Int {
            var n = num

            while n % divisor == 0 {
                n /= divisor
            }

            return n
        }
    }

    @Suite struct UglyNumberIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "49a88d57-1dc2-4906-b77c-9ebdc093b8bf",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "259e6935-79de-4ac8-8e16-dc1b98e43960",
             input: "n = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ced53e19-53cd-4e16-a1f2-376124aeed58",
             input: "n = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "00b7893f-a9d1-4bc9-b74c-0421a6079578",
             input: "n = 4",
             expected: "4", orderMatters: true),
            TestCaseData(id: "bbd8d679-f956-4afd-8b1c-76265619460b",
             input: "n = 5",
             expected: "5", orderMatters: true),
            TestCaseData(id: "75f9495b-97ee-44a2-827f-93abe297e3fc",
             input: "n = 6",
             expected: "6", orderMatters: true),
            TestCaseData(id: "7002d0c2-acdf-449a-b561-13c534837bfc",
             input: "n = 7",
             expected: "8", orderMatters: true),
            TestCaseData(id: "b195d2be-f7ba-408f-8577-5adc10fec682",
             input: "n = 8",
             expected: "9", orderMatters: true),
            TestCaseData(id: "f4036d28-2b6c-456a-9e68-fdea8212e3d4",
             input: "n = 9",
             expected: "10", orderMatters: true),
            TestCaseData(id: "00b42dc2-71e2-4cc9-8351-db87d6b5a1e7",
             input: "n = 11",
             expected: "15", orderMatters: true),
            TestCaseData(id: "5aa4bebb-78d3-4dd7-bd22-bbb5142cfc46",
             input: "n = 12",
             expected: "16", orderMatters: true),
            TestCaseData(id: "f6576958-9ab3-44ca-b791-03748540f9dc",
             input: "n = 13",
             expected: "18", orderMatters: true),
            TestCaseData(id: "5c3d3011-8b30-4d11-872b-90654f6c4da6",
             input: "n = 14",
             expected: "20", orderMatters: true),
            TestCaseData(id: "ab02d10a-d793-475f-bcbc-fcbf94b03720",
             input: "n = 15",
             expected: "24", orderMatters: true),
            TestCaseData(id: "50dd1958-f946-406c-a8fc-50c0ce63cf8c",
             input: "n = 16",
             expected: "25", orderMatters: true),
            TestCaseData(id: "34410601-d163-4a8e-9106-7edbb7c76f3e",
             input: "n = 17",
             expected: "27", orderMatters: true),
            TestCaseData(id: "cc6ab46b-5527-4514-85f2-fc6ad0e14c6c",
             input: "n = 18",
             expected: "30", orderMatters: true),
            TestCaseData(id: "0826dff5-6b56-4d78-aa0f-4171133ff4a4",
             input: "n = 19",
             expected: "32", orderMatters: true),
            TestCaseData(id: "42032c47-05c1-466e-9e89-ad1e6842451b",
             input: "n = 21",
             expected: "40", orderMatters: true),
            TestCaseData(id: "9493f093-d902-42de-869d-cb3eef53c5d7",
             input: "n = 22",
             expected: "45", orderMatters: true),
            TestCaseData(id: "74e7e5b9-adf8-4bd9-9c66-85ea90ae353c",
             input: "n = 23",
             expected: "48", orderMatters: true),
            TestCaseData(id: "fa479415-85f4-4a29-b83f-c060f73ca2da",
             input: "n = 24",
             expected: "50", orderMatters: true),
            TestCaseData(id: "9f4c5c0d-af53-4768-a188-46c57eed0347",
             input: "n = 25",
             expected: "54", orderMatters: true),
            TestCaseData(id: "2b8129e9-3fdb-4355-b551-d76afb9a54dd",
             input: "n = 26",
             expected: "60", orderMatters: true),
            TestCaseData(id: "e319bfc7-41b4-41ba-916c-ef57d73d9659",
             input: "n = 27",
             expected: "64", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "ugly-number-ii"
            let topic = "math-geometry"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_n >= 1 && p_n <= 1690 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 1690"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.nthUglyNumber(p_n)
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

            let matches = computedOutput == expectedOutput
            await ResultRecorderActor.shared.record(
                slug: slug, topic: topic, testId: testId,
                input: rawInput, originalExpected: expectedOutput, computedOutput: computedOutput,
                isValid: true, status: matches ? "matched" : "mismatched", orderMatters: orderMatters
            )
            #expect(matches, "Test \(testId): \(computedOutput)")
        }

    }

}
