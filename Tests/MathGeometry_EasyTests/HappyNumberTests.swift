import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCHappyNumber {
    private class Solution {
        func isHappy(_ n: Int) -> Bool {
            var slow = n
            var fast = sumOfSquares(n)

            while fast != 1 && slow != fast {
                slow = sumOfSquares(slow)
                fast = sumOfSquares(sumOfSquares(fast))
            }

            return fast == 1
        }

        func sumOfSquares(_ n: Int) -> Int {
            var sum = 0
            var num = n
            while num > 0 {
                let digit = num % 10
                sum += digit * digit
                num /= 10
            }
            return sum
        }
    }

    @Suite struct HappyNumberTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "13faeb38-9273-4b1a-9fd0-4aa7ef25d100",
             input: "n = 0",
             expected: "false", orderMatters: true),
            TestCaseData(id: "9cc4c27c-c373-4fbf-832d-4b4afcbf86c4",
             input: "n = 4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e4413c70-0516-4bf6-bd7a-4fe0bcff9545",
             input: "n = 7",
             expected: "true", orderMatters: true),
            TestCaseData(id: "61e4689d-3e43-4806-b26d-e58a7f2759e6",
             input: "n = 13",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2235b517-c10d-45fe-99c2-6c9907b6eb12",
             input: "n = 20",
             expected: "false", orderMatters: true),
            TestCaseData(id: "db1ba040-efe9-4b4d-adf3-949e6321e22c",
             input: "n = 97",
             expected: "true", orderMatters: true),
            TestCaseData(id: "9b44172c-d8b0-428c-a626-c7f9cfedc485",
             input: "n = 200",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b22ceac5-f44e-40e9-a5de-c4c8e3cb1c1e",
             input: "n = -1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b796078c-3741-436d-ab10-8d3c96832464",
             input: "n = -4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "2e46bf4c-b249-4235-9bde-12073b45042c",
             input: "n = -7",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c77da343-504e-4176-8bb1-6099eb64eb26",
             input: "n = -13",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bc820006-db98-4bf5-93a7-52f83b412f18",
             input: "n = -20",
             expected: "false", orderMatters: true),
            TestCaseData(id: "40aac3d7-87a1-4670-b692-95953c2b0b39",
             input: "n = -97",
             expected: "false", orderMatters: true),
            TestCaseData(id: "367803cb-59cd-41cb-b345-b7316fbcd3b3",
             input: "n = -100",
             expected: "false", orderMatters: true),
            TestCaseData(id: "bd9be843-88e8-4578-8397-4d4ecac7c37f",
             input: "n = -107",
             expected: "false", orderMatters: true),
            TestCaseData(id: "8249f190-a1c8-4118-b2fa-786eb10f9668",
             input: "n = -199",
             expected: "false", orderMatters: true),
            TestCaseData(id: "f3c8a2bd-3c2f-4ff6-bcf4-32ff5c1f2512",
             input: "n = -200",
             expected: "false", orderMatters: true),
            TestCaseData(id: "ba49cbc2-d860-42ee-874c-405c2bacdd49",
             input: "n = -203",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1947f590-d4ae-4f2d-ae4c-341c59470842",
             input: "n = -1000",
             expected: "false", orderMatters: true),
            TestCaseData(id: "c134a9c5-d96a-4773-a2c9-039a9d327c9f",
             input: "n = 12345",
             expected: "false", orderMatters: true),
            TestCaseData(id: "a9246a03-02b8-4538-87b0-d0fd4bbd79f9",
             input: "n = 98765",
             expected: "false", orderMatters: true),
            TestCaseData(id: "b8d412ff-680c-43e3-9878-4c7c909d30ad",
             input: "n = 11111",
             expected: "false", orderMatters: true),
            TestCaseData(id: "274836f3-6c65-4a98-b730-d1209e06bfe5",
             input: "n = 22222",
             expected: "false", orderMatters: true),
            TestCaseData(id: "7816e55b-1f68-4dc3-81ea-5bc57ddc6cf8",
             input: "n = 33333",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3747b6a7-9714-4a8d-ac63-c8302bffcf24",
             input: "n = 44444",
             expected: "false", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "happy-number"
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
            let result = solution.isHappy(p_n)
            let computedOutput = OutputSerializer.serialize(result)

            // Normalize: parse expected to Bool (handles true/True/TRUE/1)
            let trimmedExpected = expectedOutput.trimmingCharacters(in: .whitespaces)
            let expectedBool = trimmedExpected.lowercased() == "true" || trimmedExpected == "1"
            let matches = result == expectedBool
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
