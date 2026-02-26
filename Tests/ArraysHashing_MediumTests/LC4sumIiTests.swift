import Foundation
@testable import LeetCodeHelpers
import Testing

enum LC4sumIi {
    private class Solution {
        func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
            var count = 0
            var abSum: [Int: Int] = [:]

            for a in A {
                for b in B {
                    let sum = a + b
                    abSum[sum] = (abSum[sum] ?? 0) + 1
                }
            }

            for c in C {
                for d in D {
                    let sum = c + d
                    count += abSum[-sum] ?? 0
                }
            }

            return count
        }
    }

    @Suite struct LC4sumIiTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "4b0f84dd-9a4f-4dc0-8256-2f925b2145ec",
             input: "A = [0], B = [0], C = [0], D = [0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a3c201fe-8e21-48d4-b141-a5dccc4623c2",
             input: "A = [], B = [], C = [], D = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4fcb89f8-2583-416b-b1db-0a6deeb796e8",
             input: "A = [1, 2, 3], B = [4, 5, 6], C = [7, 8, 9], D = [10, 11, 12]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a171332b-3b5f-45dc-a697-a4cf7627cff2",
             input: "A = [-1, -2, -3], B = [-4, -5, -6], C = [-7, -8, -9], D = [-10, -11, -12]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "c26d4bd7-9ffd-42ac-996a-cdfa5868e234",
             input: "A = [0, 0, 0, 0, 0], B = [0, 0, 0, 0, 0], C = [0, 0, 0, 0, 0], D = [0, 0, 0, 0, 0]",
             expected: "625", orderMatters: true),
            TestCaseData(id: "bd315e0a-8046-496d-a404-d7c7466a82f5",
             input: "A = [1, 2, 3, 4, 5], B = [6, 7, 8, 9, 10], C = [11, 12, 13, 14, 15], D = [16, 17, 18, 19, 20]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "612286d8-d364-4eda-bc7c-2e7d8c670e5f",
             input: "A = [-1, -2, -3, -4, -5], B = [-6, -7, -8, -9, -10], C = [-11, -12, -13, -14, -15], D = [-16, -17, -18, -19, -20]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a7689f50-6441-4486-9489-69404671c915",
             input: "A = [0, 0, 0, 0, 0], B = [0, 0, 0, 0, 0], C = [0, 0, 0, 0, 0], D = [1, 1, 1, 1, 1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "515b2948-8594-4412-956f-44deab38f618",
             input: "A = [1, 2, 3], B = [4, 5, 6], C = [7, 8, 9], D = [10, 11, 12, 13, 14]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6b9e9055-2047-4d27-9e1c-94e79d4b751b",
             input: "A = [1, 2, 3, 4, 5, 6], B = [7, 8, 9], C = [10, 11, 12], D = [13, 14, 15]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "55b625c7-26f1-4866-b961-1b5bd6ae315a",
             input: "A = [1, 2, 3], B = [4, 5, 6], C = [7, 8, 9, 10, 11], D = [12, 13, 14]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e5cddea3-45ef-49b8-96f7-0d868d2b5288",
             input: "A = [1, 2, 3, 4, 5], B = [6, 7, 8, 9, 10], C = [11, 12], D = [13, 14, 15, 16, 17]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e177eb87-3e45-4884-9bf0-995759be229e",
             input: "A = [1, 2, 3], B = [4, 5, 6, 7, 8], C = [9, 10, 11], D = [12, 13, 14, 15]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9a7a784e-256d-4907-bfbd-ba423347b569",
             input: "A = [1, 2, 3, 4], B = [5, 6, 7, 8], C = [9, 10, 11, 12], D = [13, 14, 15, 16, 17]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "98c48e19-075a-4b60-bbc2-3c494d859536",
             input: "A = [1, 2, 3, 4, 5, 6], B = [7, 8, 9, 10, 11, 12], C = [13, 14, 15], D = [16, 17, 18, 19, 20]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "73c96376-a3c8-4980-9100-a84c0c9bd7b0",
             input: "A = [1, 2, 3, 4, 5], B = [6, 7, 8, 9, 10, 11], C = [12, 13, 14, 15], D = [16, 17, 18, 19, 20, 21]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f3169ec7-93b2-4ab9-a14f-433dd8373eac",
             input: "A = [1, 2, 3, 4], B = [5, 6, 7, 8, 9], C = [10, 11, 12, 13, 14], D = [15, 16, 17, 18, 19, 20]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ace063cd-769b-44b8-b4c8-3e3c09ad9bf5",
             input: "A = [1, 2, 3, 4, 5], B = [6, 7, 8, 9, 10, 11, 12], C = [13, 14, 15, 16, 17, 18], D = [19, 20, 21, 22, 23, 24, 25]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "54580915-2a22-4130-8f0d-1e0c06ad36e9",
             input: "A = [1, 2, 3, 4, 5, 6, 7], B = [8, 9, 10, 11, 12, 13, 14], C = [15, 16, 17, 18, 19, 20], D = [21, 22, 23, 24, 25, 26, 27, 28]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5a1057ee-2e28-45d8-9f8b-f37f908e3e1d",
             input: "A = [1, 2, 3, 4, 5, 6, 7, 8], B = [9, 10, 11, 12, 13, 14, 15, 16], C = [17, 18, 19, 20, 21, 22, 23], D = [24, 25, 26, 27, 28, 29, 30, 31"
                + ", 32]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "674ab144-4250-4368-bafc-59e99a316152",
             input: "A = [1, 2, 3, 4, 5, 6, 7, 8, 9], B = [10, 11, 12, 13, 14, 15, 16, 17, 18], C = [19, 20, 21, 22, 23, 24, 25], D = [26, 27, 28, 29, 30, 31"
                + ", 32, 33, 34, 35]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "13573451-39cc-470f-abba-c151842905cc",
             input: "A = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], B = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20], C = [21, 22, 23, 24, 25, 26], D = [27, 28, 29, 30, 31"
                + ", 32, 33, 34, 35, 36, 37]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "ac4b841c-61ec-4761-90cc-1185b9f6ea6a",
             input: "A = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], B = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22], C = [23, 24, 25, 26, 27], D = [28, 29, 30, 31"
                + ", 32, 33, 34, 35, 36, 37, 38, 39]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4ffc2179-2622-4b17-9d0c-e5cc65d38f8b",
             input: "A = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], B = [13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], C = [25, 26, 27, 28], D = [29, 30, 31"
                + ", 32, 33, 34, 35, 36, 37, 38, 39, 40, 41]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0b7fcc81-7ffe-44c9-b58d-244d6e069f3e",
             input: "A = [1], B = [1], C = [1], D = [1]",
             expected: "0", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "4sum-ii"
            let topic = "arrays-hashing"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 4 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 4, got \(params.count)"
                )
                return
            }

            guard let p_A = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_A.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: A array too large (\(p_A.count))"
                )
                return
            }
            guard let p_B = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_B.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: B array too large (\(p_B.count))"
                )
                return
            }
            guard let p_C = InputParser.parseIntArray(params[2]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 2 as [Int]"
                )
                return
            }
            guard p_C.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: C array too large (\(p_C.count))"
                )
                return
            }
            guard let p_D = InputParser.parseIntArray(params[3]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 3 as [Int]"
                )
                return
            }
            guard p_D.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: D array too large (\(p_D.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_B.allSatisfy({ $0 >= -268435456 && $0 <= 268435456 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -2^28 <= nums1[i], nums2[i], nums3[i], nums4[i] <= 2^28"
                )
                return
            }
            guard p_C.allSatisfy({ $0 >= -268435456 && $0 <= 268435456 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -2^28 <= nums1[i], nums2[i], nums3[i], nums4[i] <= 2^28"
                )
                return
            }
            guard p_D.allSatisfy({ $0 >= -268435456 && $0 <= 268435456 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -2^28 <= nums1[i], nums2[i], nums3[i], nums4[i] <= 2^28"
                )
                return
            }

            let solution = Solution()
            let result = solution.fourSumCount(p_A, p_B, p_C, p_D)
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
