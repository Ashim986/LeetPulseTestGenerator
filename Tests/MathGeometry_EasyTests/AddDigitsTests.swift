import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCAddDigits {
    private class Solution {
        func addDigits(_ num: Int) -> Int {
            if num == 0 { return 0 }
            return (num - 1) % 9 + 1
        }
    }

    @Suite struct AddDigitsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "5452088f-fee9-4f5a-9605-f28745f1a898",
             input: "num = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dfeb5718-316d-49ed-ab6e-c21474e2c7d1",
             input: "num = 9",
             expected: "9", orderMatters: true),
            TestCaseData(id: "13b177da-97f4-4ce6-b55a-69f539f31614",
             input: "num = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b4e74500-8dc6-4ac4-a060-89e277da1eb5",
             input: "num = 19",
             expected: "1", orderMatters: true),
            TestCaseData(id: "3a1aca45-edd0-4c77-89d2-a99608c8c512",
             input: "num = 100",
             expected: "1", orderMatters: true),
            TestCaseData(id: "dccd3931-3951-404c-825a-7cd14021e704",
             input: "num = 123",
             expected: "6", orderMatters: true),
            TestCaseData(id: "3d5b09da-6256-4f15-ba88-5ab2e9f0fb00",
             input: "num = 1234",
             expected: "1", orderMatters: true),
            TestCaseData(id: "663d367c-463a-4a75-9059-153db956915c",
             input: "num = 12345",
             expected: "6", orderMatters: true),
            TestCaseData(id: "935fe506-f412-47d2-ae84-a2788db5333c",
             input: "num = 54321",
             expected: "6", orderMatters: true),
            TestCaseData(id: "f104c27b-fdd7-4fa0-9d2b-6ece538bcedf",
             input: "num = 1111",
             expected: "4", orderMatters: true),
            TestCaseData(id: "6b37e9c2-d688-4d25-b73e-af8f062b9050",
             input: "num = 2222",
             expected: "8", orderMatters: true),
            TestCaseData(id: "6983af66-2d9f-481b-be87-5ddc83ce3c6e",
             input: "num = 3333",
             expected: "3", orderMatters: true),
            TestCaseData(id: "3d535aa8-85b1-4cc5-b7ba-3a3cf25894ad",
             input: "num = 4444",
             expected: "7", orderMatters: true),
            TestCaseData(id: "a0d84ce0-99ba-469c-aaf5-be56f07fd1aa",
             input: "num = 5555",
             expected: "2", orderMatters: true),
            TestCaseData(id: "adb2ea01-0e04-460a-967b-7d13233c285a",
             input: "num = 9999",
             expected: "9", orderMatters: true),
            TestCaseData(id: "d8c2ecdc-1128-482d-b6f5-4d7397786b19",
             input: "num = 10000",
             expected: "1", orderMatters: true),
            TestCaseData(id: "b66c9d36-b2ef-4c22-9f48-2c41aa439e25",
             input: "num = 123456",
             expected: "3", orderMatters: true),
            TestCaseData(id: "491f9bc0-f1ae-492f-8f35-6591b60e072f",
             input: "num = 654321",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6348e15e-df62-40ff-a018-07502161f5a9",
             input: "num = 543210",
             expected: "6", orderMatters: true),
            TestCaseData(id: "9018a6ed-3064-4821-a05d-6bcad770c2e7",
             input: "num = 111111",
             expected: "6", orderMatters: true),
            TestCaseData(id: "34dbf07d-294d-4be3-90bc-aea809b8694e",
             input: "num = 333333",
             expected: "9", orderMatters: true),
            TestCaseData(id: "a3777b12-a654-4b60-a045-b868d9491e8b",
             input: "num = 1000000",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ce129486-a007-48af-8c0e-f1c32b36b159",
             input: "num = -1",
             expected: "-1", orderMatters: true),
            TestCaseData(id: "d386f58b-e1a4-416b-80dc-449865d09b0b",
             input: "num = 6666",
             expected: "6", orderMatters: true),
            TestCaseData(id: "f010ce4c-cf97-40b3-bb3d-b95e05e80b8b",
             input: "num = 7777",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "add-digits"
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

            guard let p_num = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_num >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= num <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.addDigits(p_num)
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
