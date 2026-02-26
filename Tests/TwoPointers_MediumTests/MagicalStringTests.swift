import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMagicalString {
    private class Solution {
        func magicalString(n: Int) -> Int {
            var res = [1]
            var p = 0
            var num = 2
            var count = 1
            while res.count < n {
                for _ in 1...res[p] {
                    if res.count < n {
                        res.append(num)
                    }
                    if num == 1 {
                        count += 1
                    }
                }
                num = num == 1 ? 2 : 1
                p += 1
            }
            return count
        }
    }

    @Suite struct MagicalStringTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "53d6c0ed-8020-4b8a-92f6-624bacc225d0",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3fbb41af-7fda-4e85-81ae-fd94e1c2f5da",
             input: "n = 3",
             expected: "2", orderMatters: true),
            TestCaseData(id: "48a854f5-981c-45ca-a2b9-3c7a0a5f92cb",
             input: "n = 4",
             expected: "2", orderMatters: true),
            TestCaseData(id: "a1fb8dac-52e7-4ab8-b101-0a17b2b655dd",
             input: "n = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "f2f3c77b-1ba1-4207-b906-50f1e1052430",
             input: "n = 5",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9ce8a275-5300-474b-9702-285df52700b4",
             input: "n = 8",
             expected: "5", orderMatters: true),
            TestCaseData(id: "1600dcbe-f429-43fd-8f41-3dbc2a55d66b",
             input: "n = 9",
             expected: "5", orderMatters: true),
            TestCaseData(id: "d4c0cf1f-de85-46d7-8de3-67d0f869438b",
             input: "n = 10",
             expected: "5", orderMatters: true),
            TestCaseData(id: "d6c8d58d-6106-4ea0-9eee-8d746894b005",
             input: "n = 11",
             expected: "6", orderMatters: true),
            TestCaseData(id: "8b636007-2f80-4422-8dfe-f07c2eeade6c",
             input: "n = 12",
             expected: "7", orderMatters: true),
            TestCaseData(id: "6ba5322e-d6de-4b5e-87a4-90d9990f80d6",
             input: "n = 13",
             expected: "7", orderMatters: true),
            TestCaseData(id: "7b10a126-ed30-41bb-9c35-57724f7d433e",
             input: "n = 14",
             expected: "7", orderMatters: true),
            TestCaseData(id: "63690eb8-4999-4e0d-866f-567035b2b5a4",
             input: "n = 15",
             expected: "8", orderMatters: true),
            TestCaseData(id: "8d907a65-3f64-49b9-9d48-4b9ff3498705",
             input: "n = 16",
             expected: "9", orderMatters: true),
            TestCaseData(id: "115b2544-260f-4585-aced-9536a6d4e379",
             input: "n = 17",
             expected: "10", orderMatters: true),
            TestCaseData(id: "54560a1a-b7c6-4369-bcd5-db4b0e4ab1f4",
             input: "n = 18",
             expected: "11", orderMatters: true),
            TestCaseData(id: "6c601cd6-2c8e-4c61-b7e5-e05909ed7a83",
             input: "n = 19",
             expected: "12", orderMatters: true),
            TestCaseData(id: "2161a549-b499-4d65-9fdf-b7414e50d283",
             input: "n = 20",
             expected: "13", orderMatters: true),
            TestCaseData(id: "a205856e-4cd1-4d0a-940b-b0dc1771bf5f",
             input: "n = 21",
             expected: "14", orderMatters: true),
            TestCaseData(id: "5fae5c5e-805f-440e-95bc-82d7d4c6f273",
             input: "n = 22",
             expected: "15", orderMatters: true),
            TestCaseData(id: "20eefca1-b0ac-47aa-8a1a-5ab84468b9cb",
             input: "n = 23",
             expected: "15", orderMatters: true),
            TestCaseData(id: "43abdb59-a142-46c8-a61c-057f5515f13b",
             input: "n = 24",
             expected: "15", orderMatters: true),
            TestCaseData(id: "fa3a4f79-c3ba-41ae-b9c0-f05db36a495b",
             input: "n = 25",
             expected: "15", orderMatters: true),
            TestCaseData(id: "6e6c9b21-86cc-4704-bc8d-7178be16f81d",
             input: "n = 26",
             expected: "15", orderMatters: true),
            TestCaseData(id: "a6a85c8a-cd2e-44a8-835b-9d1da393e726",
             input: "n = 27",
             expected: "15", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "magical-string"
            let topic = "two-pointers"
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
            guard p_n >= 1 && p_n <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.magicalString(n: p_n)
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
