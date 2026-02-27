import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMaximumDistanceInArrays {
    private class Solution {
        func maxDistToClosest(seats: [Int]) -> Int {
            var maxDist = 0
            var last1 = -1
            for i in 0..<seats.count {
                if seats[i] == 1 {
                    if last1 == -1 {
                        maxDist = max(maxDist, i)
                    } else {
                        maxDist = max(maxDist, (i - last1) / 2)
                    }
                    last1 = i
                }
            }
            maxDist = max(maxDist, seats.count - 1 - last1)
            return maxDist
        }
    }

    @Suite struct MaximumDistanceInArraysTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "02e7f1e1-2518-4ddf-8686-0dd57091d164",
             input: "people = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "bf2e68ed-25e9-4e03-8cdf-5a36813e0a20",
             input: "people = [1,0,1,0,1,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "40b149fd-3298-4c53-853b-903328e3e501",
             input: "people = [0,1,0,1,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "97252a05-53a3-4164-bf21-a8cb040611f9",
             input: "people = [1,0,0,0,0,0,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6b1420d3-e73d-4828-b41e-9a5ab77fef71",
             input: "people = [1,1,0,0,0,0,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c921b090-36ea-4652-a4ec-7fa4b1d66f0f",
             input: "people = [1,0,0,0,0,0,0,0,0,0,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "c833e4ac-46b1-4f02-b63b-029daff2b025",
             input: "people = [0,0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "991f0559-ea14-4ee0-afc0-a73063005331",
             input: "people = [1,1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "b89d2f16-54ca-47fa-b442-723c44104e0f",
             input: "people = [1,0,1,0,1,0,1,0,1,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "5e6fd078-557c-4dae-8cfb-f396edd29e9c",
             input: "people = [0,1,0,1,0,1,0,1,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a544b533-8cf7-471b-b0cb-2bec36213e7a",
             input: "people = [0,0,0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5d4abde4-019b-4526-a883-a5e0bc6f7f4b",
             input: "people = [1,1,1,1,1,1,1,1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "9a676ebe-fc86-4fe8-b353-bb2b1877f9ba",
             input: "people = [1,0,1,0,1,0,1,0,1,0,1,0]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "1b5f9e13-233d-4b31-b462-26bb6faf3fa4",
             input: "people = [0,1,0,1,0,1,0,1,0,1,0,1]",
             expected: "1", orderMatters: true),
            TestCaseData(id: "939dd94f-b6ef-498a-8311-24bf5ec2bd25",
             input: "people = [1,0,0,0,0,1]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "37ee536d-bd6b-4fd1-ad64-fe7694a3c8ca",
             input: "people = [0,0,0,1,0,0,0]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a7f1dc3e-ed4c-4aaa-9e86-82363ac8b569",
             input: "people = [0,0,0,0,0]",
             expected: "2", orderMatters: true),
            TestCaseData(id: "b0b59db6-0a8e-463d-92d3-851ab96d4579",
             input: "people = [0,0,0,0,0,0,0]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "2c408c63-2162-4984-9dad-99388a1b4fab",
             input: "people = [0,0,0,1,1,0,0]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a0a8dd90-ea65-40ce-b3fd-5e1af65e8b09",
             input: "people = [0,0,0,0,0,1,1,0,0,0]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "e9b35b35-e791-4861-a1c8-91e431426510",
             input: "people = [1,1,0,0,0,0,0,0,0,0,1]",
             expected: "8", orderMatters: true),
            TestCaseData(id: "b3feec25-a5f3-4824-b202-3ad73683b9a8",
             input: "people = [0,0,0,0,0,1,1,0,0,0,0]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "048536fc-5a2d-4684-880b-36a271661f0f",
             input: "people = [1,0,0,0,0,0,0,0,0,0,0,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "026a2ba0-b4f0-41ad-81fe-ae37d0502d81",
             input: "people = [1,1,0,0,0,0,0,0,0,0,0,1]",
             expected: "5", orderMatters: true),
            TestCaseData(id: "f07b0eeb-c80a-4bce-b621-1b63fc27f97d",
             input: "people = [0,0,0,0,0,1,1,0,0,0,0,0]",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "maximum-distance-in-arrays"
            let topic = "greedy"
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

            guard let p_seats = InputParser.parseIntArray(params[0]) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Failed to parse param 0 as [Int]"
                )
                return
            }
            guard p_seats.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput, computedOutput: "",
                    isValid: false, status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: seats array too large (\(p_seats.count))"
                )
                return
            }

            let solution = Solution()
            var resultHolder: Int?
            let didCrash = withCrashGuard {
                resultHolder = solution.maxDistToClosest(seats: p_seats)
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
