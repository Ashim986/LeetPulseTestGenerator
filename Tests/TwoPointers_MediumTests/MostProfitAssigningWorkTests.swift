import Foundation
@testable import LeetCodeHelpers
import Testing

enum LCMostProfitAssigningWork {
    private class Solution {
        func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
          let jobs = zip(difficulty, profit).sorted(by: { $0.0 < $1.0 })
          var maxProfit = [0]
          var curMaxProfit = 0
          for i in 0..<jobs.count {
            if jobs[i].1 > curMaxProfit {
              curMaxProfit = jobs[i].1
            }
            maxProfit.append(curMaxProfit)
          }
          var res = 0
          for w in worker {
            if let idx = binarySearch(jobs.map { $0.0 }, w) {
              res += maxProfit[idx]
            }
          }
          return res
        }

        func binarySearch(_ arr: [Int], _ target: Int) -> Int? {
          var left = 0
          var right = arr.count - 1
          while left <= right {
            let mid = (left + right) / 2
            if arr[mid] <= target {
              left = mid + 1
            } else {
              right = mid - 1
            }
          }
          if right >= 0 {
            return right
          }
          return nil
        }
    }

    @Suite struct MostProfitAssigningWorkTests {
        init() { registerResultFlush() }

        static let testCases: [TestCaseData] = [
            TestCaseData(id: "efe937bf-b83b-4f33-aed3-dd5b1d970f6f",
             input: "difficulty = [1,1,1], profit = [1,1,1], worker = [1,1,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "a07bdf0a-9a6c-47e0-9075-f7bc740f44df",
             input: "difficulty = [1,2,3], profit = [1,2,3], worker = []",
             expected: "0", orderMatters: true),
            TestCaseData(id: "6d56ba18-2f18-4ce2-9a31-acca2547aa29",
             input: "difficulty = [], profit = [], worker = [1,2,3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "89150d89-e966-48cb-8cec-e20334fa8f9b",
             input: "difficulty = [1,2,3], profit = [1,2,3], worker = [-1,-2,-3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f7076b5e-7145-4231-b830-4af203a5f8c0",
             input: "difficulty = [1,2,3,4,5], profit = [1,2,3,4,5], worker = [0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "d8b55f24-2093-4e4f-b708-a2d8153f7489",
             input: "difficulty = [1,2,3,4,5], profit = [1,2,3,4,5], worker = [-1,-1,-1,-1,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "0a1d5e4b-131c-4a47-8c49-ae48369a6f47",
             input: "difficulty = [1,2,3,4,5], profit = [1,2,3,4,5], worker = [0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "cf396784-a56d-4ce9-b64c-658d1d5a286a",
             input: "difficulty = [1,2,3,4,5], profit = [1,2,3,4,5], worker = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "515c3ead-ff96-422b-9471-fa5f602f05ba",
             input: "difficulty = [1,2,3,4,5], profit = [1,2,3,4,5], worker = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "5ff2bc2f-dd84-4305-859c-df0f30779118",
             input: "difficulty = [1,2,3,4,5], profit = [1,2,3,4,5], worker = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "4fc6b6df-b0a1-4efa-ae4a-761facf40ebe",
             input: "difficulty = [1], profit = [1], worker = [1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "f4b80ac8-f1c5-4d9d-b95c-b0e3abb4f72e",
             input: "difficulty = [1,2], profit = [2,3], worker = [1,2,3]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "1d19a7dd-8597-4041-94f5-7b6d5c3ff8ca",
             input: "difficulty = [1,2,3], profit = [1,2,3], worker = [1,2,3]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "d614c46f-8277-4064-81d1-d57ceca12490",
             input: "difficulty = [1,2,3], profit = [3,2,1], worker = [1,2,3]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "26a0ccf1-52ea-4937-9ff3-44a9a8352c9e",
             input: "difficulty = [1,2,3], profit = [1,2,3], worker = [3,2,1]",
             expected: "3", orderMatters: true),
            TestCaseData(id: "9dcdf5e4-8ff1-49f3-8627-d08f28005341",
             input: "difficulty = [1,2,3], profit = [1,2,3], worker = [4,5,6]",
             expected: "6", orderMatters: true),
            TestCaseData(id: "3233636f-57c1-4c0b-8cc0-66765dc33ec3",
             input: "difficulty = [-1,-2,-3], profit = [-1,-2,-3], worker = [-1,-2,-3]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "91723c66-3012-457e-bf31-972354d32be0",
             input: "difficulty = [1000,2000,3000], profit = [1000,2000,3000], worker = [1000,2000,3000]",
             expected: "3000", orderMatters: true),
            TestCaseData(id: "2ea8f4d7-c8af-4a51-a6dd-a694c52f4de4",
             input: "difficulty = [1,1,1,1,1], profit = [1,2,3,4,5], worker = [1,1,1,1,1]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "37e8f4de-c21b-4c96-8a8a-4e8fefd07567",
             input: "difficulty = [1,2,3,4,5], profit = [1,1,1,1,1], worker = [1,2,3,4,5]",
             expected: "4", orderMatters: true),
            TestCaseData(id: "2dfddbf1-4428-4482-8f3d-12cbbbe420bc",
             input: "difficulty = [1,2,3,4,5], profit = [5,4,3,2,1], worker = [1,2,3,4,5]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "c5273d62-7fab-43d3-a737-2e85934780d5",
             input: "difficulty = [1,2,3,4,5], profit = [1,2,3,4,5], worker = [5,4,3,2,1]",
             expected: "10", orderMatters: true),
            TestCaseData(id: "d9932c5a-fd19-44ea-8194-97e5ac93e854",
             input: "difficulty = [1,2,3,4,5], profit = [1,2,3,4,5], worker = [1,1,1,1,1]",
             expected: "0", orderMatters: true),
            TestCaseData(id: "3ee491bb-7399-4e81-b2c0-7b41371307ae",
             input: "difficulty = [1,2,3,4,5], profit = [1,2,3,4,5], worker = [5,5,5,5,5]",
             expected: "20", orderMatters: true),
            TestCaseData(id: "0f473099-cbf6-418f-9cf1-ad8868d6c43f",
             input: "difficulty = [1,2,3,4,5], profit = [1,2,3,4,5], worker = [10,10,10,10,10]",
             expected: "20", orderMatters: true)
        ]

        @Test(arguments: 0..<testCases.count)
        static func run(index: Int) async {
            let tc = Self.testCases[index]
            let slug = "most-profit-assigning-work"
            let topic = "two-pointers"
            let testId = tc.id
            let rawInput = tc.input
            let expectedOutput = tc.expected
            let orderMatters = tc.orderMatters

            let params = InputParser.stripParamNames(rawInput)

            guard params.count == 3 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Wrong param count: expected 3, got \(params.count)"
                )
                return
            }

            guard let p_difficulty = InputParser.parseIntArray(params[0]) else {
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
            guard p_difficulty.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: difficulty array too large (\(p_difficulty.count))"
                )
                return
            }
            guard let p_profit = InputParser.parseIntArray(params[1]) else {
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
            guard p_profit.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: profit array too large (\(p_profit.count))"
                )
                return
            }
            guard let p_worker = InputParser.parseIntArray(params[2]) else {
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
            guard p_worker.count <= 100_000 else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: worker array too large (\(p_worker.count))"
                )
                return
            }

            // Constraint precondition checks
            guard p_difficulty.allSatisfy({ $0 >= 1 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= difficulty[i], profit[i], worker[i] <= 105"
                )
                return
            }
            guard p_profit.allSatisfy({ $0 >= 1 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= difficulty[i], profit[i], worker[i] <= 105"
                )
                return
            }
            guard p_worker.allSatisfy({ $0 >= 1 && $0 <= 105 }) else {
                await ResultRecorderActor.shared.record(
                    slug: slug, topic: topic, testId: testId,
                    input: rawInput, originalExpected: expectedOutput,
                    computedOutput: "",
                    isValid: false,
                    status: "parse_error", orderMatters: orderMatters,
                    errorMessage: "Constraint violation: 1 <= difficulty[i], profit[i], worker[i] <= 105"
                )
                return
            }

            let solution = Solution()
            let result = solution.maxProfitAssignment(p_difficulty, p_profit, p_worker)
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
