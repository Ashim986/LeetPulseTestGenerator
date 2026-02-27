import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCDegreeOfAnArray {
    private class Solution {
        func findShortestSubArray(_ nums: [Int]) -> Int {
            var count: [Int: Int] = [:]
            var first: [Int: Int] = [:]
            var last: [Int: Int] = [:]

            for (i, num) in nums.enumerated() {
                count[num, default: 0] += 1
                if first[num] == nil { first[num] = i }
                last[num] = i
            }

            let degree = count.values.max() ?? 0
            var ans = nums.count
            for (num, freq) in count where freq == degree {
                if let f = first[num], let l = last[num] {
                    ans = min(ans, l - f + 1)
                }
            }
            return ans
        }
    }

    @Suite struct DegreeOfAnArrayTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "51528F6E-CEA0-441F-9796-7315EBB5EB91",
             input: "[1,2,2,3,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "24EF648E-A61B-42DC-B418-ADB0DFF3648E",
             input: "[1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "16A582C9-0A04-40EE-A6D4-881BC188840E",
             input: "[1,1,1,1,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "07A6BF0C-0F8F-4522-B000-B7ED81A52514",
             input: "[]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "D32325A2-AFF3-4EE1-B72F-62E1C0BB2703",
             input: "[1,2,3,4,5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "48D01CF8-FFE1-49D6-B801-46A4354CD36C",
             input: "[1,1,2,2,3,3]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "5CC4F938-AEE9-4B68-8D16-B6D79E95714C",
             input: "[-1,-1,-1,-1,-1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "EDB45B25-1C4D-4312-AD7B-F44AC2294F19",
             input: "[0,0,0,0,0]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "CA997B4A-4026-4385-A339-9F8663F462BF",
             input: "[10,20,30,40,50]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "868D16D8-5459-4D05-BF93-814FDC7B6CC1",
             input: "[1000]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "09D33650-0CF4-4905-9DBE-1296BAC00C0B",
             input: "[1,1,1,1,1,1]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "A297AB27-42C0-465A-83B4-FF5A7A453537",
             input: "[2,2,2,2,2,2,2]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "864AA3A6-CB51-47A6-8CA4-A99FCD89039D",
             input: "[10,10,10,20,20,20]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "860B1907-D215-4615-BC8C-BF39A181F95F",
             input: "[5,5,5,5,5,5,5,5,5]",
             expected: "9", orderMatters: true),
            TestCaseData(id: "F6233E49-E326-49A2-9A21-7292FD7DD95D",
             input: "[1,1,1,2,2,2,3,3,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "C4AF8E07-959D-420C-B070-65227831BA5A",
             input: "[5,5,5,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "FE7DE4EB-9D3C-4BE5-B26C-F3F4609AD33E",
             input: "[1,-2,-3,-4,-5]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4A39A34D-E294-4C66-9A8A-9A5D1C608E69",
             input: "[10,-20,30,-40,50]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7F8D1579-9B93-4ED9-A1E0-BF6D19A2593F",
             input: "[0,0,0,0,0,0,0]",
             expected: "7", orderMatters: true),
            TestCaseData(id: "6BEF311A-D482-48D8-8393-6F172FC7C9FB",
             input: "[10,20,30,40,50,60]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "CCDCEC04-CDEA-4C21-BBC7-6078C1C3B2A8",
             input: "[1,2,3,4,5,6,7]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "582C5D5F-998A-420D-B0F3-34C93BE57734",
             input: "[1,2,2,3,3,3,3]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "9BE018C8-1B5C-404B-852D-311E89707901",
             input: "[1,1,2,3,3,3,3,3]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "68FA3946-BDB1-4FEB-89DC-9A8C825A718E",
             input: "[1,2,2,3,3,3,3,4]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "B439DAB9-DA85-45C6-8043-7AF24AFAE3FB",
             input: "[1,2,2,2,3,3,3,4]",
             expected: "3", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "degree-of-an-array"
            let topic = "arrays-hashing"
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

            // Constraint precondition checks
            guard p_nums.count >= 1 && p_nums.count <= 50 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums.length will be between 1 and 50,000."
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= 0 && $0 <= 49 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums[i] will be an integer between 0 and 49,999."
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.findShortestSubArray(p_nums)
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
