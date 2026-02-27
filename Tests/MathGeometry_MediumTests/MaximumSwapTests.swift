import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumSwap {
    private class Solution {
        let maxSwap = { (num: Int) -> Int in
          var strNum = String(num)
          let count = strNum.count
          var maxIndex = -1
          var maxVal = -1
          var firstIndex = -1

          // Find the maximum digit and its index from right to left
          for i in (0...count-1).reversed() {
            let val = Int(String(strNum[strNum.index(strNum.startIndex, offsetBy: i)])) ?? 0
            if val > maxVal {
              maxVal = val
              maxIndex = i
            }
          }

          // Find the first digit that is smaller than the maximum digit
          for i in 0..<count {
            let val = Int(String(strNum[strNum.index(strNum.startIndex, offsetBy: i)])) ?? 0
            if val < maxVal {
              firstIndex = i
              break
            }
          }

          // Swap the first digit with the maximum digit if found
          if firstIndex != -1 && maxIndex != -1 {
            var strArray = Array(strNum)
            let temp = strArray[firstIndex]
            strArray[firstIndex] = strArray[maxIndex]
            strArray[maxIndex] = temp
            strNum = String(strArray)
          }

          return Int(strNum) ?? num
        }
    }

    @Suite struct MaximumSwapTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "baf1ccbe-2df8-4ae4-ae6a-57382ba1f057",
             input: "num = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f8c9a5a1-4464-4593-a1a2-23798f1b6d3a",
             input: "num = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ba4d3578-b2e9-4032-a2e3-20ee6b8fd384",
             input: "num = 9",
             expected: "9", orderMatters: true),
            TestCaseData(id: "45208438-5966-41d2-8599-c853ffa1492c",
             input: "num = 10",
             expected: "10", orderMatters: true),
            TestCaseData(id: "74a4cd2f-3a7d-4e88-8a2a-3bd4494ad467",
             input: "num = 99",
             expected: "99", orderMatters: true),
            TestCaseData(id: "56867a01-70e7-4418-8971-08656908febe",
             input: "num = 100",
             expected: "100", orderMatters: true),
            TestCaseData(id: "8007705b-5e7f-4b53-98b0-957a842c3323",
             input: "num = 123",
             expected: "321", orderMatters: true),
            TestCaseData(id: "dedae3a5-65e7-4a2e-9afc-1d0fa7dd9b9b",
             input: "num = 1111",
             expected: "1111", orderMatters: true),
            TestCaseData(id: "afc7b3d0-5278-438b-86d7-651b8a23e6b5",
             input: "num = 54321",
             expected: "54321", orderMatters: true),
            TestCaseData(id: "73d209a0-d59d-4f98-92ff-4af669821653",
             input: "num = 98765",
             expected: "98765", orderMatters: true),
            TestCaseData(id: "869f0cee-f4c0-48ea-b16c-09e3107c74dd",
             input: "num = 1357",
             expected: "7351", orderMatters: true),
            TestCaseData(id: "5505655d-d66c-4343-ab1a-09edccb2ecb2",
             input: "num = 2468",
             expected: "8462", orderMatters: true),
            TestCaseData(id: "50c1bb26-b3f7-4861-966d-9a89c566203e",
             input: "num = 4680",
             expected: "8640", orderMatters: true),
            TestCaseData(id: "765672c4-c29a-4712-961c-e8e16d96af81",
             input: "num = 5791",
             expected: "9751", orderMatters: true),
            TestCaseData(id: "d5b6a2bb-ab5b-4940-adbb-003378db05dc",
             input: "num = 7890",
             expected: "9870", orderMatters: true),
            TestCaseData(id: "0f51d4e2-df1b-4aa3-af14-00a2119049c4",
             input: "num = 1000000",
             expected: "1000000", orderMatters: true),
            TestCaseData(id: "88f5cd37-2e41-4821-b722-4927bc46b007",
             input: "num = 7654321",
             expected: "7654321", orderMatters: true),
            TestCaseData(id: "f670c285-1f38-4bf0-a978-791fac1bbed5",
             input: "num = 9876543",
             expected: "9876543", orderMatters: true),
            TestCaseData(id: "5e2ee027-96b6-4494-91f5-e43a85aa4c65",
             input: "num = 987654321",
             expected: "987654321", orderMatters: true),
            TestCaseData(id: "09ca8c01-88a8-4b8c-b946-335fe841a127",
             input: "num = 9876543210",
             expected: "9876543210", orderMatters: true),
            TestCaseData(id: "6b2c7dbf-581e-487a-9b77-4bd168a38c33",
             input: "num = 1111111111",
             expected: "1111111111", orderMatters: true),
            TestCaseData(id: "2c4a39ec-85b1-4305-a112-5a3f315444f0",
             input: "num = 9999999999",
             expected: "9999999999", orderMatters: true),
            TestCaseData(id: "7900605a-2555-4d8f-8359-c544214b8ae1",
             input: "num = 1234",
             expected: "4231", orderMatters: true),
            TestCaseData(id: "5279873e-3b02-43ea-aea1-500f601c5b7d",
             input: "num = 3579",
             expected: "9573", orderMatters: true),
            TestCaseData(id: "97021c19-2d79-4b15-b420-15c072da21a4",
             input: "num = 6789",
             expected: "9786", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-swap"
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
            guard p_num >= 0 && p_num <= 108 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= num <= 108"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxSwap(p_num)
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
