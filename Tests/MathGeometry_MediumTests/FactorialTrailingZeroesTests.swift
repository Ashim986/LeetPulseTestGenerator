import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCFactorialTrailingZeroes {
    private class Solution {
        func trailingZeroes(_ n: Int) -> Int {
            var count = 0
            var i = 5
            while n / i >= 1 {
                count += n / i
                i *= 5
            }
            return count
        }
    }

    @Suite struct FactorialTrailingZeroesTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "013e6297-4fa2-45bf-beee-782156a69257",
             input: "n = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0dda1cbf-7d50-4b1f-b044-77133c470357",
             input: "n = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "9ca7fe06-def0-450d-b6b5-54c1fed8ceae",
             input: "n = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6018dce8-1578-4615-b880-a6d1814d0f94",
             input: "n = 4",
             expected: "2", orderMatters: true),
            TestCaseData(id: "eac65bfd-4a14-4eff-b475-578e3ffc99d5",
             input: "n = 6",
             expected: "2", orderMatters: true),
            TestCaseData(id: "ebf757ed-00cb-4441-9210-b701257495b1",
             input: "n = 10",
             expected: "4", orderMatters: true),
            TestCaseData(id: "f8306935-c483-4dc3-95f4-1b0e3a005036",
             input: "n = 15",
             expected: "9", orderMatters: true),
            TestCaseData(id: "f174c0fb-f332-4621-98ec-f7164563f885",
             input: "n = 20",
             expected: "12", orderMatters: true),
            TestCaseData(id: "b06965c6-9e2a-46f8-a200-93efa92b9e3f",
             input: "n = 25",
             expected: "7", orderMatters: true),
            TestCaseData(id: "7aa6275d-2d58-4ec7-84af-40dc9a24ed97",
             input: "n = 30",
             expected: "19", orderMatters: true),
            TestCaseData(id: "3917f1ac-359d-4061-b5f7-5c2ce54b5913",
             input: "n = -1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "be7875f6-bc75-4f7e-806b-edb2430d5313",
             input: "n = -5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "58ff77a8-4ed2-4f36-9701-d8a515bf2559",
             input: "n = -10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4c1c3b1f-ec39-4d99-81ae-c1666b48ac98",
             input: "n = 100",
             expected: "19", orderMatters: true),
            TestCaseData(id: "1419ea37-4b19-4ce1-8df2-b68e50776e10",
             input: "n = 200",
             expected: "19", orderMatters: true),
            TestCaseData(id: "9cc2879e-c1e7-44bb-be9c-08130ac65338",
             input: "n = 500",
             expected: "19", orderMatters: true),
            TestCaseData(id: "56013304-35a0-448a-835c-5d622fd2dfd3",
             input: "n = 1000",
             expected: "19", orderMatters: true),
            TestCaseData(id: "9ab547d2-8c11-4187-b3ad-494611893c27",
             input: "n = 2000",
             expected: "19", orderMatters: true),
            TestCaseData(id: "ad0b7749-42a2-4cbd-81ce-c93f6a2e5a90",
             input: "n = 5000",
             expected: "19", orderMatters: true),
            TestCaseData(id: "7b18c1f1-f593-4d1d-b6c0-5597bcbe1a11",
             input: "n = 10000",
             expected: "19", orderMatters: true),
            TestCaseData(id: "fb706bc0-6548-4db5-bd01-27e8799dd2cf",
             input: "n = 25000",
             expected: "103502", orderMatters: true),
            TestCaseData(id: "d0ea4870-774a-4bf3-9faf-f7d1e74ae385",
             input: "n = 50000",
             expected: "200745", orderMatters: true),
            TestCaseData(id: "d31150e7-17e0-4dd5-96f7-ee1ff64e9a5f",
             input: "n = 100000",
             expected: "431575", orderMatters: true),
            TestCaseData(id: "0c02301a-b27d-4a37-bb88-6eea3eb17d9e",
             input: "n = 250000",
             expected: "1118399", orderMatters: true),
            TestCaseData(id: "c9e170d2-c7a7-47c8-80b7-33783ed26d2e",
             input: "n = 500000",
             expected: "2275002", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "factorial-trailing-zeroes"
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
            guard p_n >= 0 && p_n <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= n <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.trailingZeroes(p_n)
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
