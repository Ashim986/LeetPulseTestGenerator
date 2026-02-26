import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCKokoEatingBananas {
    private class Solution {
        func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
            func canFinish(_ k: Int) -> Bool {
                var totalHours = 0
                for pile in piles {
                    totalHours += (pile + k - 1) / k
                    if totalHours > h { return false }  // Early exit
                }
                return true
            }

            var left = 1
            var right = piles.max().unsafelyUnwrapped

            while left < right {
                let mid = left + (right - left) / 2
                if canFinish(mid) {
                    right = mid
                } else {
                    left = mid + 1
                }
            }

            return left
        }
    }

    @Suite struct KokoEatingBananasTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "b54605b8-7baf-4e2b-82d1-335277ced7f6",
             input: "piles = [1], h = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "49ee9278-a3fc-443e-9780-751b7dfbeb88",
             input: "piles = [1, 1], h = 2",
             expected: "1", orderMatters: true),
            TestCaseData(id: "cbb9a3ec-5ca9-45cb-8557-06d4f4d96ce6",
             input: "piles = [2, 2], h = 2",
             expected: "2", orderMatters: true),
            TestCaseData(id: "c99d6b75-9310-44fb-84f2-46e0b8935a53",
             input: "piles = [1, 1, 1, 1, 1], h = 5",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ec6a46d6-64a0-4520-a5c1-5d74573475c4",
             input: "piles = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1], h = 10",
             expected: "1", orderMatters: true),
            TestCaseData(id: "ba01d682-e237-483a-a15b-47bc1de5bb62",
             input: "piles = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10], h = 10",
             expected: "10", orderMatters: true),
            TestCaseData(id: "ff1caa59-0f80-401b-b033-8e6d43e11ac3",
             input: "piles = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], h = 100",
             expected: "1", orderMatters: true),
            TestCaseData(id: "7e4a31f3-eba2-47ff-922b-33201ddf7f94",
             input: "piles = [1, 1, 1, 1, 1], h = 1",
             expected: "1", orderMatters: true),
            TestCaseData(id: "0e3e7e28-04c8-42ee-bb62-09a5f4989e8d",
             input: "piles = [1, 2, 3, 4, 5], h = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "37a725a5-c2e8-47e8-aac4-069402335a47",
             input: "piles = [5, 4, 3, 2, 1], h = 1",
             expected: "5", orderMatters: true),
            TestCaseData(id: "b66b908d-76fe-4aca-bab7-c3c03a04b1f9",
             input: "piles = [1, 1, 1, 1, 1], h = 100",
             expected: "1", orderMatters: true),
            TestCaseData(id: "35b1b85e-28f5-4570-8492-a691b4f04243",
             input: "piles = [10, 20, 30, 40, 50], h = 1000",
             expected: "1", orderMatters: true),
            TestCaseData(id: "a6eadee5-c793-46df-b875-81a9dbee56b6",
             input: "piles = [50, 40, 30, 20, 10], h = 1000",
             expected: "1", orderMatters: true),
            TestCaseData(id: "43c97286-06df-4699-9330-d3d192cb7908",
             input: "piles = [1, 2, 3, 4, 5], h = 1000",
             expected: "1", orderMatters: true),
            TestCaseData(id: "14ff2fbf-7a07-4269-a492-cd87e13398f0",
             input: "piles = [5, 4, 3, 2, 1], h = 1000",
             expected: "1", orderMatters: true),
            TestCaseData(id: "6711450f-86de-4109-97c3-a3b2cecede7d",
             input: "piles = [1, 2, 3], h = 3",
             expected: "3", orderMatters: true),
            TestCaseData(id: "6255d1ee-7ab8-4a11-bc69-0c33d3c57b1a",
             input: "piles = [1, 2, 3], h = 5",
             expected: "2", orderMatters: true),
            TestCaseData(id: "207f88ba-7c45-4646-b133-9a20f5b6e950",
             input: "piles = [10, 20, 30], h = 10",
             expected: "7", orderMatters: true),
            TestCaseData(id: "987ed4c6-de00-48f2-90c9-d1cf908fee94",
             input: "piles = [100, 200, 300], h = 100",
             expected: "7", orderMatters: true),
            TestCaseData(id: "a3fe1f14-2c6b-40c8-acb7-73b227515883",
             input: "piles = [5, 5, 5, 5], h = 10",
             expected: "3", orderMatters: true),
            TestCaseData(id: "69abce69-0e66-4ab0-8c64-c2990d44bb21",
             input: "piles = [10, 10, 10, 10], h = 10",
             expected: "5", orderMatters: true),
            TestCaseData(id: "30f5d0b5-65bc-492e-91b5-1b23c41abf2d",
             input: "piles = [1, 2, 3, 4, 5], h = 10",
             expected: "2", orderMatters: true),
            TestCaseData(id: "7b6466bd-c127-417d-87a9-f99cd998dded",
             input: "piles = [5, 4, 3, 2, 1], h = 10",
             expected: "2", orderMatters: true),
            TestCaseData(id: "d79161c2-064d-4063-85cb-b22784445409",
             input: "piles = [-1, -2, -3], h = 3",
             expected: "1", orderMatters: true),
            TestCaseData(id: "4d0c381a-8d4f-434c-8867-4e2b224f4173",
             input: "piles = [3,6,7,11], h = 8",
             expected: "4", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "koko-eating-bananas"
            let topic = "binary-search"
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

            guard let p_piles = InputParser.parseIntArray(params[0]) else {
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
            guard p_piles.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: piles array too large (\(p_piles.count))"
                )
                return
            }
            guard let p_h = InputParser.parseInt(params[1]) else {
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
            guard p_piles.count >= 1 && p_piles.count <= 104 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= piles.length <= 104"
                )
                return
            }
            guard p_piles.allSatisfy({ $0 >= 1 && $0 <= 109 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= piles[i] <= 109"
                )
                return
            }

            let solution = Solution()
            let result = solution.minEatingSpeed(p_piles, p_h)
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
