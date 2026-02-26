import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCComplementOfBase10Integer {
    private class Solution {
        func findComplement(_ num: Int) -> Int {
            var n = num
            var bits = 0
            while n > 0 {
                bits += 1
                n = n >> 1
            }
            let mask = (1 << bits) - 1
            return num ^ mask
        }
    }

    @Suite struct ComplementOfBase10IntegerTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "9b975e96-5b12-4817-abd6-fa199c014ea1",
             input: "num = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d55a41b3-bcb9-4067-85af-cc08c35c3fae",
             input: "num = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bb494d8b-d77f-4ae9-b33e-5cdb31bf419e",
             input: "num = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "db236ddb-73ad-4c5d-a401-6ed55146c63f",
             input: "num = 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b3a78670-afd0-49f6-9654-398ee138040c",
             input: "num = 4",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ab9796a7-0f37-4443-91aa-b530d2bfac0d",
             input: "num = 6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4f6f0a8d-09bf-49f1-91a1-3718ea2a0ddf",
             input: "num = 7",
             expected: "0", orderMatters: true),
            TestCaseData(id: "771724bf-12e9-46d7-8114-8d6b4f043496",
             input: "num = 8",
             expected: "7", orderMatters: true),
            TestCaseData(id: "4a69619b-53eb-448b-b000-bc46c19bce87",
             input: "num = 9",
             expected: "6", orderMatters: true),
            TestCaseData(id: "2b5b95ec-0580-4e5a-92de-c8829bf43673",
             input: "num = 10",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c1f9f72b-cc0b-4d1d-8329-89cecf0d2478",
             input: "num = 11",
             expected: "4", orderMatters: true),
            TestCaseData(id: "89580cb7-4c31-4fd8-965d-0f740364e743",
             input: "num = 12",
             expected: "3", orderMatters: true),
            TestCaseData(id: "ccbd8797-5630-4aa5-bdb5-cae4e2ddb14b",
             input: "num = 13",
             expected: "2", orderMatters: true),
            TestCaseData(id: "06a879ac-8014-444d-a156-53216fd7170e",
             input: "num = 14",
             expected: "1", orderMatters: true),
            TestCaseData(id: "81d1bf4a-c17a-4ad3-baed-bff0b59983b7",
             input: "num = 15",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a53e795a-c329-411a-b968-e6267c959f78",
             input: "num = 16",
             expected: "15", orderMatters: true),
            TestCaseData(id: "aa1d52f6-e939-4dff-aa6c-cfd3cb745476",
             input: "num = 17",
             expected: "14", orderMatters: true),
            TestCaseData(id: "4621d079-668a-40c8-a2f7-515cefaebcd5",
             input: "num = 18",
             expected: "13", orderMatters: true),
            TestCaseData(id: "89c6f963-8e1f-4a3f-b49e-f0f047a596d4",
             input: "num = 19",
             expected: "12", orderMatters: true),
            TestCaseData(id: "ec2e56b0-2ba0-4808-81b6-968c25dcffec",
             input: "num = 20",
             expected: "11", orderMatters: true),
            TestCaseData(id: "9f7119c3-6047-4fa1-ba66-024e051c206e",
             input: "num = 21",
             expected: "10", orderMatters: true),
            TestCaseData(id: "e893ff07-41b0-42a2-9193-bd202499b577",
             input: "num = 22",
             expected: "9", orderMatters: true),
            TestCaseData(id: "e179b062-95da-458d-ab32-0449bd837ddb",
             input: "num = 23",
             expected: "8", orderMatters: true),
            TestCaseData(id: "a1626d6d-87a1-452e-966b-29595e13af13",
             input: "num = 24",
             expected: "7", orderMatters: true),
            TestCaseData(id: "eaa5d6e1-cced-4e16-a30e-8d07a0a80779",
             input: "num = 25",
             expected: "6", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "complement-of-base-10-integer"
            let topic = "bit-manipulation"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 1, got \(params.count)"
                )
                return
            }

            guard let p_num = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_num >= 0 && p_num <= 109 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= n < 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.findComplement(p_num)
            let computedOutput = OutputSerializer.serialize(result)

            let matches = computedOutput == expectedOutput
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
