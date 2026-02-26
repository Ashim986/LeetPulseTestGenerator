import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCArrangingCoins {
    private class Solution {
        func arrangeCoins(n: Int) -> Int { return Int((-1 + sqrt(1.0 + 8.0 * Double(n))) / 2) }
    }

    @Suite struct ArrangingCoinsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "866b1564-21f9-40f0-a409-32b2fe78ab76",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b6c90ac9-04c0-477d-af2b-a5b66f76a6cd",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ea4a1f08-15ec-42d9-b526-b81ef6f034b0",
             input: "n = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0e1109d9-92c3-4111-aa9b-c8176a8800b6",
             input: "n = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0c33b387-bc45-481c-b829-195d1f424e94",
             input: "n = 4",
             expected: "2", orderMatters: true),
            TestCaseData(id: "9aa0e42d-0743-4c5e-9b39-a888a23add88",
             input: "n = 6",
             expected: "3", orderMatters: true),
            TestCaseData(id: "81326d65-4ea3-4035-8a54-1cbc5b7a8b05",
             input: "n = 10",
             expected: "4", orderMatters: true),
            TestCaseData(id: "28429645-d39f-4628-a735-39da11a83ffa",
             input: "n = 11",
             expected: "4", orderMatters: true),
            TestCaseData(id: "253fd03f-5628-4bcb-812c-8fdae2cf85a4",
             input: "n = 15",
             expected: "5", orderMatters: true),
            TestCaseData(id: "ccf7f239-5063-4c6f-82f0-094c8f16f81e",
             input: "n = 21",
             expected: "6", orderMatters: true),
            TestCaseData(id: "7493dfdb-c73a-4381-b2eb-ee6c07fb3166",
             input: "n = 28",
             expected: "7", orderMatters: true),
            TestCaseData(id: "f9f15b98-93bc-41ca-ac90-7d5791d19e4e",
             input: "n = 36",
             expected: "8", orderMatters: true),
            TestCaseData(id: "85e85dfd-dc5c-4926-8150-51d2738987a4",
             input: "n = 45",
             expected: "9", orderMatters: true),
            TestCaseData(id: "3de1141c-67fb-44d2-ad1f-ae61324962b9",
             input: "n = 55",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d2bae919-e32e-4b59-bf44-72e6624b89d1",
             input: "n = 66",
             expected: "11", orderMatters: true),
            TestCaseData(id: "8144f75a-42ad-49f2-a6d7-4c48b6bf2e29",
             input: "n = 78",
             expected: "12", orderMatters: true),
            TestCaseData(id: "a935af5f-a32b-4b8c-9ec3-d4420efa4377",
             input: "n = 91",
             expected: "13", orderMatters: true),
            TestCaseData(id: "3fd37d7a-b200-4f99-80ff-23501e090bbb",
             input: "n = 105",
             expected: "14", orderMatters: true),
            TestCaseData(id: "9e661941-5edc-4938-8208-4c9c30c3b87d",
             input: "n = 120",
             expected: "15", orderMatters: true),
            TestCaseData(id: "d9731371-0abb-41b7-8a77-1de2a8fb6fb6",
             input: "n = 136",
             expected: "16", orderMatters: true),
            TestCaseData(id: "a9e7d36b-fb2c-499e-b8aa-28c8d0c87d31",
             input: "n = 153",
             expected: "17", orderMatters: true),
            TestCaseData(id: "8c70a1d2-e6e5-426c-9fc6-a3320f9ba48b",
             input: "n = 171",
             expected: "18", orderMatters: true),
            TestCaseData(id: "515cd827-3c9b-4737-83f3-200110e71a09",
             input: "n = 190",
             expected: "19", orderMatters: true),
            TestCaseData(id: "2e07ba8e-145b-4249-b677-b65a9b715d43",
             input: "n = 210",
             expected: "20", orderMatters: true),
            TestCaseData(id: "ad37b753-9d81-43d6-8e52-c63c41db463a",
             input: "n = -1",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "arranging-coins"
            let topic = "math-geometry"
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

            guard let p_n = InputParser.parseInt(params[0]) else {
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
            guard p_n >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.arrangeCoins(n: p_n)
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
