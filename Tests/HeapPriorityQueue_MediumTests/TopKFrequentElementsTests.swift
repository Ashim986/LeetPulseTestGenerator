import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCTopKFrequentElements {
    private class Solution {
        func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
            var counts: [Int: Int] = [:]
            for num in nums { counts[num, default: 0] += 1 }
            var buckets = Array(repeating: [Int](), count: nums.count + 1)
            for (num, count) in counts {
                buckets[count].append(num)
            }
            var result: [Int] = []
            for freq in stride(from: buckets.count - 1, through: 1, by: -1) {
                for num in buckets[freq] {
                    result.append(num)
                    if result.count == k { return result }
                }
            }
            return result
        }
    }

    @Suite struct TopKFrequentElementsTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "18B3BB64-1650-4F1A-AB2D-B97674C565EB",
             input: "[1,1,1,2,2,3]\n2",
             expected: "[1,2]", orderMatters: false),
            TestCaseData(id: "32A1E91A-F1E9-45F6-864C-9A5AA385CEB2",
             input: "[1]\n1",
             expected: "[1]", orderMatters: false),
            TestCaseData(id: "AB5D7695-53AB-4BF5-9BCD-756E58DC0548",
             input: "[]\n0",
             expected: "[]", orderMatters: false),
            TestCaseData(id: "FBC2042C-A3FE-4F4D-BD99-F92BCF6F072D",
             input: "[1,2]\n2",
             expected: "[1,2]", orderMatters: false),
            TestCaseData(id: "CE0979DE-8AA4-4101-9E16-7E14AB2C225C",
             input: "[1,1,2,2,3,3,3]\n1",
             expected: "[3]", orderMatters: false),
            TestCaseData(id: "6FA0301E-9CF6-49F2-82E9-5A18C7867F14",
             input: "[3,0,1,0]\n1",
             expected: "[0]", orderMatters: false),
            TestCaseData(id: "12808917-232D-401E-825A-1258C189ECFE",
             input: "[-1,-1]\n1",
             expected: "[-1]", orderMatters: false),
            TestCaseData(id: "B9B40E57-7531-449B-86F7-DEA069A7ECEE",
             input: "[1,2,3,4,5,6]\n3",
             expected: "[1,2,3]", orderMatters: false),
            TestCaseData(id: "7EF5323F-2FCF-4245-8634-79A603FEFFC0",
             input: "[-1,-1,-1,-2,-2]\n1",
             expected: "[-1]", orderMatters: false),
            TestCaseData(id: "8A10AC0C-CAF6-414E-8362-0540C96449B5",
             input: "[5,5,5,5,5,6,6,6,7,7,8,8,8,8,8,9]\n2",
             expected: "[5,8]", orderMatters: false),
            TestCaseData(id: "5466F342-2B0F-4322-9ABF-6FD6309C9809",
             input: "[1,1,1,2,2,2,3,3,3,3]\n3",
             expected: "[3,1,2]", orderMatters: false),
            TestCaseData(id: "D83F67CD-E951-45C3-AAA4-86AB8C150072",
             input: "[-1,-1,-1,0,0,0]\n1",
             expected: "[-1]", orderMatters: false),
            TestCaseData(id: "6CD1D367-41B8-43CE-87F0-F0A39567F9F3",
             input: "[9,9,9,9,9,9,9,8,8,8,8,8,8,7,7,7,6,6,6]\n3",
             expected: "[9,8,7]", orderMatters: false),
            TestCaseData(id: "7288707F-0032-4C3F-8804-E25FB4BE6117",
             input: "[1,2,3,1,2,3,1,2,3,1,2,3,1,2,3]\n2",
             expected: "[1,2]", orderMatters: false),
            TestCaseData(id: "E5816568-2428-4C62-AC5C-7D0011E391CE",
             input: "[0,0,0,2,2,2,2,3,3,3]\n2",
             expected: "[2,0]", orderMatters: false),
            TestCaseData(id: "E5BDEC86-4D5D-41FB-944A-A926DFE77E3A",
             input: "[-1,-2,-3,-2,-1,-2,-2,0,0,0]\n3",
             expected: "[-2,0,-1]", orderMatters: false),
            TestCaseData(id: "EA033C51-24B6-494E-A747-815D8FD50462",
             input: "[0,4,1,-1,-1,0,-1,-1,-1,4,4,0]\n3",
             expected: "[-1,0,4]", orderMatters: false),
            TestCaseData(id: "973611B9-E5D6-4E64-82E4-F93FCAEF9455",
             input: "[5,5,5,5,5,5,5,4,4,4,4,4,3,3,3,2,2,1]\n5",
             expected: "[5,4,3,2,1]", orderMatters: false),
            TestCaseData(id: "4622C7AC-6AF8-42EE-92F9-B1F832B433C2",
             input: "[8,8,8,8,8,8,8,1,1,1,1,1,1,1]\n2",
             expected: "[8,1]", orderMatters: false),
            TestCaseData(id: "0E9D7F62-DE82-40A0-B464-698B0C061557",
             input: "[1,2,2,4,2,4,4,5,4,5,5,5,4,5,5]\n2",
             expected: "[5,4]", orderMatters: false),
            TestCaseData(id: "18F39EFC-103E-49D8-BA1F-11548FD4D42B",
             input: "[-3,-3,-3,-3,-3,-3,-3,-3,-2,-2,-2,-2,0,0,0,0,0,0,1,1,1]\n2",
             expected: "[-3,0]", orderMatters: false),
            TestCaseData(id: "E36A2762-BEA0-45F5-B40D-0902AFA8D4AE",
             input: "[7,7,7,7,7,7,7,7,7,6,6,6,6,5,5,5,5]\n3",
             expected: "[7,6,5]", orderMatters: false),
            TestCaseData(id: "876AF71D-D810-472C-8BCB-94C00E3C5547",
             input: "[3,3,3,2,2,2,1,1,1]\n2",
             expected: "[3,2]", orderMatters: false),
            TestCaseData(id: "384F1658-7874-468D-B91C-28D2DD658CD0",
             input: "[3,2,1]\n3",
             expected: "[3,2,1]", orderMatters: false),
            TestCaseData(id: "3983DB95-63D9-451E-976D-FA9A6E01DB01",
             input: "[1,1,2,2,3,3,4,4,5,5]\n5",
             expected: "[1,2,3,4,5]", orderMatters: false)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "top-k-frequent-elements"
            let topic = "heap-priority-queue"
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

            guard let p_nums = InputParser.parseIntArray(params[0]) else {
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
            guard p_nums.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: nums array too large (\(p_nums.count))"
                )
                return
            }
            guard let p_k = InputParser.parseInt(params[1]) else {
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
            guard p_nums.count >= 1 && p_nums.count <= 105 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= nums.length <= 105"
                )
                return
            }
            guard p_nums.allSatisfy({ $0 >= -104 && $0 <= 104 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: -104 <= nums[i] <= 104"
                )
                return
            }

            let solution = Solution()
            let result = solution.topKFrequent(p_nums, p_k)
            let computedOutput = OutputSerializer.serialize(result)

            // Order-independent array comparison (QUAL-01)
            // Sorted comparison ensures same elements with same frequencies
            guard let expectedArray = InputParser.parseIntArray(expectedOutput) else {
                let matches = false
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: computedOutput,
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse expected output as [Int]"
                )
                #expect(Bool(false), "Test \(testId): failed to parse expected")
                return
            }
            let matches: Bool
            if orderMatters {
                matches = result == expectedArray
            } else {
                matches = result.sorted() == expectedArray.sorted()
            }
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
