import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCHammingDistance {
    private class Solution {
        func hammingDistance(_ x: Int, _ y: Int) -> Int { var xor = x ^ y; var distance = 0; while xor > 0 { if xor & 1 == 1 { distance += 1 }; xor >>= 1 }; return distance }
    }

    @Suite struct HammingDistanceTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4f153996-cfc5-43f5-8f7c-b96f1fa55ec5",
             input: "x = 0, y = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "605b83c6-03b2-447d-a6d0-c44fe36d6f9a",
             input: "x = 1, y = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "58eb384d-2ec6-4006-89e0-cb41196fb5cf",
             input: "x = 0, y = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "85ab3d67-2ae5-44d1-a145-fe971e94031f",
             input: "x = 0, y = 2147483647",
             expected: "31", orderMatters: true),
            TestCaseData(id: "3f4598ca-a0aa-4627-b5ee-450e25fba14b",
             input: "x = 2147483647, y = 0",
             expected: "31", orderMatters: true),
            TestCaseData(id: "6c4b620b-6e59-4b78-98eb-d6fa3994bc65",
             input: "x = 1, y = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "8580ee57-dfa5-43ad-9241-a554ebc40209",
             input: "x = 2, y = 1",
             expected: "2", orderMatters: true),
            TestCaseData(id: "6f1cdf46-63bb-4c93-a4be-2b226190071d",
             input: "x = 3, y = 3",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c56b25bf-5b31-4c5f-81ff-f9d3ea1b6475",
             input: "x = 4, y = 4",
             expected: "0", orderMatters: true),
            TestCaseData(id: "16c00308-2f3e-4503-abc3-a96f8569a930",
             input: "x = 5, y = 5",
             expected: "0", orderMatters: true),
            TestCaseData(id: "238f78eb-350c-4e85-a46d-ed5e8f00463e",
             input: "x = 6, y = 6",
             expected: "0", orderMatters: true),
            TestCaseData(id: "38a462e7-ba02-41ad-bd09-885e79c7e583",
             input: "x = 7, y = 7",
             expected: "0", orderMatters: true),
            TestCaseData(id: "09a7b8ad-620a-4dd1-931a-d53f558b2752",
             input: "x = 8, y = 8",
             expected: "0", orderMatters: true),
            TestCaseData(id: "469ac0e8-58ff-4943-a135-563c1aab3df0",
             input: "x = 9, y = 9",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0334e733-3a33-4b6c-97f9-484678ac6e3d",
             input: "x = 10, y = 10",
             expected: "0", orderMatters: true),
            TestCaseData(id: "7371f35f-d922-40ad-9be5-8e930519c823",
             input: "x = 11, y = 11",
             expected: "0", orderMatters: true),
            TestCaseData(id: "8d045f08-a9b3-45be-a392-b239713cd886",
             input: "x = 12, y = 12",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e6308997-d3b1-4b01-bcde-8aeea324d94b",
             input: "x = 13, y = 13",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a2c82fbb-de10-4a16-88ab-e92122f3f6ef",
             input: "x = 14, y = 14",
             expected: "0", orderMatters: true),
            TestCaseData(id: "88ba361e-3fcb-4a4a-b5e7-f27950788b35",
             input: "x = 15, y = 15",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b3f5d3b8-40f1-4fec-9bc5-ec1a930dfe73",
             input: "x = 16, y = 16",
             expected: "0", orderMatters: true),
            TestCaseData(id: "52bb13be-d13e-4360-a6e3-a9d7cae5e14d",
             input: "x = 17, y = 17",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c097707f-2738-4ccd-b6e4-ac22c25b45c9",
             input: "x = 18, y = 18",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ff6fcceb-b9fb-4908-8615-fcfc9f1712ef",
             input: "x = 19, y = 19",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3c84163f-5e51-480d-b825-398bec55c242",
             input: "x = 20, y = 20",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "hamming-distance"
            let topic = "bit-manipulation"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_x = InputParser.parseInt(params[0]) else {
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
            guard let p_y = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_x >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= x, y <= 231 - 1"
                )
                return
            }
            guard p_y >= 0 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= x, y <= 231 - 1"
                )
                return
            }

            let solution = Solution()
            let result = solution.hammingDistance(p_x, p_y)
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
