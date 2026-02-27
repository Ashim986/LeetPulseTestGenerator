import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumLengthOfRepeatedSubarray {
    private class Solution {
        func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
           let MOD = Int(1e9 + 7)
           func hashValue(of str: [Int], withBase base: Int) -> Int {
              var value = 0
              var b = 1
              for num in str {
                 value = (value + b * num) % MOD
                 b = (b * base) % MOD
              }
              return value
           }
           func rollingHash(_ str: [Int], _ length: Int, withBase base: Int) -> [Int] {
              var values = [Int]()
              var hashValue = 0
              var b = 1
              for i in 0..<length {
                 hashValue = (hashValue + b * str[i]) % MOD
                 b = (b * base) % MOD
              }
              values.append(hashValue)
              for i in length..<str.count {
                 hashValue = (hashValue - b * str[i - length] + MOD) % MOD
                 hashValue = (hashValue * base) % MOD
                 hashValue = (hashValue + b * str[i]) % MOD
                 values.append(hashValue)
              }
              return values
           }
           var maxLength = 0
           for length in 1...min(nums1.count, nums2.count) {
              let hashValues1 = rollingHash(nums1, length, withBase: 256)
              let hashValues2 = rollingHash(nums2, length, withBase: 256)
              for i in 0..<hashValues1.count {
                 for j in 0..<hashValues2.count {
                    if hashValues1[i] == hashValues2[j] {
                       // verify character by character
                       var k = 0
                       while i + k < nums1.count && j + k < nums2.count && nums1[i + k] == nums2[j + k] {
                          k += 1
                       }
                       maxLength = max(maxLength, k)
                    }
                 }
              }
           }
           return maxLength
        }
    }

    @Suite struct MaximumLengthOfRepeatedSubarrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "6b5c9f5e-97d9-43fd-8772-c9d00603e92e",
             input: "nums1 = [1,2,3], nums2 = [4,5,6]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "1a775765-171d-4598-9364-efec42f03a7c",
             input: "nums1 = [], nums2 = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "41108114-1e14-4844-8f18-2672f0228abd",
             input: "nums1 = [1,2,3], nums2 = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b1648f81-7bf7-448e-9814-3e2f95d398b0",
             input: "nums1 = [1], nums2 = [1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5b986f41-5db7-47ad-828c-7aae290d7610",
             input: "nums1 = [1,1,1], nums2 = [1,1,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2b12700c-5b08-474a-b1c4-cb364544ac12",
             input: "nums1 = [1,1,1,1,1], nums2 = [1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "7c039501-69fa-47ac-91e0-cac7c68b3e07",
             input: "nums1 = [1,2,3,4,5,6,7,8,9,10], nums2 = [1,2,3,4,5,6,7,8,9,10]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "79593ffa-cd71-4a44-bcc4-24a7fc17215f",
             input: "nums1 = [1,1,1,1,1,1,1,1,1,1], nums2 = [1,1,1,1,1,1,1,1,1,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "84e0fae0-9e34-4991-bc1b-cd4bdc59be40",
             input: "nums1 = [1,2,3,4,5], nums2 = [1,2,3,4,6]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "6a575e7b-00d4-4ebb-a5dc-5c7ccff4f2fb",
             input: "nums1 = [1,2,3,4,5], nums2 = [6,7,8,9,10]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "e7d944fa-2d3f-494b-bb17-facb26e98791",
             input: "nums1 = [1,1,2,2,3,3], nums2 = [1,1,2,2,3,3]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "05dab676-f8b0-4660-bfb0-901384aabbeb",
             input: "nums1 = [1,2,3,4,5,6], nums2 = [4,5,6,7,8,9]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "abb9fc7e-f053-42e4-9aad-935704d4c0c7",
             input: "nums1 = [1,2,3,4,5,6,7,8,9], nums2 = [4,5,6,7,8,9,10]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "2230010b-6e9e-4822-a846-a3a5d078ba8d",
             input: "nums1 = [1,2,3,4,5,6,7,8,9,10,11,12], nums2 = [10,11,12,13,14,15,16,17,18,19,20,21]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "f0f05b13-08f0-450d-85b1-72e336c2c9f0",
             input: "nums1 = [1,2,3,4,5,6,7,8,9,10,11,12], nums2 = [1,2,3,4,5,6,7,8,9,10,11,12]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "998a8c86-89a1-4d60-a0d8-8a45b58c0b60",
             input: "nums1 = [1,1,1,1,1,1,1,1,1,1,1,1], nums2 = [1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "75f21ded-ec35-43a4-8608-039ff147b231",
             input: "nums1 = [0,0,0,0,0,0,0,0,0,0,0,0], nums2 = [0,0,0,0,0,0,0,0,0,0,0,0]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "812fd99d-ef3b-4a2a-957a-44ed5bf56081",
             input: "nums1 = [10,20,30,40,50,60,70,80,90,100,110,120], nums2 = [10,20,30,40,50,60,70,80,90,100,110,120]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "8d78bbff-4592-4245-9f27-cf6852663a42",
             input: "nums1 = [-10,-20,-30,-40,-50,-60,-70,-80,-90,-100,-110,-120], nums2 = [-10,-20,-30,-40,-50,-60,-70,-80,-90,-100,-110,-120]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "8fab3e13-1120-493b-877a-ee94b212f16c",
             input: "nums1 = [1000,2000,3000,4000,5000,6000,7000,8000,9000,10000,11000,12000], nums2 = [1000,2000,3000,4000,5000,6000,7000,8000,9000,10000,11"
                + "000,12000]",
             expected: "12", orderMatters: true),
            TestCaseData(id: "fb3bc8a6-d045-4037-af2d-00a80d4aa2c9",
             input: "nums1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], nums2 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "b6023238-c91a-4724-bb7d-4417e46656e1",
             input: "nums1 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], nums2 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "6c384781-0f91-45f7-8f5e-b9f6d4f37a74",
             input: "nums1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], nums2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]",
             expected: "15", orderMatters: true),
            TestCaseData(id: "3e29c312-5e9f-40b7-bfdc-82beea7b090b",
             input: "nums1 = [1,2,3], nums2 = [3,2,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "d8187c2c-c6e5-462e-90e0-c90294b336f9",
             input: "nums1 = [1,2,3,4,5], nums2 = [5,4,3,2,1]",
             expected: "1", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-length-of-repeated-subarray"
            let topic = "binary-search"
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

            guard let p_nums1 = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_nums1.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums1 array too large (\(p_nums1.count))"
                )
                return
            }
            guard let p_nums2 = InputParser.parseIntArray(params[1]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 1 as [Int]"
                )
                return
            }
            guard p_nums2.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums2 array too large (\(p_nums2.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_nums1.count >= 1 && p_nums1.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums1.length, nums2.length <= 1000"
                )
                return
            }
            guard p_nums2.count >= 1 && p_nums2.count <= 1000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums1.length, nums2.length <= 1000"
                )
                return
            }
            guard p_nums1.allSatisfy({ $0 >= 0 && $0 <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums1[i], nums2[i] <= 100"
                )
                return
            }
            guard p_nums2.allSatisfy({ $0 >= 0 && $0 <= 100 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 0 <= nums1[i], nums2[i] <= 100"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findLength(p_nums1, p_nums2)
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
