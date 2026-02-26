import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCPowerOfTwo {
    private class Solution {
        func isPowerOfTwo(_ n: Int) -> Bool {
            return n > 0 && (n & (n - 1)) == 0
        }
    }

    @Suite struct PowerOfTwoTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "71b3ef65-a3be-4440-b23f-9494cc1838dc",
             input: "n = 0",
             expected: "false", orderMatters: true),
            TestCaseData(id: "3f22ac12-ab6a-43c0-868c-6ad7bbb9d73d",
             input: "n = -1",
             expected: "false", orderMatters: true),
            TestCaseData(id: "1f183cec-b0c0-4138-9c62-3d7490e0c8fa",
             input: "n = -2",
             expected: "false", orderMatters: true),
            TestCaseData(id: "5f6c805c-93c7-4e1e-9791-55a2a2377d0d",
             input: "n = -4",
             expected: "false", orderMatters: true),
            TestCaseData(id: "80315b9a-80a8-4f8e-9eaa-20a882f446c3",
             input: "n = -8",
             expected: "false", orderMatters: true),
            TestCaseData(id: "e89ce1bb-d89a-4f96-b8ca-25d2662926d7",
             input: "n = 2",
             expected: "true", orderMatters: true),
            TestCaseData(id: "c060cdd1-755e-4bb7-bdb4-8a6dd21285cd",
             input: "n = 4",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2864c307-8acf-4ec3-8d39-2c9c0afcf973",
             input: "n = 8",
             expected: "true", orderMatters: true),
            TestCaseData(id: "bdc4c4c1-e044-4121-a217-a5e8acbd53e3",
             input: "n = 32",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cffb9987-89b3-4cbe-88c7-4e93f3be4656",
             input: "n = 64",
             expected: "true", orderMatters: true),
            TestCaseData(id: "4103ad1b-9bd4-461c-88ba-b9d5cd5d90b8",
             input: "n = 128",
             expected: "true", orderMatters: true),
            TestCaseData(id: "7467d3a9-ac8a-4c8e-9ef1-b390fe3ddbbf",
             input: "n = 256",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2b27d80f-d4f5-4053-90ad-9d5c4ecd7b52",
             input: "n = 512",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f5839469-f178-4b46-b00c-1cce55b0c5a8",
             input: "n = 1024",
             expected: "true", orderMatters: true),
            TestCaseData(id: "220b7b0d-ceea-420d-aa13-c7e044fe1030",
             input: "n = 2048",
             expected: "true", orderMatters: true),
            TestCaseData(id: "0e46d7f3-ca24-46f6-95f8-e032422552e2",
             input: "n = 4096",
             expected: "true", orderMatters: true),
            TestCaseData(id: "316b4b6b-c31d-47fa-a7fc-60831ac5b84c",
             input: "n = 8192",
             expected: "true", orderMatters: true),
            TestCaseData(id: "2bb5239a-d441-47b1-a898-6f7c0c289403",
             input: "n = 16384",
             expected: "true", orderMatters: true),
            TestCaseData(id: "f5c5e6b3-bad0-441d-a71d-f7b63d24e1fd",
             input: "n = 32768",
             expected: "true", orderMatters: true),
            TestCaseData(id: "fe7032ce-c417-4ab1-93f1-f4db964faedb",
             input: "n = 65536",
             expected: "true", orderMatters: true),
            TestCaseData(id: "d3ba6c13-a0e6-47b0-82b7-cfc930fa8989",
             input: "n = 131072",
             expected: "true", orderMatters: true),
            TestCaseData(id: "ef097a7d-269d-497a-9194-a2ec23454e28",
             input: "n = 262144",
             expected: "true", orderMatters: true),
            TestCaseData(id: "08b6f1e2-ccaa-4a49-aa4f-418beefa682e",
             input: "n = 524288",
             expected: "true", orderMatters: true),
            TestCaseData(id: "819f3d72-c6a3-4ce8-8f9b-fe4b28786fa6",
             input: "n = 1048576",
             expected: "true", orderMatters: true),
            TestCaseData(id: "cea93da9-6fe9-401d-bf0f-e17bbe0c0477",
             input: "n = 2097152",
             expected: "true", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "power-of-two"
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
            guard p_n >= -231 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -231 <= n <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.isPowerOfTwo(p_n)
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
