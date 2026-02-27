import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCBinarySubarraysWithSum {
    private class Solution {
        func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
          var count = 0
          var prefixSum = 0
          var sumCount: [Int: Int] = [0: 1]

          for num in nums {
            prefixSum += num
            if let val = sumCount[prefixSum - goal] {
              count += val
            }
            sumCount[prefixSum, default: 0] += 1
          }
          return count
        }
    }

    @Suite struct BinarySubarraysWithSumTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "02b9db83-9074-4353-b66a-f2b2060eda40",
             input: "nums = [1,1,1,1,1], goal = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "163ace99-0c83-414b-ba2a-a978ca7d814c",
             input: "nums = [0,0,0,0,0], goal = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "30126580-0612-403f-a25a-032287d13a13",
             input: "nums = [1,1,1,1,1], goal = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "669c51e9-99f9-4f51-9969-22e466d7c129",
             input: "nums = [0,0,0,0,0], goal = -1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "12f3b6af-d066-481b-8e7f-4d7c5d38c706",
             input: "nums = [1,2,3,4,5], goal = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6e0fb1c9-9a45-4395-abb4-75063c21a7f8",
             input: "nums = [5,4,3,2,1], goal = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "bc5cccc5-fc05-4900-908e-0b6af6525900",
             input: "nums = [1,1,1,1,1], goal = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b08364bc-6bbf-4063-b78c-9581d5bc5b53",
             input: "nums = [], goal = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "a4f0854e-49eb-439b-8302-84c08dc7acfc",
             input: "nums = [1], goal = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "fa37610f-0617-456d-80c4-a92b06445485",
             input: "nums = [1], goal = 0",
             expected: "0", orderMatters: true),
            TestCaseData(id: "93f43120-a40d-475e-a765-1181f7646c9e",
             input: "nums = [0], goal = 0",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cd443583-26f8-4b6a-bb75-28a81ca59df4",
             input: "nums = [0], goal = 1",
             expected: "0", orderMatters: true),
            TestCaseData(id: "33d4e85a-ba5c-4fe4-8b83-866bbe76dcd9",
             input: "nums = [1,1,1,1,1], goal = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "860a9455-a7e6-492f-b1d0-035eeccb4f18",
             input: "nums = [1,0,1,0,1], goal = 0",
             expected: "2", orderMatters: true),
            TestCaseData(id: "80e7c4ed-a098-4db1-b43e-eddd8fb3f897",
             input: "nums = [1,0,1,0,1], goal = 3",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a7f5cc30-5046-4606-9d85-5ce693b9613d",
             input: "nums = [1,0,1,0,1], goal = 1",
             expected: "8", orderMatters: true),
            TestCaseData(id: "8598588c-bd35-4878-92aa-5d7a1df80d4a",
             input: "nums = [0,1,0,1,0], goal = 1",
             expected: "8", orderMatters: true),
            TestCaseData(id: "ac723515-dd56-4525-9bb0-f15b45a3e79d",
             input: "nums = [0,0,1,0,0], goal = 1",
             expected: "9", orderMatters: true),
            TestCaseData(id: "da3b08c4-2c92-4a1d-933c-6ba2841d0892",
             input: "nums = [1,0,0,0,0], goal = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "71d1e51c-9c77-4b4d-9503-300493688e33",
             input: "nums = [0,0,0,0,1], goal = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "178dcb66-f569-4a29-8acf-c92a1bb06b04",
             input: "nums = [1,1,0,0,0], goal = 2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "eb339f13-ab8e-49ed-8453-d074092d41cf",
             input: "nums = [0,0,0,1,1], goal = 2",
             expected: "4", orderMatters: true),
            TestCaseData(id: "58a9cfd9-d635-4f67-99b1-403e19ad63b2",
             input: "nums = [1,1,1,0,0], goal = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "94571a80-1ed5-49fa-b74d-7cb678da4191",
             input: "nums = [0,0,1,1,1], goal = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "723f325d-ef44-4b7c-8f0f-ed138c37670f",
             input: "nums = [1,0,1,1,0], goal = 2",
             expected: "5", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "binary-subarrays-with-sum"
            let topic = "sliding-window"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 2 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 2, got \(params.count)"
                )
                return
            }

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }
            guard let p_goal = InputParser.parseInt(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as Int"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums.count >= 1 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 3 * 104"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.numSubarraysWithSum(p_nums, p_goal)
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
