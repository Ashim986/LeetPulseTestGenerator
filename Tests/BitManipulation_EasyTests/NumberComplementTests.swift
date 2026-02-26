import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCNumberComplement {
    private class Solution {
        func findComplement(_ num: Int) -> Int { let numberOfBits = num.nonzeroBitCount; let bitmask = (1 << (numberOfBits + 1)) - 1; return num ^ bitmask }
    }

    @Suite struct NumberComplementTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "659d65fa-a203-4441-afa5-42560a7388bd",
             input: "num = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fa72a9d1-2aee-4f1b-84ee-909319343411",
             input: "num = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5da65edf-1db4-4a56-ab4e-4d3e87bb168f",
             input: "num = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "891fb93f-3dde-4c09-bf69-b5f6482a35d6",
             input: "num = 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1a3ef358-7d4d-44ca-9f5e-fbbff2d30844",
             input: "num = 4",
             expected: "3", orderMatters: true),
            TestCaseData(id: "e69ba7b3-635c-4a2f-8709-c610004b70ea",
             input: "num = 6",
             expected: "1", orderMatters: true),
            TestCaseData(id: "8442d1bf-8d7b-4d85-b874-9c0f39b53b69",
             input: "num = 7",
             expected: "0", orderMatters: true),
            TestCaseData(id: "35533aba-f7ae-4d42-80ae-0d686c7a4fea",
             input: "num = 8",
             expected: "7", orderMatters: true),
            TestCaseData(id: "b4d1a9a6-9163-48bd-b45f-0ef8c46eb8db",
             input: "num = 9",
             expected: "6", orderMatters: true),
            TestCaseData(id: "6c2bb3de-c9d4-4766-b863-66a76dc653c5",
             input: "num = 10",
             expected: "5", orderMatters: true),
            TestCaseData(id: "1f7e70b5-3889-4e93-bf27-c363386aecab",
             input: "num = 11",
             expected: "4", orderMatters: true),
            TestCaseData(id: "ef9473af-b50e-4e20-a5d4-d35e0ad65baf",
             input: "num = 12",
             expected: "3", orderMatters: true),
            TestCaseData(id: "5bcc397c-2194-43a0-8373-751e4c89091f",
             input: "num = 13",
             expected: "2", orderMatters: true),
            TestCaseData(id: "0f7621fd-5c0f-41f9-8954-c542f2badc8b",
             input: "num = 14",
             expected: "1", orderMatters: true),
            TestCaseData(id: "be7d4f72-fa9b-477d-9c55-3fca18c3947b",
             input: "num = 15",
             expected: "0", orderMatters: true),
            TestCaseData(id: "2b527ea2-984f-4799-8e2c-b56cc60faa2b",
             input: "num = 16",
             expected: "15", orderMatters: true),
            TestCaseData(id: "5fe58e76-dd23-4fe1-8c9e-b2b9eb4ac1aa",
             input: "num = 17",
             expected: "14", orderMatters: true),
            TestCaseData(id: "24e23a54-4fa9-4718-bf15-f52a0e86c33e",
             input: "num = 18",
             expected: "13", orderMatters: true),
            TestCaseData(id: "8a72e539-1c8c-4559-9ba7-1e622bd7e1ab",
             input: "num = 19",
             expected: "12", orderMatters: true),
            TestCaseData(id: "4c484672-a3f4-4280-bc85-dd793dda2c5f",
             input: "num = 20",
             expected: "11", orderMatters: true),
            TestCaseData(id: "112b76f9-2a24-4f13-9fb4-a00ca6fdee01",
             input: "num = 21",
             expected: "10", orderMatters: true),
            TestCaseData(id: "f9e1819e-66fb-4d0c-a1e5-b0a974c22b9f",
             input: "num = 22",
             expected: "9", orderMatters: true),
            TestCaseData(id: "4faf3c3b-0bfd-4480-9fd3-7255b78d52e0",
             input: "num = 23",
             expected: "8", orderMatters: true),
            TestCaseData(id: "cf0f5d9d-d24b-4ba1-89e0-00ba1aa4aa62",
             input: "num = 24",
             expected: "7", orderMatters: true),
            TestCaseData(id: "5e41c8f7-07a3-4ef5-8144-b9eb77da3ded",
             input: "num = 25",
             expected: "6", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "number-complement"
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
            guard p_num >= 1 && p_num <= 231 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= num < 231"
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
