import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCKnightDialer {
    private class Solution {
        func knightDialer(_ N: Int) -> Int {
          let moves = [
            0: [4, 6],
            1: [6, 8],
            2: [7, 9],
            3: [4, 8],
            4: [0, 3, 9],
            5: [],
            6: [0, 1, 7],
            7: [2, 6],
            8: [1, 3],
            9: [2, 4]
          ];
          var dp = [Int](repeating: 1, count: 10)
          if N == 1 {
            return 10
          }
          for _ in 2...N {
            var temp = [Int](repeating: 0, count: 10)
            for i in 0...9 {
              for j in moves[i].unsafelyUnwrapped {
                temp[i] += dp[j]
              }
            }
            dp = temp
          }
          return dp.reduce(0, +)
        }
    }

    @Suite struct KnightDialerTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b2c6311b-11c9-403e-b770-e9ed81fce19b",
             input: "N = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "55b4f515-ec64-4718-9083-299c7d0b1dc0",
             input: "N = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "48f3bc32-a678-4d9f-b8fb-15c121b6467f",
             input: "N = 3",
             expected: "10", orderMatters: true),
            TestCaseData(id: "b45ffa92-0909-4753-979e-0f93b3c71b2c",
             input: "N = 4",
             expected: "22", orderMatters: true),
            TestCaseData(id: "af539e19-a238-4058-88e1-fa21266c7689",
             input: "N = 5",
             expected: "50", orderMatters: true),
            TestCaseData(id: "f09615c6-0898-44d4-b104-2ecc9b507dd3",
             input: "N = 6",
             expected: "118", orderMatters: true),
            TestCaseData(id: "f6ccd3ca-7d94-4eef-b6a8-923e410bba75",
             input: "N = 7",
             expected: "264", orderMatters: true),
            TestCaseData(id: "28836704-ddc6-47d5-bce5-598013b87bbf",
             input: "N = 8",
             expected: "608", orderMatters: true),
            TestCaseData(id: "f7a1ab16-8ccd-41a3-80c2-1e1321221d22",
             input: "N = 9",
             expected: "1392", orderMatters: true),
            TestCaseData(id: "d47a3901-deb1-4480-92b3-97b0fc20c25b",
             input: "N = 10",
             expected: "3192", orderMatters: true),
            TestCaseData(id: "ff5822ae-6734-4119-b080-a6ea32b168ce",
             input: "N = 11",
             expected: "7304", orderMatters: true),
            TestCaseData(id: "35b1685a-4301-4e6c-9977-8869ba312b82",
             input: "N = 12",
             expected: "16704", orderMatters: true),
            TestCaseData(id: "52071f9a-c7ca-45b3-9b5a-d9086c24c8ec",
             input: "N = 13",
             expected: "10", orderMatters: true),
            TestCaseData(id: "00f3ed89-5204-4245-a70f-7e745d1ebaeb",
             input: "N = 14",
             expected: "21", orderMatters: true),
            TestCaseData(id: "c1f085c1-ef15-4a83-8243-6da7825b0983",
             input: "N = 15",
             expected: "40", orderMatters: true),
            TestCaseData(id: "97047926-b3d7-4710-b74f-828c5c49f4c6",
             input: "N = 16",
             expected: "70", orderMatters: true),
            TestCaseData(id: "a76fcc98-2911-4048-a618-03b78066ceec",
             input: "N = 17",
             expected: "110", orderMatters: true),
            TestCaseData(id: "f4ba55ff-7e24-49ad-ab18-f35e9fc96b42",
             input: "N = 18",
             expected: "150", orderMatters: true),
            TestCaseData(id: "868c80fe-986c-48a6-8d73-ba76c48e20b9",
             input: "N = 19",
             expected: "190", orderMatters: true),
            TestCaseData(id: "ffe3ad93-afef-49ea-a4e5-ba5b70eae0b0",
             input: "N = 20",
             expected: "230", orderMatters: true),
            TestCaseData(id: "f4b6090e-affe-455e-a1c3-7a400c56086e",
             input: "N = -2",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "e721f9e4-e9ad-4778-bf07-26890554cc69",
             input: "N = -3",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "eda1957a-20ef-4d5f-97b7-e6c117845d0a",
             input: "N = -4",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "bd043d2e-d13f-4651-8a48-9c7813006baa",
             input: "N = -5",
             expected: "Infinite Loop", orderMatters: true),
            TestCaseData(id: "c0d51556-3bce-42c6-8061-d6d56e4e0c06",
             input: "n = 1",
             expected: "10", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "knight-dialer"
            let topic = "dynamic-programming"
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

            guard let p_N = InputParser.parseInt(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_N >= 1 && p_N <= 5000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= n <= 5000"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.knightDialer(p_N)
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
